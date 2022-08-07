Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05D5C19F2D
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 00:40:07 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web08.9251.1659832807031603773
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Brsv/MCk;
 spf=pass (domain: gmail.com, ip: 209.85.128.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-328303afa6eso52706877b3.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lcE1OKVAhAYpY1/cR9S3Vng8A+BOXkWzIC+vNGQUF7w=;
        b=Brsv/MCkaIszvSwy71SfIC5INknG7gMKHWBENtTZd4q+0o+s3r81b/vPygw3L4voGk
         ZjPKTKFo3AzihI8kv0oqUwZm/wmnbOjpTPCLBODfHU7nG8Idat9p/7UKZQ65f/Z6IKZZ
         1AKFarS62B8F5axbgaBHMLo0l9m0FdB0hO+5cEFjXQlesDP07T6m0XbTFzPnkNJp52tX
         AvwYTarsjSie3zY9bGq3YGi1jv1a1Pg+o1yoe9jO40cVyIVer08gjzcNKbgxIkw3HLUI
         rKyrC3v4bpI9zuBvc4mSFsOYXLSOzU6bgCTYYQB2DFF1oUXIUibiUJLkrlMfHEOMEOXJ
         akLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lcE1OKVAhAYpY1/cR9S3Vng8A+BOXkWzIC+vNGQUF7w=;
        b=RQJNPWp49XC5OMOOMjy+w3cFwCg1OyhWADVnCDUQTlpsYWele4J8n9cVxHErVQjev9
         kbQ5JYpFMGkMp7AESZt3qALkNStBlxTuf8o68mh8yTikaYU4Vbdg8ZkwgQ1UKGlojCJT
         86s0IrPUVd1v3cVGUWDfsQs9lh7H+gJh7eF85RmGWH6Du1Vcuc1Oslla0Ko6VXVYznEJ
         e1DExkNqY2doaJL8MjMlktVqd+/2eSELHMHeg6nYqoCTOcNRL9RkY42f3gHFMeKFypAF
         IR6lBk5okD0sPT7MpBJWjRUCmYVEz8WGXQBRZ3aI60pzhMJi1a80HPzG7rz55+rEbs03
         /igQ==
X-Gm-Message-State: ACgBeo0CjDolYdOb0NdzFJC5L/rbTxKJ1vxAy4YjDjRifvhbSgE+oijy
	ZWtL75JOVXnFcJgdlroenFJxl6JZ4XYWauY7ZfU=
X-Google-Smtp-Source: 
 AA6agR5F+CsRR/jhjO1CUJAYsOCV6Uj7etTUcZ17e/xyc72qWeeHgkgSFItB91aK+rB1sA96Bs/FINP1jNnhJi47vAg=
X-Received: by 2002:a81:55c2:0:b0:31f:645b:9858 with SMTP id
 j185-20020a8155c2000000b0031f645b9858mr12588908ywb.296.1659832806036; Sat, 06
 Aug 2022 17:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
 <20220805131252.3706794-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220805131252.3706794-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Aug 2022 17:39:38 -0700
Message-ID: 
 <CAMKF1soETtLXzAwDPAbPDHTBQXrFUUSCMTX38sZfGBj7+QcLaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/29] populate_sdk_base: Disable rust SDK for
 MIPS n32
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 00:40:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168978

On Fri, Aug 5, 2022 at 6:12 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The n32 MIPS rust SDK doesn't quite build (libstd-rs fails with an llvm
> register issue). Disable it for now, someone with interest in having it working
> can fix if/as/when.
>

Thats ok. Can you add a comment in code too so we know roughly the
reason just by looking at code disabling it.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/populate_sdk_base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index f260217b508..0d1c6e18c4e 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -45,6 +45,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
>
>  SDK_TOOLCHAIN_LANGS ??= ""
>  SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
> +SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
>
>  TOOLCHAIN_HOST_TASK ?= " \
>      nativesdk-packagegroup-sdk-host \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168936): https://lists.openembedded.org/g/openembedded-core/message/168936
> Mute This Topic: https://lists.openembedded.org/mt/92834377/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

