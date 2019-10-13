Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id CA3887F561
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 01:24:33 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id s17so6300963plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=fXx/ELZUsKN7iNkm1yrpftptE3UJ2KcejvVgfOVNbv8=;
	b=pA7HCqa8sIXVW3mRGHIqpQQuXqKSmHaQXIG6yTIXtxYy0gbeV09LV8L6YMCOv+v7T/
	euHMhiDCCuulA9TIM/BB31gx0lUsSEw+LMP2SCSMQ4Z51aFo8hSMfQWqOIMKIVxY3wNv
	GbfBlrWglvQgTh6GYwXJNVcOi18BTCArF9i/oZeo8pXbqPBZsd9GCwnvIr9SDPXby02H
	kS83q9nkuvgZuojcCbupNbGVWZ4oUnXN3lfZxqVVPggNb4wpuUpM9PV8ASHwkg1+7W/V
	qb2nuOo+/CbK4Phdygs3tJzhKRmI/hK/Zkqj8ydIEP3Z37VL/vReym0tXNxhPh4sfdSi
	XmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=fXx/ELZUsKN7iNkm1yrpftptE3UJ2KcejvVgfOVNbv8=;
	b=MhTTThavze67vofrjBGM/K8Ia4Qp0Q2acs8BX3o6zbejU8X/3jq3KLgtGlvg1yuFSy
	R+A3KOl1TJxnpzyiAmN37DZGxbuZ7wd4Rh4dHqKntMaHZjmmEMJpP0Aw4K15lwYMIaNd
	sKlXJVJM8Ft/fbKjoG9gVbq2mHDbHRCF9b2dW5SlkB329kCF1pOtCPj99fpFnKYNAJdv
	mIelio5wGhAqR/288inpQhlZh4+F70rIZWFARWsdUsDYsYhkFDElxyYsp3VssN0CvDGA
	4WG8ioSQSfU50oX/DhmENO5MwIYut8sLo9P2dS7j/PmiEfI1Ccn6S/FHf4n/Urb3bk5I
	Tktw==
X-Gm-Message-State: APjAAAXDkHVwaJlX84z6F+Pa7BJuGVL5cYScwOtlPGwUZku3QB1SENBo
	QzVYT6blJvXjtAKYlQu3mmtfdC+PJds=
X-Google-Smtp-Source: APXvYqx5tUfFgF0Zl9+CKfk2/0RsycDRfogefo5AmvoGz1p+XxLwtTSDSJaoWwP9UY4Zaqqbsz/PuA==
X-Received: by 2002:a17:902:9306:: with SMTP id
	bc6mr22981697plb.133.1570929874472; 
	Sat, 12 Oct 2019 18:24:34 -0700 (PDT)
Received: from tyche ([2601:646:8500:1c20::3d0e])
	by smtp.gmail.com with ESMTPSA id
	j24sm13709221pff.71.2019.10.12.18.24.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 18:24:33 -0700 (PDT)
Message-ID: <ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: JH <jupiter.hce@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 18:24:33 -0700
In-Reply-To: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
References: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: Failed to build zImage-initramfs
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
X-List-Received-Date: Sun, 13 Oct 2019 01:24:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-10-13 at 12:14 +1100, JH wrote:
> Hi,
> 
> Apologize if it is not right mailing list for helps, please advise
> which mailing list I should go.
> 
> I have been trying to build zImage-initramfs, according to the
> oe-core/meta/classes/kernel.bbclass, I defined following variables in
> local.conf:
> 
> INITRAMFS_IMAGE = "zImage-initramfs"

this should be the rootfs image that you want to bundle into kernel and
not the name of final kernel as above. Put something like core-image-
minimal-initramfs or somesuch here.

> INITRAMFS_IMAGE_NAME = "zImage-initramfs"
> INITRAMFS_IMAGE_BUNDLE = "1"
> IMAGE_INSTALL_append = "zImage-initramfs"
> 
> But I had following errors:
> 
> ERROR: Nothing RPROVIDES 'zImage-initramfs' (but
> /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/ram-image.bb
> RDEPENDS on or otherwise requires it)
> 
> NOTE: Runtime target 'zImage-initramfs' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['zImage-initramfs']
> 
> ERROR: Required build target 'solar-image' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['ram-image', 'zImage-
> initramfs']
> 
> In my ram-image.bb:
> 
> inherit core-image
> 
> IMAGE_ROOTFS_SIZE = "100000"
> IMAGE_FSTYPES += " ${INITRAMFS_FSTYPES} cpio.gz tar.gz"
> PACKAGE_INSTALL = "${IMAGE_INSTALL}"
> 
> What I am missing for "Nothing RPROVIDES" error?
> 
> Thank you.
> 
> Kind regards,
> 
> - jh


