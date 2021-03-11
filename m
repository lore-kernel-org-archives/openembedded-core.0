Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.7681.1615475920808590513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LgNrsYkw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 7so2302565wrz.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8zzby+WKdbxojZf3hcTFZcmMRO0hnDOHbnFcHT1jO68=;
        b=LgNrsYkwp1Cl28weth6ygzQjMIe4f2cWcVEFTCpWg4vc4yKMUPjqzbHETfK/Lz/H0a
         Ei57/XrAFfRExNJL4SKPhrfJFEgoWBqN5aUjrB02BVWtA6GDPi4Daht57jgvZIr9pDxQ
         Yyco2u66hslFRLwVuGJtjSATn/eKxeoILsjwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8zzby+WKdbxojZf3hcTFZcmMRO0hnDOHbnFcHT1jO68=;
        b=jjlzImr5Jm0fbEo7UAJpZp97B9CqXeSLPc1iztqoJUaQxHHYcATccNi0R8jCmWVG/s
         B/H4flBSjoSAomUu95bavEx+C1HSbvgaXIyVAo7cEPFRv+bwt1z1wRRw4tnPF6cMOBCA
         bmSBVT5MttbPIsL3RzG7kYSX0SwEMmytRKtZ0OC/DOUfhokT4tkPdAgqMqyv8+jt+5pk
         uIZlcaYbHE4T/ebE3lNwphkKtIPXWJLtUq9Y7Oxf1KtoeF+DRavCEBbud9VzMT9zqqsv
         MpmF5OFN1F1Xb5drUhEvtLUv7zahMoAmvtE2tAjQI2ahW0Sc6jh2thP1HnQEiJ+XvB9V
         eNcw==
X-Gm-Message-State: AOAM530st/SJ3iRoYaRgOPIg27OfjxJXtqFr6hPKuVNy47RPQVhs59TQ
	+CU/M8AP3NWeY/7bcSKkUXYv5g==
X-Google-Smtp-Source: ABdhPJzKCpOLFlvSnDrt2k/A7O4yW8vEuUWwNfXmHcmAzwaSV0LiAasddMwjcR9VTMh9BB5qjGOSxg==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr9593963wrv.40.1615475919304;
        Thu, 11 Mar 2021 07:18:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id n66sm3990088wmn.25.2021.03.11.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:18:38 -0800 (PST)
Message-ID: <83729bde0ecc08a5801328086747db15c5472f00.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	anibal.limon@linaro.org
Date: Thu, 11 Mar 2021 15:18:38 +0000
In-Reply-To: <20210311151051.pjdkjyaj5ojax2ya@jama>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
	 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
	 <20210311090200.33p3mptsfwusspwa@jama>
	 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
	 <20210311151051.pjdkjyaj5ojax2ya@jama>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 16:10 +0100, Martin Jansa wrote:
> On Thu, Mar 11, 2021 at 02:38:16PM +0000, Richard Purdie wrote:
> > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > This can fix a do_package error when compile with meta-secure-core layer:
> > > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-secure-core/
> > > > 
> > > > $ bitbake kernel-initramfs
> > > > [snip]
> > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-core-image-initramfs.packagedata
> > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk (variant '')?
> > > > [snip]
> > > > 
> > > > This is because kernel-initramfs wants to pack an initramfs image into
> > > > kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to do this:
> > > > 
> > > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > > > 
> > > > This causes kernel-initramfs' do_package depends on
> > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get the
> > > > error. Delete do_packagedata as other do_package relelated tasks for the image
> > > > recipe will fix the error.
> > > > 
> > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > 
> > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > 
> > > I went a bit further and inheritted nopackages, but RP mentioned that it
> > > might be removing too much. Nothing failed with nopackages over night,
> > > but still this smaller version will be safer as this needs to got to
> > > gatesgarth and dunfell as well now.
> > 
> > This has side effects and there was a reason this wasn't done originally. The 
> > trouble is that nobody is testing for that, just wanting to fix the problem 
> > they see. To prove this isn't straightforward, I tested this locally, comparing
> > task-depends.dot from "bitbake core-image-sato -g" before and after this patch.
> 
> The trouble for me is that seeing this "bitbake -g" again, doesn't 
> look wrong to me and:

It is a change of behaviour and it is not mentioned in the commit message
so it would silently break anyone using SRC_URI in image recipes (amongst 
other possible failure modes). Whether they should be doing that is a 
different question.
> 

> > I know last time we tried this I got several complaints
> > from users who use these tasks for things.
> 
> is the first time I've heard about people using these tasks in image
> recipes. I haven't found any reference to this in the patches which
> previously touched this area. Complaining that people don't remember
> whole history of OE like you isn't fair :).

I just remember changing this area of code and getting complaints. The 
information probably isn't in the commits but in the mailing list 
discussion surrounding them. Sadly my memory is far from perfect on any
of this, seeing that diff did spark something though :/.

Cheers,

Richard



