Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060E3C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 11:20:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5379.1641554400082573615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 03:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OuzQybbi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id o30so3677317wms.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=h2aZ0Bj3QMLyu2oM8J6L8SewMIftjD8PbiODye2gCaA=;
        b=OuzQybbi7s40xS+kwSdfGzxwssdghWcEZMWZ882BEhBPfvpsYPU5P/GCBk/KJUlLEQ
         xPUUJ0x9BEKHRSrPyOMjWj+6CdW9urH58OU+Y07Os7blKNP+4HIapFRPV0EcqjzISNzT
         OvQ5TLJ84PeQ+8stU/gNhXV0j7ViQ3xn8usuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h2aZ0Bj3QMLyu2oM8J6L8SewMIftjD8PbiODye2gCaA=;
        b=JLHhdVR3qgJXDNcEtcgeZUNpb47+4KKbmEPRZZTjhE4k6HTAMSuwadFXy5357aQQUs
         KvtMrPMoiiiL4AvpSrLEWhYrJpVXzKsm3/wBO1LgcM90L4kmZIc4wXLR2d8pO+hJPDN8
         mS58zS1XaUYe/JsqF+Km0EfU+o0rFeF5rMqiCjaI53u++4udW+7p3d8aotTOWfaUhadF
         jpgwy9KS5p3W007Yfp+1zmuBzrzSC/WumgyDLh1oxPmjmwhu/5kiY7eL3OodyrDx+8l8
         arlfDDPltqKWHYKXJRkfp82xo7W037ft2/Sr2t1jmLpOS224bYglkTeP59g0IbKzuO+D
         z4VA==
X-Gm-Message-State: AOAM531Dlxg8CJqA0SK+iSumgR6nag7GmaGL61FP23SGu6+3YGzee8Rw
	tCCGgqtUUGU1jQDAS/sXlSqkjQ==
X-Google-Smtp-Source: 
 ABdhPJzrZnAhrQLT6J/u6XePPP/CPUdiDtqXuVTRIPr1c+g1cQsBF7QGAy2Bj0aifORS1mwVS7HqWg==
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr10695636wmh.156.1641554398566;
        Fri, 07 Jan 2022 03:19:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:df67:6706:4d53:dd6b?
 ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 l6sm5999831wry.18.2022.01.07.03.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 03:19:58 -0800 (PST)
Message-ID: 
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 07 Jan 2022 11:19:57 +0000
In-Reply-To: <20211215201615.536707-1-matt@madison.systems>
References: <20211215201615.536707-1-matt@madison.systems>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 11:20:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160254

On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> which is introducing task hash changes for some
> allarch package builds, and should no longer
> be needed with recent versions of qemu.
> 
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/qemu.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 01a7b86ae1..333202b7c4 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
>  # qemu-arm default CPU supports all required architecture levels.
>  
> -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
>  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>  
>  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"

I've sent a revert for this since the commit message isn't true, this is causing
autobuilder failures and there was also a user report of issues with it.

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
(centos7 aarch64 build)

We'll have to find a different way to fix the allarch issue (more details
welcome on which package shows the issue).

Cheers,

Richard




