Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C00C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:16:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.11658.1635023803061850023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MBZjLmDH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso8215813wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yT5T55OCtfDzzdAGQFa/lmQ6kuDMeGi3ersMDe8wfsM=;
        b=MBZjLmDHV7DO3dj3vDLxCZmx/5GDNUGLARKwCdbm0aPr3KTw4jcf4AJ4SbXNGj7U00
         8xgOY4JlG96cvGJHThkyj9eY/A0EwKKMNS6e/LCmK+zfVcMuKy0EadXlZxt9+9T03btB
         zLPy6NMH87xA0wtm4Ncu29TERAE6mYjgHp9G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yT5T55OCtfDzzdAGQFa/lmQ6kuDMeGi3ersMDe8wfsM=;
        b=CCqonZ+yPYAl/HOOSiMlVDUMsV4uMUdFJJFMd2uhIdpuhKE3xRqs/xftQEBIo1TcuU
         IJGkq6dV1OCV1tTDzyqbtPITTFeP9Xu5CwoFnvZH1eoz+U5qB5lb7Q16qeFS2t2//8oS
         kkmqGfQ6DziLzJO4Fu5tTK7Uxo85eSx3W8g5vdWCv32E8e/DRt4K0v6iIJ16KitWGBV5
         BjBn2znS1JRPcXR+oFnEnpwEYQkC6XAPrkUw2BqULCNochbw+JLMztdCHuJQR7p/3obP
         JkabF/9SII4BRNFHIFJVCm+B3mZ5KmH14odR8FNaYEWuR5xmxFzeLezlrFHROLNWIMB3
         N8RA==
X-Gm-Message-State: AOAM532H84rmWyrUcElbchrjE6aSg0JizxJYSYTT1+fgHINu9kuvWFIE
	/G2DyS7ci+shvcJ3iDe/bSjuKQ==
X-Google-Smtp-Source: 
 ABdhPJyxDQiOMxWOxM5jNyqdHOBzROXY5CzaPdgBzeinkoIY+S2uxlEMJZK0uHguZiCOzFNJ2rYYew==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr39157744wmi.72.1635023801492;
        Sat, 23 Oct 2021 14:16:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:57a7:1a1b:1d71:50eb?
 ([2001:8b0:aba:5f3c:57a7:1a1b:1d71:50eb])
        by smtp.gmail.com with ESMTPSA id
 z26sm2109139wmi.45.2021.10.23.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 14:16:41 -0700 (PDT)
Message-ID: 
 <fbc96f2c9631b7d8b36f1fac8362abd32e520197.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/populate_sdk_base: Add setscene tasks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Oct 2021 22:16:39 +0100
In-Reply-To: <20211022214422.2176030-1-JPEWhacker@gmail.com>
References: <20211022214422.2176030-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 21:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157315

On Fri, 2021-10-22 at 16:44 -0500, Joshua Watt wrote:
> do_populate_sdk was added to SSTATETASKS, but had no _setscene task
> created to allow it to actually run from sstate. Add it so that SDKs can
> be restored from sstate.
> 
> Note that like do_image_complete, do_populate_sdk is marked with
> SSTATE_SKIP_CREATION by default so sstate is not used for them; adding
> this task will allow it to work if the user overrides this default
> though.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 49e166e697..fafdd96749 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -179,6 +179,10 @@ do_populate_sdk[cleandirs] = "${SDKDEPLOYDIR}"
>  do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
>  do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
>  do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
> +python do_populate_sdk_setscene () {
> +    sstate_setscene(d)
> +}
> +addtask do_populate_sdk_setscene
>  
> 

That was deliberately missing since we don't use/need it. I've merged this since
I guess you want to use it but it isn't something I particularly want to
support. It simply won't work for eSDK either.

Cheers,

Richard


