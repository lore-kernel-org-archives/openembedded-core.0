Return-Path: <joe.rutledge@phabrix.com>
Received: from ion-systems.net (custmail.ion-systems.net [213.129.94.130])
	by mail.openembedded.org (Postfix) with ESMTP id 1A40474E5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 11:19:10 +0000 (UTC)
Received: from Thripper.dynamic.ziggo.nl ([217.63.252.239]) by ion-systems.net
	with MailEnable ESMTP; Tue, 15 May 2018 12:19:09 +0100
From: Joe Rutledge <joe.rutledge@phabrix.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 12:17:31 +0100
Message-Id: <1526383051-13987-1-git-send-email-joe.rutledge@phabrix.com>
X-Mailer: git-send-email 2.7.4
X-ME-Bayesian: 0.000000
Subject: [Krogoth][PATCH v2] python-3.5: Include _posixsubprocess in package
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
X-List-Received-Date: Tue, 15 May 2018 11:19:11 -0000

Change the python-3.5-manifest.inc file to also include:
lib-dynload/_posixsubprocess.*.so

This is needed for Python subprocess support but was not included.

Signed-off-by: Joe Rutledge <joe.rutledge@phabrix.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0ad9186..7b642c3 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -231,7 +231,7 @@ FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/pyth
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-selectors"
-FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* "
+FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* ${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so "
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index eac493a..5a27196 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
 
-VERSION = "3.5.0"
+VERSION = "3.5.1"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ = "20140131"
@@ -349,7 +349,7 @@ if __name__ == "__main__":
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-selectors",
-    "subprocess.*" )
+    "subprocess.* lib-dynload/_posixsubprocess.*.so" )
 
     m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core",
     "signal.*" )
-- 
2.7.4


