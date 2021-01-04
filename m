Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.12171.1609759902959222082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 03:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P4cgdPME;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id r4so18967038wmh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eCmyHsOawY6aSxS9Gw/fnnpQZ31JuAC9VAiyJp0DGKU=;
        b=P4cgdPMEd2x09X3tKbi8S52zWuJl3c1EYlfyHVBSJYCsdb91CUUbrQ9A5MhgDs2Rw3
         l4RosoZ1gVyUGw4JgH34f2ZcYHiOtG4/uUX69JO2xOZQkF+vt5sIya6kg//TU/A6Qn87
         WePtTgmO0mM2Hqu0dw9rydkEaarPg8J3u2G2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eCmyHsOawY6aSxS9Gw/fnnpQZ31JuAC9VAiyJp0DGKU=;
        b=r12q9l/Cm0i0bHLeiSXEBdPec+0GRnT/9x0S2Wf2e7v9kEX6Gjg5A2nCUQBTxLnrwc
         zbeT8Se15n9atzcAMmH7lWIC8Cnlvg41jwd8EBofZiKr3WePejfUwYZbSoOGSgzz48BF
         BQoFB30fqsXSXeuUbtVQGgsV44KNo233u8sC8lhvCfKEb0RVzQnI4e+4MQqanJwhUam3
         8M/Ml73WvmqHrc8sSLaJ/Y/xR3xANtvy1sQbeiZWpSFUulIoCjRMPcqjj5c7eoBfwA5y
         kehDIpFAkTL0WJQxFxP5o+pfAPI4N0wqJAdKOtEP0OaRlqu1IT4TYA4x5YAMDBwj/R8v
         JPBQ==
X-Gm-Message-State: AOAM531/hG4stYEvOXjZiBx8ETC+awUCN8rOP7i9pvVkjMhDOua9flOe
	KDRgtMpTGrvs6SgwKU/XkXZe9g==
X-Google-Smtp-Source: ABdhPJzXoWKHNR8OT2Et3C1BOUaS3Q1gnqwBBbQY0g8ImVz8P5R7F6Js2Dm13oHdKhQ6B9WMIfORFw==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr27004258wmd.2.1609759901349;
        Mon, 04 Jan 2021 03:31:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id h184sm34568963wmh.23.2021.01.04.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:31:41 -0800 (PST)
Message-ID: <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: nd <nd@arm.com>
Date: Mon, 04 Jan 2021 11:31:40 +0000
In-Reply-To: <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
	<9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-04 at 10:56 +0000, Diego Sueiro wrote:
> 
> Sorry, I missed your message in the IRC and was on holidays just
> returning today.

No problem, I think we're all catching up after the holidays!

> For example, in trusted-firmware-a recipe in meta-arm ( 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> ),
> we have an option to include the u-boot binary (as BL33) in the FIP
> image. And this
> is achieved by passing the DEPLOY_DIR_IMAGE path.
> 
> The idea for using the SYSROOT_DIRS is to not depend on u-
> boot:do_deploy in order
> to be able to use its generated artifacts. I'm just trying to follow
> the recommendation
> listed in the manual:  
> https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#new-sharing-files-between-recipes
> .
> 
> Note that some of these artifacts are not expected to be included in
> the filesystem.
> 
> In meta-arm, we are using the SYSROOT_DIRS approach for other
> firmware related
> recipes to share files between them.
> 
> We had some situations (which I don't remember exactly) where
> dependency cycles
> occurred between do_deploy tasks when trying to signing or creating
> wic images, and
> by using the combination of SYSROOT_DIRS and DEPENDS we managed to
> overcome
> these issues.

I think you are reading more into that manual section than is intended.
For files on the general filesystem, the sysroot is definitely the way
to share between recipes. For files that are not within the filesystem,
I think deploy is more appropriate. We could improve the docs to
mention that.

As such I don't really want to add a mechanism where we confuse those
lines if we can help it and I am reluctant to take the patch. do_deploy
was designed for these cases.

If you can find out more details of the issue you were running into we
might be able to help figure out how to break the circular
dependencies.

Cheers,

Richard


