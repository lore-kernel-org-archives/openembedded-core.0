Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 55A4F76230
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:44:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2015 07:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="678997601"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 05 Nov 2015 07:44:13 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7D2956A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 07:43:10 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 17:44:41 +0200
Message-Id: <1446738281-19058-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 3/5] python-pycurl: update version to 7.19.5.2
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
X-List-Received-Date: Thu, 05 Nov 2015 15:44:14 -0000

No change in License. Updated no-static-link.patch

README.rst: license checksum changed to reflect the Copyright update
COPYING-MIT: checksum changed to reflect the Copyright update

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../python/python-pycurl/no-static-link.patch                | 12 ++++++------
 .../{python-pycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} (72%)

diff --git a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
index c5349ee..212779c 100644
--- a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
+++ b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
@@ -1,12 +1,12 @@
 Upstream-Status: Pending
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: pycurl-7.19.3.1/setup.py
-===================================================================
---- pycurl-7.19.3.1.orig/setup.py	2014-07-16 12:57:24.065346887 +0000
-+++ pycurl-7.19.3.1/setup.py	2014-07-16 12:57:53.057347678 +0000
-@@ -147,7 +147,7 @@
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur pycurl-7.19.5.2-orig/setup.py pycurl-7.19.5.2/setup.py
+--- pycurl-7.19.5.2-orig/setup.py	2015-11-02 15:42:24.000000000 +0200
++++ pycurl-7.19.5.2/setup.py	2015-11-02 17:59:36.121527273 +0200
+@@ -154,7 +154,7 @@
          optbuf = ''
          sslhintbuf = ''
          errtext = ''
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.5.1.bb b/meta/recipes-devtools/python/python-pycurl_7.19.5.2.bb
similarity index 72%
rename from meta/recipes-devtools/python/python-pycurl_7.19.5.1.bb
rename to meta/recipes-devtools/python/python-pycurl_7.19.5.2.bb
index 0d0effe..094105c 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.5.1.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.5.2.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python bindings for libcurl"
 HOMEPAGE = "http://pycurl.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=181;md5=57e5ab0c0f964533fc59d93dec5695bb \
+LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=182;md5=e5c36c3ca7e9f0bf6e144267dd760861 \
                     file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
-                    file://COPYING-MIT;md5=e8200955c773b2a0fd6cea36ea5e87be"
+                    file://COPYING-MIT;md5=0c3eb58d2e99f3102e2ce2db4eb172f1"
 
 DEPENDS = "curl python"
 RDEPENDS_${PN} = "python-core curl"
@@ -15,8 +15,8 @@ SRC_URI = "\
   file://no-static-link.patch \
 "
 
-SRC_URI[archive.md5sum] = "f44cd54256d7a643ab7b16e3f409b26b"
-SRC_URI[archive.sha256sum] = "6e9770f80459757f73bd71af82fbb29cd398b38388cdf1beab31ea91a331bc6c"
+SRC_URI[archive.md5sum] = "59cea96cc3027a1a7ed5020e69d4009a"
+SRC_URI[archive.sha256sum] = "98cc821555d152977fac99b6e5cb0f759275aabdf14e4928890c6fcc944ab736"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
2.4.0


