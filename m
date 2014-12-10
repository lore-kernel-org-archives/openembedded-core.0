Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 476 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Dec 2014 11:54:20 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id B470771624
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:54:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id A7B2D1C9B43;
	Wed, 10 Dec 2014 12:46:17 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>>,
	Rifenbark Scott <scott.m.rifenbark@intel.com>
Date: Wed, 10 Dec 2014 12:45:55 +0100
Message-Id: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/3] wic: glob support & minor fixes
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
X-List-Received-Date: Wed, 10 Dec 2014 11:54:26 -0000

This patch series adds changes that enable globbing in IMAGE_BOOT_FILES.
Effectivey this makes use of with with Raspberry Pi a tad easier, when a
lengthy list of boot files can be replaced with just one entry. A related
change to meta-raspberrypi will be sent to the Yocto mailing list.

Maciej Borzecki (3):
  wic: IMAGE_BOOT_FILES format checks in bootimg-partition source
  wic: add globbing support in IMAGE_BOOT_FILES entries
  ref-manual: update IMAGE_BOOT_FILES entry

 documentation/ref-manual/ref-variables.xml         | 37 +++++++++++++++----
 .../lib/wic/plugins/source/bootimg-partition.py    | 43 +++++++++++++++++-----
 2 files changed, 64 insertions(+), 16 deletions(-)

-- 
1.9.3


