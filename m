Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvyC-000295-Nf
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:48:24 +0100
Received: by bkbzv3 with SMTP id zv3so2373725bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tLuwybnxEsJZblonX7D+0yzl5yx2JL1Z8T7dSsNvRgM=;
	b=JgFJMiUMLImZ9WG9/lDZVPjNvY9ZoikzKd8LLpaWS+p6L+uQcWYd11fBgbrPBCKvLd
	6y8dZQvGK3zKQ7NJ1M+ogHvmTdr/xXsJrg2xK7eBSthkIp6MNx8AyjvBMauIkir1WF4z
	V87j2pS5L8afhRGsRUvtNEZ07xXkfPCkDtDSc=
Received: by 10.204.145.89 with SMTP id c25mr11413548bkv.35.1320082935972;
	Mon, 31 Oct 2011 10:42:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m4sm13116019fad.1.2011.10.31.10.42.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:42:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:41:46 +0100
Message-Id: <12fe0f0b503f76995a975b1e87d5d652d7f6a24b.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
References: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
Subject: [oe-core 3/7] update python 2.7 manifest
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
X-List-Received-Date: Mon, 31 Oct 2011 17:48:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

script: add needed files into the python-core package

regenerate python-2.7-manifest.inc file with newer script

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.7.7.1



