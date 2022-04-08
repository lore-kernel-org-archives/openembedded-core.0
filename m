Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D512C46467
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.1207.1649446703891398623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KjI7eYKi;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z16so9252740pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=orDf3bvjZqwdDb9XV6uTaieUU424ZZ+vdgJ6/joG4to=;
        b=KjI7eYKiQ0UTlWR7LGzW4LromUNFYJsrZPYR/A8g/RpmZn2CQRkkYXnI6i0+TqRcCY
         YU2FS0j5xbzexmOY6tyQ56+Ug2jKBomR08yHS1TfE8mIaslcp35fO7hlg0Lo8pks4xoA
         3yhjNFyRrhrlL8oIiT3NyDt1hVrWvpyGs4vJJVxo1+8OyMyUmHedXlq7cjSaoo9lcvHN
         2x8pUHmdTUeQSPx3VWE1pH1lh8stNlGtenhANHb63PoVORSaHaNvskY/QGCCPbkpFH0v
         r+NXcDS0ujCNW5j3I6bNmA3lXzXX2KHyG+O9ZVjIBVWsAvZqikfQbGfk6BaY8apw2J5H
         EmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=orDf3bvjZqwdDb9XV6uTaieUU424ZZ+vdgJ6/joG4to=;
        b=YQ9dKgZTcZVM9BKl7TdZMCl+zz1OMdFXTkzN2GgPdrq8Ir6G0WF0SWXaCeXH1glmhR
         wqBf9QUcjGZo6gsl+5UOEWEX296WpxOvPG76bwBTE6ZFwxoXb0BzATRGv47F7L9TpKSH
         Ad3hi/2CKvW+VvXYu3JbXvmQpdzdQhxPLlHqUyD3zWnl6qF9SfqC5kvuL4QE2ZSjI4/k
         x1ifjQqNXQilu8wo+ut8zXkaztglzJoilSiGmJV/JoKFGZELoel/GpHmRo14DS+l+ASM
         sZ0dkADYiVHNRdZuL3ZW+3rTaToKxIzq0w5Xsdc/6atXZ0j1PP56AF9F1xD8Gy5amoxK
         KH4g==
X-Gm-Message-State: AOAM5326HQirH6u7T07fy8knMIz66XfqtOea7PYtCK9/DApmEtcpG3yr
	Eq0MLgQH7p3DDSCFYv1zVhHIKUp0/ERcDQ==
X-Google-Smtp-Source: 
 ABdhPJxUG6KdectgBq0kalMvsN3dTGDW1SUql7JUyHIxZNh+tNVNjvKZYNy7ZTS7bEQBpHxDyC4z7Q==
X-Received: by 2002:a63:d454:0:b0:386:86:6aaa with SMTP id
 i20-20020a63d454000000b0038600866aaamr16838844pgj.60.1649446702946;
        Fri, 08 Apr 2022 12:38:22 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:55c2:182d:f2d6:dc4b?
 ([2601:646:9200:a0f0:55c2:182d:f2d6:dc4b])
        by smtp.gmail.com with ESMTPSA id
 mw10-20020a17090b4d0a00b001c7cc82daabsm14220589pjb.1.2022.04.08.12.38.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 12:38:22 -0700 (PDT)
Message-ID: <5fdfba27-f618-e1c5-106a-85d967fa77f9@gmail.com>
Date: Fri, 8 Apr 2022 12:38:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2 6/6] poky-tiny: enable qemuarmv5/qemuarm64
 and cleanups
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <20220408192521.1608764-7-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220408192521.1608764-7-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164169



On 4/8/22 12:25 PM, Jon Mason wrote:
> Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
> entries, as it should be generic now.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>   meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> index d8ce5dc518d5..43a5ad728a5d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> @@ -1,5 +1,4 @@
>   KBRANCH ?= "v5.15/standard/tiny/base"
> -KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
>   
>   LINUX_KERNEL_TYPE = "tiny"
>   KCONFIG_MODE = "--allnoconfig"
> @@ -15,7 +14,6 @@ DEPENDS += "openssl-native util-linux-native"
>   KMETA = "kernel-meta"
>   KCONF_BSP_AUDIT_LEVEL = "2"
>   
> -SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
>   SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
>   SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
>   
> @@ -24,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
>   
> -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"

why are we dropping qemuarm ?

>   
>   # Functionality flags
>   KERNEL_FEATURES = ""
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164168): https://lists.openembedded.org/g/openembedded-core/message/164168
> Mute This Topic: https://lists.openembedded.org/mt/90343240/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

