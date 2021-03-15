Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.2367.1615767512256917517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 17:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UpWE6PMY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id 7so7827184wrz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 17:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=x+19IVupqi7eeoVFwh+S5I6/UZwy35rPu48/UnTqXkM=;
        b=UpWE6PMYGhMx9HMY/HtK1hWF3Idaczwvqcdf/Huc8KrGcGumR0WC+3mJzcRH3igmBR
         FromznCJwMqnLL7qGyfzuus3d6uZkNggitsM5j/LK5O74NCp7+d6JBWQgnAfaDiNL3yd
         yntasLaLzCJgcUBWFRTqlb+8lqkeHinPewNYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x+19IVupqi7eeoVFwh+S5I6/UZwy35rPu48/UnTqXkM=;
        b=DYdRxfHmOKZwHq1e6eF5ENbnxFtxQae6W7USoqkIyk10rcHUfTB+VDDHOABPwG578f
         HR814qMpZGBb7nPIG76iO2T0e5ysaT/yJDTU2i1ULQALkHjSn+k+STvADANSgHBY/Jwq
         SPjSHEral8uqs3jZ2aU4ir928OGA1JXA1rYfYLAd94r+n1y0y4oR0fekqrD3R0lvODuJ
         5v2o196YnYRiHCZimNiXpjKyvuznhqLV1JrfGCgKl2mRvuMk1k6OzFjuE5BdY0t2HS1m
         HdPrQmT4nDzrWmb6nIuUbJr6shf/sR0kmHPDieEoQ6BUHn0zX0obi9L+3JAQ4LGVZeAz
         SAGw==
X-Gm-Message-State: AOAM533g0nYDQIf5vyEq/ZyeOJlWayYZ9q6BHvIbCdL7nAmhfmjq2Kxw
	w9/SF208S7RWt6kreKSH+tB+cA==
X-Google-Smtp-Source: ABdhPJz58EtlsV2DNH/AKejLR+Mph5m4016kNxkTeEkgM9H7dh3dSQCcQAO99rlYtO5FcSiIPwhzEg==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr25046739wrk.406.1615767510722;
        Sun, 14 Mar 2021 17:18:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e? ([2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e])
        by smtp.gmail.com with ESMTPSA id o13sm19439681wro.15.2021.03.14.17.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 17:18:30 -0700 (PDT)
Message-ID: <429191805a150822726954fccc1f1ff8028bce0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Martin Jansa
 <Martin.Jansa@gmail.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	anibal.limon@linaro.org
Date: Mon, 15 Mar 2021 00:18:27 +0000
In-Reply-To: <20210315001603.GJ4892@denix.org>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
	 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
	 <20210311090200.33p3mptsfwusspwa@jama>
	 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
	 <fba65a47-7d0c-e0b4-3ea8-aad55b66bd62@windriver.com>
	 <20210312111708.zgj3qjikjcekj4y6@jama> <20210315001603.GJ4892@denix.org>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-03-14 at 20:16 -0400, Denys Dmytriyenko wrote:
> On Fri, Mar 12, 2021 at 12:17:08PM +0100, Martin Jansa wrote:
> > On Fri, Mar 12, 2021 at 03:59:20PM +0800, Robert Yang wrote:
> > > Hi RP,
> > > 
> > > On 3/11/21 10:38 PM, Richard Purdie wrote:
> > > > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > > > This can fix a do_package error when compile with meta-secure-core layer:
> > > > > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-secure-core/
> > > > > > 
> > > > > > $ bitbake kernel-initramfs
> > > > > > [snip]
> > > > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-core-image-initramfs.packagedata
> > > > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk (variant '')?
> > > > > > [snip]
> > > > > > 
> > > > > > This is because kernel-initramfs wants to pack an initramfs image into
> > > > > > kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to do this:
> > > > > > 
> > > > > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > > > > > 
> > > > > > This causes kernel-initramfs' do_package depends on
> > > > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get the
> > > > > > error. Delete do_packagedata as other do_package relelated tasks for the image
> > > > > > recipe will fix the error.
> > > > > > 
> > > > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > > > 
> > > > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > 
> > > > > I went a bit further and inheritted nopackages, but RP mentioned that it
> > > > > might be removing too much. Nothing failed with nopackages over night,
> > > > > but still this smaller version will be safer as this needs to got to
> > > > > gatesgarth and dunfell as well now.
> > > > 
> > > > This has side effects and there was a reason this wasn't done originally. The
> > > > trouble is that nobody is testing for that, just wanting to fix the problem
> > > > they see. To prove this isn't straightforward, I tested this locally, comparing
> > > > task-depends.dot from "bitbake core-image-sato -g" before and after this patch.
> > > 
> > > If we want to avoid disconnecting them, it seems that a better way is fixing
> > > this in the recipes which has this problem? For example, I got this error in
> > > secure-core-image-initramfs.bb, then we can add "deltask do_packagedata" in the
> > > recipe to fix the problem.
> > 
> > That's what I did in initramfs-android-image (which was triggering this
> > for me as reported on ML)
> > https://github.com/shr-distribution/meta-smartphone/commit/732dd29325d882a9b3414764ad4c7a254dae3f03
> 
> The issue of doing this in each and every possible initramfs image recipe is 
> that it does not scale. For example, this code in the original patch is very 
> common:
> 
> d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> 
> And INITRAMFS_IMAGE can be set anywhere - in machine config, distro config or 
> even by end user in local.conf
> 
> 
> > > @Martin maybe we shouldn't backport this patch to gatesgarth or dunfell since
> > > it may suprise the users.
> > 
> > Unfortunately
> > https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=e0c1db170fdd6c1d78fdfce017feae26c96fac29
> > was already backported to both gatesgarth and dunfell.
> 
> Yeah, it's unfortunate. Our LTS maintainer is too good! :)
> Seriously though, not sure why changing warning to error was even considered 
> for backporting to LTS! Making things stricter doesn't usually fall under 
> "bugfix" category...

FWIW I'm leaning to merging a deltask to image.bbclass in master and
suggesting we revert this and live with the warning in older branches...

The deltask will probably break things but I'm starting to think that
is the lesser of several issues. Its not appropriate for the stable
branches though.

Cheers,

Richard



