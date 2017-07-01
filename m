Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0C617782B9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 15:09:53 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id z62so37131512ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=pbeXiJZ0WolCzZyGlzYwW2i3fYQ7Am4qsfnJNZ89rLs=;
	b=EMvyXijYbH/ItSnFKbzJHUzpnStlTuhX5ULnMlIeXBMon75dxULkVbqHas49NkOFy5
	r6X4SvZuwwA+tt8v0tjUnBsVcCpKaWtz4FLv3L/yd0/TmOAUejGJjPduVk9RzBiuw/Kh
	5Q+Hc6x5KLjypWDOSzqLpXQn2csHGRfKFKNypFGP6fFtNSTM7762HnelcsE3AijHknDn
	NR/RRTdPltsHj54gF/XZPIXlqeLLmYf4hsTR1Ith6vfDI3Rf0P+Hv2vPgh1Wjl/ow4Lh
	KHsG5KCwObNMd9Lc7J/V91twZzA2gu0neFHn4mp4uCDQTXNRnaG8ATF+t2SRyKJ44QRG
	7dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=pbeXiJZ0WolCzZyGlzYwW2i3fYQ7Am4qsfnJNZ89rLs=;
	b=aOR91sd5jEzlWHmvaWRFdCN9aJZJbfWbh91T6oRcVSXbCPT9O+p9jE+RWjm2nGC8RU
	8W8GTWIcHE62yEIIYR+9Yybd28BkneKVGFxC5M+2bzF7FsyUxpz3vqQ6WgKFWaqJe+z8
	ZA7x/ItVHw3xguR0TBIH8ngJMxrqp10cg2MXM/r06TtMgQzUV8FC6X6awH/z+AMpPdiO
	HCiHUCk+qnWcjt9MBzT+yqLAfsNbptjGDIuQVucVlm92jGI5qMWkxzADhu9ymKefxEyd
	ZeAxhL2bgGLHjQ1g3OplrdSAxqIYDICAGYT3fjHT69+qcVn8RytkHsgWic7Km29ecYKw
	ROjA==
X-Gm-Message-State: AKS2vOynxuiozSl0hXqT/CSYz0HMQXFVL/M1Vxig9n63r6REJ1QBGGIn
	mBYZVMCbOSiJ9RoV
X-Received: by 10.107.132.86 with SMTP id g83mr26948851iod.209.1498921794846; 
	Sat, 01 Jul 2017 08:09:54 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EA2A.dip0.t-ipconnect.de. [93.232.234.42])
	by smtp.gmail.com with ESMTPSA id 125sm7683103itz.7.2017.07.01.08.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 08:09:53 -0700 (PDT)
Message-ID: <1498921790.5259.34.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Sat, 01 Jul 2017 17:09:50 +0200
In-Reply-To: <c36489e7-90fa-ebc5-afac-6a56525e2f35@linux.intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<1498848221.5259.13.camel@intel.com>
	<c36489e7-90fa-ebc5-afac-6a56525e2f35@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Sat, 01 Jul 2017 15:09:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-30 at 15:38 -0500, Alejandro Hernandez wrote:
> Hey Patrick,
> 
> 
> On 06/30/2017 01:43 PM, Patrick Ohly wrote:
> > On Fri, 2017-06-30 at 10:53 -0700, Alejandro Hernandez wrote:
> >> When using wic to create an image from a certain build, wic is expecting
> >> to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
> >> which is wrong, since the initrd file has not been copied to the final
> >> directory yet, so instead of trying to use an initrd file from
> >> DEPLOY_DIR_IMAGE we get it from IMGDEPLOYDIR, which is the directory
> >> where the resulting images are placed before their final destination,
> >> and its where we can find the correct initrd file for our image.
> > Can you give an example with some real image and initramfs recipe where
> > this works? In other words, provide an example where the old behavior
> > fails and the new one works?
> Sure, so the problem comes when you add "wic" to IMAGE_FSTYPES (which is 
> not default for core-image-minimal nor core-image-minimal-initramfs).
> If you do this, do_image_wic will be executed automatically, and if it 
> tries to use foo.cpio.gz file as initrd, it will fail to find it on
> DEPLOY_DIR_IMAGE (unless a previous build was completed without 
> executing do_image_wic) since this file is still on IMGDEPLOYDIR and hasnt
> been copied to DEPLOY_DIR_IMAGE yet.
> 
> So a real example on real hardware:
> 
> if you build:
> DISTRO="poky-tiny"
> MACHINE="intel-corei7-64"
> bitbake core-image-tiny-initramfs
>
> You'll get an error stating that the foo.cpio.gz file cant be found.

Just for completeness, foo.cpio.gz =
core-image-tiny-initramfs-intel-corei7-64.cpio.gz, which is the
initramfs image produced by the recipe itself.

Is it really intended that do_image_wic runs for
core-image-tiny-initramfs? How and where is the output of
core-image-tiny-initramfs used?

From the DESCRIPTION:

        core-image-tiny-initramfs doesn't actually generate an image but
        rather generates boot and rootfs artifacts into a common
        location that can subsequently be picked up by external image
        generation tools such as wic.

If core-image-tiny-initramfs is meant to produce an initramfs, similar
to core-image-minimal-initramfs, then it shouldn't use "wic" in its
IMAGE_FSTYPES. Currently "wic" is listed:

# don't actually generate an image, just the artifacts needed for one
IMAGE_FSTYPES = "${INITRAMFS_FSTYPES} wic"

Does the recipe still work as intended without your patch when you
remove wic here?

> I did a build for both core-image-minimal and 
> core-image-minimal-initramfs and I dont see how theyre affected, the 
> necessary files are
> on IMGDEPLOYDIR in both cases as well.

Are you sure that core-image-minimal copies an initrd in bootimg-efi.py?
It checks source_params, but systemd-bootdisk.wks does not specify an
initrd in its sourceparams:

part /boot --source bootimg-efi --sourceparams="loader=systemd-boot"
--ondisk sda --label msdos --active --align 1024

That's different for the systemd-bootdisk-tiny64.wks that is used for
core-image-tiny-initramfs, which has:

part /boot --source bootimg-efi
--sourceparams="loader=systemd-boot,initrd=core-image-tiny-initramfs-intel-corei7-64.cpio.gz" --ondisk sda --label msdos --active --align 1024

I still think your patch breaks images which use the initrd parameter to
reference an initrd produced by some other recipe.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




