Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AA94877162
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2016 02:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703341"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:43 +0300
Message-Id: <f877009cef99eb74d10fe8faf230cda4a4375ae1.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/31] python-pygobject: port to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:28 -0000

This reverts commit 7f7c9ab29eba0e58916629ca13dc4a494535ce19.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 0
 .../{python-pygobject_3.18.2.bb => python3-pygobject_3.18.2.bb}   | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-pygobject => python3-pygobject}/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch (100%)
 rename meta/recipes-devtools/python/{python-pygobject_3.18.2.bb => python3-pygobject_3.18.2.bb} (72%)

diff --git a/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
similarity index 100%
rename from meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
rename to meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
diff --git a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
similarity index 72%
rename from meta/recipes-devtools/python/python-pygobject_3.18.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
index 00c5079..4ddae81 100644
--- a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
@@ -3,9 +3,9 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
+inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection
 
-DEPENDS += "python glib-2.0"
+DEPENDS += "python3 glib-2.0"
 
 SRCNAME="pygobject"
 SRC_URI = " \
@@ -20,6 +20,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-cairo --with-python=python2.7"
+EXTRA_OECONF = "--disable-cairo"
 
-RDEPENDS_${PN} += "python-setuptools python-importlib"
+RDEPENDS_${PN} += "python3-setuptools python3-importlib"
-- 
2.8.1


