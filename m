Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2DE7310F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302146"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:50:58 +0200
Message-Id: <4e03bb422d03db3d2d0b6dcd291b9a8277c54c88.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/24] kconfig-frontends: fetch source from git
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:14 -0000

This is where development happens; tarballs are no longer produced.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../kconfig-frontends/kconfig-frontends_3.12.0.0.bb              | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index 09e10c9e0e0..4ca0e4da3ae 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -13,14 +13,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf-native"
 RDEPENDS_${PN} += "python bash"
-SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BP}.tar.xz"
+SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends"
 
-SRC_URI[md5sum] = "b939280dcc83f8feabd87a1d5f9b00c2"
-SRC_URI[sha256sum] = "ea2615a62c74bea6ce3b38402f00c7513858f307f6ba7aa9fdbf0bbc12bcf407"
+SRCREV = "75d35b172fc0f7b6620dd659af41f2ce04edc4e6"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 do_configure_prepend () {
-	mkdir -p scripts/.autostuff/m4
+	mkdir -p ${S}/scripts/.autostuff/m4
 }
 
 do_install_append() {
-- 
2.11.0


