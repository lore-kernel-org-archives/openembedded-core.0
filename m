Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1REURc-00063o-0z
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 01:12:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Oct 2011 16:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,343,1315206000"; d="scan'208";a="62399769"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 13 Oct 2011 16:06:19 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 16:06:15 -0700
Message-Id: <ac6c2ee7e11592d4e820ae7ba12f02342ca1a794.1318547063.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1a00b766c9b8029eaacbb80e0077dfcd556c7c0f.1318547063.git.nitin.a.kamble@intel.com>
References: <1a00b766c9b8029eaacbb80e0077dfcd556c7c0f.1318547063.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1318547063.git.nitin.a.kamble@intel.com>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
Subject: [review/test 5/5] update python 2.7 manifest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 23:12:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

script: add needed files into the python-core package

regenerate python-2.7-manifest.inc file with newer script

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index b86d073..69cb3c7 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -35,7 +35,7 @@ FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.
 
 DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
 RDEPENDS_${PN}-core=""
-FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* "
+FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig.h "
 
 DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
 RDEPENDS_${PN}-crypt="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index ffd68b9..b526df5 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -164,7 +164,9 @@ if __name__ == "__main__":
     "warnings.* site.* stat.* " +
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
-    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python*" )
+    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  + 
+    "_weakrefset.* sysconfig.* config/Makefile " +
+    "${includedir}/python${PYTHON_MAJMIN}/pyconfig.h " )
 
     m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
     "${includedir} ${libdir}/libpython2.6.so" ) # package
-- 
1.7.4.4



