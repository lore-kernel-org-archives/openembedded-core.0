Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DB0C460672
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 19:15:56 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jLW624R6dz3hjMm;
	Sun, 19 Oct 2014 21:15:54 +0200 (CEST)
X-Auth-Info: r7rmpgz4pVAXyJX4QbzpcUMfQyOEzb0GIKyFcw8FcX0=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3jLW621J9zzvdWR;
	Sun, 19 Oct 2014 21:15:54 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Oct 2014 21:15:40 +0200
Message-Id: <1413746147-7120-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/7] Add basic fitImage support
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
X-List-Received-Date: Sun, 19 Oct 2014 19:16:02 -0000

This series cleans up the code in kernel.bbclass and
separates out the uImage generation. The last patch
in this series then adds support for generation of the
advanced successor of the uImage, the fitImage.

This series adds only very rudimentary support for
generation of fitImage. The advanced features might
be added in subsequent patches.

I would also like to thank Richard for explaining to
me how to properly do the implementation and I hope
this series is at least close to that.

Marek Vasut (7):
  kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
  kernel: Rework do_uboot_mkimage
  kernel: Pull out the linux.bin generation
  kernel: Pull uImage generation into separate class
  kernel: Separate out uboot_prep_kimage
  kernel: Build DTBs early
  kernel: Add basic fitImage support

 meta/classes/kernel-fitimage.bbclass    | 250 ++++++++++++++++++++++++++++++++
 meta/classes/kernel-uboot.bbclass       |  25 ++++
 meta/classes/kernel-uimage.bbclass      |  20 +++
 meta/classes/kernel.bbclass             |  35 +----
 meta/recipes-kernel/linux/linux-dtb.inc |  14 +-
 5 files changed, 311 insertions(+), 33 deletions(-)
 create mode 100644 meta/classes/kernel-fitimage.bbclass
 create mode 100644 meta/classes/kernel-uboot.bbclass
 create mode 100644 meta/classes/kernel-uimage.bbclass

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 
2.1.1


