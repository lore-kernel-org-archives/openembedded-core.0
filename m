Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E204672A85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:38:43 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbpZS3Rnnz3hhwX;
	Tue, 28 Apr 2015 18:38:40 +0200 (CEST)
X-Auth-Info: m42Vr7cO4DoT1daE9jfvmPlD6cUVwRs/fhM3y6ySVgU=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lbpZS0Q9TzvdWV;
	Tue, 28 Apr 2015 18:38:39 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 18:38:28 +0200
Message-Id: <1430239116-7671-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/8] Add basic fitImage support
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
X-List-Received-Date: Tue, 28 Apr 2015 16:38:47 -0000

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

Marek Vasut (8):
  kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
  kernel: Rework do_uboot_mkimage
  kernel: Pull out the linux.bin generation
  kernel: Pull uImage generation into separate class
  kernel: Separate out uboot_prep_kimage
  kernel: Build DTBs early
  kernel: Add basic fitImage support
  kernel: Build uImage only when really needed

 meta/classes/kernel-fitimage.bbclass    | 234 ++++++++++++++++++++++++++++++++
 meta/classes/kernel-uboot.bbclass       |  21 +++
 meta/classes/kernel-uimage.bbclass      |  36 +++++
 meta/classes/kernel.bbclass             |  46 ++-----
 meta/recipes-kernel/linux/linux-dtb.inc |  14 +-
 5 files changed, 318 insertions(+), 33 deletions(-)
 create mode 100644 meta/classes/kernel-fitimage.bbclass
 create mode 100644 meta/classes/kernel-uboot.bbclass
 create mode 100644 meta/classes/kernel-uimage.bbclass

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>

-- 
2.1.4


