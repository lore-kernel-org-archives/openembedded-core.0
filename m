Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79F737885F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240459"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:07 -0800
Message-Id: <16f18c40bfd4d9603980f799cd224718cacbaa94.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v3 02/14] python-*-manifest/generators: fix long line lengths
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
X-List-Received-Date: Tue, 12 Dec 2017 05:04:32 -0000

The generators create python-*-manifest.inc files with
lines over 2500 characters long which breaks sending
patches via git send-email (because of smtp limitation).

This patchset formats all the long lines into multiple lines.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python-2.7-manifest.inc                 | 690 +++++++++++++--
 .../python/python-3.5-manifest.inc                 | 969 +++++++++++++++++++--
 scripts/contrib/python/generate-manifest-2.7.py    |  24 +-
 scripts/contrib/python/generate-manifest-3.5.py    |  24 +-
 4 files changed, 1540 insertions(+), 167 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 57d4834b3a..6198e2d1c3 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,287 +1,831 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: './scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
-
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+PROVIDES+=" \
+  ${PN}-2to3 \
+  ${PN}-argparse \
+  ${PN}-audio \
+  ${PN}-bsddb \
+  ${PN}-codecs \
+  ${PN}-compile \
+  ${PN}-compiler \
+  ${PN}-compression \
+  ${PN}-contextlib \
+  ${PN}-core \
+  ${PN}-crypt \
+  ${PN}-ctypes \
+  ${PN}-curses \
+  ${PN}-datetime \
+  ${PN}-db \
+  ${PN}-debugger \
+  ${PN}-dev \
+  ${PN}-difflib \
+  ${PN}-distutils \
+  ${PN}-distutils-staticdev \
+  ${PN}-doctest \
+  ${PN}-email \
+  ${PN}-fcntl \
+  ${PN}-gdbm \
+  ${PN}-hotshot \
+  ${PN}-html \
+  ${PN}-idle \
+  ${PN}-image \
+  ${PN}-importlib \
+  ${PN}-io \
+  ${PN}-json \
+  ${PN}-lang \
+  ${PN}-logging \
+  ${PN}-mailbox \
+  ${PN}-math \
+  ${PN}-mime \
+  ${PN}-mmap \
+  ${PN}-multiprocessing \
+  ${PN}-netclient \
+  ${PN}-netserver \
+  ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pkgutil \
+  ${PN}-plistlib \
+  ${PN}-pprint \
+  ${PN}-profile \
+  ${PN}-pydoc \
+  ${PN}-re \
+  ${PN}-readline \
+  ${PN}-resource \
+  ${PN}-robotparser \
+  ${PN}-shell \
+  ${PN}-smtpd \
+  ${PN}-sqlite3 \
+  ${PN}-sqlite3-tests \
+  ${PN}-stringold \
+  ${PN}-subprocess \
+  ${PN}-syslog \
+  ${PN}-terminal \
+  ${PN}-tests \
+  ${PN}-textutils \
+  ${PN}-threading \
+  ${PN}-tkinter \
+  ${PN}-unittest \
+  ${PN}-unixadmin \
+  ${PN}-xml \
+  ${PN}-xmlrpc \
+  ${PN}-zlib \
+"
+
+PACKAGES=" \
+  ${PN}-dbg \
+  ${PN}-2to3 \
+  ${PN}-argparse \
+  ${PN}-audio \
+  ${PN}-bsddb \
+  ${PN}-codecs \
+  ${PN}-compile \
+  ${PN}-compiler \
+  ${PN}-compression \
+  ${PN}-contextlib \
+  ${PN}-core \
+  ${PN}-crypt \
+  ${PN}-ctypes \
+  ${PN}-curses \
+  ${PN}-datetime \
+  ${PN}-db \
+  ${PN}-debugger \
+  ${PN}-dev \
+  ${PN}-difflib \
+  ${PN}-distutils-staticdev ${PN}-distutils \
+  ${PN}-doctest \
+  ${PN}-email \
+  ${PN}-fcntl \
+  ${PN}-gdbm \
+  ${PN}-hotshot \
+  ${PN}-html \
+  ${PN}-idle \
+  ${PN}-image \
+  ${PN}-importlib \
+  ${PN}-io \
+  ${PN}-json \
+  ${PN}-lang \
+  ${PN}-logging \
+  ${PN}-mailbox \
+  ${PN}-math \
+  ${PN}-mime \
+  ${PN}-mmap \
+  ${PN}-multiprocessing \
+  ${PN}-netclient \
+  ${PN}-netserver \
+  ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pkgutil \
+  ${PN}-plistlib \
+  ${PN}-pprint \
+  ${PN}-profile \
+  ${PN}-pydoc \
+  ${PN}-re \
+  ${PN}-readline \
+  ${PN}-resource \
+  ${PN}-robotparser \
+  ${PN}-shell \
+  ${PN}-smtpd \
+  ${PN}-sqlite3 \
+  ${PN}-sqlite3-tests \
+  ${PN}-stringold \
+  ${PN}-subprocess \
+  ${PN}-syslog \
+  ${PN}-terminal \
+  ${PN}-tests \
+  ${PN}-textutils \
+  ${PN}-threading \
+  ${PN}-tkinter \
+  ${PN}-unittest \
+  ${PN}-unixadmin \
+  ${PN}-xml \
+  ${PN}-xmlrpc \
+  ${PN}-zlib \
+  ${PN}-modules\
+"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python2.7/lib2to3 "
+FILES_${PN}-2to3=" \
+    ${bindir}/2to3 \
+    ${libdir}/python2.7/lib2to3 \
+"
 
 SUMMARY_${PN}-argparse="Python command line argument parser"
 RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
-FILES_${PN}-argparse="${libdir}/python2.7/argparse.* "
+FILES_${PN}-argparse=" \
+    ${libdir}/python2.7/argparse.* \
+"
 
 SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so ${libdir}/python2.7/audiodev.* ${libdir}/python2.7/sunaudio.* ${libdir}/python2.7/sunau.* ${libdir}/python2.7/toaiff.* "
+FILES_${PN}-audio=" \
+    ${libdir}/python2.7/wave.* \
+    ${libdir}/python2.7/chunk.* \
+    ${libdir}/python2.7/sndhdr.* \
+    ${libdir}/python2.7/lib-dynload/ossaudiodev.so \
+    ${libdir}/python2.7/lib-dynload/audioop.so \
+    ${libdir}/python2.7/audiodev.* \
+    ${libdir}/python2.7/sunaudio.* \
+    ${libdir}/python2.7/sunau.* \
+    ${libdir}/python2.7/toaiff.* \
+"
 
 SUMMARY_${PN}-bsddb="Python bindings for the Berkeley Database"
 RDEPENDS_${PN}-bsddb="${PN}-core"
-FILES_${PN}-bsddb="${libdir}/python2.7/bsddb ${libdir}/python2.7/lib-dynload/_bsddb.so "
+FILES_${PN}-bsddb=" \
+    ${libdir}/python2.7/bsddb \
+    ${libdir}/python2.7/lib-dynload/_bsddb.so \
+"
 
 SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python2.7/codecs.* ${libdir}/python2.7/encodings ${libdir}/python2.7/gettext.* ${libdir}/python2.7/locale.* ${libdir}/python2.7/lib-dynload/_locale.so ${libdir}/python2.7/lib-dynload/_codecs* ${libdir}/python2.7/lib-dynload/_multibytecodec.so ${libdir}/python2.7/lib-dynload/unicodedata.so ${libdir}/python2.7/stringprep.* ${libdir}/python2.7/xdrlib.* "
+FILES_${PN}-codecs=" \
+    ${libdir}/python2.7/codecs.* \
+    ${libdir}/python2.7/encodings \
+    ${libdir}/python2.7/gettext.* \
+    ${libdir}/python2.7/locale.* \
+    ${libdir}/python2.7/lib-dynload/_locale.so \
+    ${libdir}/python2.7/lib-dynload/_codecs* \
+    ${libdir}/python2.7/lib-dynload/_multibytecodec.so \
+    ${libdir}/python2.7/lib-dynload/unicodedata.so \
+    ${libdir}/python2.7/stringprep.* \
+    ${libdir}/python2.7/xdrlib.* \
+"
 
 SUMMARY_${PN}-compile="Python bytecode compilation support"
 RDEPENDS_${PN}-compile="${PN}-core"
-FILES_${PN}-compile="${libdir}/python2.7/py_compile.* ${libdir}/python2.7/compileall.* "
+FILES_${PN}-compile=" \
+    ${libdir}/python2.7/py_compile.* \
+    ${libdir}/python2.7/compileall.* \
+"
 
 SUMMARY_${PN}-compiler="Python compiler support"
 RDEPENDS_${PN}-compiler="${PN}-core"
-FILES_${PN}-compiler="${libdir}/python2.7/compiler "
+FILES_${PN}-compiler=" \
+    ${libdir}/python2.7/compiler \
+"
 
 SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
-FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.* ${libdir}/python2.7/tarfile.* ${libdir}/python2.7/lib-dynload/bz2.so "
+FILES_${PN}-compression=" \
+    ${libdir}/python2.7/gzip.* \
+    ${libdir}/python2.7/zipfile.* \
+    ${libdir}/python2.7/tarfile.* \
+    ${libdir}/python2.7/lib-dynload/bz2.so \
+"
 
 SUMMARY_${PN}-contextlib="Python utilities for with-statementcontexts."
 RDEPENDS_${PN}-contextlib="${PN}-core"
-FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.* "
+FILES_${PN}-contextlib=" \
+    ${libdir}/python${PYTHON_MAJMIN}/contextlib.* \
+"
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
-FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core=" \
+    ${libdir}/python2.7/__future__.* \
+    ${libdir}/python2.7/_abcoll.* \
+    ${libdir}/python2.7/abc.* \
+    ${libdir}/python2.7/ast.* \
+    ${libdir}/python2.7/copy.* \
+    ${libdir}/python2.7/copy_reg.* \
+    ${libdir}/python2.7/ConfigParser.* \
+    ${libdir}/python2.7/genericpath.* \
+    ${libdir}/python2.7/getopt.* \
+    ${libdir}/python2.7/linecache.* \
+    ${libdir}/python2.7/new.* \
+    ${libdir}/python2.7/os.* \
+    ${libdir}/python2.7/posixpath.* \
+    ${libdir}/python2.7/struct.* \
+    ${libdir}/python2.7/warnings.* \
+    ${libdir}/python2.7/site.* \
+    ${libdir}/python2.7/stat.* \
+    ${libdir}/python2.7/UserDict.* \
+    ${libdir}/python2.7/UserList.* \
+    ${libdir}/python2.7/UserString.* \
+    ${libdir}/python2.7/lib-dynload/binascii.so \
+    ${libdir}/python2.7/lib-dynload/_struct.so \
+    ${libdir}/python2.7/lib-dynload/time.so \
+    ${libdir}/python2.7/lib-dynload/xreadlines.so \
+    ${libdir}/python2.7/types.* \
+    ${libdir}/python2.7/platform.* \
+    ${bindir}/python* \
+    ${libdir}/python2.7/_weakrefset.* \
+    ${libdir}/python2.7/sysconfig.* \
+    ${libdir}/python2.7/_sysconfigdata.* \
+    ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h \
+    ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py \
+"
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
-FILES_${PN}-crypt="${libdir}/python2.7/hashlib.* ${libdir}/python2.7/md5.* ${libdir}/python2.7/sha.* ${libdir}/python2.7/lib-dynload/crypt.so ${libdir}/python2.7/lib-dynload/_hashlib.so ${libdir}/python2.7/lib-dynload/_sha256.so ${libdir}/python2.7/lib-dynload/_sha512.so "
+FILES_${PN}-crypt=" \
+    ${libdir}/python2.7/hashlib.* \
+    ${libdir}/python2.7/md5.* \
+    ${libdir}/python2.7/sha.* \
+    ${libdir}/python2.7/lib-dynload/crypt.so \
+    ${libdir}/python2.7/lib-dynload/_hashlib.so \
+    ${libdir}/python2.7/lib-dynload/_sha256.so \
+    ${libdir}/python2.7/lib-dynload/_sha512.so \
+"
 
 SUMMARY_${PN}-ctypes="Python C types support"
 RDEPENDS_${PN}-ctypes="${PN}-core"
-FILES_${PN}-ctypes="${libdir}/python2.7/ctypes ${libdir}/python2.7/lib-dynload/_ctypes.so ${libdir}/python2.7/lib-dynload/_ctypes_test.so "
+FILES_${PN}-ctypes=" \
+    ${libdir}/python2.7/ctypes \
+    ${libdir}/python2.7/lib-dynload/_ctypes.so \
+    ${libdir}/python2.7/lib-dynload/_ctypes_test.so \
+"
 
 SUMMARY_${PN}-curses="Python curses support"
 RDEPENDS_${PN}-curses="${PN}-core"
-FILES_${PN}-curses="${libdir}/python2.7/curses ${libdir}/python2.7/lib-dynload/_curses.so ${libdir}/python2.7/lib-dynload/_curses_panel.so "
+FILES_${PN}-curses=" \
+    ${libdir}/python2.7/curses \
+    ${libdir}/python2.7/lib-dynload/_curses.so \
+    ${libdir}/python2.7/lib-dynload/_curses_panel.so \
+"
 
 SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python2.7/_strptime.* ${libdir}/python2.7/calendar.* ${libdir}/python2.7/lib-dynload/datetime.so "
+FILES_${PN}-datetime=" \
+    ${libdir}/python2.7/_strptime.* \
+    ${libdir}/python2.7/calendar.* \
+    ${libdir}/python2.7/lib-dynload/datetime.so \
+"
 
 SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
-FILES_${PN}-db="${libdir}/python2.7/anydbm.* ${libdir}/python2.7/dumbdbm.* ${libdir}/python2.7/whichdb.* "
+FILES_${PN}-db=" \
+    ${libdir}/python2.7/anydbm.* \
+    ${libdir}/python2.7/dumbdbm.* \
+    ${libdir}/python2.7/whichdb.* \
+"
 
 SUMMARY_${PN}-debugger="Python debugger"
 RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
-FILES_${PN}-debugger="${libdir}/python2.7/bdb.* ${libdir}/python2.7/pdb.* "
+FILES_${PN}-debugger=" \
+    ${libdir}/python2.7/bdb.* \
+    ${libdir}/python2.7/pdb.* \
+"
 
 SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python2.7/config/Makefile "
+FILES_${PN}-dev=" \
+    ${includedir} \
+    ${libdir}/lib*${SOLIBSDEV} \
+    ${libdir}/*.la \
+    ${libdir}/*.a \
+    ${libdir}/*.o \
+    ${libdir}/pkgconfig \
+    ${base_libdir}/*.a \
+    ${base_libdir}/*.o \
+    ${datadir}/aclocal \
+    ${datadir}/pkgconfig \
+    ${libdir}/python2.7/config/Makefile \
+"
 
 SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-FILES_${PN}-difflib="${libdir}/python2.7/difflib.* "
+FILES_${PN}-difflib=" \
+    ${libdir}/python2.7/difflib.* \
+"
 
 SUMMARY_${PN}-distutils="Python Distribution Utilities"
 RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
-FILES_${PN}-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils "
+FILES_${PN}-distutils=" \
+    ${libdir}/python2.7/config \
+    ${libdir}/python2.7/distutils \
+"
 
 SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a "
+FILES_${PN}-distutils-staticdev=" \
+    ${libdir}/python2.7/config/lib*.a \
+"
 
 SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest="${libdir}/python2.7/doctest.* "
+FILES_${PN}-doctest=" \
+    ${libdir}/python2.7/doctest.* \
+"
 
 SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
-FILES_${PN}-email="${libdir}/python2.7/imaplib.* ${libdir}/python2.7/email "
+FILES_${PN}-email=" \
+    ${libdir}/python2.7/imaplib.* \
+    ${libdir}/python2.7/email \
+"
 
 SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
-FILES_${PN}-fcntl="${libdir}/python2.7/lib-dynload/fcntl.so "
+FILES_${PN}-fcntl=" \
+    ${libdir}/python2.7/lib-dynload/fcntl.so \
+"
 
 SUMMARY_${PN}-gdbm="Python GNU database support"
 RDEPENDS_${PN}-gdbm="${PN}-core"
-FILES_${PN}-gdbm="${libdir}/python2.7/lib-dynload/gdbm.so "
+FILES_${PN}-gdbm=" \
+    ${libdir}/python2.7/lib-dynload/gdbm.so \
+"
 
 SUMMARY_${PN}-hotshot="Python hotshot performance profiler"
 RDEPENDS_${PN}-hotshot="${PN}-core"
-FILES_${PN}-hotshot="${libdir}/python2.7/hotshot ${libdir}/python2.7/lib-dynload/_hotshot.so "
+FILES_${PN}-hotshot=" \
+    ${libdir}/python2.7/hotshot \
+    ${libdir}/python2.7/lib-dynload/_hotshot.so \
+"
 
 SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python2.7/formatter.* ${libdir}/python2.7/htmlentitydefs.* ${libdir}/python2.7/htmllib.* ${libdir}/python2.7/markupbase.* ${libdir}/python2.7/sgmllib.* ${libdir}/python2.7/HTMLParser.* "
+FILES_${PN}-html=" \
+    ${libdir}/python2.7/formatter.* \
+    ${libdir}/python2.7/htmlentitydefs.* \
+    ${libdir}/python2.7/htmllib.* \
+    ${libdir}/python2.7/markupbase.* \
+    ${libdir}/python2.7/sgmllib.* \
+    ${libdir}/python2.7/HTMLParser.* \
+"
 
 SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle="${bindir}/idle ${libdir}/python2.7/idlelib "
+FILES_${PN}-idle=" \
+    ${bindir}/idle \
+    ${libdir}/python2.7/idlelib \
+"
 
 SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
-FILES_${PN}-image="${libdir}/python2.7/colorsys.* ${libdir}/python2.7/imghdr.* ${libdir}/python2.7/lib-dynload/imageop.so ${libdir}/python2.7/lib-dynload/rgbimg.so "
+FILES_${PN}-image=" \
+    ${libdir}/python2.7/colorsys.* \
+    ${libdir}/python2.7/imghdr.* \
+    ${libdir}/python2.7/lib-dynload/imageop.so \
+    ${libdir}/python2.7/lib-dynload/rgbimg.so \
+"
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core"
-FILES_${PN}-importlib="${libdir}/python2.7/importlib "
+FILES_${PN}-importlib=" \
+    ${libdir}/python2.7/importlib \
+"
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}-contextlib"
-FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
+FILES_${PN}-io=" \
+    ${libdir}/python2.7/lib-dynload/_socket.so \
+    ${libdir}/python2.7/lib-dynload/_io.so \
+    ${libdir}/python2.7/lib-dynload/_ssl.so \
+    ${libdir}/python2.7/lib-dynload/select.so \
+    ${libdir}/python2.7/lib-dynload/termios.so \
+    ${libdir}/python2.7/lib-dynload/cStringIO.so \
+    ${libdir}/python2.7/pipes.* \
+    ${libdir}/python2.7/socket.* \
+    ${libdir}/python2.7/ssl.* \
+    ${libdir}/python2.7/tempfile.* \
+    ${libdir}/python2.7/StringIO.* \
+    ${libdir}/python2.7/io.* \
+    ${libdir}/python2.7/_pyio.* \
+"
 
 SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re ${PN}-codecs"
-FILES_${PN}-json="${libdir}/python2.7/json ${libdir}/python2.7/lib-dynload/_json.so "
+FILES_${PN}-json=" \
+    ${libdir}/python2.7/json \
+    ${libdir}/python2.7/lib-dynload/_json.so \
+"
 
 SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core"
-FILES_${PN}-lang="${libdir}/python2.7/lib-dynload/_bisect.so ${libdir}/python2.7/lib-dynload/_collections.so ${libdir}/python2.7/lib-dynload/_heapq.so ${libdir}/python2.7/lib-dynload/_weakref.so ${libdir}/python2.7/lib-dynload/_functools.so ${libdir}/python2.7/lib-dynload/array.so ${libdir}/python2.7/lib-dynload/itertools.so ${libdir}/python2.7/lib-dynload/operator.so ${libdir}/python2.7/lib-dynload/parser.so ${libdir}/python2.7/atexit.* ${libdir}/python2.7/bisect.* ${libdir}/python2.7/code.* ${libdir}/python2.7/codeop.* ${libdir}/python2.7/collections.* ${libdir}/python2.7/dis.* ${libdir}/python2.7/functools.* ${libdir}/python2.7/heapq.* ${libdir}/python2.7/inspect.* ${libdir}/python2.7/keyword.* ${libdir}/python2.7/opcode.* ${libdir}/python2.7/symbol.* ${libdir}/python2.7/repr.* ${libdir}/python2.7/token.* ${libdir}/python2.7/tokenize.* ${libdir}/python2.7/traceback.* ${libdir}/python2.7/weakref.* "
+FILES_${PN}-lang=" \
+    ${libdir}/python2.7/lib-dynload/_bisect.so \
+    ${libdir}/python2.7/lib-dynload/_collections.so \
+    ${libdir}/python2.7/lib-dynload/_heapq.so \
+    ${libdir}/python2.7/lib-dynload/_weakref.so \
+    ${libdir}/python2.7/lib-dynload/_functools.so \
+    ${libdir}/python2.7/lib-dynload/array.so \
+    ${libdir}/python2.7/lib-dynload/itertools.so \
+    ${libdir}/python2.7/lib-dynload/operator.so \
+    ${libdir}/python2.7/lib-dynload/parser.so \
+    ${libdir}/python2.7/atexit.* \
+    ${libdir}/python2.7/bisect.* \
+    ${libdir}/python2.7/code.* \
+    ${libdir}/python2.7/codeop.* \
+    ${libdir}/python2.7/collections.* \
+    ${libdir}/python2.7/dis.* \
+    ${libdir}/python2.7/functools.* \
+    ${libdir}/python2.7/heapq.* \
+    ${libdir}/python2.7/inspect.* \
+    ${libdir}/python2.7/keyword.* \
+    ${libdir}/python2.7/opcode.* \
+    ${libdir}/python2.7/symbol.* \
+    ${libdir}/python2.7/repr.* \
+    ${libdir}/python2.7/token.* \
+    ${libdir}/python2.7/tokenize.* \
+    ${libdir}/python2.7/traceback.* \
+    ${libdir}/python2.7/weakref.* \
+"
 
 SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-FILES_${PN}-logging="${libdir}/python2.7/logging "
+FILES_${PN}-logging=" \
+    ${libdir}/python2.7/logging \
+"
 
 SUMMARY_${PN}-mailbox="Python mailbox format support"
 RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox="${libdir}/python2.7/mailbox.* "
+FILES_${PN}-mailbox=" \
+    ${libdir}/python2.7/mailbox.* \
+"
 
 SUMMARY_${PN}-math="Python math support"
 RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
-FILES_${PN}-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${libdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
+FILES_${PN}-math=" \
+    ${libdir}/python2.7/lib-dynload/cmath.so \
+    ${libdir}/python2.7/lib-dynload/math.so \
+    ${libdir}/python2.7/lib-dynload/_random.so \
+    ${libdir}/python2.7/random.* \
+    ${libdir}/python2.7/sets.* \
+"
 
 SUMMARY_${PN}-mime="Python MIME handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python2.7/mimetools.* ${libdir}/python2.7/uu.* ${libdir}/python2.7/quopri.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/MimeWriter.* "
+FILES_${PN}-mime=" \
+    ${libdir}/python2.7/mimetools.* \
+    ${libdir}/python2.7/uu.* \
+    ${libdir}/python2.7/quopri.* \
+    ${libdir}/python2.7/rfc822.* \
+    ${libdir}/python2.7/MimeWriter.* \
+"
 
 SUMMARY_${PN}-mmap="Python memory-mapped file support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
-FILES_${PN}-mmap="${libdir}/python2.7/lib-dynload/mmap.so "
+FILES_${PN}-mmap=" \
+    ${libdir}/python2.7/lib-dynload/mmap.so \
+"
 
 SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so ${libdir}/python2.7/multiprocessing "
+FILES_${PN}-multiprocessing=" \
+    ${libdir}/python2.7/lib-dynload/_multiprocessing.so \
+    ${libdir}/python2.7/multiprocessing \
+"
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
+FILES_${PN}-netclient=" \
+    ${libdir}/python2.7/*Cookie*.* \
+    ${libdir}/python2.7/base64.* \
+    ${libdir}/python2.7/cookielib.* \
+    ${libdir}/python2.7/ftplib.* \
+    ${libdir}/python2.7/gopherlib.* \
+    ${libdir}/python2.7/hmac.* \
+    ${libdir}/python2.7/httplib.* \
+    ${libdir}/python2.7/mimetypes.* \
+    ${libdir}/python2.7/nntplib.* \
+    ${libdir}/python2.7/poplib.* \
+    ${libdir}/python2.7/smtplib.* \
+    ${libdir}/python2.7/telnetlib.* \
+    ${libdir}/python2.7/urllib.* \
+    ${libdir}/python2.7/urllib2.* \
+    ${libdir}/python2.7/urlparse.* \
+    ${libdir}/python2.7/uuid.* \
+    ${libdir}/python2.7/rfc822.* \
+    ${libdir}/python2.7/mimetools.* \
+"
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
-FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer.* ${libdir}/python2.7/SocketServer.* "
+FILES_${PN}-netserver=" \
+    ${libdir}/python2.7/cgi.* \
+    ${libdir}/python2.7/*HTTPServer.* \
+    ${libdir}/python2.7/SocketServer.* \
+"
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/fractions.* ${libdir}/python2.7/numbers.* "
+FILES_${PN}-numbers=" \
+    ${libdir}/python2.7/decimal.* \
+    ${libdir}/python2.7/fractions.* \
+    ${libdir}/python2.7/numbers.* \
+"
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so ${libdir}/python2.7/pickletools.* "
+FILES_${PN}-pickle=" \
+    ${libdir}/python2.7/pickle.* \
+    ${libdir}/python2.7/shelve.* \
+    ${libdir}/python2.7/lib-dynload/cPickle.so \
+    ${libdir}/python2.7/pickletools.* \
+"
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
-FILES_${PN}-pkgutil="${libdir}/python2.7/pkgutil.* "
+FILES_${PN}-pkgutil=" \
+    ${libdir}/python2.7/pkgutil.* \
+"
 
 SUMMARY_${PN}-plistlib="Generate and parse Mac OS X .plist files"
 RDEPENDS_${PN}-plistlib="${PN}-core ${PN}-datetime ${PN}-io"
-FILES_${PN}-plistlib="${libdir}/python2.7/plistlib.* "
+FILES_${PN}-plistlib=" \
+    ${libdir}/python2.7/plistlib.* \
+"
 
 SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
-FILES_${PN}-pprint="${libdir}/python2.7/pprint.* "
+FILES_${PN}-pprint=" \
+    ${libdir}/python2.7/pprint.* \
+"
 
 SUMMARY_${PN}-profile="Python basic performance profiling support"
 RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
-FILES_${PN}-profile="${libdir}/python2.7/profile.* ${libdir}/python2.7/pstats.* ${libdir}/python2.7/cProfile.* ${libdir}/python2.7/lib-dynload/_lsprof.so "
+FILES_${PN}-profile=" \
+    ${libdir}/python2.7/profile.* \
+    ${libdir}/python2.7/pstats.* \
+    ${libdir}/python2.7/cProfile.* \
+    ${libdir}/python2.7/lib-dynload/_lsprof.so \
+"
 
 SUMMARY_${PN}-pydoc="Python interactive help support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python2.7/pydoc.* ${libdir}/python2.7/pydoc_data "
+FILES_${PN}-pydoc=" \
+    ${bindir}/pydoc \
+    ${libdir}/python2.7/pydoc.* \
+    ${libdir}/python2.7/pydoc_data \
+"
 
 SUMMARY_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
-FILES_${PN}-re="${libdir}/python2.7/re.* ${libdir}/python2.7/sre.* ${libdir}/python2.7/sre_compile.* ${libdir}/python2.7/sre_constants* ${libdir}/python2.7/sre_parse.* "
+FILES_${PN}-re=" \
+    ${libdir}/python2.7/re.* \
+    ${libdir}/python2.7/sre.* \
+    ${libdir}/python2.7/sre_compile.* \
+    ${libdir}/python2.7/sre_constants* \
+    ${libdir}/python2.7/sre_parse.* \
+"
 
 SUMMARY_${PN}-readline="Python readline support"
 RDEPENDS_${PN}-readline="${PN}-core"
-FILES_${PN}-readline="${libdir}/python2.7/lib-dynload/readline.so ${libdir}/python2.7/rlcompleter.* "
+FILES_${PN}-readline=" \
+    ${libdir}/python2.7/lib-dynload/readline.so \
+    ${libdir}/python2.7/rlcompleter.* \
+"
 
 SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python2.7/lib-dynload/resource.so "
+FILES_${PN}-resource=" \
+    ${libdir}/python2.7/lib-dynload/resource.so \
+"
 
 SUMMARY_${PN}-robotparser="Python robots.txt parser"
 RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
-FILES_${PN}-robotparser="${libdir}/python2.7/robotparser.* "
+FILES_${PN}-robotparser=" \
+    ${libdir}/python2.7/robotparser.* \
+"
 
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
-FILES_${PN}-shell="${libdir}/python2.7/cmd.* ${libdir}/python2.7/commands.* ${libdir}/python2.7/dircache.* ${libdir}/python2.7/fnmatch.* ${libdir}/python2.7/glob.* ${libdir}/python2.7/popen2.* ${libdir}/python2.7/shlex.* ${libdir}/python2.7/shutil.* "
+FILES_${PN}-shell=" \
+    ${libdir}/python2.7/cmd.* \
+    ${libdir}/python2.7/commands.* \
+    ${libdir}/python2.7/dircache.* \
+    ${libdir}/python2.7/fnmatch.* \
+    ${libdir}/python2.7/glob.* \
+    ${libdir}/python2.7/popen2.* \
+    ${libdir}/python2.7/shlex.* \
+    ${libdir}/python2.7/shutil.* \
+"
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python2.7/smtpd.* "
+FILES_${PN}-smtpd=" \
+    ${bindir}/smtpd.* \
+    ${libdir}/python2.7/smtpd.* \
+"
 
 SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib"
-FILES_${PN}-sqlite3="${libdir}/python2.7/lib-dynload/_sqlite3.so ${libdir}/python2.7/sqlite3/dbapi2.* ${libdir}/python2.7/sqlite3/__init__.* ${libdir}/python2.7/sqlite3/dump.* "
+FILES_${PN}-sqlite3=" \
+    ${libdir}/python2.7/lib-dynload/_sqlite3.so \
+    ${libdir}/python2.7/sqlite3/dbapi2.* \
+    ${libdir}/python2.7/sqlite3/__init__.* \
+    ${libdir}/python2.7/sqlite3/dump.* \
+"
 
 SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests="${libdir}/python2.7/sqlite3/test "
+FILES_${PN}-sqlite3-tests=" \
+    ${libdir}/python2.7/sqlite3/test \
+"
 
 SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python2.7/lib-dynload/strop.so ${libdir}/python2.7/string.* ${libdir}/python2.7/stringold.* "
+FILES_${PN}-stringold=" \
+    ${libdir}/python2.7/lib-dynload/strop.so \
+    ${libdir}/python2.7/string.* \
+    ${libdir}/python2.7/stringold.* \
+"
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
-FILES_${PN}-subprocess="${libdir}/python2.7/subprocess.* "
+FILES_${PN}-subprocess=" \
+    ${libdir}/python2.7/subprocess.* \
+"
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
-FILES_${PN}-syslog="${libdir}/python2.7/lib-dynload/syslog.so "
+FILES_${PN}-syslog=" \
+    ${libdir}/python2.7/lib-dynload/syslog.so \
+"
 
 SUMMARY_${PN}-terminal="Python terminal controlling support"
 RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
-FILES_${PN}-terminal="${libdir}/python2.7/pty.* ${libdir}/python2.7/tty.* "
+FILES_${PN}-terminal=" \
+    ${libdir}/python2.7/pty.* \
+    ${libdir}/python2.7/tty.* \
+"
 
 SUMMARY_${PN}-tests="Python tests"
 RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules"
-FILES_${PN}-tests="${libdir}/python2.7/test "
+FILES_${PN}-tests=" \
+    ${libdir}/python2.7/test \
+"
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
 RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils="${libdir}/python2.7/lib-dynload/_csv.so ${libdir}/python2.7/csv.* ${libdir}/python2.7/optparse.* ${libdir}/python2.7/textwrap.* "
+FILES_${PN}-textutils=" \
+    ${libdir}/python2.7/lib-dynload/_csv.so \
+    ${libdir}/python2.7/csv.* \
+    ${libdir}/python2.7/optparse.* \
+    ${libdir}/python2.7/textwrap.* \
+"
 
 SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python2.7/_threading_local.* ${libdir}/python2.7/dummy_thread.* ${libdir}/python2.7/dummy_threading.* ${libdir}/python2.7/mutex.* ${libdir}/python2.7/threading.* ${libdir}/python2.7/Queue.* "
+FILES_${PN}-threading=" \
+    ${libdir}/python2.7/_threading_local.* \
+    ${libdir}/python2.7/dummy_thread.* \
+    ${libdir}/python2.7/dummy_threading.* \
+    ${libdir}/python2.7/mutex.* \
+    ${libdir}/python2.7/threading.* \
+    ${libdir}/python2.7/Queue.* \
+"
 
 SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
-FILES_${PN}-tkinter="${libdir}/python2.7/lib-dynload/_tkinter.so ${libdir}/python2.7/lib-tk "
+FILES_${PN}-tkinter=" \
+    ${libdir}/python2.7/lib-dynload/_tkinter.so \
+    ${libdir}/python2.7/lib-tk \
+"
 
 SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest="${libdir}/python2.7/unittest/ "
+FILES_${PN}-unittest=" \
+    ${libdir}/python2.7/unittest/ \
+"
 
 SUMMARY_${PN}-unixadmin="Python Unix administration support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
-FILES_${PN}-unixadmin="${libdir}/python2.7/lib-dynload/nis.so ${libdir}/python2.7/lib-dynload/grp.so ${libdir}/python2.7/lib-dynload/pwd.so ${libdir}/python2.7/getpass.* "
+FILES_${PN}-unixadmin=" \
+    ${libdir}/python2.7/lib-dynload/nis.so \
+    ${libdir}/python2.7/lib-dynload/grp.so \
+    ${libdir}/python2.7/lib-dynload/pwd.so \
+    ${libdir}/python2.7/getpass.* \
+"
 
 SUMMARY_${PN}-xml="Python basic XML support"
 RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
-FILES_${PN}-xml="${libdir}/python2.7/lib-dynload/_elementtree.so ${libdir}/python2.7/lib-dynload/pyexpat.so ${libdir}/python2.7/xml ${libdir}/python2.7/xmllib.* "
+FILES_${PN}-xml=" \
+    ${libdir}/python2.7/lib-dynload/_elementtree.so \
+    ${libdir}/python2.7/lib-dynload/pyexpat.so \
+    ${libdir}/python2.7/xml \
+    ${libdir}/python2.7/xmllib.* \
+"
 
 SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
-FILES_${PN}-xmlrpc="${libdir}/python2.7/xmlrpclib.* ${libdir}/python2.7/SimpleXMLRPCServer.* ${libdir}/python2.7/DocXMLRPCServer.* "
+FILES_${PN}-xmlrpc=" \
+    ${libdir}/python2.7/xmlrpclib.* \
+    ${libdir}/python2.7/SimpleXMLRPCServer.* \
+    ${libdir}/python2.7/DocXMLRPCServer.* \
+"
 
 SUMMARY_${PN}-zlib="Python zlib compression support"
 RDEPENDS_${PN}-zlib="${PN}-core"
-FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
+FILES_${PN}-zlib=" \
+    ${libdir}/python2.7/lib-dynload/zlib.so \
+"
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
+RDEPENDS_${PN}-modules=" \
+  ${PN}-2to3 \
+  ${PN}-argparse \
+  ${PN}-audio \
+  ${PN}-bsddb \
+  ${PN}-codecs \
+  ${PN}-compile \
+  ${PN}-compiler \
+  ${PN}-compression \
+  ${PN}-contextlib \
+  ${PN}-core \
+  ${PN}-crypt \
+  ${PN}-ctypes \
+  ${PN}-curses \
+  ${PN}-datetime \
+  ${PN}-db \
+  ${PN}-debugger \
+  ${PN}-difflib \
+  ${PN}-distutils \
+  ${PN}-doctest \
+  ${PN}-email \
+  ${PN}-fcntl \
+  ${PN}-gdbm \
+  ${PN}-hotshot \
+  ${PN}-html \
+  ${PN}-idle \
+  ${PN}-image \
+  ${PN}-importlib \
+  ${PN}-io \
+  ${PN}-json \
+  ${PN}-lang \
+  ${PN}-logging \
+  ${PN}-mailbox \
+  ${PN}-math \
+  ${PN}-mime \
+  ${PN}-mmap \
+  ${PN}-multiprocessing \
+  ${PN}-netclient \
+  ${PN}-netserver \
+  ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pkgutil \
+  ${PN}-plistlib \
+  ${PN}-pprint \
+  ${PN}-profile \
+  ${PN}-pydoc \
+  ${PN}-re \
+  ${PN}-readline \
+  ${PN}-resource \
+  ${PN}-robotparser \
+  ${PN}-shell \
+  ${PN}-smtpd \
+  ${PN}-sqlite3 \
+  ${PN}-sqlite3-tests \
+  ${PN}-stringold \
+  ${PN}-subprocess \
+  ${PN}-syslog \
+  ${PN}-terminal \
+  ${PN}-textutils \
+  ${PN}-threading \
+  ${PN}-tkinter \
+  ${PN}-unittest \
+  ${PN}-unixadmin \
+  ${PN}-xml \
+  ${PN}-xmlrpc \
+  ${PN}-zlib \
+"
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0260e87e75..686b5f9842 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -1,283 +1,1108 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: 'scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: './scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
-
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PROVIDES+="\
+  ${PN}-2to3 \
+  ${PN}-argparse \
+  ${PN}-asyncio \
+  ${PN}-audio \
+  ${PN}-codecs \
+  ${PN}-compile \
+  ${PN}-compression \
+  ${PN}-core \
+  ${PN}-crypt \
+  ${PN}-ctypes \
+  ${PN}-curses \
+  ${PN}-datetime \
+  ${PN}-db \
+  ${PN}-debugger \
+  ${PN}-dev \
+  ${PN}-difflib \
+  ${PN}-distutils \
+  ${PN}-distutils-staticdev \
+  ${PN}-doctest \
+  ${PN}-email \
+  ${PN}-enum \
+  ${PN}-fcntl \
+  ${PN}-gdbm \
+  ${PN}-html \
+  ${PN}-idle \
+  ${PN}-image \
+  ${PN}-importlib \
+  ${PN}-io \
+  ${PN}-json \
+  ${PN}-lang \
+  ${PN}-logging \
+  ${PN}-mailbox \
+  ${PN}-math \
+  ${PN}-mime \
+  ${PN}-mmap \
+  ${PN}-multiprocessing \
+  ${PN}-netclient \
+  ${PN}-netserver \
+  ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pkgutil \
+  ${PN}-pprint \
+  ${PN}-profile \
+  ${PN}-pydoc \
+  ${PN}-re \
+  ${PN}-readline \
+  ${PN}-reprlib \
+  ${PN}-resource \
+  ${PN}-selectors \
+  ${PN}-shell \
+  ${PN}-signal \
+  ${PN}-smtpd \
+  ${PN}-sqlite3 \
+  ${PN}-sqlite3-tests \
+  ${PN}-stringold \
+  ${PN}-subprocess \
+  ${PN}-syslog \
+  ${PN}-terminal \
+  ${PN}-tests \
+  ${PN}-textutils \
+  ${PN}-threading \
+  ${PN}-tkinter \
+  ${PN}-typing \
+  ${PN}-unittest \
+  ${PN}-unixadmin \
+  ${PN}-xml \
+  ${PN}-xmlrpc \
+"
+
+PACKAGES="\
+  ${PN}-dbg \
+  ${PN}-2to3 \
+  ${PN}-argparse \
+  ${PN}-asyncio \
+  ${PN}-audio \
+  ${PN}-codecs \
+  ${PN}-compile \
+  ${PN}-compression \
+  ${PN}-core \
+  ${PN}-crypt \
+  ${PN}-ctypes \
+  ${PN}-curses \
+  ${PN}-datetime \
+  ${PN}-db \
+  ${PN}-debugger \
+  ${PN}-dev \
+  ${PN}-difflib \
+${PN}-distutils \
+ ${PN}-distutils-staticdev \
+  ${PN}-doctest \
+  ${PN}-email \
+  ${PN}-enum \
+  ${PN}-fcntl \
+  ${PN}-gdbm \
+  ${PN}-html \
+  ${PN}-idle \
+  ${PN}-image \
+  ${PN}-importlib \
+  ${PN}-io \
+  ${PN}-json \
+  ${PN}-lang \
+  ${PN}-logging \
+  ${PN}-mailbox \
+  ${PN}-math \
+  ${PN}-mime \
+  ${PN}-mmap \
+  ${PN}-multiprocessing \
+  ${PN}-netclient \
+  ${PN}-netserver \
+  ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pkgutil \
+  ${PN}-pprint \
+  ${PN}-profile \
+  ${PN}-pydoc \
+  ${PN}-re \
+  ${PN}-readline \
+  ${PN}-reprlib \
+  ${PN}-resource \
+  ${PN}-selectors \
+  ${PN}-shell \
+  ${PN}-signal \
+  ${PN}-smtpd \
+  ${PN}-sqlite3 \
+  ${PN}-sqlite3-tests \
+  ${PN}-stringold \
+  ${PN}-subprocess \
+  ${PN}-syslog \
+  ${PN}-terminal \
+  ${PN}-tests \
+  ${PN}-textutils \
+  ${PN}-threading \
+  ${PN}-tkinter \
+  ${PN}-typing \
+  ${PN}-unittest \
+  ${PN}-unixadmin \
+  ${PN}-xml \
+  ${PN}-xmlrpc \
+  ${PN}-modules \
+"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${libdir}/python3.5/lib2to3 ${libdir}/python3.5/lib2to3/__pycache__ "
+FILES_${PN}-2to3="\
+  ${libdir}/python3.5/lib2to3 \
+  ${libdir}/python3.5/lib2to3/__pycache__ \
+"
 
 SUMMARY_${PN}-argparse="Python command line argument parser"
 RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
-FILES_${PN}-argparse="${libdir}/python3.5/argparse.* ${libdir}/python3.5/__pycache__/argparse.* "
+FILES_${PN}-argparse="\
+  ${libdir}/python3.5/argparse.* \
+  ${libdir}/python3.5/__pycache__/argparse.* \
+"
 
 SUMMARY_${PN}-asyncio="Python Asynchronous I/O, event loop, coroutines and tasks"
 RDEPENDS_${PN}-asyncio="${PN}-core"
-FILES_${PN}-asyncio="${libdir}/python3.5/asyncio ${libdir}/python3.5/asyncio/__pycache__ "
+FILES_${PN}-asyncio="\
+  ${libdir}/python3.5/asyncio \
+  ${libdir}/python3.5/asyncio/__pycache__ \
+"
 
 SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python3.5/wave.* ${libdir}/python3.5/__pycache__/wave.* ${libdir}/python3.5/chunk.* ${libdir}/python3.5/__pycache__/chunk.* ${libdir}/python3.5/sndhdr.* ${libdir}/python3.5/__pycache__/sndhdr.* ${libdir}/python3.5/lib-dynload/ossaudiodev.*.so ${libdir}/python3.5/lib-dynload/__pycache__/ossaudiodev.*.so ${libdir}/python3.5/lib-dynload/audioop.*.so ${libdir}/python3.5/lib-dynload/__pycache__/audioop.*.so ${libdir}/python3.5/audiodev.* ${libdir}/python3.5/__pycache__/audiodev.* ${libdir}/python3.5/sunaudio.* ${libdir}/python3.5/__pycache__/sunaudio.* ${libdir}/python3.5/sunau.* ${libdir}/python3.5/__pycache__/sunau.* ${libdir}/python3.5/toaiff.* ${libdir}/python3.5/__pycache__/toaiff.* "
+FILES_${PN}-audio="\
+  ${libdir}/python3.5/wave.* \
+  ${libdir}/python3.5/__pycache__/wave.* \
+  ${libdir}/python3.5/chunk.* \
+  ${libdir}/python3.5/__pycache__/chunk.* \
+  ${libdir}/python3.5/sndhdr.* \
+  ${libdir}/python3.5/__pycache__/sndhdr.* \
+  ${libdir}/python3.5/lib-dynload/ossaudiodev.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/ossaudiodev.*.so \
+  ${libdir}/python3.5/lib-dynload/audioop.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/audioop.*.so \
+  ${libdir}/python3.5/audiodev.* \
+  ${libdir}/python3.5/__pycache__/audiodev.* \
+  ${libdir}/python3.5/sunaudio.* \
+  ${libdir}/python3.5/__pycache__/sunaudio.* \
+  ${libdir}/python3.5/sunau.* \
+  ${libdir}/python3.5/__pycache__/sunau.* \
+  ${libdir}/python3.5/toaiff.* \
+  ${libdir}/python3.5/__pycache__/toaiff.* \
+"
 
 SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python3.5/codecs.* ${libdir}/python3.5/__pycache__/codecs.* ${libdir}/python3.5/encodings ${libdir}/python3.5/encodings/__pycache__ ${libdir}/python3.5/gettext.* ${libdir}/python3.5/__pycache__/gettext.* ${libdir}/python3.5/locale.* ${libdir}/python3.5/__pycache__/locale.* ${libdir}/python3.5/lib-dynload/_locale.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_locale.*.so ${libdir}/python3.5/lib-dynload/_codecs* ${libdir}/python3.5/lib-dynload/_codecs*/__pycache__ ${libdir}/python3.5/lib-dynload/_multibytecodec.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_multibytecodec.*.so ${libdir}/python3.5/lib-dynload/unicodedata.*.so ${libdir}/python3.5/lib-dynload/__pycache__/unicodedata.*.so ${libdir}/python3.5/stringprep.* ${libdir}/python3.5/__pycache__/stringprep.* ${libdir}/python3.5/xdrlib.* ${libdir}/python3.5/__pycache__/xdrlib.* "
+FILES_${PN}-codecs="\
+  ${libdir}/python3.5/codecs.* \
+  ${libdir}/python3.5/__pycache__/codecs.* \
+  ${libdir}/python3.5/encodings \
+  ${libdir}/python3.5/encodings/__pycache__ \
+  ${libdir}/python3.5/gettext.* \
+  ${libdir}/python3.5/__pycache__/gettext.* \
+  ${libdir}/python3.5/locale.* \
+  ${libdir}/python3.5/__pycache__/locale.* \
+  ${libdir}/python3.5/lib-dynload/_locale.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_locale.*.so \
+  ${libdir}/python3.5/lib-dynload/_codecs* \
+  ${libdir}/python3.5/lib-dynload/_codecs*/__pycache__ \
+  ${libdir}/python3.5/lib-dynload/_multibytecodec.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_multibytecodec.*.so \
+  ${libdir}/python3.5/lib-dynload/unicodedata.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/unicodedata.*.so \
+  ${libdir}/python3.5/stringprep.* \
+  ${libdir}/python3.5/__pycache__/stringprep.* \
+  ${libdir}/python3.5/xdrlib.* \
+  ${libdir}/python3.5/__pycache__/xdrlib.* \
+"
 
 SUMMARY_${PN}-compile="Python bytecode compilation support"
 RDEPENDS_${PN}-compile="${PN}-core"
-FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/__pycache__/py_compile.* ${libdir}/python3.5/compileall.* ${libdir}/python3.5/__pycache__/compileall.* "
+FILES_${PN}-compile="\
+  ${libdir}/python3.5/py_compile.* \
+  ${libdir}/python3.5/__pycache__/py_compile.* \
+  ${libdir}/python3.5/compileall.* \
+  ${libdir}/python3.5/__pycache__/compileall.* \
+"
 
 SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell"
-FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycache__/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/__pycache__/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/__pycache__/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/__pycache__/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/zlib.*.so ${libdir}/python3.5/bz2.py ${libdir}/python3.5/__pycache__/bz2.py ${libdir}/python3.5/lzma.py ${libdir}/python3.5/__pycache__/lzma.py ${libdir}/python3.5/_compression.py ${libdir}/python3.5/__pycache__/_compression.py "
+FILES_${PN}-compression="\
+  ${libdir}/python3.5/gzip.* \
+  ${libdir}/python3.5/__pycache__/gzip.* \
+  ${libdir}/python3.5/zipfile.* \
+  ${libdir}/python3.5/__pycache__/zipfile.* \
+  ${libdir}/python3.5/tarfile.* \
+  ${libdir}/python3.5/__pycache__/tarfile.* \
+  ${libdir}/python3.5/lib-dynload/bz2.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/bz2.*.so \
+  ${libdir}/python3.5/lib-dynload/zlib.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/zlib.*.so \
+  ${libdir}/python3.5/bz2.py \
+  ${libdir}/python3.5/__pycache__/bz2.py \
+  ${libdir}/python3.5/lzma.py \
+  ${libdir}/python3.5/__pycache__/lzma.py \
+  ${libdir}/python3.5/_compression.py \
+  ${libdir}/python3.5/__pycache__/_compression.py \
+"
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/__pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="\
+  ${libdir}/python3.5/__future__.* \
+  ${libdir}/python3.5/__pycache__/__future__.* \
+  ${libdir}/python3.5/_abcoll.* \
+  ${libdir}/python3.5/__pycache__/_abcoll.* \
+  ${libdir}/python3.5/abc.* \
+  ${libdir}/python3.5/__pycache__/abc.* \
+  ${libdir}/python3.5/ast.* \
+  ${libdir}/python3.5/__pycache__/ast.* \
+  ${libdir}/python3.5/copy.* \
+  ${libdir}/python3.5/__pycache__/copy.* \
+  ${libdir}/python3.5/copyreg.* \
+  ${libdir}/python3.5/__pycache__/copyreg.* \
+  ${libdir}/python3.5/configparser.* \
+  ${libdir}/python3.5/__pycache__/configparser.* \
+  ${libdir}/python3.5/genericpath.* \
+  ${libdir}/python3.5/__pycache__/genericpath.* \
+  ${libdir}/python3.5/getopt.* \
+  ${libdir}/python3.5/__pycache__/getopt.* \
+  ${libdir}/python3.5/linecache.* \
+  ${libdir}/python3.5/__pycache__/linecache.* \
+  ${libdir}/python3.5/new.* \
+  ${libdir}/python3.5/__pycache__/new.* \
+  ${libdir}/python3.5/os.* \
+  ${libdir}/python3.5/__pycache__/os.* \
+  ${libdir}/python3.5/posixpath.* \
+  ${libdir}/python3.5/__pycache__/posixpath.* \
+  ${libdir}/python3.5/struct.* \
+  ${libdir}/python3.5/__pycache__/struct.* \
+  ${libdir}/python3.5/warnings.* \
+  ${libdir}/python3.5/__pycache__/warnings.* \
+  ${libdir}/python3.5/site.* \
+  ${libdir}/python3.5/__pycache__/site.* \
+  ${libdir}/python3.5/stat.* \
+  ${libdir}/python3.5/__pycache__/stat.* \
+  ${libdir}/python3.5/UserDict.* \
+  ${libdir}/python3.5/__pycache__/UserDict.* \
+  ${libdir}/python3.5/UserList.* \
+  ${libdir}/python3.5/__pycache__/UserList.* \
+  ${libdir}/python3.5/UserString.* \
+  ${libdir}/python3.5/__pycache__/UserString.* \
+  ${libdir}/python3.5/lib-dynload/binascii.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so \
+  ${libdir}/python3.5/lib-dynload/_struct.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so \
+  ${libdir}/python3.5/lib-dynload/time.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so \
+  ${libdir}/python3.5/lib-dynload/xreadlines.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so \
+  ${libdir}/python3.5/types.* \
+  ${libdir}/python3.5/__pycache__/types.* \
+  ${libdir}/python3.5/platform.* \
+  ${libdir}/python3.5/__pycache__/platform.* \
+  ${bindir}/python* \
+  ${libdir}/python3.5/_weakrefset.* \
+  ${libdir}/python3.5/__pycache__/_weakrefset.* \
+  ${libdir}/python3.5/sysconfig.* \
+  ${libdir}/python3.5/__pycache__/sysconfig.* \
+  ${libdir}/python3.5/_sysconfigdata.* \
+  ${libdir}/python3.5/__pycache__/_sysconfigdata.* \
+  ${includedir}/python${PYTHON_BINABI}/pyconfig*.h \
+  ${libdir}/python${PYTHON_MAJMIN}/collections \
+  ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* \
+  ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* \
+  ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py \
+"
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
-FILES_${PN}-crypt="${libdir}/python3.5/hashlib.* ${libdir}/python3.5/__pycache__/hashlib.* ${libdir}/python3.5/md5.* ${libdir}/python3.5/__pycache__/md5.* ${libdir}/python3.5/sha.* ${libdir}/python3.5/__pycache__/sha.* ${libdir}/python3.5/lib-dynload/crypt.*.so ${libdir}/python3.5/lib-dynload/__pycache__/crypt.*.so ${libdir}/python3.5/lib-dynload/_hashlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_hashlib.*.so ${libdir}/python3.5/lib-dynload/_sha256.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_sha256.*.so ${libdir}/python3.5/lib-dynload/_sha512.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_sha512.*.so "
+FILES_${PN}-crypt="\
+  ${libdir}/python3.5/hashlib.* \
+  ${libdir}/python3.5/__pycache__/hashlib.* \
+  ${libdir}/python3.5/md5.* \
+  ${libdir}/python3.5/__pycache__/md5.* \
+  ${libdir}/python3.5/sha.* \
+  ${libdir}/python3.5/__pycache__/sha.* \
+  ${libdir}/python3.5/lib-dynload/crypt.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/crypt.*.so \
+  ${libdir}/python3.5/lib-dynload/_hashlib.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_hashlib.*.so \
+  ${libdir}/python3.5/lib-dynload/_sha256.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_sha256.*.so \
+  ${libdir}/python3.5/lib-dynload/_sha512.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_sha512.*.so \
+"
 
 SUMMARY_${PN}-ctypes="Python C types support"
 RDEPENDS_${PN}-ctypes="${PN}-core ${PN}-subprocess"
-FILES_${PN}-ctypes="${libdir}/python3.5/ctypes ${libdir}/python3.5/ctypes/__pycache__ ${libdir}/python3.5/lib-dynload/_ctypes.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ctypes.*.so ${libdir}/python3.5/lib-dynload/_ctypes_test.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ctypes_test.*.so "
+FILES_${PN}-ctypes="\
+  ${libdir}/python3.5/ctypes \
+  ${libdir}/python3.5/ctypes/__pycache__ \
+  ${libdir}/python3.5/lib-dynload/_ctypes.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_ctypes.*.so \
+  ${libdir}/python3.5/lib-dynload/_ctypes_test.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_ctypes_test.*.so \
+"
 
 SUMMARY_${PN}-curses="Python curses support"
 RDEPENDS_${PN}-curses="${PN}-core"
-FILES_${PN}-curses="${libdir}/python3.5/curses ${libdir}/python3.5/curses/__pycache__ ${libdir}/python3.5/lib-dynload/_curses.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_curses.*.so ${libdir}/python3.5/lib-dynload/_curses_panel.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_curses_panel.*.so "
+FILES_${PN}-curses="\
+  ${libdir}/python3.5/curses \
+  ${libdir}/python3.5/curses/__pycache__ \
+  ${libdir}/python3.5/lib-dynload/_curses.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_curses.*.so \
+  ${libdir}/python3.5/lib-dynload/_curses_panel.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_curses_panel.*.so \
+"
 
 SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python3.5/_strptime.* ${libdir}/python3.5/__pycache__/_strptime.* ${libdir}/python3.5/calendar.* ${libdir}/python3.5/__pycache__/calendar.* ${libdir}/python3.5/datetime.* ${libdir}/python3.5/__pycache__/datetime.* ${libdir}/python3.5/lib-dynload/_datetime.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_datetime.*.so "
+FILES_${PN}-datetime="\
+  ${libdir}/python3.5/_strptime.* \
+  ${libdir}/python3.5/__pycache__/_strptime.* \
+  ${libdir}/python3.5/calendar.* \
+  ${libdir}/python3.5/__pycache__/calendar.* \
+  ${libdir}/python3.5/datetime.* \
+  ${libdir}/python3.5/__pycache__/datetime.* \
+  ${libdir}/python3.5/lib-dynload/_datetime.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_datetime.*.so \
+"
 
 SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
-FILES_${PN}-db="${libdir}/python3.5/anydbm.* ${libdir}/python3.5/__pycache__/anydbm.* ${libdir}/python3.5/dumbdbm.* ${libdir}/python3.5/__pycache__/dumbdbm.* ${libdir}/python3.5/whichdb.* ${libdir}/python3.5/__pycache__/whichdb.* ${libdir}/python3.5/dbm ${libdir}/python3.5/dbm/__pycache__ ${libdir}/python3.5/lib-dynload/_dbm.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_dbm.*.so "
+FILES_${PN}-db="\
+  ${libdir}/python3.5/anydbm.* \
+  ${libdir}/python3.5/__pycache__/anydbm.* \
+  ${libdir}/python3.5/dumbdbm.* \
+  ${libdir}/python3.5/__pycache__/dumbdbm.* \
+  ${libdir}/python3.5/whichdb.* \
+  ${libdir}/python3.5/__pycache__/whichdb.* \
+  ${libdir}/python3.5/dbm \
+  ${libdir}/python3.5/dbm/__pycache__ \
+  ${libdir}/python3.5/lib-dynload/_dbm.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_dbm.*.so \
+"
 
 SUMMARY_${PN}-debugger="Python debugger"
 RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib ${PN}-pkgutil"
-FILES_${PN}-debugger="${libdir}/python3.5/bdb.* ${libdir}/python3.5/__pycache__/bdb.* ${libdir}/python3.5/pdb.* ${libdir}/python3.5/__pycache__/pdb.* "
+FILES_${PN}-debugger="\
+  ${libdir}/python3.5/bdb.* \
+  ${libdir}/python3.5/__pycache__/bdb.* \
+  ${libdir}/python3.5/pdb.* \
+  ${libdir}/python3.5/__pycache__/pdb.* \
+"
 
 SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python3.5/config*/Makefile ${libdir}/python3.5/config*/Makefile/__pycache__ "
+FILES_${PN}-dev="\
+  ${includedir} \
+  ${libdir}/lib*${SOLIBSDEV} \
+  ${libdir}/*.la \
+  ${libdir}/*.a \
+  ${libdir}/*.o \
+  ${libdir}/pkgconfig \
+  ${base_libdir}/*.a \
+  ${base_libdir}/*.o \
+  ${datadir}/aclocal \
+  ${datadir}/pkgconfig \
+  ${libdir}/python3.5/config*/Makefile \
+  ${libdir}/python3.5/config*/Makefile/__pycache__ \
+"
 
 SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-FILES_${PN}-difflib="${libdir}/python3.5/difflib.* ${libdir}/python3.5/__pycache__/difflib.* "
+FILES_${PN}-difflib="\
+  ${libdir}/python3.5/difflib.* \
+  ${libdir}/python3.5/__pycache__/difflib.* \
+"
 
 SUMMARY_${PN}-distutils="Python Distribution Utilities"
 RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
-FILES_${PN}-distutils="${libdir}/python3.5/config ${libdir}/python3.5/config/__pycache__ ${libdir}/python3.5/distutils ${libdir}/python3.5/distutils/__pycache__ "
+FILES_${PN}-distutils="\
+  ${libdir}/python3.5/config \
+  ${libdir}/python3.5/config/__pycache__ \
+  ${libdir}/python3.5/distutils \
+  ${libdir}/python3.5/distutils/__pycache__ \
+"
 
 SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python3.5/config/lib*.a ${libdir}/python3.5/config/__pycache__/lib*.a "
+FILES_${PN}-distutils-staticdev="\
+  ${libdir}/python3.5/config/lib*.a \
+  ${libdir}/python3.5/config/__pycache__/lib*.a \
+"
 
 SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest="${libdir}/python3.5/doctest.* ${libdir}/python3.5/__pycache__/doctest.* "
+FILES_${PN}-doctest="\
+  ${libdir}/python3.5/doctest.* \
+  ${libdir}/python3.5/__pycache__/doctest.* \
+"
 
 SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
-FILES_${PN}-email="${libdir}/python3.5/imaplib.* ${libdir}/python3.5/__pycache__/imaplib.* ${libdir}/python3.5/email ${libdir}/python3.5/email/__pycache__ "
+FILES_${PN}-email="\
+  ${libdir}/python3.5/imaplib.* \
+  ${libdir}/python3.5/__pycache__/imaplib.* \
+  ${libdir}/python3.5/email \
+  ${libdir}/python3.5/email/__pycache__ \
+"
 
 SUMMARY_${PN}-enum="Python support for enumerations"
 RDEPENDS_${PN}-enum="${PN}-core"
-FILES_${PN}-enum="${libdir}/python3.5/enum.* ${libdir}/python3.5/__pycache__/enum.* "
+FILES_${PN}-enum="\
+  ${libdir}/python3.5/enum.* \
+  ${libdir}/python3.5/__pycache__/enum.* \
+"
 
 SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
-FILES_${PN}-fcntl="${libdir}/python3.5/lib-dynload/fcntl.*.so ${libdir}/python3.5/lib-dynload/__pycache__/fcntl.*.so "
+FILES_${PN}-fcntl="\
+  ${libdir}/python3.5/lib-dynload/fcntl.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/fcntl.*.so \
+"
 
 SUMMARY_${PN}-gdbm="Python GNU database support"
 RDEPENDS_${PN}-gdbm="${PN}-core"
-FILES_${PN}-gdbm="${libdir}/python3.5/lib-dynload/_gdbm.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_gdbm.*.so "
+FILES_${PN}-gdbm="\
+  ${libdir}/python3.5/lib-dynload/_gdbm.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_gdbm.*.so \
+"
 
 SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/__pycache__/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/__pycache__/htmlentitydefs.* ${libdir}/python3.5/html ${libdir}/python3.5/html/__pycache__ ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/__pycache__/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/__pycache__/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/__pycache__/sgmllib.* ${libdir}/python3.5/HTMLParser.* ${libdir}/python3.5/__pycache__/HTMLParser.* "
+FILES_${PN}-html="\
+  ${libdir}/python3.5/formatter.* \
+  ${libdir}/python3.5/__pycache__/formatter.* \
+  ${libdir}/python3.5/htmlentitydefs.* \
+  ${libdir}/python3.5/__pycache__/htmlentitydefs.* \
+  ${libdir}/python3.5/html \
+  ${libdir}/python3.5/html/__pycache__ \
+  ${libdir}/python3.5/htmllib.* \
+  ${libdir}/python3.5/__pycache__/htmllib.* \
+  ${libdir}/python3.5/markupbase.* \
+  ${libdir}/python3.5/__pycache__/markupbase.* \
+  ${libdir}/python3.5/sgmllib.* \
+  ${libdir}/python3.5/__pycache__/sgmllib.* \
+  ${libdir}/python3.5/HTMLParser.* \
+  ${libdir}/python3.5/__pycache__/HTMLParser.* \
+"
 
 SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.5/idlelib ${libdir}/python3.5/idlelib/__pycache__ "
+FILES_${PN}-idle="\
+  ${bindir}/idle \
+  ${libdir}/python3.5/idlelib \
+  ${libdir}/python3.5/idlelib/__pycache__ \
+"
 
 SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
-FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/__pycache__/colorsys.* ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/__pycache__/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/__pycache__/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so ${libdir}/python3.5/lib-dynload/__pycache__/rgbimg.*.so "
+FILES_${PN}-image="\
+  ${libdir}/python3.5/colorsys.* \
+  ${libdir}/python3.5/__pycache__/colorsys.* \
+  ${libdir}/python3.5/imghdr.* \
+  ${libdir}/python3.5/__pycache__/imghdr.* \
+  ${libdir}/python3.5/lib-dynload/imageop.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/imageop.*.so \
+  ${libdir}/python3.5/lib-dynload/rgbimg.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/rgbimg.*.so \
+"
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
-FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/importlib/__pycache__ ${libdir}/python3.5/imp.* ${libdir}/python3.5/__pycache__/imp.* "
+FILES_${PN}-importlib="\
+  ${libdir}/python3.5/importlib \
+  ${libdir}/python3.5/importlib/__pycache__ \
+  ${libdir}/python3.5/imp.* \
+  ${libdir}/python3.5/__pycache__/imp.* \
+"
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-FILES_${PN}-io="${libdir}/python3.5/lib-dynload/_socket.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_socket.*.so ${libdir}/python3.5/lib-dynload/_io.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_io.*.so ${libdir}/python3.5/lib-dynload/_ssl.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ssl.*.so ${libdir}/python3.5/lib-dynload/select.*.so ${libdir}/python3.5/lib-dynload/__pycache__/select.*.so ${libdir}/python3.5/lib-dynload/termios.*.so ${libdir}/python3.5/lib-dynload/__pycache__/termios.*.so ${libdir}/python3.5/lib-dynload/cStringIO.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cStringIO.*.so ${libdir}/python3.5/ipaddress.* ${libdir}/python3.5/__pycache__/ipaddress.* ${libdir}/python3.5/pipes.* ${libdir}/python3.5/__pycache__/pipes.* ${libdir}/python3.5/socket.* ${libdir}/python3.5/__pycache__/socket.* ${libdir}/python3.5/ssl.* ${libdir}/python3.5/__pycache__/ssl.* ${libdir}/python3.5/tempfile.* ${libdir}/python3.5/__pycache__/tempfile.* ${libdir}/python3.5/StringIO.* ${libdir}/python3.5/__pycache__/StringIO.* ${libdir}/python3.5/io.* ${libdir}/python3.5/__pycache__/io.* ${libdir}/python3.5/_pyio.* ${libdir}/python3.5/__pycache__/_pyio.* "
+FILES_${PN}-io="\
+  ${libdir}/python3.5/lib-dynload/_socket.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_socket.*.so \
+  ${libdir}/python3.5/lib-dynload/_io.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_io.*.so \
+  ${libdir}/python3.5/lib-dynload/_ssl.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_ssl.*.so \
+  ${libdir}/python3.5/lib-dynload/select.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/select.*.so \
+  ${libdir}/python3.5/lib-dynload/termios.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/termios.*.so \
+  ${libdir}/python3.5/lib-dynload/cStringIO.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/cStringIO.*.so \
+  ${libdir}/python3.5/ipaddress.* \
+  ${libdir}/python3.5/__pycache__/ipaddress.* \
+  ${libdir}/python3.5/pipes.* \
+  ${libdir}/python3.5/__pycache__/pipes.* \
+  ${libdir}/python3.5/socket.* \
+  ${libdir}/python3.5/__pycache__/socket.* \
+  ${libdir}/python3.5/ssl.* \
+  ${libdir}/python3.5/__pycache__/ssl.* \
+  ${libdir}/python3.5/tempfile.* \
+  ${libdir}/python3.5/__pycache__/tempfile.* \
+  ${libdir}/python3.5/StringIO.* \
+  ${libdir}/python3.5/__pycache__/StringIO.* \
+  ${libdir}/python3.5/io.* \
+  ${libdir}/python3.5/__pycache__/io.* \
+  ${libdir}/python3.5/_pyio.* \
+  ${libdir}/python3.5/__pycache__/_pyio.* \
+"
 
 SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
-FILES_${PN}-json="${libdir}/python3.5/json ${libdir}/python3.5/json/__pycache__ ${libdir}/python3.5/lib-dynload/_json.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_json.*.so "
+FILES_${PN}-json="\
+  ${libdir}/python3.5/json \
+  ${libdir}/python3.5/json/__pycache__ \
+  ${libdir}/python3.5/lib-dynload/_json.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_json.*.so \
+"
 
 SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core ${PN}-importlib"
-FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_bisect.*.so ${libdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_collections.*.so ${libdir}/python3.5/lib-dynload/_heapq.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_weakref.*.so ${libdir}/python3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.so ${libdir}/python3.5/lib-dynload/__pycache__/array.*.so ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dynload/__pycache__/itertools.*.so ${libdir}/python3.5/lib-dynload/operator.*.so ${libdir}/python3.5/lib-dynload/__pycache__/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/lib-dynload/__pycache__/parser.*.so ${libdir}/python3.5/atexit.* ${libdir}/python3.5/__pycache__/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/__pycache__/bisect.* ${libdir}/python3.5/code.* ${libdir}/python3.5/__pycache__/code.* ${libdir}/python3.5/codeop.* ${libdir}/python3.5/__pycache__/codeop.* ${libdir}/python3.5/collections.* ${libdir}/python3.5/__pycache__/collections.* ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/__pycache__/_collections_abc.* ${libdir}/python3.5/contextlib.* ${libdir}/python3.5/__pycache__/contextlib.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/__pycache__/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/__pycache__/functools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/__pycache__/heapq.* ${libdir}/python3.5/inspect.* ${libdir}/python3.5/__pycache__/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/__pycache__/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/__pycache__/opcode.* ${libdir}/python3.5/operator.* ${libdir}/python3.5/__pycache__/operator.* ${libdir}/python3.5/symbol.* ${libdir}/python3.5/__pycache__/symbol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/__pycache__/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/__pycache__/token.* ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/__pycache__/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/__pycache__/traceback.* ${libdir}/python3.5/weakref.* ${libdir}/python3.5/__pycache__/weakref.* "
+FILES_${PN}-lang="\
+  ${libdir}/python3.5/lib-dynload/_bisect.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_bisect.*.so \
+  ${libdir}/python3.5/lib-dynload/_collections.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_collections.*.so \
+  ${libdir}/python3.5/lib-dynload/_heapq.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_heapq.*.so \
+  ${libdir}/python3.5/lib-dynload/_weakref.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_weakref.*.so \
+  ${libdir}/python3.5/lib-dynload/_functools.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_functools.*.so \
+  ${libdir}/python3.5/lib-dynload/array.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/array.*.so \
+  ${libdir}/python3.5/lib-dynload/itertools.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/itertools.*.so \
+  ${libdir}/python3.5/lib-dynload/operator.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/operator.*.so \
+  ${libdir}/python3.5/lib-dynload/parser.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/parser.*.so \
+  ${libdir}/python3.5/atexit.* \
+  ${libdir}/python3.5/__pycache__/atexit.* \
+  ${libdir}/python3.5/bisect.* \
+  ${libdir}/python3.5/__pycache__/bisect.* \
+  ${libdir}/python3.5/code.* \
+  ${libdir}/python3.5/__pycache__/code.* \
+  ${libdir}/python3.5/codeop.* \
+  ${libdir}/python3.5/__pycache__/codeop.* \
+  ${libdir}/python3.5/collections.* \
+  ${libdir}/python3.5/__pycache__/collections.* \
+  ${libdir}/python3.5/_collections_abc.* \
+  ${libdir}/python3.5/__pycache__/_collections_abc.* \
+  ${libdir}/python3.5/contextlib.* \
+  ${libdir}/python3.5/__pycache__/contextlib.* \
+  ${libdir}/python3.5/dis.* \
+  ${libdir}/python3.5/__pycache__/dis.* \
+  ${libdir}/python3.5/functools.* \
+  ${libdir}/python3.5/__pycache__/functools.* \
+  ${libdir}/python3.5/heapq.* \
+  ${libdir}/python3.5/__pycache__/heapq.* \
+  ${libdir}/python3.5/inspect.* \
+  ${libdir}/python3.5/__pycache__/inspect.* \
+  ${libdir}/python3.5/keyword.* \
+  ${libdir}/python3.5/__pycache__/keyword.* \
+  ${libdir}/python3.5/opcode.* \
+  ${libdir}/python3.5/__pycache__/opcode.* \
+  ${libdir}/python3.5/operator.* \
+  ${libdir}/python3.5/__pycache__/operator.* \
+  ${libdir}/python3.5/symbol.* \
+  ${libdir}/python3.5/__pycache__/symbol.* \
+  ${libdir}/python3.5/repr.* \
+  ${libdir}/python3.5/__pycache__/repr.* \
+  ${libdir}/python3.5/token.* \
+  ${libdir}/python3.5/__pycache__/token.* \
+  ${libdir}/python3.5/tokenize.* \
+  ${libdir}/python3.5/__pycache__/tokenize.* \
+  ${libdir}/python3.5/traceback.* \
+  ${libdir}/python3.5/__pycache__/traceback.* \
+  ${libdir}/python3.5/weakref.* \
+  ${libdir}/python3.5/__pycache__/weakref.* \
+"
 
 SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-FILES_${PN}-logging="${libdir}/python3.5/logging ${libdir}/python3.5/logging/__pycache__ "
+FILES_${PN}-logging="\
+  ${libdir}/python3.5/logging \
+  ${libdir}/python3.5/logging/__pycache__ \
+"
 
 SUMMARY_${PN}-mailbox="Python mailbox format support"
 RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox="${libdir}/python3.5/mailbox.* ${libdir}/python3.5/__pycache__/mailbox.* "
+FILES_${PN}-mailbox="\
+  ${libdir}/python3.5/mailbox.* \
+  ${libdir}/python3.5/__pycache__/mailbox.* \
+"
 
 SUMMARY_${PN}-math="Python math support"
 RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
-FILES_${PN}-math="${libdir}/python3.5/lib-dynload/cmath.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cmath.*.so ${libdir}/python3.5/lib-dynload/math.*.so ${libdir}/python3.5/lib-dynload/__pycache__/math.*.so ${libdir}/python3.5/lib-dynload/_random.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_random.*.so ${libdir}/python3.5/random.* ${libdir}/python3.5/__pycache__/random.* ${libdir}/python3.5/sets.* ${libdir}/python3.5/__pycache__/sets.* "
+FILES_${PN}-math="\
+  ${libdir}/python3.5/lib-dynload/cmath.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/cmath.*.so \
+  ${libdir}/python3.5/lib-dynload/math.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/math.*.so \
+  ${libdir}/python3.5/lib-dynload/_random.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_random.*.so \
+  ${libdir}/python3.5/random.* \
+  ${libdir}/python3.5/__pycache__/random.* \
+  ${libdir}/python3.5/sets.* \
+  ${libdir}/python3.5/__pycache__/sets.* \
+"
 
 SUMMARY_${PN}-mime="Python MIME handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python3.5/mimetools.* ${libdir}/python3.5/__pycache__/mimetools.* ${libdir}/python3.5/uu.* ${libdir}/python3.5/__pycache__/uu.* ${libdir}/python3.5/quopri.* ${libdir}/python3.5/__pycache__/quopri.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/__pycache__/rfc822.* ${libdir}/python3.5/MimeWriter.* ${libdir}/python3.5/__pycache__/MimeWriter.* "
+FILES_${PN}-mime="\
+  ${libdir}/python3.5/mimetools.* \
+  ${libdir}/python3.5/__pycache__/mimetools.* \
+  ${libdir}/python3.5/uu.* \
+  ${libdir}/python3.5/__pycache__/uu.* \
+  ${libdir}/python3.5/quopri.* \
+  ${libdir}/python3.5/__pycache__/quopri.* \
+  ${libdir}/python3.5/rfc822.* \
+  ${libdir}/python3.5/__pycache__/rfc822.* \
+  ${libdir}/python3.5/MimeWriter.* \
+  ${libdir}/python3.5/__pycache__/MimeWriter.* \
+"
 
 SUMMARY_${PN}-mmap="Python memory-mapped file support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
-FILES_${PN}-mmap="${libdir}/python3.5/lib-dynload/mmap.*.so ${libdir}/python3.5/lib-dynload/__pycache__/mmap.*.so "
+FILES_${PN}-mmap="\
+  ${libdir}/python3.5/lib-dynload/mmap.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/mmap.*.so \
+"
 
 SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing="${libdir}/python3.5/lib-dynload/_multiprocessing.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_multiprocessing.*.so ${libdir}/python3.5/multiprocessing ${libdir}/python3.5/multiprocessing/__pycache__ "
+FILES_${PN}-multiprocessing="\
+  ${libdir}/python3.5/lib-dynload/_multiprocessing.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_multiprocessing.*.so \
+  ${libdir}/python3.5/multiprocessing \
+  ${libdir}/python3.5/multiprocessing/__pycache__ \
+"
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime ${PN}-html"
-FILES_${PN}-netclient="${libdir}/python3.5/*Cookie*.* ${libdir}/python3.5/__pycache__/*Cookie*.* ${libdir}/python3.5/base64.* ${libdir}/python3.5/__pycache__/base64.* ${libdir}/python3.5/cookielib.* ${libdir}/python3.5/__pycache__/cookielib.* ${libdir}/python3.5/ftplib.* ${libdir}/python3.5/__pycache__/ftplib.* ${libdir}/python3.5/gopherlib.* ${libdir}/python3.5/__pycache__/gopherlib.* ${libdir}/python3.5/hmac.* ${libdir}/python3.5/__pycache__/hmac.* ${libdir}/python3.5/http* ${libdir}/python3.5/http*/__pycache__ ${libdir}/python3.5/httplib.* ${libdir}/python3.5/__pycache__/httplib.* ${libdir}/python3.5/mimetypes.* ${libdir}/python3.5/__pycache__/mimetypes.* ${libdir}/python3.5/nntplib.* ${libdir}/python3.5/__pycache__/nntplib.* ${libdir}/python3.5/poplib.* ${libdir}/python3.5/__pycache__/poplib.* ${libdir}/python3.5/smtplib.* ${libdir}/python3.5/__pycache__/smtplib.* ${libdir}/python3.5/telnetlib.* ${libdir}/python3.5/__pycache__/telnetlib.* ${libdir}/python3.5/urllib ${libdir}/python3.5/urllib/__pycache__ ${libdir}/python3.5/uuid.* ${libdir}/python3.5/__pycache__/uuid.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/__pycache__/rfc822.* ${libdir}/python3.5/mimetools.* ${libdir}/python3.5/__pycache__/mimetools.* "
+FILES_${PN}-netclient="\
+  ${libdir}/python3.5/*Cookie*.* \
+  ${libdir}/python3.5/__pycache__/*Cookie*.* \
+  ${libdir}/python3.5/base64.* \
+  ${libdir}/python3.5/__pycache__/base64.* \
+  ${libdir}/python3.5/cookielib.* \
+  ${libdir}/python3.5/__pycache__/cookielib.* \
+  ${libdir}/python3.5/ftplib.* \
+  ${libdir}/python3.5/__pycache__/ftplib.* \
+  ${libdir}/python3.5/gopherlib.* \
+  ${libdir}/python3.5/__pycache__/gopherlib.* \
+  ${libdir}/python3.5/hmac.* \
+  ${libdir}/python3.5/__pycache__/hmac.* \
+  ${libdir}/python3.5/http* \
+  ${libdir}/python3.5/http*/__pycache__ \
+  ${libdir}/python3.5/httplib.* \
+  ${libdir}/python3.5/__pycache__/httplib.* \
+  ${libdir}/python3.5/mimetypes.* \
+  ${libdir}/python3.5/__pycache__/mimetypes.* \
+  ${libdir}/python3.5/nntplib.* \
+  ${libdir}/python3.5/__pycache__/nntplib.* \
+  ${libdir}/python3.5/poplib.* \
+  ${libdir}/python3.5/__pycache__/poplib.* \
+  ${libdir}/python3.5/smtplib.* \
+  ${libdir}/python3.5/__pycache__/smtplib.* \
+  ${libdir}/python3.5/telnetlib.* \
+  ${libdir}/python3.5/__pycache__/telnetlib.* \
+  ${libdir}/python3.5/urllib \
+  ${libdir}/python3.5/urllib/__pycache__ \
+  ${libdir}/python3.5/uuid.* \
+  ${libdir}/python3.5/__pycache__/uuid.* \
+  ${libdir}/python3.5/rfc822.* \
+  ${libdir}/python3.5/__pycache__/rfc822.* \
+  ${libdir}/python3.5/mimetools.* \
+  ${libdir}/python3.5/__pycache__/mimetools.* \
+"
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
-FILES_${PN}-netserver="${libdir}/python3.5/cgi.* ${libdir}/python3.5/__pycache__/cgi.* ${libdir}/python3.5/socketserver.* ${libdir}/python3.5/__pycache__/socketserver.* ${libdir}/python3.5/*HTTPServer.* ${libdir}/python3.5/__pycache__/*HTTPServer.* ${libdir}/python3.5/SocketServer.* ${libdir}/python3.5/__pycache__/SocketServer.* "
+FILES_${PN}-netserver="\
+  ${libdir}/python3.5/cgi.* \
+  ${libdir}/python3.5/__pycache__/cgi.* \
+  ${libdir}/python3.5/socketserver.* \
+  ${libdir}/python3.5/__pycache__/socketserver.* \
+  ${libdir}/python3.5/*HTTPServer.* \
+  ${libdir}/python3.5/__pycache__/*HTTPServer.* \
+  ${libdir}/python3.5/SocketServer.* \
+  ${libdir}/python3.5/__pycache__/SocketServer.* \
+"
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python3.5/decimal.* ${libdir}/python3.5/__pycache__/decimal.* ${libdir}/python3.5/fractions.* ${libdir}/python3.5/__pycache__/fractions.* ${libdir}/python3.5/numbers.* ${libdir}/python3.5/__pycache__/numbers.* "
+FILES_${PN}-numbers="\
+  ${libdir}/python3.5/decimal.* \
+  ${libdir}/python3.5/__pycache__/decimal.* \
+  ${libdir}/python3.5/fractions.* \
+  ${libdir}/python3.5/__pycache__/fractions.* \
+  ${libdir}/python3.5/numbers.* \
+  ${libdir}/python3.5/__pycache__/numbers.* \
+"
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.5/_compat_pickle.* ${libdir}/python3.5/__pycache__/_compat_pickle.* ${libdir}/python3.5/pickle.* ${libdir}/python3.5/__pycache__/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/__pycache__/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so ${libdir}/python3.5/pickletools.* ${libdir}/python3.5/__pycache__/pickletools.* "
+FILES_${PN}-pickle="\
+  ${libdir}/python3.5/_compat_pickle.* \
+  ${libdir}/python3.5/__pycache__/_compat_pickle.* \
+  ${libdir}/python3.5/pickle.* \
+  ${libdir}/python3.5/__pycache__/pickle.* \
+  ${libdir}/python3.5/shelve.* \
+  ${libdir}/python3.5/__pycache__/shelve.* \
+  ${libdir}/python3.5/lib-dynload/cPickle.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so \
+  ${libdir}/python3.5/pickletools.* \
+  ${libdir}/python3.5/__pycache__/pickletools.* \
+"
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
-FILES_${PN}-pkgutil="${libdir}/python3.5/pkgutil.* ${libdir}/python3.5/__pycache__/pkgutil.* "
+FILES_${PN}-pkgutil="\
+  ${libdir}/python3.5/pkgutil.* \
+  ${libdir}/python3.5/__pycache__/pkgutil.* \
+"
 
 SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
-FILES_${PN}-pprint="${libdir}/python3.5/pprint.* ${libdir}/python3.5/__pycache__/pprint.* "
+FILES_${PN}-pprint="\
+  ${libdir}/python3.5/pprint.* \
+  ${libdir}/python3.5/__pycache__/pprint.* \
+"
 
 SUMMARY_${PN}-profile="Python basic performance profiling support"
 RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
-FILES_${PN}-profile="${libdir}/python3.5/profile.* ${libdir}/python3.5/__pycache__/profile.* ${libdir}/python3.5/pstats.* ${libdir}/python3.5/__pycache__/pstats.* ${libdir}/python3.5/cProfile.* ${libdir}/python3.5/__pycache__/cProfile.* ${libdir}/python3.5/lib-dynload/_lsprof.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_lsprof.*.so "
+FILES_${PN}-profile="\
+  ${libdir}/python3.5/profile.* \
+  ${libdir}/python3.5/__pycache__/profile.* \
+  ${libdir}/python3.5/pstats.* \
+  ${libdir}/python3.5/__pycache__/pstats.* \
+  ${libdir}/python3.5/cProfile.* \
+  ${libdir}/python3.5/__pycache__/cProfile.* \
+  ${libdir}/python3.5/lib-dynload/_lsprof.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_lsprof.*.so \
+"
 
 SUMMARY_${PN}-pydoc="Python interactive help support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.5/pydoc.* ${libdir}/python3.5/__pycache__/pydoc.* ${libdir}/python3.5/pydoc_data ${libdir}/python3.5/pydoc_data/__pycache__ "
+FILES_${PN}-pydoc="\
+  ${bindir}/pydoc \
+  ${libdir}/python3.5/pydoc.* \
+  ${libdir}/python3.5/__pycache__/pydoc.* \
+  ${libdir}/python3.5/pydoc_data \
+  ${libdir}/python3.5/pydoc_data/__pycache__ \
+"
 
 SUMMARY_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
-FILES_${PN}-re="${libdir}/python3.5/re.* ${libdir}/python3.5/__pycache__/re.* ${libdir}/python3.5/sre.* ${libdir}/python3.5/__pycache__/sre.* ${libdir}/python3.5/sre_compile.* ${libdir}/python3.5/__pycache__/sre_compile.* ${libdir}/python3.5/sre_constants* ${libdir}/python3.5/sre_constants*/__pycache__ ${libdir}/python3.5/sre_parse.* ${libdir}/python3.5/__pycache__/sre_parse.* "
+FILES_${PN}-re="\
+  ${libdir}/python3.5/re.* \
+  ${libdir}/python3.5/__pycache__/re.* \
+  ${libdir}/python3.5/sre.* \
+  ${libdir}/python3.5/__pycache__/sre.* \
+  ${libdir}/python3.5/sre_compile.* \
+  ${libdir}/python3.5/__pycache__/sre_compile.* \
+  ${libdir}/python3.5/sre_constants* \
+  ${libdir}/python3.5/sre_constants*/__pycache__ \
+  ${libdir}/python3.5/sre_parse.* \
+  ${libdir}/python3.5/__pycache__/sre_parse.* \
+"
 
 SUMMARY_${PN}-readline="Python readline support"
 RDEPENDS_${PN}-readline="${PN}-core"
-FILES_${PN}-readline="${libdir}/python3.5/lib-dynload/readline.*.so ${libdir}/python3.5/lib-dynload/__pycache__/readline.*.so ${libdir}/python3.5/rlcompleter.* ${libdir}/python3.5/__pycache__/rlcompleter.* "
+FILES_${PN}-readline="\
+  ${libdir}/python3.5/lib-dynload/readline.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/readline.*.so \
+  ${libdir}/python3.5/rlcompleter.* \
+  ${libdir}/python3.5/__pycache__/rlcompleter.* \
+"
 
 SUMMARY_${PN}-reprlib="Python alternate repr() implementation"
 RDEPENDS_${PN}-reprlib="${PN}-core"
-FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.py ${libdir}/python3.5/__pycache__/reprlib.py "
+FILES_${PN}-reprlib="\
+  ${libdir}/python3.5/reprlib.py \
+  ${libdir}/python3.5/__pycache__/reprlib.py \
+"
 
 SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so ${libdir}/python3.5/lib-dynload/__pycache__/resource.*.so "
+FILES_${PN}-resource="\
+  ${libdir}/python3.5/lib-dynload/resource.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/resource.*.so \
+"
 
 SUMMARY_${PN}-selectors="Python High-level I/O multiplexing"
 RDEPENDS_${PN}-selectors="${PN}-core"
-FILES_${PN}-selectors="${libdir}/python3.5/selectors.* ${libdir}/python3.5/__pycache__/selectors.* "
+FILES_${PN}-selectors="\
+  ${libdir}/python3.5/selectors.* \
+  ${libdir}/python3.5/__pycache__/selectors.* \
+"
 
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re ${PN}-compression"
-FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/__pycache__/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/__pycache__/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/__pycache__/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/__pycache__/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/__pycache__/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/__pycache__/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/__pycache__/shlex.* ${libdir}/python3.5/shutil.* ${libdir}/python3.5/__pycache__/shutil.* "
+FILES_${PN}-shell="\
+  ${libdir}/python3.5/cmd.* \
+  ${libdir}/python3.5/__pycache__/cmd.* \
+  ${libdir}/python3.5/commands.* \
+  ${libdir}/python3.5/__pycache__/commands.* \
+  ${libdir}/python3.5/dircache.* \
+  ${libdir}/python3.5/__pycache__/dircache.* \
+  ${libdir}/python3.5/fnmatch.* \
+  ${libdir}/python3.5/__pycache__/fnmatch.* \
+  ${libdir}/python3.5/glob.* \
+  ${libdir}/python3.5/__pycache__/glob.* \
+  ${libdir}/python3.5/popen2.* \
+  ${libdir}/python3.5/__pycache__/popen2.* \
+  ${libdir}/python3.5/shlex.* \
+  ${libdir}/python3.5/__pycache__/shlex.* \
+  ${libdir}/python3.5/shutil.* \
+  ${libdir}/python3.5/__pycache__/shutil.* \
+"
 
 SUMMARY_${PN}-signal="Python set handlers for asynchronous events support"
 RDEPENDS_${PN}-signal="${PN}-core ${PN}-enum"
-FILES_${PN}-signal="${libdir}/python3.5/signal.* ${libdir}/python3.5/__pycache__/signal.* "
+FILES_${PN}-signal="\
+  ${libdir}/python3.5/signal.* \
+  ${libdir}/python3.5/__pycache__/signal.* \
+"
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.5/smtpd.* ${libdir}/python3.5/__pycache__/smtpd.* "
+FILES_${PN}-smtpd="\
+  ${bindir}/smtpd.* \
+  ${libdir}/python3.5/smtpd.* \
+  ${libdir}/python3.5/__pycache__/smtpd.* \
+"
 
 SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading"
-FILES_${PN}-sqlite3="${libdir}/python3.5/lib-dynload/_sqlite3.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_sqlite3.*.so ${libdir}/python3.5/sqlite3/dbapi2.* ${libdir}/python3.5/sqlite3/__pycache__/dbapi2.* ${libdir}/python3.5/sqlite3/__init__.* ${libdir}/python3.5/sqlite3/__pycache__/__init__.* ${libdir}/python3.5/sqlite3/dump.* ${libdir}/python3.5/sqlite3/__pycache__/dump.* "
+FILES_${PN}-sqlite3="\
+  ${libdir}/python3.5/lib-dynload/_sqlite3.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_sqlite3.*.so \
+  ${libdir}/python3.5/sqlite3/dbapi2.* \
+  ${libdir}/python3.5/sqlite3/__pycache__/dbapi2.* \
+  ${libdir}/python3.5/sqlite3/__init__.* \
+  ${libdir}/python3.5/sqlite3/__pycache__/__init__.* \
+  ${libdir}/python3.5/sqlite3/dump.* \
+  ${libdir}/python3.5/sqlite3/__pycache__/dump.* \
+"
 
 SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests="${libdir}/python3.5/sqlite3/test ${libdir}/python3.5/sqlite3/test/__pycache__ "
+FILES_${PN}-sqlite3-tests="\
+  ${libdir}/python3.5/sqlite3/test \
+  ${libdir}/python3.5/sqlite3/test/__pycache__ \
+"
 
 SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/python3.5/lib-dynload/__pycache__/strop.*.so ${libdir}/python3.5/string.* ${libdir}/python3.5/__pycache__/string.* ${libdir}/python3.5/stringold.* ${libdir}/python3.5/__pycache__/stringold.* "
+FILES_${PN}-stringold="\
+  ${libdir}/python3.5/lib-dynload/strop.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/strop.*.so \
+  ${libdir}/python3.5/string.* \
+  ${libdir}/python3.5/__pycache__/string.* \
+  ${libdir}/python3.5/stringold.* \
+  ${libdir}/python3.5/__pycache__/stringold.* \
+"
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading ${PN}-signal ${PN}-selectors"
-FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* ${libdir}/python3.5/__pycache__/subprocess.* ${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_posixsubprocess.*.so "
+FILES_${PN}-subprocess="\
+  ${libdir}/python3.5/subprocess.* \
+  ${libdir}/python3.5/__pycache__/subprocess.* \
+  ${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_posixsubprocess.*.so \
+"
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
-FILES_${PN}-syslog="${libdir}/python3.5/lib-dynload/syslog.*.so ${libdir}/python3.5/lib-dynload/__pycache__/syslog.*.so "
+FILES_${PN}-syslog="\
+  ${libdir}/python3.5/lib-dynload/syslog.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/syslog.*.so \
+"
 
 SUMMARY_${PN}-terminal="Python terminal controlling support"
 RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
-FILES_${PN}-terminal="${libdir}/python3.5/pty.* ${libdir}/python3.5/__pycache__/pty.* ${libdir}/python3.5/tty.* ${libdir}/python3.5/__pycache__/tty.* "
+FILES_${PN}-terminal="\
+  ${libdir}/python3.5/pty.* \
+  ${libdir}/python3.5/__pycache__/pty.* \
+  ${libdir}/python3.5/tty.* \
+  ${libdir}/python3.5/__pycache__/tty.* \
+"
 
 SUMMARY_${PN}-tests="Python tests"
 RDEPENDS_${PN}-tests="${PN}-core ${PN}-compression"
-FILES_${PN}-tests="${libdir}/python3.5/test ${libdir}/python3.5/test/__pycache__ "
+FILES_${PN}-tests="\
+  ${libdir}/python3.5/test \
+  ${libdir}/python3.5/test/__pycache__ \
+"
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
 RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils="${libdir}/python3.5/lib-dynload/_csv.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_csv.*.so ${libdir}/python3.5/csv.* ${libdir}/python3.5/__pycache__/csv.* ${libdir}/python3.5/optparse.* ${libdir}/python3.5/__pycache__/optparse.* ${libdir}/python3.5/textwrap.* ${libdir}/python3.5/__pycache__/textwrap.* "
+FILES_${PN}-textutils="\
+  ${libdir}/python3.5/lib-dynload/_csv.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_csv.*.so \
+  ${libdir}/python3.5/csv.* \
+  ${libdir}/python3.5/__pycache__/csv.* \
+  ${libdir}/python3.5/optparse.* \
+  ${libdir}/python3.5/__pycache__/optparse.* \
+  ${libdir}/python3.5/textwrap.* \
+  ${libdir}/python3.5/__pycache__/textwrap.* \
+"
 
 SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python3.5/_threading_local.* ${libdir}/python3.5/__pycache__/_threading_local.* ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/__pycache__/dummy_thread.* ${libdir}/python3.5/dummy_threading.* ${libdir}/python3.5/__pycache__/dummy_threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/__pycache__/mutex.* ${libdir}/python3.5/threading.* ${libdir}/python3.5/__pycache__/threading.* ${libdir}/python3.5/queue.* ${libdir}/python3.5/__pycache__/queue.* "
+FILES_${PN}-threading="\
+  ${libdir}/python3.5/_threading_local.* \
+  ${libdir}/python3.5/__pycache__/_threading_local.* \
+  ${libdir}/python3.5/dummy_thread.* \
+  ${libdir}/python3.5/__pycache__/dummy_thread.* \
+  ${libdir}/python3.5/dummy_threading.* \
+  ${libdir}/python3.5/__pycache__/dummy_threading.* \
+  ${libdir}/python3.5/mutex.* \
+  ${libdir}/python3.5/__pycache__/mutex.* \
+  ${libdir}/python3.5/threading.* \
+  ${libdir}/python3.5/__pycache__/threading.* \
+  ${libdir}/python3.5/queue.* \
+  ${libdir}/python3.5/__pycache__/queue.* \
+"
 
 SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
-FILES_${PN}-tkinter="${libdir}/python3.5/lib-dynload/_tkinter.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_tkinter.*.so ${libdir}/python3.5/lib-tk ${libdir}/python3.5/lib-tk/__pycache__ ${libdir}/python3.5/tkinter ${libdir}/python3.5/tkinter/__pycache__ "
+FILES_${PN}-tkinter="\
+  ${libdir}/python3.5/lib-dynload/_tkinter.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_tkinter.*.so \
+  ${libdir}/python3.5/lib-tk \
+  ${libdir}/python3.5/lib-tk/__pycache__ \
+  ${libdir}/python3.5/tkinter \
+  ${libdir}/python3.5/tkinter/__pycache__ \
+"
 
 SUMMARY_${PN}-typing="Python typing support"
 RDEPENDS_${PN}-typing="${PN}-core"
-FILES_${PN}-typing="${libdir}/python3.5/typing.* ${libdir}/python3.5/__pycache__/typing.* "
+FILES_${PN}-typing="\
+  ${libdir}/python3.5/typing.* \
+  ${libdir}/python3.5/__pycache__/typing.* \
+"
 
 SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest="${libdir}/python3.5/unittest/ ${libdir}/python3.5/unittest/__pycache__ "
+FILES_${PN}-unittest="\
+  ${libdir}/python3.5/unittest/ \
+  ${libdir}/python3.5/unittest/__pycache__ \
+"
 
 SUMMARY_${PN}-unixadmin="Python Unix administration support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
-FILES_${PN}-unixadmin="${libdir}/python3.5/lib-dynload/nis.*.so ${libdir}/python3.5/lib-dynload/__pycache__/nis.*.so ${libdir}/python3.5/lib-dynload/grp.*.so ${libdir}/python3.5/lib-dynload/__pycache__/grp.*.so ${libdir}/python3.5/lib-dynload/pwd.*.so ${libdir}/python3.5/lib-dynload/__pycache__/pwd.*.so ${libdir}/python3.5/getpass.* ${libdir}/python3.5/__pycache__/getpass.* "
+FILES_${PN}-unixadmin="\
+  ${libdir}/python3.5/lib-dynload/nis.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/nis.*.so \
+  ${libdir}/python3.5/lib-dynload/grp.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/grp.*.so \
+  ${libdir}/python3.5/lib-dynload/pwd.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/pwd.*.so \
+  ${libdir}/python3.5/getpass.* \
+  ${libdir}/python3.5/__pycache__/getpass.* \
+"
 
 SUMMARY_${PN}-xml="Python basic XML support"
 RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
-FILES_${PN}-xml="${libdir}/python3.5/lib-dynload/_elementtree.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_elementtree.*.so ${libdir}/python3.5/lib-dynload/pyexpat.*.so ${libdir}/python3.5/lib-dynload/__pycache__/pyexpat.*.so ${libdir}/python3.5/xml ${libdir}/python3.5/xml/__pycache__ ${libdir}/python3.5/xmllib.* ${libdir}/python3.5/__pycache__/xmllib.* "
+FILES_${PN}-xml="\
+  ${libdir}/python3.5/lib-dynload/_elementtree.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/_elementtree.*.so \
+  ${libdir}/python3.5/lib-dynload/pyexpat.*.so \
+  ${libdir}/python3.5/lib-dynload/__pycache__/pyexpat.*.so \
+  ${libdir}/python3.5/xml \
+  ${libdir}/python3.5/xml/__pycache__ \
+  ${libdir}/python3.5/xmllib.* \
+  ${libdir}/python3.5/__pycache__/xmllib.* \
+"
 
 SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pydoc"
-FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/__pycache__/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc ${libdir}/python3.5/xmlrpc/__pycache__ "
+FILES_${PN}-xmlrpc="\
+  ${libdir}/python3.5/xmlrpclib.* \
+  ${libdir}/python3.5/__pycache__/xmlrpclib.* \
+  ${libdir}/python3.5/SimpleXMLRPCServer.* \
+  ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* \
+  ${libdir}/python3.5/DocXMLRPCServer.* \
+  ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* \
+  ${libdir}/python3.5/xmlrpc \
+  ${libdir}/python3.5/xmlrpc/__pycache__ \
+"
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules=" \
+  ${PN}-2to3 \
+  ${PN}-argparse \
+  ${PN}-asyncio \
+  ${PN}-audio \
+  ${PN}-codecs \
+  ${PN}-compile \
+  ${PN}-compression \
+  ${PN}-core \
+  ${PN}-crypt \
+  ${PN}-ctypes \
+  ${PN}-curses \
+  ${PN}-datetime \
+  ${PN}-db \
+  ${PN}-debugger \
+  ${PN}-difflib \
+  ${PN}-distutils \
+  ${PN}-doctest \
+  ${PN}-email \
+  ${PN}-enum \
+  ${PN}-fcntl \
+  ${PN}-gdbm \
+  ${PN}-html \
+  ${PN}-idle \
+  ${PN}-image \
+  ${PN}-importlib \
+  ${PN}-io \
+  ${PN}-json \
+  ${PN}-lang \
+  ${PN}-logging \
+  ${PN}-mailbox \
+  ${PN}-math \
+  ${PN}-mime \
+  ${PN}-mmap \
+  ${PN}-multiprocessing \
+  ${PN}-netclient \
+  ${PN}-netserver \
+  ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pkgutil \
+  ${PN}-pprint \
+  ${PN}-profile \
+  ${PN}-pydoc \
+  ${PN}-re \
+  ${PN}-readline \
+  ${PN}-reprlib \
+  ${PN}-resource \
+  ${PN}-selectors \
+  ${PN}-shell \
+  ${PN}-signal \
+  ${PN}-smtpd \
+  ${PN}-sqlite3 \
+  ${PN}-sqlite3-tests \
+  ${PN}-stringold \
+  ${PN}-subprocess \
+  ${PN}-syslog \
+  ${PN}-terminal \
+  ${PN}-textutils \
+  ${PN}-threading \
+  ${PN}-tkinter \
+  ${PN}-typing \
+  ${PN}-unittest \
+  ${PN}-unixadmin \
+  ${PN}-xml \
+  ${PN}-xmlrpc \
+"
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 586b329c19..2491bd0bc4 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -88,9 +88,9 @@ class MakefileMaker:
         # generate provides line
         #
 
-        provideLine = 'PROVIDES+="'
+        provideLine = 'PROVIDES+=" \\\n'
         for name in sorted(self.packages):
-            provideLine += "%s " % name
+            provideLine += "  %s \\\n" % name
         provideLine += '"'
 
         self.out( provideLine )
@@ -100,14 +100,15 @@ class MakefileMaker:
         # generate package line
         #
 
-        packageLine = 'PACKAGES="${PN}-dbg '
+        packageLine = 'PACKAGES=" \\\n'
+        packageLine += '  ${PN}-dbg \\\n'
         for name in sorted(self.packages):
             if name.startswith("${PN}-distutils"):
                 if name == "${PN}-distutils":
-                    packageLine += "%s-staticdev %s " % (name, name)
+                    packageLine += "  %s-staticdev %s \\\n" % (name, name)
             elif name != '${PN}-dbg':
-                packageLine += "%s " % name
-        packageLine += '${PN}-modules"'
+                packageLine += "  %s \\\n" % name
+        packageLine += '  ${PN}-modules\\\n"'
 
         self.out( packageLine )
         self.out( "" )
@@ -125,7 +126,7 @@ class MakefileMaker:
             self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
             self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
 
-            line = 'FILES_%s="' % name
+            line = 'FILES_%s=" \\\n' % name
 
             #
             # check which directories to make in the temporary directory
@@ -140,20 +141,21 @@ class MakefileMaker:
             #
 
             for target in files:
-                line += "%s " % target
+                line += "    %s \\\n" % target
 
             line += '"'
             self.out( line )
             self.out( "" )
 
         self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
-        line = 'RDEPENDS_${PN}-modules="'
+        line = 'RDEPENDS_${PN}-modules=" \\\n'
 
         for name, data in sorted(self.packages.items()):
             if name not in ['${PN}-dev', '${PN}-distutils-staticdev'] and name not in self.excluded_pkgs:
-                line += "%s " % name
+                line += "  %s \\\n" % name
 
-        self.out( "%s \"" % line )
+        line += '"'
+        self.out( line )
         self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )
 
     def doEpilog( self ):
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 6352f8f120..33779cffab 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -101,9 +101,9 @@ class MakefileMaker:
         # generate provides line
         #
 
-        provideLine = 'PROVIDES+="'
+        provideLine = 'PROVIDES+="\\\n'
         for name in sorted(self.packages):
-            provideLine += "%s " % name
+            provideLine += "  %s \\\n" % name
         provideLine += '"'
 
         self.out( provideLine )
@@ -113,14 +113,15 @@ class MakefileMaker:
         # generate package line
         #
 
-        packageLine = 'PACKAGES="${PN}-dbg '
+        packageLine = 'PACKAGES="\\\n'
+        packageLine += '  ${PN}-dbg \\\n'
         for name in sorted(self.packages):
             if name.startswith("${PN}-distutils"):
                 if name == "${PN}-distutils":
-                    packageLine += "%s-staticdev %s " % (name, name)
+                    packageLine += "%s \\\n %s-staticdev \\\n" % (name, name)
             elif name != '${PN}-dbg':
-                packageLine += "%s " % name
-        packageLine += '${PN}-modules"'
+                packageLine += "  %s \\\n" % name
+        packageLine += '  ${PN}-modules \\\n"'
 
         self.out( packageLine )
         self.out( "" )
@@ -138,7 +139,7 @@ class MakefileMaker:
             self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
             self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
 
-            line = 'FILES_%s="' % name
+            line = 'FILES_%s="\\\n' % name
 
             #
             # check which directories to make in the temporary directory
@@ -153,20 +154,21 @@ class MakefileMaker:
             #
 
             for target in files:
-                line += "%s " % target
+                line += "  %s \\\n" % target
 
             line += '"'
             self.out( line )
             self.out( "" )
 
         self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
-        line = 'RDEPENDS_${PN}-modules="'
+        line = 'RDEPENDS_${PN}-modules=" \\\n'
 
         for name, data in sorted(self.packages.items()):
             if name not in ['${PN}-dev', '${PN}-distutils-staticdev'] and name not in self.excluded_pkgs:
-                line += "%s " % name
+                line += "  %s \\\n" % name
 
-        self.out( "%s \"" % line )
+        line += '"'
+        self.out( line )
         self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )
 
     def doEpilog( self ):
-- 
2.14.3


