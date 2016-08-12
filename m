Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29BF16E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 21:06:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 12 Aug 2016 14:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,512,1464678000"; d="scan'208";a="864546310"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2016 14:06:53 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 21:03:33 +0000
Message-Id: <5e7ef6c13822259be4c3a29b2a8105a9d02d7f08.1471026724.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1471026724.git.alejandro.hernandez@linux.intel.com>
References: <cover.1471026724.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/3] python3.5-manifest: Fixes several dependencies on the newest python3
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
X-List-Received-Date: Fri, 12 Aug 2016 21:06:55 -0000

This patch adds the following packages: python3-enum (needed by python3-git),
python3-selectors (needed by python3-subprocess), python3-signal (needed by python3-subprocess),
and it also fixes the following ones with missing dependencies: python3-subprocess,
python3-compression, python3-datetime

[YOCTO #10127] [YOCTO #10124] [YOCTO #10122]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python-3.5-manifest.inc                 | 28 +++++++++++++++-------
 scripts/contrib/python/generate-manifest-3.5.py    | 19 +++++++++++----
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index d0cb98d..b4cb733 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -1,13 +1,13 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: './generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
@@ -31,7 +31,7 @@ FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/compil
 
 SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell"
-FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so "
+FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
@@ -51,7 +51,7 @@ FILES_${PN}-curses="${libdir}/python3.5/curses ${libdir}/python3.5/lib-dynload/_
 
 SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python3.5/_strptime.* ${libdir}/python3.5/calendar.* ${libdir}/python3.5/lib-dynload/datetime.*.so "
+FILES_${PN}-datetime="${libdir}/python3.5/_strptime.* ${libdir}/python3.5/calendar.* ${libdir}/python3.5/datetime.* ${libdir}/python3.5/lib-dynload/_datetime.*.so "
 
 SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
@@ -85,6 +85,10 @@ SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
 FILES_${PN}-email="${libdir}/python3.5/imaplib.* ${libdir}/python3.5/email "
 
+SUMMARY_${PN}-enum="Python support for enumerations"
+RDEPENDS_${PN}-enum="${PN}-core"
+FILES_${PN}-enum="${libdir}/python3.5/enum.* "
+
 SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
 FILES_${PN}-fcntl="${libdir}/python3.5/lib-dynload/fcntl.*.so "
@@ -193,10 +197,18 @@ SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
 FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so "
 
+SUMMARY_${PN}-selectors="Python High-level I/O multiplexing"
+RDEPENDS_${PN}-selectors="${PN}-core"
+FILES_${PN}-selectors="${libdir}/python3.5/selectors.* "
+
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re ${PN}-compression"
 FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/shutil.* "
 
+SUMMARY_${PN}-signal="Python set handlers for asynchronous events support"
+RDEPENDS_${PN}-signal="${PN}-core"
+FILES_${PN}-signal="${libdir}/python3.5/signal.* "
+
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
 FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.5/smtpd.* "
@@ -214,8 +226,8 @@ RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
 FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/python3.5/string.* ${libdir}/python3.5/stringold.* "
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
-RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
-FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* "
+RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-selectors"
+FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* ${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so "
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
@@ -258,7 +270,7 @@ RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
 FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 2feea2c..14029b3 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
 
-VERSION = "3.5.0"
+VERSION = "3.5.2"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ = "20140131"
@@ -218,7 +218,7 @@ if __name__ == "__main__":
     "py_compile.* compileall.*" )
 
     m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell",
-    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
+    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so lib-dynload/zlib.*.so" )
 
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.*.so lib-dynload/_hashlib.*.so lib-dynload/_sha256.*.so lib-dynload/_sha512.*.so" )
@@ -233,7 +233,7 @@ if __name__ == "__main__":
     "ctypes lib-dynload/_ctypes.*.so lib-dynload/_ctypes_test.*.so" ) # directory + low level module
 
     m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
-    "_strptime.* calendar.* lib-dynload/datetime.*.so" )
+    "_strptime.* calendar.* datetime.* lib-dynload/_datetime.*.so" )
 
     m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
@@ -256,6 +256,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-email", "Python email support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
     "imaplib.* email" ) # package
 
+    m.addPackage( "${PN}-enum", "Python support for enumerations", "${PN}-core",
+    "enum.*" )
+
     m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-core",
     "lib-dynload/fcntl.*.so" )
 
@@ -336,11 +339,17 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
 
+    m.addPackage( "${PN}-selectors", "Python High-level I/O multiplexing", "${PN}-core",
+    "selectors.*" )
+
     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re ${PN}-compression",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
-    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
-    "subprocess.*" )
+    m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core",
+    "signal.*" )
+
+    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-selectors",
+    "subprocess.* lib-dynload/_posixsubprocess.*.so" )
 
     m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading",
     "lib-dynload/_sqlite3.*.so sqlite3/dbapi2.* sqlite3/__init__.* sqlite3/dump.*" )
-- 
2.6.6


