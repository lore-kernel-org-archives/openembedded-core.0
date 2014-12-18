Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDE172864
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 7A89342600B;
	Thu, 18 Dec 2014 15:51:40 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Magnus Olsson <magnus@minimum.se>, Matt Fleming <matt.fleming@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 18 Dec 2014 15:51:22 +0100
Message-Id: <1418914282-18186-3-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418914282-18186-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1418914282-18186-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/2] python-2.7-manifest.inc: add stdlib argparse module
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
X-List-Received-Date: Thu, 18 Dec 2014 14:51:42 -0000

Adding argparse module from Python's standard library. The module has replaced
previous python-argparse package that was build using source that are not part
of Python 2.7 release.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 12 ++++++++----
 scripts/contrib/python/generate-manifest-2.7.py      |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 5c2629e..d16e452 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,18 +1,22 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '../poky/scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
+PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
 FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python2.7/lib2to3 "
 
+SUMMARY_${PN}-argparse="Python command line argument parser"
+RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
+FILES_${PN}-argparse="${libdir}/python2.7/argparse.* "
+
 SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
 FILES_${PN}-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so ${libdir}/python2.7/audiodev.* ${libdir}/python2.7/sunaudio.* ${libdir}/python2.7/sunau.* ${libdir}/python2.7/toaiff.* "
@@ -274,7 +278,7 @@ RDEPENDS_${PN}-zlib="${PN}-core"
 FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 68c42b0..74ec729 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -170,7 +170,7 @@ if __name__ == "__main__":
     "warnings.* site.* stat.* " +
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
-    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  + 
+    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  +
     "_weakrefset.* sysconfig.* config/Makefile " +
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
@@ -388,4 +388,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
+    m.addPackage( "${PN}-argparse", "Python command line argument parser", "${PN}-core ${PN}-codecs ${PN}-textutils",
+    "argparse.*" )
+
     m.make()
-- 
1.9.3


