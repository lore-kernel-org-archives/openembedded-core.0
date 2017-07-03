Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 00BEE7806D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 06:45:40 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id k192so51459736ith.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Jul 2017 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=LPAYoh2s+Z5FzF3z2ikkHVM0nhOyqyfz6TahnEP13Iw=;
	b=eqwuhM8gmzdz77/zqIKjWDSXtWBv3LVgCa67q1XvP60hWOEGKO81SvZiG1FSyIpnZL
	4b/sshvAC5tJ4rSEKB2w0fIi3E9JvFf8GjQNhIH3fkShxb2YorKx2uBHbQcYI8uN7u1Z
	YRXbZ829S4yL7xisov8x5n6IYcgTcFL5Tb3ALOdY5YYmk7FJM2bggyNMCGPWM++c0GJ1
	gJRcacxHSyq7TIiePhdqYopf1pLUWTZyM9l2lRnJ7MYX+ZAld++0I/vyk6RFRHwQDeEp
	qfcXY5VHuGkygwWnO1zdLCXb7a1YHB/VIj6sd9Wgt+bvrhtYGhRkb/GxoaPzKW0dGDh2
	ubJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=LPAYoh2s+Z5FzF3z2ikkHVM0nhOyqyfz6TahnEP13Iw=;
	b=cSoCcdWgXdsprMfY0E6IBixOhW2ePEGUboZiRiSiiGLma5K4rkZbd73luisCuhZ5Jt
	HTAh2gWnwF4RU7UD7AYooSQ7507loVaR2buXPq9Ik9P7+kvKfthUaEcEUpiB4ET46U/9
	VG/6MQigvHjtiobfML2IBbpqSI8LmWvU3kAIAz/bGG0Gw4WoauStCqUIPhowRNbtSAjO
	DGgPB+r1NMnemflpuGiBq4eezBWDj6yLRXA39y6DJwejWB+ZQbyGNYRDaGDXLICvvsGo
	EOXz/q23BDP6MvvwkzkCx+hbeLfi76Sb1lf6nMDNrPXtLzhgFOARrdgaJIZdmlT1AtOF
	Pb5A==
X-Gm-Message-State: AKS2vOxSlgUDtlqfy43i1FmBh5YZ7V2fLp4uMQlw8FnUXWrwCVmdc55b
	8tNnVnctQ2qiP95I/6U=
X-Received: by 10.36.131.75 with SMTP id d72mr30749667ite.37.1499064341618;
	Sun, 02 Jul 2017 23:45:41 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF7A.dip0.t-ipconnect.de. [93.232.239.122])
	by smtp.gmail.com with ESMTPSA id
	z64sm8063561iod.55.2017.07.02.23.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Jul 2017 23:45:40 -0700 (PDT)
Message-ID: <1499064337.5259.48.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Mon, 03 Jul 2017 08:45:37 +0200
In-Reply-To: <6aef97ed-8284-039a-c780-c5b01ee8fe1a@linux.intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<1498848221.5259.13.camel@intel.com>
	<c36489e7-90fa-ebc5-afac-6a56525e2f35@linux.intel.com>
	<1498921790.5259.34.camel@intel.com>
	<6aef97ed-8284-039a-c780-c5b01ee8fe1a@linux.intel.com>
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
X-List-Received-Date: Mon, 03 Jul 2017 06:45:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-07-01 at 16:48 -0500, Alejandro Hernandez wrote:
> 
> On 07/01/2017 10:09 AM, Patrick Ohly wrote:
> > Is it really intended that do_image_wic runs for
> > core-image-tiny-initramfs? How and where is the output of
> > core-image-tiny-initramfs used?
> Yes, do_image_wic is intended to run automatically, hence why wic was 
> added to IMAGE_FSTYPES
> I'm not sure I understand what you mean by the second question, but the 
> output is just as in any other image

My point was that core-image-tiny-initramfs isn't like other *-initramfs
image recipes at all, and having an outdated DESCRIPTION in it doesn't
help much either.

> >  From the DESCRIPTION:
> >
> >          core-image-tiny-initramfs doesn't actually generate an image but
> >          rather generates boot and rootfs artifacts into a common
> >          location that can subsequently be picked up by external image
> >          generation tools such as wic.
> This is the old description, when it was though that we would have a common
> artifacts directory, which never happened due to some changes in wic 
> last year
> after which it was decided that core-image-tiny-initramfs would generate 
> the artifacts
> AND a wic image.

If that remains the solution (see below), will the DESCRIPTION and
perhaps even the file name be changed?

> > I still think your patch breaks images which use the initrd parameter to
> > reference an initrd produced by some other recipe.
> I see your point, if an initrd is produced by some other recipe it'd be 
> somewhere else, but at the same time, what if an initrd is produced by 
> the image recipe itself?, like in this case

I see two solutions:
1) keep using the recipe as currently intended and 
   add another sourceparam to bootimg-efi.py which changes the default
   source for initrd from DEPLOY_DIR_IMAGE (the current behavior) to
   IMGDEPLOYDIR
2) use two recipes, one for the initramfs (the current
   core-image-tiny-initramfs.bb, but without wic in IMAGE_FSTYPES) and
   a separate core-image-tiny.bb where do_rootfs gets replaced with
   an empty stub

I personally find the second solution cleaner. It's the standard way of
doing image + initramfs and thus will be easier to understand and have
less unexpected pitfalls.

One such pitfall in solution one exists even with your current patch:
do_image_wic does not depend on do_image_cpio (run "bitbake -g
core-image-tiny-initramfs:do_image_wic", "grep
'^.core-image-tiny-initramfs.do_image_wic' task-depends.dot") and thus
there's a race condition between the two tasks of the same recipe. That
can be fixed, of course, but it is making the solution even more
unusual.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




