Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id C497A746B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:41:18 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id w9-v6so15067827otj.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/qt1qSkw7Bi9G8DTWSUglSICYh/F5U1wq3S+5dcBAUg=;
	b=yHodD1soa0PP0NRKszi82agkSdpkX1bPBJUBJ2OYdOYIjcdUm4X5Sd4s3a7Z5Vwopd
	+LyL0X3KerMpf1BHPkmDqigS1jqQeKz+RQV174nksJwMUGygNVlHJdNiogJhlbM26dkx
	ituOy6X2ipS+HgHi7Iyk3RaxSt6yoAh3ELcTTkpEoBhtsdCmr/e86QDPiPHqmnlEkdkw
	l822Vrq8I8FR/2OwbHvjMQH7w2lEO54YLTOqESF5WbQVGD27y8H+CUySLZg5/eIcw/ku
	0ErHCnBI/Mdi89xLJDEeE3CAO02M4mshnRFfRUXb9z1eOHoSMFMagYmp+gzPJuIsCeHV
	W6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/qt1qSkw7Bi9G8DTWSUglSICYh/F5U1wq3S+5dcBAUg=;
	b=ag0DWjqm27vsonawB8sGmqhNosr9CVGuuHKhwszF26suBXFkZ/d3b3+lXwQ1v8nrwD
	w+WeTMMwnoJvbERfyNyXk/lQS0MGdn7x5UQI2ra5zdzIezPBldvQxcabeNOy27iljnAN
	ZpVvjHgwsW5xSyTCBDGlDJDBYanDxDQivLOyorPaa/824Mvnnw6/wK/1DFNv8HEdld/G
	3w1zCynLHuTbNGYq1L8DVvO+HDsvgyT9OBKINYDSoQXOmJ8ND8w/8i+7s0Jh/5KvAmXY
	rjXIAS2O0wJLcb6W+/Jj4CPaiqKbjjm+lPsPsfIBi0Xx/lkSsFZ3lPz1YbY0n2xsFJcg
	dKpQ==
X-Gm-Message-State: APt69E2touKu06PZPL+iMgDxV7ARvIeBdoD6lt5F2YiEA0qzZlBnFg86
	STzk9q5piW+0tllHKxAXSu5+1AA7L5lT25akRtpd3g==
X-Google-Smtp-Source: AAOMgpfxbamyCvhuiRvRiT3mTbqDCO6NPmDjE53PM84EdEjDxDRaJbLjnbh54jowxdUoxowCLsboCkYwwGjRZuiSld0=
X-Received: by 2002:a9d:357:: with SMTP id 81-v6mr7833042otv.119.1529934079601;
	Mon, 25 Jun 2018 06:41:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 06:40:59
	-0700 (PDT)
In-Reply-To: <c8a7632a1f27b73ac623c5399ed4e452f2b37571.1529919069.git.Qi.Chen@windriver.com>
References: <cover.1529919069.git.Qi.Chen@windriver.com>
	<c8a7632a1f27b73ac623c5399ed4e452f2b37571.1529919069.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jun 2018 14:40:59 +0100
Message-ID: <CAJTo0LaW-4wBMWcp+ZdDJd0kKQMm_fRGo6nQph3GKXPJ6SuCPQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/systemd.py: avoid timeout problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 13:41:18 -0000
Content-Type: text/plain; charset="UTF-8"

The busctl invocation will only rarely be called so is very prone to
bitrot, maybe it should just always use busctl?

Personally I think that there should be a way for VM time to be
independent of host time to avoid this sort of problem...

Ross

On 25 June 2018 at 10:33, Chen Qi <Qi.Chen@windriver.com> wrote:
> I've encountered the following error when doing testimage.
>
>   RESULTS - systemd.SystemdBasicTests.test_systemd_list - Testcase 551: FAILED
>
> After investigation, I found that it's not functionality issue. It's
> just that the qemu was not running fast enough. And it resulted 'time out'
> problem when using `systemctl list-unit-files'.
>
> The correctness could be verified by using 'busctl' directly.
> e.g.
> busctl --timeout=240 call org.freedesktop.systemd1 \
> /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager \
> ListUnitFilesByPatterns asas 0 0
>
> Checking the source codes, I can see that the timeout is 25s. I don't
> think we should patch systemd's source codes just for such a simple
> runtime test case.
>
> So instead, I change the test case to use 'busctl' directly if
> 'systemctl list-unit-files' gets a timeout error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/systemd.py | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
> index db69384..b4f1025 100644
> --- a/meta/lib/oeqa/runtime/cases/systemd.py
> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> @@ -81,7 +81,19 @@ class SystemdBasicTests(SystemdTest):
>      @OETestID(551)
>      @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
>      def test_systemd_list(self):
> -        self.systemctl('list-unit-files')
> +        command = 'systemctl list-unit-files'
> +        status, output = self.target.run(command)
> +        message = '\n'.join([command, output])
> +        match = re.search('Connection timed out', output)
> +        if match:
> +            # it's possible that qemu is running slow
> +            # use busctl to check the results with timeout set to 240s
> +            command = 'busctl --timeout=240 call org.freedesktop.systemd1 /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager ListUnitFilesByPatterns asas 0 0'
> +            status, output = self.target.run(command)
> +            message = '\n'.join([command, output])
> +            self.assertEqual(status, 0, message)
> +        else:
> +            self.assertEqual(status, 0, message)
>
>      @OETestID(550)
>      @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

