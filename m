Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6792DC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 21:49:20 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.87385.1670968155141158652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 13:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T20yv0vX;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: armccurdy@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id b2so40025401eja.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 13:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iPpcSUdWj0d2DGxqvwFwXubVNErjQbN49ZDkcuylH5I=;
        b=T20yv0vXFOm6nLZYf383FBcecVYwWMBQcg8kHk1asX4VeC/ElhKQJRfXcunJZHvvJg
         sR+Y8hfQd0ewkXGV3gQjf2nTHzVToZDxG/BShDoHqrI9esG12ZWXn63VP0VceYL4c1T0
         BAFovy1xfOnkkBdoTQtF3iqyzoY3p79t6+lqibre4dczx3fBVUOuVSqZ3gS3AzWGvTMD
         oCU6A53KELrjwpovry50XHQiZced0imiRjN9Mko1ChQbfchSb3H2YyJp+HliNRRlhn19
         UEK1grnVg4B8NncOcOIvF6yTcm7YdRF95dnEeHEXUNG+VuUQCOeeW+8OEKwy0jpOLkL3
         0z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPpcSUdWj0d2DGxqvwFwXubVNErjQbN49ZDkcuylH5I=;
        b=uu0txQl4/m5/SnO6Nmt1RrHT//n+ndxSbA7idgVqtoPDdr7liRS5753g1PPzLLejr0
         GAAcax9dZI9tPQAZmFuX17GTC2CjksuarTxuChm+2CVpNNu1wN+kmX61i11xaehGw/NE
         Y2DMHjnDDuA9LAzLzJik0hO9cRJcSsEIV9gMpgCV7XwCQOgD0hiDreMs0+BbkcYf5vVp
         R7LPke2Te07k+zbXrudPhax3nCEgi1b4zSajeCcfuqsaPuLzXF56MUPAh2Orpb+GzH8r
         dACTnp5L5rvmkbfHX+8lDY2e/ZFuyOXxundQ3YIV5rPuyk5P/LcZvWs0j9DM3U4oUJZu
         MOtw==
X-Gm-Message-State: ANoB5pl1qPcNKU9zxNeJSpylQ9Ls7jxZSvU8igMbX4tGN21OkVCjqkdg
	XHaR6R4JfE3p6uNd7ScRPQvvzOFnUXA2s1BJUsg=
X-Google-Smtp-Source: AA0mqf5Bj9SzFdLUPgaXlElPLI3+AeH7l7BXJOjCvdX5ezRE0A5B9qXL7yAW0Vg5ARbeS28ALSnFtPBwFBzwaZonWMQ=
X-Received: by 2002:a17:906:40d3:b0:7c0:efba:a8c6 with SMTP id
 a19-20020a17090640d300b007c0efbaa8c6mr15998378ejk.632.1670968153363; Tue, 13
 Dec 2022 13:49:13 -0800 (PST)
MIME-Version: 1.0
References: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 13 Dec 2022 13:48:56 -0800
Message-ID: <CAJ86T=VSQ9YVvs76axGytFTzxVU0-DVyB9vEoWucteDY-bv-6Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for
 aarch64 by default.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 21:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174545

On Mon, Dec 12, 2022 at 6:38 PM leimaohui <leimaohui@fujitsu.com> wrote:
>
> Reference to libpng-1.6.38/configure,if enable_hardware_optimizations is
> enabled, libpng can judge whether enable enable_arm_neon according
> to $host_cpu.
> ----------------------------------------
> $ cat libpng-1.6.38/configure
> ......
> if test ${enable_hardware_optimizations+y}
> then :
> ......
>          # allow enabling hardware optimization on any system:
>          case "$host_cpu" in
>             arm*|aarch64*)
>               enable_arm_neon=yes
>
> printf "%s\n" "#define PNG_ARM_NEON_OPT 2" >>confdefs.h
> ......
> ----------------------------------------
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.38.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> index dc627203ef..7da71d9d3b 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> @@ -22,7 +22,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
>  inherit autotools binconfig-disabled pkgconfig
>
>  # Work around missing symbols
> -EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> +EXTRA_OECONF:append:class-target = " --enable-hardware-optimizations=on "

It's difficult (impossible?) to automatically detect whether an ARM
target supports NEON at build time, so this looks unlikely to work.
Testing for NEON either needs to happen at run time or the information
needs to be passed from the build system as an explicit configure
option (ie the original approach here).

If you don't want to pass NEON options to 64bit ARM targets then add
an over-ride which only applies to 32bit ARM targets.

Or in this case, if the configure script is wrong to try to enable
NEON for 64bit ARM targets, patch the configure script and submit the
patch upstream.

>  PACKAGES =+ "${PN}-tools"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174506): https://lists.openembedded.org/g/openembedded-core/message/174506
> Mute This Topic: https://lists.openembedded.org/mt/95637494/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

