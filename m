Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AECBC6010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:28 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2016 06:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="23892243"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2016 06:28:06 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DED176A4006;
	Wed, 26 Oct 2016 06:27:31 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:48 +0300
Message-Id: <afb1b7e673da5c15ccffc77421739b4a1d2b8f47.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/14] at-spi2-core: Upgrade 2.20.2 -> 2.22.0
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:28 -0000

Six-monthly release, mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-core_2.20.2.bb => at-spi2-core_2.22.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.20.2.bb => at-spi2-core_2.22.0.bb} (88%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.20.2.bb b/meta/recipes-support/atk/at-spi2-core_2.22.0.bb
similarity index 88%
rename from meta/recipes-support/atk/at-spi2-core_2.20.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.22.0.bb
index 199243a..272849e 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.20.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.22.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-build-Add-with-systemduserunitdir.patch \
           "
 
-SRC_URI[md5sum] = "f6f6303da2e72317f881703f40bf0c62"
-SRC_URI[sha256sum] = "88a4de9d43139f13cca531b47b901bc1b56e0ab06ba899126644abd4ac16a143"
+SRC_URI[md5sum] = "3da5fe62a653e49dad1c47f9a46fee56"
+SRC_URI[sha256sum] = "415ea3af21318308798e098be8b3a17b2f0cf2fe16cecde5ad840cf4e0f2c80a"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-- 
2.1.4


