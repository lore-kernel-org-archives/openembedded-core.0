Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 7F93165CE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 247103162602;
	Mon, 22 Sep 2014 13:36:16 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:12 +0200
Message-Id: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [Patch 0/9]: support for generating SD images from wic
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:19 -0000

This patch series is a proposal that adds support for generating SD
card images for embedded boards using wic. I did not want to cross
post to meta-ti and meta-freescale so Denys and Otavio are added in
CC. I would be glad to receive some feedback from you.

So far, the 2 most common scenarios I've seen are that either the boot
files need to be located in a specific partition, or the bootloader is
located within the disk image, typically directly following MBR. The
series implements support for the first case. The second case should
be easily supportable on top of this code.

Within the context of boot partition, the proposal adds a new variable
IMAGE_BOOT_FILES. The variable contains a list of files that need to
be copied to the boot partition, possibly being renamed during the
process (example BBB support lists u-boot.img and MLO, analogical
config can be made up for RsPI). By default the files are picked up
from DEPLOY_DIR_IMAGE.

Patches 1-4 solve some general problems in wic, so if these go through
review I'd recommend merging them to master. If that's more convenient
I can post them again as a separate series.

Patches 5-8 implement IMAGE_BOOT_FILES support, wic source plugin and
a kickstart for SD card.

Patch 9 adds IMAGE_BOOT_FILES to yocto-bsp BBB config.


