Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7887001D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498002"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:59 +0300
Message-Id: <28508e582166210a885333fa35435d83c51e13ad.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/45] python3: drop 110-enable-zlib.patch
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

With the patch, python (incorrectly) builds zlib module against external zlib.
Without the patch, it's using own internal copy of zlib.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-devtools/python/python3-native_3.5.1.bb |  1 -
 .../python/python3/110-enable-zlib.patch            | 21 ---------------------
 meta/recipes-devtools/python/python3_3.5.1.bb       |  1 -
 3 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.1.bb b/meta/recipes-devtools/python/python3-native_3.5.1.bb
index e8d0f9b..126935b 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.1.bb
@@ -12,7 +12,6 @@ file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
-file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://python-3.3-multilib.patch \
diff --git a/meta/recipes-devtools/python/python3/110-enable-zlib.patch b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
deleted file mode 100644
index fb92a19..0000000
--- a/meta/recipes-devtools/python/python3/110-enable-zlib.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Enable zlib in python
-
--Khem
-
-Upstream-Status: Inappropriate [OE-Specific]
-
----
- Modules/Setup.dist |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/Modules/Setup.dist
-+++ b/Modules/Setup.dist
-@@ -354,7 +354,7 @@ _symtable symtablemodule.c
- # Andrew Kuchling's zlib module.
- # This require zlib 1.1.3 (or later).
- # See http://www.gzip.org/zlib/
--#zlib zlibmodule.c -I$(prefix)/include -L$(exec_prefix)/lib -lz
-+zlib zlibmodule.c -lz
- 
- # Interface to the Expat XML parser
- #
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 1c8fe2f..bbb54f6 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -13,7 +13,6 @@ file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
-file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-- 
2.8.1


