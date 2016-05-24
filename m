Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBAE60118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109497992"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:57 +0300
Message-Id: <52db9c6d52cd0b6970a4a67d6625b8fc891f6a19.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/45] python-dbus: update to 1.2.4, port to python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:53:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{python-dbus_1.2.0.bb => python3-dbus_1.2.4.bb}       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python-dbus_1.2.0.bb => python3-dbus_1.2.4.bb} (62%)

diff --git a/meta/recipes-devtools/python/python-dbus_1.2.0.bb b/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
similarity index 62%
rename from meta/recipes-devtools/python/python-dbus_1.2.0.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.4.bb
index ccdb9ae..c058caf 100644
--- a/meta/recipes-devtools/python/python-dbus_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
@@ -3,24 +3,25 @@ SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0b83047ce9e948b67c0facc5f233476a"
-DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
+DEPENDS = "expat dbus dbus-glib virtual/libintl"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "b09cd2d1a057cc432ce944de3fc06bf7"
-SRC_URI[sha256sum] = "e12c6c8b2bf3a9302f75166952cbe41d6b38c3441bbc6767dbd498942316c6df"
+SRC_URI[md5sum] = "7372a588c83a7232b4e08159bfd48fe5"
+SRC_URI[sha256sum] = "e2f1d6871f74fba23652e51d10873e54f71adab0525833c19bad9e99b1b2f9cc"
 S = "${WORKDIR}/dbus-python-${PV}"
 
-inherit distutils-base autotools pkgconfig
+inherit distutils3-base autotools pkgconfig
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python-docutils-native"
 PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python-docutils-native python-epydoc-native"
 
-export STAGING_LIBDIR
-export STAGING_INCDIR
+do_configure_prepend() {
+    export PYTHON=${PYTHON}
+}
 
-RDEPENDS_${PN} = "python-io python-logging python-stringold python-threading python-xml"
+RDEPENDS_${PN} = "python3-io python3-logging python3-stringold python3-threading python3-xml"
 
 FILES_${PN}-dev += "${libdir}/pkgconfig"
-- 
2.8.1


