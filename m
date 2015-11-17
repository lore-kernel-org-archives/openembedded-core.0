Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BAFD76072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 22:13:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2015 14:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,310,1444719600"; d="scan'208";a="853305473"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.105])
	by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2015 14:13:30 -0800
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 16:13:15 -0600
Message-Id: <e43a8c7c3cd6fd8e3aa3737745042213733c9291.1447797811.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH 3/4] initramfs-framework_1.0:replace busybox for variable.
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
X-List-Received-Date: Tue, 17 Nov 2015 22:13:29 -0000

It replaces the use of busybox as hardcoded dependency to more dynamic
this wouldn't affect the way that the initrams is build, just it let a more
flexible replacement in the core.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6c37b9a..0664a95 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS_${PN} += "busybox"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
 PR = "r2"
 
-- 
2.1.0


