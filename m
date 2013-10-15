Return-Path: <riku.voipio@linaro.org>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 217796CBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:05:21 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id k15so2946008qaq.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gNZMf13jlPnZ4nRYDkFSSUHWInWQou8abbsIlI9Akqc=;
	b=FKAGEH9Xka8rNhk6N24gZ3HUCx2rjn29/E2dEBEd485sMD6OJTsRzVfMVDP1ImfNEw
	lz9o6eKvegE7PAyog5KvjkrKE+f+lOTb6WTYg3/Hnbp3BbSDTrnPGPj1nHG8bbaksN3X
	IHInRjudr+y8xoRQ/MpsAu5QoG7M+61TRrWEQLXI29cYXVPlscDyaV+Sgbi5eF1nBgMH
	K5x9e2yzU+5kqF8UGF/jk9p+dzL2HT1boR+dRwfKCeqdFyglPSibofdGo6mEzoPAnCeg
	5vB2sSfMLOILK29LSU6KZmWGwFZ0GoL7e+xJrsDOlykugV9kv6+k6TeZ7w3Zc48/n5sp
	orNw==
X-Gm-Message-State: ALoCoQlYmWNSnCXggeHgt7n+aWRY3LyvCxQGe1CEYCX+fTodSG3BNeUc2vLD0ZGwwGkHwlEjMqXg
MIME-Version: 1.0
X-Received: by 10.224.20.198 with SMTP id g6mr42739514qab.24.1381835118912;
	Tue, 15 Oct 2013 04:05:18 -0700 (PDT)
Received: by 10.49.12.146 with HTTP; Tue, 15 Oct 2013 04:05:18 -0700 (PDT)
In-Reply-To: <CAJTo0LYLUmi7_sL2zgveVhS3RaKJ90roc7HccATJ8mGca1pSQg@mail.gmail.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
	<1381168150-25518-2-git-send-email-ross.burton@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C495AA@IRSMSX105.ger.corp.intel.com>
	<CAGNsrLAXyqZn38bY5WU=YcpOF4xhn0B+OA4Lr55cD=iQmKza4w@mail.gmail.com>
	<CAJTo0LYLUmi7_sL2zgveVhS3RaKJ90roc7HccATJ8mGca1pSQg@mail.gmail.com>
Date: Tue, 15 Oct 2013 14:05:18 +0300
Message-ID: <CAAqcGHkVrJgnp8AqLtvCjJaj9DrCwvSaSLGdwuFxzKdP_Ehj+Q@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] glib-2.0: upgrade to 2.28.0
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
X-List-Received-Date: Tue, 15 Oct 2013 11:05:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 October 2013 12:43, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 October 2013 09:37, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> it fails to build on Aarch64:
>> | gdbusprivate.c: In function 'write_message_print_transport_debug':
>> | gdbusprivate.c:2164:12: error: format '%lu' expects argument of type
>> 'long unsigned int', but argument 2 has type 'gssize'
>> [-Werror=format=]
>> |             g_type_name (G_TYPE_FROM_INSTANCE
>> (g_io_stream_get_output_stream (data->worker->stream))));
>> |             ^
>
> I don't have any aarch64 hardware to test on, can you work with
> upstream to get a fix and submit it here?

This is fixed upstream in:

https://git.gnome.org/browse/glib/commit/?id=0167c3340d8201dca8e9031b61703bbc5ed6ce33

I'll submit a patch in a moment.

Riku

