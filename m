Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5647BFBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:29:12 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d39so4114645edb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 02:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=e/mSfRmXKd1uIxosw90mbVWJpscL3RkkBIjc/O1fqFw=;
	b=hwZr00/z2kE5hlzgT9RaARavZUMHHDc+1qQa1weIjqY5nkKxPR+bolRaEC6rLoJxsw
	cIItsmaLdsOdRm/keJPlvrt2yKVRKOWjmkcaQUnbokMIxWw/JDpC183o0I9gtqGZL8qF
	XtdUYlAfY/ktcoEBk4hnVnrVe1QQINHa/UeVoC3YDgFZ/ZzLY4DWPdUR9k6lPAS+O/iH
	54hbBbS6Woyo23GZQfXS77utiK/pdajCTVMTrm6tfOwIkQf0xRUKOZSk8y7L7jmWRmKi
	qPs4vMDTdrH8b1xLh2+u/KL2qH4vlo8TqnmTcPb12/yamIKecELNazK1mz2xXE+Mlz90
	ClTQ==
X-Gm-Message-State: AJcUukdGi2DSaQR8L9WxscyeQYZzdzccjEkOZuvTO+DZTLKdQ9M2ElUA
	lPscSCjZgBjVwbX1gYf7L6zViVxu
X-Google-Smtp-Source: ALg8bN7jVNZ+mCThD5Z870x/zObVjsq8ZhuSqH+XyKfNL7moF9ieFlv3BYgM0UaSHtGPvPtpcx2EiA==
X-Received: by 2002:a50:95b4:: with SMTP id w49mr6017272eda.186.1548325752824; 
	Thu, 24 Jan 2019 02:29:12 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	j23sm10661500edr.89.2019.01.24.02.29.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 02:29:11 -0800 (PST)
Message-ID: <e1ef649844a23dc41a051d4bb196f212f2332daa.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 10:29:10 +0000
In-Reply-To: <83b8b17a-40c4-4876-8880-b89f95dc6f43@windriver.com>
References: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
	<6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
	<83b8b17a-40c4-4876-8880-b89f95dc6f43@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: How to include fitImage-initramfs in rootfs image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2019 10:29:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 15:52 +0800, Robert Yang wrote:
> 
> On 1/24/19 3:31 PM, Robert Yang wrote:
> > Hi Richard.L,
> > 
> > On 1/24/19 3:09 PM, Richard Leitner wrote:
> > > Hi,
> > > I'm currently facing issues on how to include a fitImage with
> > > devicetrees and 
> > > a INITRAMFS_IMAGE in my rootfs image.
> 
> I think that set both INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE should
> work,
> you have set INITRAMFS_IMAGE, so also set:
> 
> INITRAMFS_IMAGE_BUNDLE = "1"

I'm n not sure bundling the initramfs with the kernel is the best approach
when using a fitImage. After all, the purpose of the FIT is to describe to
U-Boot the individual components and their location already.

Cheers,
Andre'
 
> 
> // Robert
> 
> 
> > > My config is something like:
> > > 
> > > KERNEL_IMAGETYPE = "fitImage"
> > > KERNEL_CLASSES  = "kernel-fitimage"
> > > KERNEL_DEVICETREE = "a.dtb b.dtb c.dtb"
> > > INITRAMFS_IMAGE = "initramfs-mine"
> > > 
> > > To include the "normal" fitImage without the initramfs in the rootfs
> > > the 
> > > following works:
> > > 
> > > IMAGE_INSTALL_append += " kernel-image"
> > > 
> > > 
> > > When digging around a little bit I found that the fitImage-initramfs-
> > > mine is
> > > deployed to tmp/deploy/images but there's no package including that
> > > file.
> > 
> > fitImage-initramfs-mine is an image, so it is not in any package, it is
> > handled by kernel.bbclass, you can check it for more info.
> > 
> > // Robert
> > 
> > > Therefore I'm unable to include it via IMAGE_INSTALL.
> > > 
> > > Am I missing something?
> > > Is anybody of you aware of a solution?
> > > Does kernel-fitimage and kernel.bbclass offer this at all?
> > > 
> > > Any help would be greatly appreciated! Thanks!
> > > 
> > > regards;Richard.L


