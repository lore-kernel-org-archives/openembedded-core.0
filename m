Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D0F516E991
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:30:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785192"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:51 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:32 +0200
Message-Id: <e2e1b80e4ff468cb6788fc958538e6d82016f2fa.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 13/13] python-pycurl: upgrade to 7.19.3
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:02 -0000

Changes:
 * Refreshed no-static-link.patch;
 * LGPL&MIT license files changed names;
 * MIT license file added a contributor to the list;
 * README.rst license snippet changed to reflect the filename changes
   and the new contributor;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../python/python-pycurl/no-static-link.patch      |   20 +++++++++++---------
 ...-pycurl_7.19.0.2.bb => python-pycurl_7.19.3.bb} |   10 +++++-----
 2 files changed, 16 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.0.2.bb => python-pycurl_7.19.3.bb} (59%)

diff --git a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
index e8c0005..907380f 100644
--- a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
+++ b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
@@ -1,15 +1,17 @@
 Upstream-Status: Pending
 
-Index: pycurl-7.19.0.2/setup.py
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: pycurl-7.19.3/setup.py
 ===================================================================
---- pycurl-7.19.0.2.orig/setup.py	2013-10-08 15:28:53.000000000 +0300
-+++ pycurl-7.19.0.2/setup.py	2013-11-04 13:46:47.928292585 +0200
-@@ -101,7 +101,7 @@
-     # support one or the other of these curl-config options, so gracefully
-     # tolerate failure of either, but not both.
+--- pycurl-7.19.3.orig/setup.py	2014-01-10 08:04:40.000000000 +0200
++++ pycurl-7.19.3/setup.py	2014-02-04 15:09:08.411552887 +0200
+@@ -211,7 +211,7 @@
+     # If neither --libs nor --static-libs work, fail.
      optbuf = ""
+     errtext = ''
 -    for option in ["--libs", "--static-libs"]:
 +    for option in ["--libs"]:
-         p = subprocess.Popen("'%s' %s" % (CURL_CONFIG, option), shell=True,
-             stdout=subprocess.PIPE)
-         (stdout, stderr) = p.communicate()
+         p = subprocess.Popen((CURL_CONFIG, option),
+             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+         stdout, stderr = p.communicate()
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb b/meta/recipes-devtools/python/python-pycurl_7.19.3.bb
similarity index 59%
rename from meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
rename to meta/recipes-devtools/python/python-pycurl_7.19.3.bb
index aceaab3..aee6cdd 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.3.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python bindings for libcurl"
 HOMEPAGE = "http://pycurl.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=97;endline=111;md5=b5a5e531d80812bcbecbeb240fde63ef \
-                    file://COPYING;md5=3579a9fd0221d49a237aaa33492f988c \
-                    file://COPYING2;md5=ffaa1e283b7f9bf5aafd8d45db6f7518"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=204;endline=219;md5=57e5ab0c0f964533fc59d93dec5695bb \
+                    file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
+                    file://COPYING-MIT;md5=e8200955c773b2a0fd6cea36ea5e87be"
 
 DEPENDS = "curl python"
 RDEPENDS_${PN} = "python-core curl"
@@ -15,8 +15,8 @@ SRC_URI = "\
   file://no-static-link.patch \
 "
 
-SRC_URI[archive.md5sum] = "518be33976dbc6838e42495ada64b43f"
-SRC_URI[archive.sha256sum] = "7a9e793b9181654d5eef3f6d22c244c57d2b51d38feb4c1b71d68efda99b0547"
+SRC_URI[archive.md5sum] = "b9091b7438d3de1552e28862d2971cd1"
+SRC_URI[archive.sha256sum] = "05e48835fe445ff327dcd373f49d9970e0b828a07cd4d08a23264507a742d616"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
1.7.9.5


