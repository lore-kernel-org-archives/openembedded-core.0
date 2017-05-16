Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E79AB77E3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:03 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711850"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:38 +0300
Message-Id: <a75e2861aa05b7ec5676da7c5a67201dc9546339.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 08/20] python: add python-tools subpackage
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
X-List-Received-Date: Tue, 16 May 2017 13:19:04 -0000

Useful in developing Python, e.g. in benchmarking.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 8 +++++---
 meta/recipes-devtools/python/python_2.7.13.bb        | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 7ed254bbd6..33189e0f0b 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -4,9 +4,9 @@
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
+PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-tools"
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules ${PN}-tools"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
@@ -284,4 +284,6 @@ SUMMARY_${PN}-modules="All Python modules"
 RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
-
+SUMMARY_${PN}-tools="Useful scripts from Python"
+RDEPENDS_${PN}-tools="${PN}-modules"
+FILES_${PN}-tools="${docdir}/${PN}/Tools"
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index d9e458cf72..c39bcfe447 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -148,6 +148,11 @@ do_install() {
 	fi
 
 	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+
+    # Install tools
+    install -d -m 755 ${D}/${docdir}/${PN}
+    cp -r ${S}/Tools ${D}/${docdir}/${PN}/
+    find ${D}/${docdir}/${PN}/ -name Makefile -delete
 }
 
 do_install_append_class-nativesdk () {
-- 
2.12.0


