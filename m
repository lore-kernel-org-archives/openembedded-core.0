Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECACDC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.878.1639599866222285552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VTm8NfjA;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so483720pjc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=C3KGw/cPm9z0G8KPffGE5WiU0xy4YP+NBPYsy55L89Y=;
        b=VTm8NfjAHGE9isWUS77v9EHhaPpE8YJy7WCkFL0bF4ukfIO3iBUr+7tBZ7eCZigFex
         AuhWqIZf1jx02H7BjqR8l+EUxp+o4k+7gCklYD/LSjN6OntKolK/j61GmO50AgSxXEqm
         TpYS+xLm70tss4rdR4oyYPaPcmXDpEpZc6wzUCJR1ucPzoq9Jmt2qsiH/pLASvT6Bh4T
         23DReIWfFn5FCZlJYOKlHfMLFBkrN/pxlSMj6/HzOv1Skj5L1/ZYo6H5mqupl/9ffmqI
         sdEpUQBT4UR3s6X2QOl7DH0oyZEmcShM+itX/VhLOH+0SCd8THWO4EM1IZKbqVPjAXhv
         bWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=C3KGw/cPm9z0G8KPffGE5WiU0xy4YP+NBPYsy55L89Y=;
        b=1ykfoTr/5o+rCQmk88MKFsITpv5GSeNoE6LEBDS3RDFUGUCsQzHgQp6LiBJsUqgFgk
         KUpa19DkdF0V1qfkOQJelNPcF6iuYR5vCZwLTKCWLWawgWUQGPf9HJwRuKVAQ1Z10Y7T
         2pI6LW/qncKAkwQwKxmx5qplj2+qdrBVaDVlIjNBCFmpXjzPpDvim4BnXWd4a3NzW5vB
         Pav2SnP7dd2LM1JELXg13vFbREv/o5Rk8GpZyj9KWxjnZF3RURHDIWv2hne1RPxr8nJx
         HrDs70d+kWdWLPNpvmFioSMOXrb2WPAHT94xno01rkJAvdIYGsw8Q5eMZ8uUpHJO5DR+
         C6Vw==
X-Gm-Message-State: AOAM531H8MSMxmj+vn/ZdYja/FMs8p7Dp/aXl5TITEKDjBNDTa4jeYj6
	nIzktdOmhGQgZbfe7BuV1w0=
X-Google-Smtp-Source: 
 ABdhPJzV7bCeXEGS3EJj83J8CbadjfIm5Wr1UiU744o8Cc7ijJRHTvaw+WmK7HVjFRCID/MxcTPa4Q==
X-Received: by 2002:a17:902:6b07:b0:142:852a:9e1f with SMTP id
 o7-20020a1709026b0700b00142852a9e1fmr12552378plk.29.1639599865639;
        Wed, 15 Dec 2021 12:24:25 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:cd09:406c:9104:34eb?
 ([2601:646:9200:a0f0:cd09:406c:9104:34eb])
        by smtp.gmail.com with ESMTPSA id q9sm3671372pfj.9.2021.12.15.12.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 12:24:25 -0800 (PST)
Message-ID: <4b84e786-7592-1b7d-be0a-d8804ed7a607@gmail.com>
Date: Wed, 15 Dec 2021 12:24:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
Content-Language: en-US
To: Matt Madison <matt@madison.systems>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211215201615.536707-1-matt@madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211215201615.536707-1-matt@madison.systems>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159741



On 12/15/21 12:16 PM, Matt Madison wrote:
> which is introducing task hash changes for some
> allarch package builds, and should no longer
> be needed with recent versions of qemu.
> 

This would need a qemu backport for riscv32
https://lists.nongnu.org/archive/html/qemu-riscv/2021-12/msg00220.html

> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>   meta/classes/qemu.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 01a7b86ae1..333202b7c4 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>   # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
>   # qemu-arm default CPU supports all required architecture levels.
>   
> -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
>   QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>   
>   QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"

