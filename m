Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 674907772F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 16:23:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 09:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="290677683"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2017 09:23:06 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 09:23:03 -0700
Message-Id: <20170724162303.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] python-3.5-manifest: move python3.5-config script into the dev package
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
X-List-Received-Date: Mon, 24 Jul 2017 16:23:06 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The python config script is installed /usr/bin thus conflicting when
installing python and its multilib version. To avoid the latter, move
the script into the dev package.

[YOCTO #11513]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 65db7e8f20..227372e4c9 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -38,7 +38,7 @@ FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycach
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/__pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/__pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python*[!-config] ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
@@ -66,7 +66,7 @@ FILES_${PN}-debugger="${libdir}/python3.5/bdb.* ${libdir}/python3.5/__pycache__/
 
 SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python3.5/config*/Makefile ${libdir}/python3.5/config*/Makefile/__pycache__ "
+FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python3.5/config*/Makefile ${libdir}/python3.5/config*/Makefile/__pycache__ ${bindir}/python*-config"
 
 SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-- 
2.12.3


