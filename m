Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZTN2-0004Ma-Jo
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:45:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MJgHNi019300
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 12:42:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 12:42:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 14:53:40 -0500
Message-ID: <48012ee2472c72eb6274cca7f0f748ea1b1b81a2.1308771739.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308771739.git.mark.hatle@windriver.com>
References: <cover.1308771739.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 13/40] python: Switch to using the default -dbg package (v3)
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
X-List-Received-Date: Wed, 22 Jun 2011 19:45:53 -0000
Content-Type: text/plain

Python was missing a lot of debug information.  Switch to use the default
-dbg package.  Also add some additional debug information to the -dbg package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python/python-2.6-manifest.inc                 |    8 ++------
 meta/recipes-devtools/python/python.inc            |    2 +-
 meta/recipes-devtools/python/python_2.6.6.bb       |    2 +-
 scripts/contrib/python/generate-manifest-2.6.py    |   16 +++++++++-------
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc b/meta/recipes-devtools/python/python-2.6-manifest.inc
index e4e503c..e3ebe41 100644
--- a/meta/recipes-devtools/python/python-2.6-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.6-manifest.inc
@@ -5,9 +5,9 @@
 
  
 
-PROVIDES+="${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-core-dbg ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
+PROVIDES+="${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
 
-PACKAGES="${PN}-core-dbg ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
 
 DESCRIPTION_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
@@ -37,10 +37,6 @@ DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
 RDEPENDS_${PN}-core=""
 FILES_${PN}-core="${libdir}/python2.6/__future__.* ${libdir}/python2.6/_abcoll.* ${libdir}/python2.6/abc.* ${libdir}/python2.6/copy.* ${libdir}/python2.6/copy_reg.* ${libdir}/python2.6/ConfigParser.* ${libdir}/python2.6/genericpath.* ${libdir}/python2.6/getopt.* ${libdir}/python2.6/linecache.* ${libdir}/python2.6/new.* ${libdir}/python2.6/os.* ${libdir}/python2.6/posixpath.* ${libdir}/python2.6/struct.* ${libdir}/python2.6/warnings.* ${libdir}/python2.6/site.* ${libdir}/python2.6/stat.* ${libdir}/python2.6/UserDict.* ${libdir}/python2.6/UserList.* ${libdir}/python2.6/UserString.* ${libdir}/python2.6/lib-dynload/binascii.so ${libdir}/python2.6/lib-dynload/_struct.so ${libdir}/python2.6/lib-dynload/time.so ${libdir}/python2.6/lib-dynload/xreadlines.so ${libdir}/python2.6/types.* ${libdir}/python2.6/platform.* ${bindir}/python* "
 
-DESCRIPTION_${PN}-core-dbg="Python core module debug information"
-RDEPENDS_${PN}-core-dbg="${PN}-core"
-FILES_${PN}-core-dbg="${libdir}/python2.6/config/.debug ${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug "
-
 DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
 RDEPENDS_${PN}-crypt="${PN}-core"
 FILES_${PN}-crypt="${libdir}/python2.6/hashlib.* ${libdir}/python2.6/md5.* ${libdir}/python2.6/sha.* ${libdir}/python2.6/lib-dynload/crypt.so ${libdir}/python2.6/lib-dynload/_hashlib.so ${libdir}/python2.6/lib-dynload/_sha256.so ${libdir}/python2.6/lib-dynload/_sha512.so "
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 3de220b..f5ebb5b 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -4,7 +4,7 @@ LICENSE = "PSF"
 SECTION = "devel/python"
 PRIORITY = "optional"
 # bump this on every change in contrib/python/generate-manifest-2.6.py
-INC_PR = "nk1"
+INC_PR = "nk2"
 
 DEFAULT_PREFERENCE = "-26"
 
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 24f1d33..e3c2355 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
diff --git a/scripts/contrib/python/generate-manifest-2.6.py b/scripts/contrib/python/generate-manifest-2.6.py
index 1b11266..0cc06b0 100755
--- a/scripts/contrib/python/generate-manifest-2.6.py
+++ b/scripts/contrib/python/generate-manifest-2.6.py
@@ -4,6 +4,11 @@
 # (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # (C) 2007 Jeremy Laine
 # licensed under MIT, see COPYING.MIT
+#
+# June 22, 2011 -- Mark Hatle <mark.hatle@windriver.com>
+#  * Updated to no longer generate special -dbg package, instead use the
+#    single system -dbg
+#  * Update version with ".1" to indicate this change
 
 import os
 import sys
@@ -12,7 +17,7 @@ import time
 VERSION = "2.6.6"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20110222"
+__version__ = "20110222.1"
 
 class MakefileMaker:
 
@@ -76,9 +81,9 @@ class MakefileMaker:
         # generate package line
         #
 
-        packageLine = 'PACKAGES="${PN}-core-dbg '
+        packageLine = 'PACKAGES="${PN}-dbg '
         for name in sorted(self.packages):
-            if name != '${PN}-core-dbg':
+            if name != '${PN}-dbg':
                 packageLine += "%s " % name
         packageLine += '${PN}-modules"'
 
@@ -123,7 +128,7 @@ class MakefileMaker:
         line = 'RDEPENDS_${PN}-modules="'
 
         for name, data in sorted(self.packages.iteritems()):
-            if name not in ['${PN}-core-dbg', '${PN}-dev']:
+            if name not in ['${PN}-dev']:
                 line += "%s " % name
 
         self.out( "%s \"" % line )
@@ -161,9 +166,6 @@ if __name__ == "__main__":
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
     "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python*" )
 
-    m.addPackage( "${PN}-core-dbg", "Python core module debug information", "${PN}-core",
-    "config/.debug lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug" )
-
     m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
     "${includedir} ${libdir}/libpython2.6.so" ) # package
 
-- 
1.7.3.4



