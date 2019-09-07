Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7AE7D2E6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 18:31:41 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v11so11047692qto.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=la/ujBeUPSeqd9wPy0A+Ga95epzO5foqCHSNP74jwZ8=;
	b=S2YbEcBl07jWfw6uYcN0ZlT7g3+yUTwoBWXL/yrsKBI4C5UN+87kF3HydS12COwYmQ
	fv6+4vxz1BuCsKpItjy5IU538S19hsxcd4N1X2eQ8x220hO7iM8tOH4zqUDEsKUJlSHe
	2gw9VmaNg/wutcjUpj/1MxZOlibXCXZzUJPQEC05I26tTljRyZ7NdEZXtn27hqZVqfAr
	0I1X6EVQuZTrgX53XeeEqnx1UvrCuUnapOEsUsCcFbu9NJvVLV/5Xp1kD+CHgAlCZZXz
	JUPjhN+AhqRVJ20z3n+fjrk/I9O4/ZAYA1QxASUHcggsC8CRxGSMYbFJ5VS+vbMJU2W4
	EKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=la/ujBeUPSeqd9wPy0A+Ga95epzO5foqCHSNP74jwZ8=;
	b=OyvDfgP4vrmNIyfHavzvhwzJn/xseGBdtssw0aOkBeBZOc2QzTVelBpEzkFuV6mQk1
	hxGAn3UrqkGzYGoznkQvpV7mRtuf3ka4oC98/Zwp4uPHyMel5+cgScQ/lzav29eZyCRI
	bdLdh+hPdrl3/bXY+Ln6eqedkxRAOGhUfTAVc6vFiVMf3mdCYwtnQDS5Qyi/eoZyqcaP
	F/7JGHyuCVkZqY0bqIbGgE434oxs8o6F0C+ZwIlkUzWD+3CNVyX7d9FXNMjP0zjC7vu+
	1enDxEHfF9KmjS8UzF/W/xEO90d33I/Y5FDKft2DG13L2xEQgAvWPNqZD5C7GNMntxyQ
	6hqQ==
X-Gm-Message-State: APjAAAVoa0ar5ffiyTfxkeEKDjd1qM1LQMpFCh2f7tYRiopTtHBseQGc
	/P50d6ULLOe9th+e51Ej9WY7EOuuQ9GwiMpTovIOEgWm
X-Google-Smtp-Source: APXvYqw7K1fDwH8Vgzzg22/oHcHvgNRYsLNvbHZK2ojWLWZB3hGjBT8IuLx9aNPvTqddANSeIvc7zzZk0HXcMsirQpY=
X-Received: by 2002:ac8:7445:: with SMTP id h5mr15467727qtr.53.1567881101900; 
	Sat, 07 Sep 2019 11:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190907183022.6811-1-raj.khem@gmail.com>
In-Reply-To: <20190907183022.6811-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2019 11:31:16 -0700
Message-ID: <CAMKF1srGD__59cc-Jj9BebvyQWBWjidfcPNsuRoNVy-Skv6c0g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: Recognise svlogd as another logger
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
X-List-Received-Date: Sat, 07 Sep 2019 18:31:41 -0000
Content-Type: text/plain; charset="UTF-8"

this has been applied, ignore it

On Sat, Sep 7, 2019 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is provided by runit which another init system like systemd,
> sysvinit, this lets oeqa run on systems which are using runit
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/oe_syslog.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> index 3a8271a53a..f3c2bedbaf 100644
> --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> @@ -17,7 +17,7 @@ class SyslogTest(OERuntimeTestCase):
>          msg = "Failed to execute %s" % self.tc.target_cmds['ps']
>          self.assertEqual(status, 0, msg=msg)
>          msg = "No syslog daemon process; %s output:\n%s" % (self.tc.target_cmds['ps'], output)
> -        hasdaemon = "syslogd" in output or "syslog-ng" in output
> +        hasdaemon = "syslogd" in output or "syslog-ng" in output or "svlogd" in output
>          self.assertTrue(hasdaemon, msg=msg)
>
>  class SyslogTestConfig(OERuntimeTestCase):
> --
> 2.23.0
>

