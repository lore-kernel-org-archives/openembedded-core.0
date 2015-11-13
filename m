Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4B35A772D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686749"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:01 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:54 +0200
Message-Id: <9e15ed59da509627fffb517fbddbb3341256e780.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/19] pixman: Upgrade 0.32.6 -> 0.32.8
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:01 -0000

Update Upstream-Status on a patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch   | 2 +-
 meta/recipes-graphics/xorg-lib/{pixman_0.32.6.bb => pixman_0.32.8.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.6.bb => pixman_0.32.8.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
index a60df5f..6b7c1e6 100644
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
@@ -11,7 +11,7 @@ problematic code in test/utils.c.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Submitted
+Upstream-Status: Backport [commit 4297e9058]
 ---
 Changes v1 -> v2:
 
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
index 317a568..e13b9ad 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
@@ -34,7 +34,7 @@ SRC_URI += "\
 	    file://0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch \
 "
 
-SRC_URI[md5sum] = "8a9e8f14743a39cf303803f369c1f344"
-SRC_URI[sha256sum] = "201fc0d7d6bc0017496f2bd27b3ca14224aea0df6b624c5ee2dc0307a4ff14a4"
+SRC_URI[md5sum] = "18d6b62abdb7bc0f8e6b0ddf48986b2c"
+SRC_URI[sha256sum] = "5c63dbb3523fc4d86ed4186677815918a941b7cb390d5eec4f55cb5d66b59fb1"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.1.4


