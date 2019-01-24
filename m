Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5F579D66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:33:18 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a20so4137815edc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 02:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/xZp4RlNQG0luOPSMhLnZAmkSKNDefNTV7fCG+fF6DY=;
	b=d+UE6oJiFBuksreyy6H/hVtNYT4yuHtDd6lcx65WbsDEyrSBmXtu3XvV6T9e61s7dY
	OP1Jrt4owC1k7ozoprYVtUMm7HS3UIqOv/kMqRTKyjgIWL8VAS+GlxFN+0l7DR31db+d
	OcnZnwv6tavoEMbJsyUgygYUgMGhJUk76+4bOVTKCLwpesIXmYK21GXE3rGSeI6Dezvn
	UF+NM+GtMd3zpXm4BX7tvFcNoFPqKCFyZ290xE7T1MnP2G5qPBM0QAEBUfDE+AC70wKN
	sHDPZJI8CfkTZntOY9Y5sd8D3kTeIIL2nIxV4941T25fvN5dapiq+6Qe37x0GkTQUQzf
	F1HA==
X-Gm-Message-State: AJcUukfk3knZbhkgHeIXhiC+EyNrbsT2Mv/AZswo8yqZoFzZTANlqgEx
	AWGCrv3wtjfIz509PlGzKZooN4Ls
X-Google-Smtp-Source: ALg8bN7VfsHGEIy4MfY0qoMzrDO/1Ru72AXYBSmeTpT+62E84/aDpw9BPixLSyC2jMOW3XslF9dJOQ==
X-Received: by 2002:a17:906:a4d5:: with SMTP id
	cc21mr5480841ejb.12.1548325998710; 
	Thu, 24 Jan 2019 02:33:18 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	x58sm10569273edm.10.2019.01.24.02.33.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 02:33:17 -0800 (PST)
Message-ID: <df0ee05291d15cbb947877454ed4f5d2404edb69.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 10:33:17 +0000
In-Reply-To: <1e8ad2e7-e200-0a74-6740-8337258aa574@skidata.com>
References: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
	<6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
	<1e8ad2e7-e200-0a74-6740-8337258aa574@skidata.com>
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
X-List-Received-Date: Thu, 24 Jan 2019 10:33:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 08:29 +0100, Richard Leitner wrote:
> 
> On 24/01/2019 08:31, Robert Yang wrote:
> > Hi Richard.L,
> > 
> > On 1/24/19 3:09 PM, Richard Leitner wrote:
> > > Hi,
> > > I'm currently facing issues on how to include a fitImage with 
> > > devicetrees and a INITRAMFS_IMAGE in my rootfs image.
> > > 
> > > My config is something like:
> > > 
> > > KERNEL_IMAGETYPE = "fitImage"
> > > KERNEL_CLASSES  = "kernel-fitimage"
> > > KERNEL_DEVICETREE = "a.dtb b.dtb c.dtb"
> > > INITRAMFS_IMAGE = "initramfs-mine"
> > > 
> > > To include the "normal" fitImage without the initramfs in the rootfs 
> > > the following works:
> > > 
> > > IMAGE_INSTALL_append += " kernel-image"
> > > 
> > > 
> > > When digging around a little bit I found that the 
> > > fitImage-initramfs-mine is
> > > deployed to tmp/deploy/images but there's no package including that
> > > file.
> > 
> > fitImage-initramfs-mine is an image, so it is not in any package, it is
> > handled by kernel.bbclass, you can check it for more info.
> 
> Ok. I saw how it's generated in the kernel-fitimage.bbclass and 
> kernel.bbclass... But is there any "clean" way of adding it to my rootfs 
> image like the fitImage?

I usually just add the fitImage manually in a ROOTFS_POSTINSTALL_COMMAND,
either via a specific project's bbclass that all actual images inherit, or
directly in the actual image recipe.

Cheers,
Andre'

> 
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


