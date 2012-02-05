Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rtvkz-00013m-Ms
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 07:39:26 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q156VIVb002873;
	Sat, 4 Feb 2012 22:31:22 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  5 Feb 2012 01:31:06 -0500
Message-Id: <8df8eccce619fcd2d85fb66ec013e2d74933e6e8.1328423023.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/5] linux-yocto: meta updates for sys940x and cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Feb 2012 06:39:27 -0000

Updating the meta SRCREV to pickup the following changes:

[
  Author: Darren Hart <dvhart@linux.intel.com>
  Date:   Wed Feb 1 09:37:48 2012 -0800

    Remove boot-live cfg duplication from BSPs

    Several BSPs duplicated the boot-live fragment in their BSP
    specific config. Remove the duplication and add CONFIG_RD_GZIP
    and CONFIG_BLK_DEV_SR to the boot-live fragment.

    Signed-off-by: Darren Hart <dvhart@linux.intel.com>
    Acked-by: Tom Zanussi <tzanussi@intel.com>

  Author: Darren Hart <dvhart@linux.intel.com>
  Date:   Tue Jan 31 13:18:17 2012 -0800

    meta: sys940x BSP meta data

    The Inforce SYS940x-ECX Developer-Ready Reference Platform features:
    o Intel Atom E6xx (0.6-1.6 GHz)
    o Up to 1GB on-board DDR2
    o Intel Platform Controller Hub EG20T
    o VGA,LVDS
    o HD Audio
    o SD Card
    o Dual SATA
    o Mini-PCIe

    http://www.inforcecomputing.com/SYS940X_ECX.html

    Signed-off-by: Darren Hart <dvhart@linux.intel.com>
    Acked-by: Tom Zanussi <tzanussi@intel.com>
    Signed-off-by: Darren Hart <dvhart@linux.intel.com>
]

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 5402f17..7f902fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "2f9d925f5681eaae7f341cc1270c739e8b329c03"
 SRCREV_machine_qemuppc ?= "c66f7ef2315010756c8c97af6b13d52f9f18c03b"
-SRCREV_meta ?= "59314a3523e360796419d76d78c6f7d8c5ef2593"
+SRCREV_meta ?= "77ca4855e80acb8dad21acea946908716c308b5b"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 6ff6027..f7bb0d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "15fd748017f0849138ff4b47d73f6866fa26cfe8"
 SRCREV_machine_qemux86 ?= "8f74a4339b3dc029fafff0ba7d88d6dc950d4b31"
 SRCREV_machine_qemux86-64 ?= "610c5a62daeda033755b0b7bfcb3e2cad5c76f3f"
 SRCREV_machine ?= "5df0b4c2538399aed543133b3855f809adf08ab8"
-SRCREV_meta ?= "59314a3523e360796419d76d78c6f7d8c5ef2593"
+SRCREV_meta ?= "77ca4855e80acb8dad21acea946908716c308b5b"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



