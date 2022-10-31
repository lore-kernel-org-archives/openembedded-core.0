Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624D5ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:41:12 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web12.10951.1667230866130810264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZN3gA8fx;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso13810683fac.13
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oB7wbfMaEylp1g7nsg5UpX3udMrEZUdp5NvGLED7geg=;
        b=ZN3gA8fxoVwaDgqWBJVQmMihzCBCunPxVb3Rl2z0+AUvCb1w5p21STAry6ExTelqe4
         LZfn5JyuwyIo1JcqQU4OryCrFuYHEeTde9ZrB8xl7vEaP2uIRRccT7dr0l6TaqWRNjx3
         x2ioGcq7/Ottgjc3XHk+X+iNSmIne4bwqfHjrW3mOuConiilK37SPsfTX1ZrkbnQvbu/
         sveJP7WrM4HvyAX6PUElty4c6NoE6LeTZahJxA92VwL7mpif0TUDU5/2rZ/mI+PCo0vY
         E5v4xx+IvlUmgvhQN4GocwAcsnKSprDtEaXVUJ6PLg/qwo6U+jRNXcwc3gPkItYeBy6f
         JWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB7wbfMaEylp1g7nsg5UpX3udMrEZUdp5NvGLED7geg=;
        b=vm8/w4aePT/zExTRrapa+c3KOtOWgTUBGv9Tb8DPs4h6gqdZ6hfaqQ6zlNmPm4dXCv
         d15LaOQ4pq2qKc5RUEU1ST5emJKQ0eAT59ZWjlRTx99L2/o7pfy0ebOo9on08pPqbfo9
         UGSGbtlUa9xadefxpWD0UxAoGxwcKUmVbMaLrTtNfATLCMmKjCGeOEA0UrAy0qqT68IU
         MfkbQg4FdIApq283NoSBFHdxhzMVjftLCrhb/vftgCjCxnqm+dJNaMH+DAwvYA+R+EOC
         0T7KJ4iHhw212sOjXs9fVn+pV4ROYmCrydDu95Z1kX6lB+ndvD+1BVqQgnuhdFA20Y+h
         wW7Q==
X-Gm-Message-State: ACrzQf2Y77CFTiyMnXiyuiOO325qD7R2zaR3m+UG9o5R7UJK6GBPL/LR
	2HghYYhxsyltyJfnUqFuatFZEemd0DWU+pS4Sj8=
X-Google-Smtp-Source: AMsMyM4rs3Ld+gTeqBthMDuLdWS9/mkHnXLLJIlh5Qwx7lc1KmRvcREmgjj15suajTMZT3s6ZCbHhDY9c+Ulgzr/KNc=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr17101306oae.262.1667230865371; Mon, 31
 Oct 2022 08:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221031075042.224693-1-xiangyu.chen@windriver.com>
In-Reply-To: <20221031075042.224693-1-xiangyu.chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Oct 2022 08:40:39 -0700
Message-ID: <CAMKF1sq_Ubb3r+UtgZ651=wf-SFvkDW17cDzJ_us47oiGc6mZg@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][master][PATCH] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
To: Xiangyu Chen <xiangyu.chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172323

On Mon, Oct 31, 2022 at 12:51 AM Xiangyu Chen
<xiangyu.chen@windriver.com> wrote:
>
> With the default jitter options aarch64 CPU-based devices typically experience continuous
> high CPU utilisation for several minutes after rngd starts.
>
> Accoring to the rng-tools issue #150[1] and comments[2],in order to address this,
> the following configuration changes have been made, those configurations
> also can be found on Alpine Linux[3]:
>
> - reduce the number of threads used to 1 in total, rather than 1 per core.
> - reduce the buffer size from 16535 to 4133 which reduces the time taken
>   to fill the buffer (and so reduces the duration of CPU load).
>
> [1] https://github.com/nhorman/rng-tools/issues/150
> [2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-953079212
> [3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-arm
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  .../rng-tools/rng-tools/default.aarch64               | 11 +++++++++++
>  meta/recipes-support/rng-tools/rng-tools_6.15.bb      |  5 +++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta/recipes-support/rng-tools/rng-tools/default.aarch64
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/default.aarch64 b/meta/recipes-support/rng-tools/rng-tools/default.aarch64
> new file mode 100644
> index 0000000000..5a2fbcc9ef
> --- /dev/null
> +++ b/meta/recipes-support/rng-tools/rng-tools/default.aarch64
> @@ -0,0 +1,11 @@
> +# With the default jitter options Arm CPU-based devices typically experience
> +# continuous high CPU utilisation for several minutes after rngd starts.
> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
> +# https://github.com/nhorman/rng-tools/issues/150
> +# In order to address this the following configuration changes have been made:
> +#
> +#   - reduce the number of threads used to 1 in total, rather than 1 per core.
> +#   - reduce the buffer size from 16535 to 4133 which reduces the time taken
> +#     to fill the buffer (and so reduces the duration of CPU load).
> +#
> +EXTRA_ARGS="-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refill_thresh:4133 -O jitter:thread_count:1"
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> index 0696351903..e1f6b2ad77 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
>             file://init \
>             file://default \
>             file://rngd.service \
> +           file://default.aarch64 \
>             "
>  SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
>
> @@ -59,3 +60,7 @@ do_install:append() {
>              ${D}${systemd_system_unitdir}/rngd.service
>      fi
>  }
> +
> +do_install:append:aarch64() {
> +    install -Dm 0644 ${WORKDIR}/default.aarch64 ${D}${sysconfdir}/default/rng-tools
> +}

Perhaps drop the aarch64 specific default file inside a folder called
aarch64 under meta/recipes-support/rng-tools/rng-tools
and we don't need any changes in recipe.

> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172290): https://lists.openembedded.org/g/openembedded-core/message/172290
> Mute This Topic: https://lists.openembedded.org/mt/94680433/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

