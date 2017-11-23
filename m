Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AAFDD7875A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:52 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341183"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:53 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:23 -0800
Message-Id: <93861d608e574d58adf8fb34f5854878f3ef77ef.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 02/13] python-*-manifest/generator: add runpy; python3-plistlib
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
X-List-Received-Date: Thu, 23 Nov 2017 18:14:52 -0000

* runpy allows running modules/scripts with 'python -m foo'
* python3-setuptools RDEPENDS on plistlib (present in python2)
* pip3 RDEPENDS on _markupbase (add to python3-core)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 12 ++++++++----
 meta/recipes-devtools/python/python-3.5-manifest.inc | 16 ++++++++++++----
 scripts/contrib/python/generate-manifest-2.7.py      |  3 +++
 scripts/contrib/python/generate-manifest-3.5.py      |  7 +++++++
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 57d4834b3a..a8852f3aa8 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,12 +1,12 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
+PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-runpy ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-runpy ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
@@ -212,6 +212,10 @@ SUMMARY_${PN}-robotparser="Python robots.txt parser"
 RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
 FILES_${PN}-robotparser="${libdir}/python2.7/robotparser.* "
 
+SUMMARY_${PN}-runpy="Python script for locating/executing scripts in module namespace"
+RDEPENDS_${PN}-runpy="${PN}-core ${PN}-pkgutil"
+FILES_${PN}-runpy="${libdir}/python2.7/runpy.* "
+
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
 FILES_${PN}-shell="${libdir}/python2.7/cmd.* ${libdir}/python2.7/commands.* ${libdir}/python2.7/dircache.* ${libdir}/python2.7/fnmatch.* ${libdir}/python2.7/glob.* ${libdir}/python2.7/popen2.* ${libdir}/python2.7/shlex.* ${libdir}/python2.7/shutil.* "
@@ -281,7 +285,7 @@ RDEPENDS_${PN}-zlib="${PN}-core"
 FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-runpy ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0260e87e75..9facf96ea3 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -4,9 +4,9 @@
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-runpy ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-runpy ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
@@ -38,7 +38,7 @@ FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycach
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/__pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/__pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_markupbase.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
@@ -172,6 +172,10 @@ SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
 FILES_${PN}-pkgutil="${libdir}/python3.5/pkgutil.* ${libdir}/python3.5/__pycache__/pkgutil.* "
 
+SUMMARY_${PN}-plistlib="Generate and parse Mac OS X .plist files"
+RDEPENDS_${PN}-plistlib="${PN}-core ${PN}-datetime ${PN}-io"
+FILES_${PN}-plistlib="${libdir}/python3.5/plistlib.* ${libdir}/python3.5/__pycache__/plistlib.* "
+
 SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
 FILES_${PN}-pprint="${libdir}/python3.5/pprint.* ${libdir}/python3.5/__pycache__/pprint.* "
@@ -200,6 +204,10 @@ SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
 FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so ${libdir}/python3.5/lib-dynload/__pycache__/resource.*.so "
 
+SUMMARY_${PN}-runpy="Python script for locating/executing scripts in module namespace"
+RDEPENDS_${PN}-runpy="${PN}-core ${PN}-pkgutil"
+FILES_${PN}-runpy="${libdir}/python3.5/runpy.* ${libdir}/python3.5/__pycache__/runpy.* "
+
 SUMMARY_${PN}-selectors="Python High-level I/O multiplexing"
 RDEPENDS_${PN}-selectors="${PN}-core"
 FILES_${PN}-selectors="${libdir}/python3.5/selectors.* ${libdir}/python3.5/__pycache__/selectors.* "
@@ -277,7 +285,7 @@ RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pyd
 FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/__pycache__/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc ${libdir}/python3.5/xmlrpc/__pycache__ "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-runpy ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 586b329c19..5ccf86593d 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -366,6 +366,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
     "robotparser.*")
 
+    m.addPackage( "${PN}-runpy", "Python script for locating/executing scripts in module namespace", "${PN}-core ${PN}-pkgutil",
+    "runpy.*")
+
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 6352f8f120..cf92462296 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -211,6 +211,7 @@ if __name__ == "__main__":
     "${includedir}/python${PYTHON_BINABI}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
+    "${libdir}/python${PYTHON_MAJMIN}/_markupbase.* " +
     "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
@@ -358,6 +359,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
 
+    m.addPackage( "${PN}-plistlib", "Generate and parse Mac OS X .plist files", "${PN}-core ${PN}-datetime ${PN}-io",
+    "plistlib.*")
+
     m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core ${PN}-io",
     "pprint.*" )
 
@@ -376,6 +380,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
 
+    m.addPackage( "${PN}-runpy", "Python script for locating/executing scripts in module namespace", "${PN}-core ${PN}-pkgutil",
+    "runpy.*" )
+
     m.addPackage( "${PN}-selectors", "Python High-level I/O multiplexing", "${PN}-core",
     "selectors.*" )
 
-- 
2.13.6


