Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6426D9B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:33:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 06:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920190"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:33:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:46 +0000
Message-Id: <5c3dd473522fa0acea6388bf5c45e93a20927a24.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/11] systemd: fix comments
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
X-List-Received-Date: Wed, 13 Nov 2013 14:33:04 -0000

It's DISTRO_FEATURES; DISTRO_FEATURE is invalid.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/systemd.bbclass             | 4 ++--
 meta/recipes-core/systemd/systemd_208.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 3700b2e..7a8d35c 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -9,8 +9,8 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
 SYSTEMD_AUTO_ENABLE ??= "enable"
 
 # This class will be included in any recipe that supports systemd init scripts,
-# even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
-# changes directly but check the DISTRO_FEATURES first.
+# even if systemd is not in DISTRO_FEATURES.  As such don't make any changes
+# directly but check the DISTRO_FEATURES first.
 python __anonymous() {
     features = d.getVar("DISTRO_FEATURES", True).split()
     # If the distro features have systemd but not sysvinit, inhibit update-rcd
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index ee716f4..8c70fe5 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -323,8 +323,8 @@ pkg_prerm_udev-hwdb () {
 	rm -f ${sysconfdir}/udev/hwdb.bin
 }
 
-# As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
-# building udev and systemd in world builds.
+# As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
+# that we don't build both udev and systemd in world builds.
 python () {
     if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
-- 
1.8.1.2


