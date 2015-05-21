Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B0D2965D19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:16:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,470,1427785200"; d="scan'208";a="733176205"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 09:15:35 +0000
Message-Id: <2a5f4b4dda096ef97aaa3b82b4f666241f07a5b3.1432199284.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/5] python3: fix pyconfig.h installation on target
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
X-List-Received-Date: Thu, 21 May 2015 16:16:08 -0000

The file pyconfig.h wasnt being deployed on target, causing an error
when importing some libraries that required it, this patch fixes
python3 manifest to include this file and fix the issue.

[YOCTO #7764]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.4-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.4.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
index 28885a9..b0f46c3 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -35,7 +35,7 @@ FILES_${PN}-compression="${libdir}/python3.4/gzip.* ${libdir}/python3.4/zipfile.
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.4/__future__.* ${libdir}/python3.4/_abcoll.* ${libdir}/python3.4/abc.* ${libdir}/python3.4/copy.* ${libdir}/python3.4/copyreg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/genericpath.* ${libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* ${libdir}/python3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posixpath.* ${libdir}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir}/python3.4/site.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.* ${libdir}/python3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}/python3.4/lib-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struct.*.so ${libdir}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dynload/xreadlines.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platform.* ${bindir}/python* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3.4/sysconfig.* ${libdir}/python3.4/_sysconfigdata.* ${libdir}/python3.4/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.4/__future__.* ${libdir}/python3.4/_abcoll.* ${libdir}/python3.4/abc.* ${libdir}/python3.4/copy.* ${libdir}/python3.4/copyreg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/genericpath.* ${libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* ${libdir}/python3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posixpath.* ${libdir}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir}/python3.4/site.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.* ${libdir}/python3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}/python3.4/lib-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struct.*.so ${libdir}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dynload/xreadlines.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platform.* ${bindir}/python* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3.4/sysconfig.* ${libdir}/python3.4/_sysconfigdata.* ${libdir}/python3.4/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
index 84da574..427367c 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -175,7 +175,7 @@ if __name__ == "__main__":
     "lib-dynload/binascii.*.so lib-dynload/_struct.*.so lib-dynload/time.*.so " +
     "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  + 
     "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
-    "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
+    "${includedir}/python${PYTHON_BINABI}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
     "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* " +
-- 
1.8.4.5


