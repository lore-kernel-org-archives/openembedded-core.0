Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F07C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 08:41:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.5265.1633077690052412022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 01:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fnwJuQcE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so13068wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=itBSbZTiUpkCbHVsJxchwrE3AbPogFFkWDar6Do8RGo=;
        b=fnwJuQcERJ8dvnIp8e+4GLr4h0Cdmxez9Qg67E/b7VLfUnxjKJUgO9YxAcwIP+4SB/
         FI0ZfQrarxgqKJEsrWlffN2nEYBS0dvwNf2D/0ql+htoQdcY59vO13EBoTQFDBnfcO+Z
         Strdq0LKaNHpzFZsk65a/AHAr70X+SL9eAWwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=itBSbZTiUpkCbHVsJxchwrE3AbPogFFkWDar6Do8RGo=;
        b=Fa1MVj0F7vYVqZe9wRNII8mspCrFSa6/QJyLCyyEgSi+Q7/pye2OcWaxluyxEyEHjv
         nsXhPcvvzH0UPGALxun83KCLu9Gw33JMEe97tv9ky5wapwoPLqqqXJ2aeCwuNY8qsCUZ
         BWaDsYbh+vAZVritzm/rDmTfmVJLKb7OpXx8nYoclo1JoTAvYhJzUFxgrf5dm9Z79Tgs
         7xB7NjNpTHb0C0ACGHrghpKmgBbKXR7q6ha+cCB5SEkQWtrClFVmNdTf5TMoE843Ur6o
         3JPm7Qp5br0a+JMmdf0RXbfiFNEdrJC2C8Vr5lrac0q03v1e9mdwM/pWsTqKHggdFszI
         vNeA==
X-Gm-Message-State: AOAM533BX26sBDCLxSSrNMvZhew0Mmj/B4jRWyOOMYm0rcZ1e3MHUbci
	mUX2/I4JOTkkpbRwCvUwd5uymA==
X-Google-Smtp-Source: 
 ABdhPJxFLT1/lEysM0o4qM/6a1Y+1RJyxzgDVOMfnVFXXu2513HrBIPFLrItSab0O36z613XkEpCsQ==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr3167883wmq.159.1633077688443;
        Fri, 01 Oct 2021 01:41:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:415a:6029:9a90:9863?
 ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 i2sm5021286wrq.78.2021.10.01.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 01:41:28 -0700 (PDT)
Message-ID: 
 <93d076f8bbc8b9ddce33ab83dd085e0a8e2ef13f.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] wic/bootimg-efi: Add Unified Kernel Image option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Klausen <kristian@klausen.dk>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 01 Oct 2021 09:41:27 +0100
In-Reply-To: <YVa1Jr29QAgfhqqo@bob>
References: <20210913081304.10799-1-kristian@klausen.dk>
	 <YVGooo7LiUG3JQ0h@bob>
	 <0c89091d931bd81497bb81df47f1dfb559f2fffe.camel@linuxfoundation.org>
	 <YVa1Jr29QAgfhqqo@bob>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 08:41:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156515

Hi Kristian,

On Fri, 2021-10-01 at 09:13 +0200, Kristian Klausen wrote:
> That is unfortunate. I just had a quick look at the failed no-x11 
> build[1] and failed wic build[3]. According to the error logs[2][4] the 
> "postinstall intercept hook 'update_gio_module_cache'" is failing due 
> to:
> TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/libexec/gio-querymodules: /lib64/libc.so.6: version `GLIBC_2.34' not found (required by TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/libexec/gio-querymodules)
> 
> So I'm not sure it is related to my patch, please let me know how it 
> goes with the retest and I can investigate further if my patch is to 
> blame.
> 
> For the record, the tested patch wasn't this (v2) but the v3[5].
> 
> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/4084
> [2] https://errors.yoctoproject.org/Errors/Build/131891/
> [3] https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/4049
> [4] https://errors.yoctoproject.org/Errors/Build/131857/
> [5] https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_wic_bootimg_efi/85923375

It was the v3, I replied to the wrong email, sorry about that.

I think I've got the builds confused. I thought this one had wic failures in but
the wic failures look like they're in the one before:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2675

e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/4375

but I think they're also in the build without your change which does rule it
out.

There is clearly something else wrong causing the qemuwrapper issues so I'll try
and work that out then come back to this. Sorry about the noise, figuring out
which patches are causing which failures can sometimes be tricky.

Cheers,

Richard



