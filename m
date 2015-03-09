Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id E1FB273998
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:31:45 +0000 (UTC)
Received: by igqa13 with SMTP id a13so23629614igq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 11:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W843v6w5q23J3GGijOsnmilonhJp10IWhSDkw5mgKkA=;
	b=Z5gEInTkjjphq+rjFUZlt/MXlSmbK8wlv6zJMgDbtuFOUVgf7NEtaTRSK+zupsiwL7
	ZYMLRpZv9WVewnBrTkaihxsYqyJAixzH3Iid7ZdIhbhV2FDvkS3smkfKmHPToZxuZ/y2
	cwuL5aBwbwgfCXzoU5MNBczJSuKHE5o4yQ51oT27uRypVga8VTHz2PddGtN54v1mKSyM
	KHKPAxK+ORa3BDrpWOSXsyo1ofGwWsvYwNks9F6ivxJXi9QE8U7GQRgyzSLx87go9g4R
	mBV2CqR/m7FmsTffuQe7rFwmuXBLTeXMCwbrEStIgtXVfosI6fD4fsjY7RPzinv4+N12
	/SMg==
X-Gm-Message-State: ALoCoQkibvlgMXxouwPvji0XQp0FlqTY6DZw/KT7XFcrG+mktcSpY0mmwjlbYnzAi8cwBoIrcjrP
X-Received: by 10.107.15.17 with SMTP id x17mr9449137ioi.39.1425925906398;
	Mon, 09 Mar 2015 11:31:46 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194])
	by mx.google.com with ESMTPSA id w3sm6552503igz.4.2015.03.09.11.31.40
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 11:31:44 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 00:01:11 +0530
Message-Id: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Mon, 09 Mar 2015 18:31:47 -0000

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
  syslinux: Remove bootimg dependency for aarch64
  bootimg: Skip iso image build for aarch64
  grub: Update grub git recipe
  grub-efi: Add support to install grubaa64 efi

 meta/classes/bootimg.bbclass      |   17 ++++++++++---
 meta/classes/grub-efi.bbclass     |   17 ++++++++-----
 meta/classes/syslinux.bbclass     |   11 ++++++++-
 meta/recipes-bsp/grub/grub_git.bb |   48 +++++++++++++++++++++++++++++++------
 4 files changed, 76 insertions(+), 17 deletions(-)

-- 
1.7.9.5


