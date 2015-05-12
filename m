Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B986374028
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 22:10:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2015 15:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,417,1427785200"; d="scan'208";a="693922857"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2015 15:10:01 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2015 15:09:50 +0000
Message-Id: <62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4.1431443215.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1431443215.git.alejandro.hernandez@linux.intel.com>
References: <cover.1431443215.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3: Upgrade from 3.4.2 to 3.4.3
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
X-List-Received-Date: Tue, 12 May 2015 22:10:02 -0000

Modifies:
python3-native_3.4.2.bb -> python3-native_3.4.3.bb: Updates checksums, LICENSE did not change,
dates were updated.
python3_3.4.2.bb -> python3_3.4.3.bb: Updates checksums, LICENSE did not change,
dates were updated.
generate-manifest-3.4.py: fixes asyncio and net-tools.
python-3.4-manifest.inc: fixes asyncio and net-tools.
This upgrade contains a fix for CVE-2014-9365.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.4-manifest.inc         | 12 ++++++++----
 .../{python3-native_3.4.2.bb => python3-native_3.4.3.bb}     |  7 +++----
 .../python/{python3_3.4.2.bb => python3_3.4.3.bb}            |  6 +++---
 scripts/contrib/python/generate-manifest-3.4.py              |  5 ++++-
 4 files changed, 18 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.4.2.bb => python3-native_3.4.3.bb} (89%)
 rename meta/recipes-devtools/python/{python3_3.4.2.bb => python3_3.4.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
index f051373..28885a9 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -5,14 +5,18 @@
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
 FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
 
+SUMMARY_${PN}-asyncio="Python Asynchronous I/O, event loop, coroutines and tasks"
+RDEPENDS_${PN}-asyncio="${PN}-core"
+FILES_${PN}-asyncio="${libdir}/python3.4/asyncio "
+
 SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
 FILES_${PN}-audio="${libdir}/python3.4/wave.* ${libdir}/python3.4/chunk.* ${libdir}/python3.4/sndhdr.* ${libdir}/python3.4/lib-dynload/ossaudiodev.*.so ${libdir}/python3.4/lib-dynload/audioop.*.so ${libdir}/python3.4/audiodev.* ${libdir}/python3.4/sunaudio.* ${libdir}/python3.4/sunau.* ${libdir}/python3.4/toaiff.* "
@@ -147,7 +151,7 @@ FILES_${PN}-multiprocessing="${libdir}/python3.4/lib-dynload/_multiprocessing.*.
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient="${libdir}/python3.4/*Cookie*.* ${libdir}/python3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.4/telnetlib.* ${libdir}/python3.4/urllib.* ${libdir}/python3.4/urllib2.* ${libdir}/python3.4/urlparse.* ${libdir}/python3.4/uuid.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
+FILES_${PN}-netclient="${libdir}/python3.4/*Cookie*.* ${libdir}/python3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.4/telnetlib.* ${libdir}/python3.4/urllib ${libdir}/python3.4/uuid.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
@@ -262,7 +266,7 @@ RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
 FILES_${PN}-xmlrpc="${libdir}/python3.4/xmlrpclib.* ${libdir}/python3.4/SimpleXMLRPCServer.* ${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/python3.4/xmlrpc "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/meta/recipes-devtools/python/python3-native_3.4.2.bb b/meta/recipes-devtools/python/python3-native_3.4.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-native_3.4.2.bb
rename to meta/recipes-devtools/python/python3-native_3.4.3.bb
index 463957f..464ff05 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.3.bb
@@ -26,12 +26,11 @@ file://makerace.patch \
 ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
-file://pip_build_directory_unclean.patch \
 "
-SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
-SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
+SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
+SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3_3.4.2.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.4.2.bb
rename to meta/recipes-devtools/python/python3_3.4.3.bb
index 0350de6..bee9e6f 100644
--- a/meta/recipes-devtools/python/python3_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -38,10 +38,10 @@ SRC_URI += "\
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
            "
-SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
-SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
+SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
+SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
index 5335308..84da574 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -208,6 +208,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
     "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.*.so lib-dynload/audioop.*.so audiodev.* sunaudio.* sunau.* toaiff.*" )
 
+    m.addPackage( "${PN}-asyncio", "Python Asynchronous I/O, event loop, coroutines and tasks", "${PN}-core",
+    "asyncio" )
+
     m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n support", "${PN}-core ${PN}-lang",
     "codecs.* encodings gettext.* locale.* lib-dynload/_locale.*.so lib-dynload/_codecs* lib-dynload/_multibytecodec.*.so lib-dynload/unicodedata.*.so stringprep.* xdrlib.*" )
 
@@ -305,7 +308,7 @@ if __name__ == "__main__":
 
     m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
     "*Cookie*.* " +
-    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
+    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimetools.*" )
 
     m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient",
     "cgi.* *HTTPServer.* SocketServer.*" )
-- 
1.8.4.5


