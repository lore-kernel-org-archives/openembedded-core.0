Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02D89731A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 19:09:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 13 Jan 2016 11:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,290,1449561600"; d="scan'208";a="880732827"
Received: from unknown (HELO swold-mobl.jf.intel.com) ([10.252.130.206])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2016 11:09:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 13 Jan 2016 11:09:11 -0800
Message-Id: <1452712151-28662-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] linux-yocto: Update Genericx86* BSPs to 4.1.15
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
X-List-Received-Date: Wed, 13 Jan 2016 19:09:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 916e4ae..0473b08 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -7,8 +7,8 @@ KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
 KMACHINE_genericx86 ?= "common-pc"
 KMACHINE_genericx86-64 ?= "common-pc-64"
 
-SRCREV_machine_genericx86    ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
-SRCREV_machine_genericx86-64 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine_genericx86    ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_genericx86-64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
 SRCREV_machine_edgerouter ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
 SRCREV_machine_beaglebone ?= "efb6ffb2ca96a364f916c9890ad023fc595e0e6e"
 SRCREV_machine_mpc8315e-rdb ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-- 
2.5.0


