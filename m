Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 47F726D71F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417505"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:28 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:17 +0200
Message-Id: <17791e4074d041c6c87e2fbe4806f1f8c1a7cad3.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/7] python-pycurl: upgrade to 7.19.0.2
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:27 -0000

Refreshed no-static-link.patch to work with this release and changed the
lines/checksum (and the file) where the license can be found.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../python/python-pycurl/no-static-link.patch      |   25 ++++++++++----------
 ...-pycurl_7.19.0.bb => python-pycurl_7.19.0.2.bb} |    7 +++---
 2 files changed, 15 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.0.bb => python-pycurl_7.19.0.2.bb} (74%)

diff --git a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
index c97f5dc..e8c0005 100644
--- a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
+++ b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
@@ -1,16 +1,15 @@
 Upstream-Status: Pending
 
-Index: pycurl-7.18.2/setup.py
+Index: pycurl-7.19.0.2/setup.py
 ===================================================================
---- pycurl-7.18.2.orig/setup.py
-+++ pycurl-7.18.2/setup.py
-@@ -97,8 +97,7 @@ else:
-         else:
-             extra_compile_args.append(e)
-     libs = split_quoted(
--        os.popen("'%s' --libs" % CURL_CONFIG).read()+\
--        os.popen("'%s' --static-libs" % CURL_CONFIG).read())
-+        os.popen("'%s' --libs" % CURL_CONFIG).read())
-     for e in libs:
-         if e[:2] == "-l":
-             libraries.append(e[2:])
+--- pycurl-7.19.0.2.orig/setup.py	2013-10-08 15:28:53.000000000 +0300
++++ pycurl-7.19.0.2/setup.py	2013-11-04 13:46:47.928292585 +0200
+@@ -101,7 +101,7 @@
+     # support one or the other of these curl-config options, so gracefully
+     # tolerate failure of either, but not both.
+     optbuf = ""
+-    for option in ["--libs", "--static-libs"]:
++    for option in ["--libs"]:
+         p = subprocess.Popen("'%s' %s" % (CURL_CONFIG, option), shell=True,
+             stdout=subprocess.PIPE)
+         (stdout, stderr) = p.communicate()
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
similarity index 74%
rename from meta/recipes-devtools/python/python-pycurl_7.19.0.bb
rename to meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
index 122e1bd..fb57b49 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
@@ -2,22 +2,21 @@ DESCRIPTION = "libcurl python bindings."
 HOMEPAGE = "http://pycurl.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README;endline=13;md5=fbfe545b1869617123a08c0983ef17b2 \
+LIC_FILES_CHKSUM = "file://README.rst;beginline=97;endline=111;md5=b5a5e531d80812bcbecbeb240fde63ef \
                     file://COPYING;md5=3579a9fd0221d49a237aaa33492f988c \
                     file://COPYING2;md5=ffaa1e283b7f9bf5aafd8d45db6f7518"
 
 DEPENDS = "curl python"
 RDEPENDS_${PN} = "python-core curl"
 SRCNAME = "pycurl"
-PR = "r3"
 
 SRC_URI = "\
   http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
   file://no-static-link.patch \
 "
 
-SRC_URI[archive.md5sum] = "919d58fe37e69fe87ce4534d8b6a1c7b"
-SRC_URI[archive.sha256sum] = "eb782dfcc5a7c023539a077462b83c167e178128ee9f7201665b9fbb1a8b0642"
+SRC_URI[archive.md5sum] = "518be33976dbc6838e42495ada64b43f"
+SRC_URI[archive.sha256sum] = "7a9e793b9181654d5eef3f6d22c244c57d2b51d38feb4c1b71d68efda99b0547"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
1.7.9.5


