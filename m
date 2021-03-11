Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7702.1615476093357028237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WDqfWCM8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id h98so2277680wrh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BC58fxBcVrGiAvVE4wG79LijXKMK3xIKxg1bwF1pAmE=;
        b=WDqfWCM86gSucII8TzBY11S+E+9IwB6s8brLgeh/jGutPKB+g+q4+rLy7AgjujW7wG
         /mH1nge9pBaJ7lKVXdo0WipEFoOeAYdRp9DWTC/jLGO8Cc5Ki5fQF23PK/E0cITnbDNp
         OyUAMKImQu/2DB+F+lbJLmsyYEtM6x7wZbZ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BC58fxBcVrGiAvVE4wG79LijXKMK3xIKxg1bwF1pAmE=;
        b=ZBnELuYzcKgBG5OGhSkb0/2zdPbZfJ9H7IDIyyij6H+yzdCmCp3qqNviCmVLozQKmD
         K+jpMX1PXqgUeV/QAGNm/xqj3DDmoHPc4IaQ4hJhphlu6cgPyjs3Nh+m8gsofkLF8vnZ
         06mhDCtGKi4e6K8nKqNBJggXCIsvconIRuvs5kDepZyRmpIdemtNaB9m2s8FAmzwHtOO
         vQe4ODoYzzmpnZfPgSxhSFOj2Bm+jyQI+ZiM77iXSCZGauttD8cqIiLWAfd8qLdkZ42J
         gBUBcKCC3KZLma64DGMb6Wvc0EOodtQvqrIp0TJ/4kAqNM0iQrF2ObzaWJcmjy5KMfj/
         mKsg==
X-Gm-Message-State: AOAM531J37yuMg86x3CS5krg8zImAqvjd3lBVjBNcJ+zG14ZgSJbShJr
	2C/bsiNdDHke/7JUnJYBnqly0Q==
X-Google-Smtp-Source: ABdhPJwT9QIhRQamg0TiVkdLVTl5RG4tackqN8adc1HBpivEEzPFLpBAFjrTZa0A11x4s/93jtZG/Q==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr9412122wrn.346.1615476091916;
        Thu, 11 Mar 2021 07:21:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id h10sm4431477wrp.22.2021.03.11.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:21:31 -0800 (PST)
Message-ID: <30cf5ee761a17704e5e223d298869c16f13bf058.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	anibal.limon@linaro.org
Date: Thu, 11 Mar 2021 15:21:30 +0000
In-Reply-To: <166B52CA91D6C66C.28467@lists.openembedded.org>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
	 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
	 <20210311090200.33p3mptsfwusspwa@jama>
	 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
	 <20210311151051.pjdkjyaj5ojax2ya@jama>
	 <166B52CA91D6C66C.28467@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 15:18 +0000, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2021-03-11 at 16:10 +0100, Martin Jansa wrote:
> > On Thu, Mar 11, 2021 at 02:38:16PM +0000, Richard Purdie wrote:
> > > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > > This can fix a do_package error when compile with meta-secure-core layer:
> > > > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-secure-core/
> > > > > 
> > > > > $ bitbake kernel-initramfs
> > > > > [snip]
> > > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-core-image-initramfs.packagedata
> > > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk (variant '')?
> > > > > [snip]
> > > > > 
> > > > > This is because kernel-initramfs wants to pack an initramfs image into
> > > > > kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to do this:
> > > > > 
> > > > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > > > > 
> > > > > This causes kernel-initramfs' do_package depends on
> > > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get the
> > > > > error. Delete do_packagedata as other do_package relelated tasks for the image
> > > > > recipe will fix the error.
> > > > > 
> > > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > > 
> > > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > 
> > > > I went a bit further and inheritted nopackages, but RP mentioned that it
> > > > might be removing too much. Nothing failed with nopackages over night,
> > > > but still this smaller version will be safer as this needs to got to
> > > > gatesgarth and dunfell as well now.
> > > 
> > > This has side effects and there was a reason this wasn't done originally. The 
> > > trouble is that nobody is testing for that, just wanting to fix the problem 
> > > they see. To prove this isn't straightforward, I tested this locally, comparing
> > > task-depends.dot from "bitbake core-image-sato -g" before and after this patch.
> > 
> > The trouble for me is that seeing this "bitbake -g" again, doesn't 
> > look wrong to me and:
> 
> It is a change of behaviour and it is not mentioned in the commit message
> so it would silently break anyone using SRC_URI in image recipes (amongst 
> other possible failure modes). Whether they should be doing that is a 
> different question.

I would add that anyone actually depending on that behaviour actually already
has a race issue since do_install and friends only has to happen before 
do_build so can happen long after do_image_complete...

Cheers,

Richard
> 

