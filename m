Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3W-00065F-3j
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625128"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:46 -0700
Message-Id: <bdf6f1b3586ef755c94f24c8c337e51fdf04728d.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/28] python: improve packaging
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:25 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* move 2to3 to separate package and include lib2to3 (was in python-misc)
* fix pattern for python-unittest (was in python-misc because it's in subdirectory now)
* add pydoc_data to python-pydoc (was in python-misc)
* add more stuff to smtpd, audio, codecs, ctypes, html, io, json, mime,
  pickle, stringold, xmlrpc
* move all FILES_ details from python recipe to manifest generator so it's in one place
* added manual line break in FILES_${PN}-core, because git send-email
  doesn't like too long lines
  $ git send-email -1 dfaae65839f0ab23e5b2ae2a68df0f370bca84d2
  fatal: /tmp/k8zbDajUNP/0001-python-improve-packaging.patch: 64: patch contains a line longer than 998 characters

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-2.7-manifest.inc                 |   43 ++++++++++--------
 meta/recipes-devtools/python/python_2.7.2.bb       |   22 +---------
 scripts/contrib/python/generate-manifest-2.7.py    |   47 ++++++++++++-------
 3 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 69cb3c7..e4017ba 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,17 +1,21 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.1 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
-PROVIDES+="${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
+PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
 
-PACKAGES="${PN}-dbg ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+
+DESCRIPTION_${PN}-2to3="Python Automated Python 2 to 3 code translation"
+RDEPENDS_${PN}-2to3="${PN}-core"
+FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python2.7/lib2to3 "
 
 DESCRIPTION_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so "
+FILES_${PN}-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so ${libdir}/python2.7/audiodev.* ${libdir}/python2.7/sunaudio.* ${libdir}/python2.7/sunau.* ${libdir}/python2.7/toaiff.* "
 
 DESCRIPTION_${PN}-bsddb="Python Berkeley Database Bindings"
 RDEPENDS_${PN}-bsddb="${PN}-core"
@@ -19,7 +23,7 @@ FILES_${PN}-bsddb="${libdir}/python2.7/bsddb ${libdir}/python2.7/lib-dynload/_bs
 
 DESCRIPTION_${PN}-codecs="Python Codecs, Encodings & i18n Support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python2.7/codecs.* ${libdir}/python2.7/encodings ${libdir}/python2.7/gettext.* ${libdir}/python2.7/locale.* ${libdir}/python2.7/lib-dynload/_locale.so ${libdir}/python2.7/lib-dynload/unicodedata.so ${libdir}/python2.7/stringprep.* ${libdir}/python2.7/xdrlib.* "
+FILES_${PN}-codecs="${libdir}/python2.7/codecs.* ${libdir}/python2.7/encodings ${libdir}/python2.7/gettext.* ${libdir}/python2.7/locale.* ${libdir}/python2.7/lib-dynload/_locale.so ${libdir}/python2.7/lib-dynload/_codecs* ${libdir}/python2.7/lib-dynload/_multibytecodec.so ${libdir}/python2.7/lib-dynload/unicodedata.so ${libdir}/python2.7/stringprep.* ${libdir}/python2.7/xdrlib.* "
 
 DESCRIPTION_${PN}-compile="Python Bytecode Compilation Support"
 RDEPENDS_${PN}-compile="${PN}-core"
@@ -35,7 +39,8 @@ FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.
 
 DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
 RDEPENDS_${PN}-core=""
-FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig.h "
+FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so \
+${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
 RDEPENDS_${PN}-crypt="${PN}-core"
@@ -43,7 +48,7 @@ FILES_${PN}-crypt="${libdir}/python2.7/hashlib.* ${libdir}/python2.7/md5.* ${lib
 
 DESCRIPTION_${PN}-ctypes="Python C Types Support"
 RDEPENDS_${PN}-ctypes="${PN}-core"
-FILES_${PN}-ctypes="${libdir}/python2.7/ctypes ${libdir}/python2.7/lib-dynload/_ctypes.so "
+FILES_${PN}-ctypes="${libdir}/python2.7/ctypes ${libdir}/python2.7/lib-dynload/_ctypes.so ${libdir}/python2.7/lib-dynload/_ctypes_test.so "
 
 DESCRIPTION_${PN}-curses="Python Curses Support"
 RDEPENDS_${PN}-curses="${PN}-core"
@@ -63,7 +68,7 @@ FILES_${PN}-debugger="${libdir}/python2.7/bdb.* ${libdir}/python2.7/pdb.* "
 
 DESCRIPTION_${PN}-dev="Python Development Package"
 RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/libpython2.6.so "
+FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
 
 DESCRIPTION_${PN}-difflib="Python helpers for computing deltas between objects."
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
@@ -99,7 +104,7 @@ FILES_${PN}-hotshot="${libdir}/python2.7/hotshot ${libdir}/python2.7/lib-dynload
 
 DESCRIPTION_${PN}-html="Python HTML Processing"
 RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python2.7/formatter.* ${libdir}/python2.7/htmlentitydefs.* ${libdir}/python2.7/htmllib.* ${libdir}/python2.7/markupbase.* ${libdir}/python2.7/sgmllib.* "
+FILES_${PN}-html="${libdir}/python2.7/formatter.* ${libdir}/python2.7/htmlentitydefs.* ${libdir}/python2.7/htmllib.* ${libdir}/python2.7/markupbase.* ${libdir}/python2.7/sgmllib.* ${libdir}/python2.7/HTMLParser.* "
 
 DESCRIPTION_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
@@ -111,11 +116,11 @@ FILES_${PN}-image="${libdir}/python2.7/colorsys.* ${libdir}/python2.7/imghdr.* $
 
 DESCRIPTION_${PN}-io="Python Low-Level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* "
+FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
 DESCRIPTION_${PN}-json="Python JSON Support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
-FILES_${PN}-json="${libdir}/python2.7/json "
+FILES_${PN}-json="${libdir}/python2.7/json ${libdir}/python2.7/lib-dynload/_json.so "
 
 DESCRIPTION_${PN}-lang="Python Low-Level Language Support"
 RDEPENDS_${PN}-lang="${PN}-core"
@@ -135,7 +140,7 @@ FILES_${PN}-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/l
 
 DESCRIPTION_${PN}-mime="Python MIME Handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python2.7/mimetools.* ${libdir}/python2.7/uu.* ${libdir}/python2.7/quopri.* ${libdir}/python2.7/rfc822.* "
+FILES_${PN}-mime="${libdir}/python2.7/mimetools.* ${libdir}/python2.7/uu.* ${libdir}/python2.7/quopri.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/MimeWriter.* "
 
 DESCRIPTION_${PN}-mmap="Python Memory-Mapped-File Support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
@@ -159,7 +164,7 @@ FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.*
 
 DESCRIPTION_${PN}-pickle="Python Persistence Support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so "
+FILES_${PN}-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so ${libdir}/python2.7/pickletools.* "
 
 DESCRIPTION_${PN}-pkgutil="Python Package Extension Utility Support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
@@ -175,7 +180,7 @@ FILES_${PN}-profile="${libdir}/python2.7/profile.* ${libdir}/python2.7/pstats.*
 
 DESCRIPTION_${PN}-pydoc="Python Interactive Help Support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python2.7/pydoc.* "
+FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python2.7/pydoc.* ${libdir}/python2.7/pydoc_data "
 
 DESCRIPTION_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
@@ -199,7 +204,7 @@ FILES_${PN}-shell="${libdir}/python2.7/cmd.* ${libdir}/python2.7/commands.* ${li
 
 DESCRIPTION_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* "
+FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python2.7/smtpd.* "
 
 DESCRIPTION_${PN}-sqlite3="Python Sqlite3 Database Support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib"
@@ -211,7 +216,7 @@ FILES_${PN}-sqlite3-tests="${libdir}/python2.7/sqlite3/test "
 
 DESCRIPTION_${PN}-stringold="Python String APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python2.7/lib-dynload/strop.so ${libdir}/python2.7/string.* "
+FILES_${PN}-stringold="${libdir}/python2.7/lib-dynload/strop.so ${libdir}/python2.7/string.* ${libdir}/python2.7/stringold.* "
 
 DESCRIPTION_${PN}-subprocess="Python Subprocess Support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
@@ -243,7 +248,7 @@ FILES_${PN}-tkinter="${libdir}/python2.7/lib-dynload/_tkinter.so ${libdir}/pytho
 
 DESCRIPTION_${PN}-unittest="Python Unit Testing Framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang"
-FILES_${PN}-unittest="${libdir}/python2.7/unittest.* "
+FILES_${PN}-unittest="${libdir}/python2.7/unittest/ "
 
 DESCRIPTION_${PN}-unixadmin="Python Unix Administration Support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
@@ -255,14 +260,14 @@ FILES_${PN}-xml="${libdir}/python2.7/lib-dynload/pyexpat.so ${libdir}/python2.7/
 
 DESCRIPTION_${PN}-xmlrpc="Python XMLRPC Support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
-FILES_${PN}-xmlrpc="${libdir}/python2.7/xmlrpclib.* ${libdir}/python2.7/SimpleXMLRPCServer.* "
+FILES_${PN}-xmlrpc="${libdir}/python2.7/xmlrpclib.* ${libdir}/python2.7/SimpleXMLRPCServer.* ${libdir}/python2.7/DocXMLRPCServer.* "
 
 DESCRIPTION_${PN}-zlib="Python zlib Support."
 RDEPENDS_${PN}-zlib="${PN}-core"
 FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
 
 DESCRIPTION_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 45d8350..bb088a4 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -107,30 +107,10 @@ RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
 
-# add sitecustomize
-FILES_${PN}-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
-# ship 2to3
-FILES_${PN}-core += "${bindir}/2to3"
-
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
 FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
 
-# additional stuff -dev
-
-FILES_${PN}-dev = "\
-  ${includedir} \
-  ${libdir}/lib*${SOLIBSDEV} \
-  ${libdir}/*.la \
-  ${libdir}/*.a \
-  ${libdir}/*.o \
-  ${libdir}/pkgconfig \
-  ${base_libdir}/*.a \
-  ${base_libdir}/*.o \
-  ${datadir}/aclocal \
-  ${datadir}/pkgconfig \
-"
-
 # catch debug extensions (isn't that already in python-core-dbg?)
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index b526df5..e0171f9 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -17,7 +17,7 @@ import time
 VERSION = "2.7.2"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20110222.1"
+__version__ = "20110222.2"
 
 class MakefileMaker:
 
@@ -166,28 +166,41 @@ if __name__ == "__main__":
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
     "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  + 
     "_weakrefset.* sysconfig.* config/Makefile " +
-    "${includedir}/python${PYTHON_MAJMIN}/pyconfig.h " )
+    "${includedir}/python${PYTHON_MAJMIN}/pyconfig.h " +
+    "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
     m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
-    "${includedir} ${libdir}/libpython2.6.so" ) # package
+    "${includedir} " +
+    "${libdir}/lib*${SOLIBSDEV} " +
+    "${libdir}/*.la " +
+    "${libdir}/*.a " +
+    "${libdir}/*.o " +
+    "${libdir}/pkgconfig " +
+    "${base_libdir}/*.a " +
+    "${base_libdir}/*.o " +
+    "${datadir}/aclocal " +
+    "${datadir}/pkgconfig " )
+
+    m.addPackage( "${PN}-2to3", "Python Automated Python 2 to 3 code translation", "${PN}-core",
+    "${bindir}/2to3 lib2to3" ) # package
 
     m.addPackage( "${PN}-idle", "Python Integrated Development Environment", "${PN}-core ${PN}-tkinter",
     "${bindir}/idle idlelib" ) # package
 
     m.addPackage( "${PN}-pydoc", "Python Interactive Help Support", "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
-    "${bindir}/pydoc pydoc.*" )
+    "${bindir}/pydoc pydoc.* pydoc_data" )
 
     m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon", "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
-    "${bindir}/smtpd.*" )
+    "${bindir}/smtpd.* smtpd.*" )
 
     m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
-    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib-dynload/audioop.so" )
+    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib-dynload/audioop.so audiodev.* sunaudio.* sunau.* toaiff.*" )
 
     m.addPackage( "${PN}-bsddb", "Python Berkeley Database Bindings", "${PN}-core",
     "bsddb lib-dynload/_bsddb.so" ) # package
 
     m.addPackage( "${PN}-codecs", "Python Codecs, Encodings & i18n Support", "${PN}-core ${PN}-lang",
-    "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so lib-dynload/unicodedata.so stringprep.* xdrlib.*" )
+    "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so lib-dynload/_codecs* lib-dynload/_multibytecodec.so lib-dynload/unicodedata.so stringprep.* xdrlib.*" )
 
     m.addPackage( "${PN}-compile", "Python Bytecode Compilation Support", "${PN}-core",
     "py_compile.* compileall.*" )
@@ -208,7 +221,7 @@ if __name__ == "__main__":
     "curses lib-dynload/_curses.so lib-dynload/_curses_panel.so" ) # directory + low level module
 
     m.addPackage( "${PN}-ctypes", "Python C Types Support", "${PN}-core",
-    "ctypes lib-dynload/_ctypes.so" ) # directory + low level module
+    "ctypes lib-dynload/_ctypes.so lib-dynload/_ctypes_test.so" ) # directory + low level module
 
     m.addPackage( "${PN}-datetime", "Python Calendar and Time support", "${PN}-core ${PN}-codecs",
     "_strptime.* calendar.* lib-dynload/datetime.so" )
@@ -242,7 +255,7 @@ if __name__ == "__main__":
     "hotshot lib-dynload/_hotshot.so" )
 
     m.addPackage( "${PN}-html", "Python HTML Processing", "${PN}-core",
-    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* " )
+    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
     m.addPackage( "${PN}-gdbm", "Python GNU Database Support", "${PN}-core",
     "lib-dynload/gdbm.so" )
@@ -251,11 +264,11 @@ if __name__ == "__main__":
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
     m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core ${PN}-math",
-    "lib-dynload/_socket.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
-    "pipes.* socket.* ssl.* tempfile.* StringIO.* " )
+    "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
+    "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
     m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core ${PN}-math ${PN}-re",
-    "json" ) # package
+    "json lib-dynload/_json.so" ) # package
 
     m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "${PN}-core",
     "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
@@ -273,7 +286,7 @@ if __name__ == "__main__":
     "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so random.* sets.*" )
 
     m.addPackage( "${PN}-mime", "Python MIME Handling APIs", "${PN}-core ${PN}-io",
-    "mimetools.* uu.* quopri.* rfc822.*" )
+    "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
 
     m.addPackage( "${PN}-mmap", "Python Memory-Mapped-File Support", "${PN}-core ${PN}-io",
     "lib-dynload/mmap.so " )
@@ -292,7 +305,7 @@ if __name__ == "__main__":
     "decimal.* numbers.*" )
 
     m.addPackage( "${PN}-pickle", "Python Persistence Support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "pickle.* shelve.* lib-dynload/cPickle.so" )
+    "pickle.* shelve.* lib-dynload/cPickle.so pickletools.*" )
 
     m.addPackage( "${PN}-pkgutil", "Python Package Extension Utility Support", "${PN}-core",
     "pkgutil.*")
@@ -328,7 +341,7 @@ if __name__ == "__main__":
     "sqlite3/test" )
 
     m.addPackage( "${PN}-stringold", "Python String APIs [deprecated]", "${PN}-core ${PN}-re",
-    "lib-dynload/strop.so string.*" )
+    "lib-dynload/strop.so string.* stringold.*" )
 
     m.addPackage( "${PN}-syslog", "Python Syslog Interface", "${PN}-core",
     "lib-dynload/syslog.so" )
@@ -346,7 +359,7 @@ if __name__ == "__main__":
     "lib-dynload/_tkinter.so lib-tk" ) # package
 
     m.addPackage( "${PN}-unittest", "Python Unit Testing Framework", "${PN}-core ${PN}-stringold ${PN}-lang",
-    "unittest.*" )
+    "unittest/" )
 
     m.addPackage( "${PN}-unixadmin", "Python Unix Administration Support", "${PN}-core",
     "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*" )
@@ -355,7 +368,7 @@ if __name__ == "__main__":
     "lib-dynload/pyexpat.so xml xmllib.*" ) # package
 
     m.addPackage( "${PN}-xmlrpc", "Python XMLRPC Support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
-    "xmlrpclib.* SimpleXMLRPCServer.*" )
+    "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.*" )
 
     m.addPackage( "${PN}-zlib", "Python zlib Support.", "${PN}-core",
     "lib-dynload/zlib.so" )
-- 
1.7.6.4



