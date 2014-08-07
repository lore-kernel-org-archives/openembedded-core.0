Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 86DF1709FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:26:21 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYSt4yyzz3hhpq;
	Thu,  7 Aug 2014 17:26:22 +0200 (CEST)
X-Auth-Info: YL9ZzbbWEpQfNwEn0mD7NhdmWCFOAn9vvquCQHMCrxE=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYSt44Xpz7S6QJ; 
	Thu,  7 Aug 2014 17:26:22 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:26:10 +0200
Message-Id: <1407425175-2828-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 0/5] Add initial fitImage support
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
X-List-Received-Date: Thu, 07 Aug 2014 15:26:21 -0000

The fitImage is a successor of the U-Boot uImage format, which is considered
legacy for years now. The fitImage allows packing multiple kernel images,
DTBs and other artifacts into a single image, which can then be protected
by SHA checksums and does even support signing the images for verified boot.

This patchset is the first stab at adding the new image format into Yocto.

Marek Vasut (5):
  Yocto: kernel: Rework do_uboot_mkimage
  Yocto: kernel: Pull out the linux.bin generation
  Yocto: kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
  Yocto: kernel: Build DTBs early
  Yocto: kernel: Add basic fitImage support

 meta/classes/kernel.bbclass             | 229 +++++++++++++++++++++++++++++---
 meta/recipes-kernel/linux/linux-dtb.inc |  14 +-
 2 files changed, 226 insertions(+), 17 deletions(-)

-- 
2.0.1


