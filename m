Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id B53616013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:55:52 +0000 (UTC)
Received: by yhot59 with SMTP id t59so12052251yho.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p8QTNdIcoLSiyU9FGBAGds8YozPWvCghIv5n2QijxSs=;
	b=aFIJ9Bi4dclfxbOQOdR7cZl4fehhAqUEUQASb6oYdZlmYbMjOyghYrVJhHy+p/J6aD
	tT0wofGLEwQI7XdBXqHgtgMsO1WTiiZzQMG8wEwRuXETThULXRkkMwu66X6SxTDYfaMF
	w3ZpZa8afKND6IH4muoBzZk9yU0PYpLmTIIGwttAh6f5bCyRqK/LsTd/lGCViHKU2rcD
	i0E0JvOPEKdRPW+rq3E9pJozLNmQjylMOwr2KbFbk3hRonOCQ+1cyjw98OIUVoLyhodX
	eY8L/HU9/LkWfjm2492Yx/PblD2sjPb/0P7UXcvjQKOmfHDwqQ84j6dipFE1aadzzn1/
	2XYA==
X-Gm-Message-State: ALoCoQluiMpq3w3EbEo609B7+YwKF9GKaSIOpIDfA1D6t9pCHxwUVtT76HemhzHUNU8gQzuPkjaX
X-Received: by 10.170.143.2 with SMTP id k2mr53269456ykc.61.1426258553718;
	Fri, 13 Mar 2015 07:55:53 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id a74sm1773572yhq.31.2015.03.13.07.55.50
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Mar 2015 07:55:52 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 20:25:22 +0530
Message-Id: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Cc: matt.fleming@intel.com
Subject: [OE-core v1 PATCH 0/5] aarch64 changes for meta layer
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
X-List-Received-Date: Fri, 13 Mar 2015 14:55:54 -0000

I am adding the support of aarch64 to LUV OS Distribution project.
The luv-yocto project is based on poky distribution.

https://01.org/linux-uefi-validation

While adding support I find that these are the few meta layer changes,
which I have been asked to upstream. If we merge these changes into
openembedded-core it will be more helpful to maintain the minimum set
patches at dependency projects like luv-yocto.

Changes since V0:[RFC series]
- Include all the chages suggested by Bernhard Reutner-Fischer
- Add grub recipe changes suggested by Burton Ross

Naresh Bhat (5):
  bootimg: Add support to install Image
  syslinux: Remove bootimg dependency on aarch64
  bootimg: Skip build iso image for aarch64
  grub: Update grub git recipe
  grub-efi: Add to support to install grubaa64 efi

 meta/classes/bootimg.bbclass      |   17 ++++++++++---
 meta/classes/grub-efi.bbclass     |   17 ++++++++-----
 meta/classes/syslinux.bbclass     |   10 +++++++-
 meta/recipes-bsp/grub/grub_git.bb |   48 +++++++++++++++++++++++++++++++------
 4 files changed, 75 insertions(+), 17 deletions(-)

-- 
1.7.9.5


