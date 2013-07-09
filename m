Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85DD76B0C0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 00:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 17:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="367139951"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2013 17:32:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 17:32:07 -0700
Message-Id: <655437c02d0d0e0a1408886bc5aad302acf0eab1.1373329833.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] kconfig-frontends: Update to 3.10
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
X-List-Received-Date: Tue, 09 Jul 2013 00:32:09 -0000

Rename recipe to match upstream tarball name which requires a fix the the SOLIBS numbering

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...onfig-frontends_3.9.0.bb => kconfig-frontends_3.10.0.0.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.9.0.bb => kconfig-frontends_3.10.0.0.bb} (78%)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.9.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.10.0.0.bb
similarity index 78%
rename from meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.9.0.bb
rename to meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.10.0.0.bb
index 53eff30..901f115 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.9.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.10.0.0.bb
@@ -11,13 +11,12 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf pkgconfig-native"
-SPIN = ".0"
-SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}${SPIN}.tar.xz"
+SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "344646587de1bdf965640fff220281bd"
-SRC_URI[sha256sum] = "5d524b238d7dfb63fec782b731af681c5408d74304ef4de38137c542350dd6d6"
+SRC_URI[md5sum] = "1ebf13983eb5b2ce960d131cae290cad"
+SRC_URI[sha256sum] = "442a3794b6dd9427f411ecec25dccab1a4bfcf07fe734f62d40e538afd1f0c8a"
 
-S = "${WORKDIR}/${BPN}-${PV}${SPIN}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools
 do_configure_prepend () {
@@ -33,7 +32,7 @@ EXTRA_OECONF += "--disable-gconf --disable-qconf"
 
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
-SOLIBS = "-${PV}.so"
+SOLIBS = "-${@d.getVar('PV',1)[:-2]}.so"
 FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
 
 BBCLASSEXTEND = "native"
-- 
1.8.1.4


