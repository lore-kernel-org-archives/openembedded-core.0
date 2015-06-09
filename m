Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 523 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Jun 2015 17:47:26 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id BE99C6AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 17:47:26 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AE2C0D40356
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:38:42 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4489ED40046
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from rhein2.am93.sysmocom.de
	(ip5b41c286.dynamic.kabel-deutschland.de [91.65.194.134])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:38:40 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 19:38:35 +0200
Message-Id: <1433871515-528-1-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] python-2.7/3.4-manifest.inc: add missing dependencies for python-netserver
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
X-List-Received-Date: Tue, 09 Jun 2015 17:47:28 -0000

* SimpleHTTPServer imports shutil so we need
  definitly python-shell

* SocketServer can be run without the threading modul,
  but I think we should run the full blown stuff, so
  let us add python-threading

* raised the PR number as mentioned in python.inc

* this work was sponsored by sysmocom GmbH

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 meta/recipes-devtools/python/python-3.4-manifest.inc | 4 ++--
 meta/recipes-devtools/python/python.inc              | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 scripts/contrib/python/generate-manifest-3.4.py      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 4cd7a0c..9ba9c7f 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -170,7 +170,7 @@ RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-l
 FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
-RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
+RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
 FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer.* ${libdir}/python2.7/SocketServer.* "
 
 SUMMARY_${PN}-numbers="Python number APIs"
diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
index b0f46c3..557acdf 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: './generate-manifest-3.4.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '../../../scripts/contrib/python/generate-manifest-3.4.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -154,7 +154,7 @@ RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-l
 FILES_${PN}-netclient="${libdir}/python3.4/*Cookie*.* ${libdir}/python3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.4/telnetlib.* ${libdir}/python3.4/urllib ${libdir}/python3.4/uuid.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
-RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
+RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
 FILES_${PN}-netserver="${libdir}/python3.4/cgi.* ${libdir}/python3.4/*HTTPServer.* ${libdir}/python3.4/SocketServer.* "
 
 SUMMARY_${PN}-numbers="Python number APIs"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index e18ab8e..ca21931 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
-INC_PR = "r1"
+INC_PR = "r2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dff3d00f049545862992d2d097831a13"
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 922ebe4..a368c8a 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -310,7 +310,7 @@ if __name__ == "__main__":
     "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
 
-    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient",
+    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading",
     "cgi.* *HTTPServer.* SocketServer.*" )
 
     m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
index 427367c..569fd3c 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -310,7 +310,7 @@ if __name__ == "__main__":
     "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimetools.*" )
 
-    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient",
+    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading",
     "cgi.* *HTTPServer.* SocketServer.*" )
 
     m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
-- 
1.9.1

