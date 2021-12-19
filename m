Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE382C433F5
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 23:36:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.22907.1639956990945728766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 15:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=evo6JerU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 p36-20020a05600c1da400b003457428ec78so7232230wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 15:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xOE9nhlDyLybIWHQssQapqcjvlYqb4kVrDzD51JwYYw=;
        b=evo6JerUJ68YPh1NUBSXeL3c/JRqyblK7caVRdZpKY11qPRdHdatmxJdc8zZ5p0EUj
         YwvHtifdgDeZBKARC/Bj+A3cmxehgvK6WwqVmFfTd47UiynhyUsd/kfl/cy4lIV/0vUf
         D5FjHhWrZJc4FGu8NidsGLzDGRwCHYKjEmBUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xOE9nhlDyLybIWHQssQapqcjvlYqb4kVrDzD51JwYYw=;
        b=GB0tDV6Pm6HatwFMdxxbFlQGopq6Eye8pSPPTGM2c7EM3AcIERBL7yNbNLbwwuGII0
         tQ+sBaTZgueEkeidTriaZkm8kUK/4lNwclSwSgMMzH8G//zEMRGLDn7W5I8V7sACxkq9
         X6BSZdRjF5hY6rnI62pLzWsnCZRLVQ6Ny7MGc0Jifl+64ebnxyFjkkC5v39j1KlIk7U9
         b6xLVMFR4MKG01aX+cQiSq1lAWNeBJ4HyUNNJ7B//xCj3B4Xd3xLrjTvdEwpI8dvLtPJ
         s3gqYv+NUaDatX+wewphgllnvoghy6k5xvCXiClfKBAGTNFGMp5hJkRInOOBqP4NXPP5
         W+Rw==
X-Gm-Message-State: AOAM531vKH/9ywd6QTAJOrDK0ziGxRLR2ip0HjFyiDP6hgQn9Sbro9Rk
	V8mz+4CSzAvHbaqlh+CZH0zRcA==
X-Google-Smtp-Source: 
 ABdhPJyWK420y1vv94sHs6OUC2PzDuaMYRyIJtIcL7C9Fjg9N8WCwdAaRdwotGW9uvfxltI+aoyp2g==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr11674896wms.116.1639956989314;
        Sun, 19 Dec 2021 15:36:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:28ea:b7b2:54a:fcdd?
 ([2001:8b0:aba:5f3c:28ea:b7b2:54a:fcdd])
        by smtp.gmail.com with ESMTPSA id
 p13sm2293629wms.41.2021.12.19.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 15:36:28 -0800 (PST)
Message-ID: 
 <18b96677545b176fec83b55c65cc90c5f1cfffcf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Dec 2021 23:36:24 +0000
In-Reply-To: <20211215201615.536707-1-matt@madison.systems>
References: <20211215201615.536707-1-matt@madison.systems>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Dec 2021 23:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159852

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

Rather worryingly this breaks a few docs packages for reproducibility:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211219-6kkv1f8k/packages/diff-html/

which raises a number of questions in my mind. Investigation is needed as the
hashes clearly aren't encoding everything they should :(.

Cheers,

Richard


