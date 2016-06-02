Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F488773BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703431"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:58 +0300
Message-Id: <9042e7def9abb02faa11a2b96bde58cf3aa35485.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/31] python-docutils: move to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:57 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3-dbus_1.2.4.bb                    | 4 ++--
 .../python/{python-docutils_0.12.bb => python3-docutils_0.12.bb}      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-docutils_0.12.bb => python3-docutils_0.12.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.4.bb b/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
index c058caf..759512c 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
@@ -15,8 +15,8 @@ S = "${WORKDIR}/dbus-python-${PV}"
 inherit distutils3-base autotools pkgconfig
 
 PACKAGECONFIG ?= ""
-PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python-docutils-native"
-PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python-docutils-native python-epydoc-native"
+PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python3-docutils-native"
+PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python3-docutils-native python3-epydoc-native"
 
 do_configure_prepend() {
     export PYTHON=${PYTHON}
diff --git a/meta/recipes-devtools/python/python-docutils_0.12.bb b/meta/recipes-devtools/python/python3-docutils_0.12.bb
similarity index 92%
rename from meta/recipes-devtools/python/python-docutils_0.12.bb
rename to meta/recipes-devtools/python/python3-docutils_0.12.bb
index 8cda88d..e78fa3b 100644
--- a/meta/recipes-devtools/python/python-docutils_0.12.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.12.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=a722fbdc20347db7b69223594dd54574"
 
-DEPENDS = "python"
+DEPENDS = "python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
 SRC_URI[md5sum] = "4622263b62c5c771c03502afa3157768"
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb8
 
 S = "${WORKDIR}/docutils-${PV}"
 
-inherit distutils
+inherit distutils3
 
 BBCLASSEXTEND = "native"
 
-- 
2.8.1


