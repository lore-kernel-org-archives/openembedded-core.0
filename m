Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB76C772E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686893"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:05 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:58 +0200
Message-Id: <00c5a47035bc8adad2e9ae6ac627b798fcc7bc04.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 13/19] xorg-driver-input: add xorg configuration to FILES
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:06 -0000

It's common for input drivers to to add files into
${datadir}/X11/xorg.conf.d/.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb | 2 --
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc         | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
index 19c122f..32db25b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
@@ -14,5 +14,3 @@ SRC_URI[md5sum] = "8ed68e8cc674dd61adb280704764aafb"
 SRC_URI[sha256sum] = "7b0e164ebd02a680e0c695955e783059f37edb0c2656398e0a972adc8e698c80"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
-
-FILES_${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index fbec064..21b60c4 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -7,5 +7,7 @@ python add_xorg_abi_depends() {
 }
 PACKAGEFUNCS =+ "add_xorg_abi_depends"
 
-FILES_${PN} += " ${libdir}/xorg/modules/input/*.so"
+FILES_${PN} += " ${libdir}/xorg/modules/input/*.so \
+                 ${datadir}/X11/xorg.conf.d \
+                 "
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/input/.debug"
-- 
2.1.4


