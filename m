Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B57246013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 12:31:33 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lnXKx1XzBz3hjRL;
	Thu, 14 May 2015 14:31:33 +0200 (CEST)
X-Auth-Info: mJGZFiG5Q5EAbod5r3PmmDAzo7FfgiuQx5Lg2wSt8Os=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lnXKw6DhdzvdWR;
	Thu, 14 May 2015 14:31:32 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 14:31:05 +0200
Message-Id: <1431606674-5173-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 0/9] Add basic fitImage support
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
X-List-Received-Date: Thu, 14 May 2015 12:31:35 -0000

This series cleans up the code in kernel.bbclass and
separates out the uImage generation. The 7th patch
in this series then adds support for generation of the
advanced successor of the uImage, the fitImage.

This series adds only very rudimentary support for
generation of fitImage. The advanced features might
be added in subsequent patches.

I would also like to thank Richard for explaining to
me how to properly do the implementation and I hope
this series is at least close to that.

Marek Vasut (9):
  kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
  kernel: Rework do_uboot_mkimage
  kernel: Pull out the linux.bin generation
  kernel: Pull uImage generation into separate class
  kernel: Separate out uboot_prep_kimage
  kernel: Build DTBs early
  kernel: Add basic fitImage support
  kernel: Build uImage only when really needed
  doc: Document new KERNEL_CLASSES variable

 documentation/ref-manual/ref-variables.xml |  18 +++
 meta/classes/kernel-fitimage.bbclass       | 234 +++++++++++++++++++++++++++++
 meta/classes/kernel-uboot.bbclass          |  21 +++
 meta/classes/kernel-uimage.bbclass         |  36 +++++
 meta/classes/kernel.bbclass                |  52 +++----
 meta/conf/documentation.conf               |   1 +
 meta/recipes-kernel/linux/linux-dtb.inc    |  14 +-
 7 files changed, 343 insertions(+), 33 deletions(-)
 create mode 100644 meta/classes/kernel-fitimage.bbclass
 create mode 100644 meta/classes/kernel-uboot.bbclass
 create mode 100644 meta/classes/kernel-uimage.bbclass

-- 
2.1.4


