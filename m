Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B17EB70611
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQUhm011074; Wed, 16 Jul 2014 17:26:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RiT4XYK-ESQE; Wed, 16 Jul 2014 17:26:31 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQR7A011047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:29 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004Nm-I9; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:10 +0100
Message-Id: <86797ae1b69e34ac85c5128b6789834c41de73ef.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/19] python-pycurl: Upgrade 7.19.3 -> 7.19.3.1
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:19 -0000

License text just moved within the README.rst (same checksum)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python-pycurl/no-static-link.patch      | 24 +++++++++++-----------
 ...-pycurl_7.19.3.bb => python-pycurl_7.19.3.1.bb} |  6 +++---
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.3.bb => python-pycurl_7.19.3.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
index 907380f..c5349ee 100644
--- a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
+++ b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
@@ -2,16 +2,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
-Index: pycurl-7.19.3/setup.py
+Index: pycurl-7.19.3.1/setup.py
 ===================================================================
---- pycurl-7.19.3.orig/setup.py	2014-01-10 08:04:40.000000000 +0200
-+++ pycurl-7.19.3/setup.py	2014-02-04 15:09:08.411552887 +0200
-@@ -211,7 +211,7 @@
-     # If neither --libs nor --static-libs work, fail.
-     optbuf = ""
-     errtext = ''
--    for option in ["--libs", "--static-libs"]:
-+    for option in ["--libs"]:
-         p = subprocess.Popen((CURL_CONFIG, option),
-             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-         stdout, stderr = p.communicate()
+--- pycurl-7.19.3.1.orig/setup.py	2014-07-16 12:57:24.065346887 +0000
++++ pycurl-7.19.3.1/setup.py	2014-07-16 12:57:53.057347678 +0000
+@@ -147,7 +147,7 @@
+         optbuf = ''
+         sslhintbuf = ''
+         errtext = ''
+-        for option in ["--libs", "--static-libs"]:
++        for option in ["--libs"]:
+             p = subprocess.Popen((CURL_CONFIG, option),
+                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+             stdout, stderr = p.communicate()
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.3.bb b/meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python-pycurl_7.19.3.bb
rename to meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb
index aee6cdd..02d0ae9 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.3.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for libcurl"
 HOMEPAGE = "http://pycurl.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=204;endline=219;md5=57e5ab0c0f964533fc59d93dec5695bb \
+LIC_FILES_CHKSUM = "file://README.rst;beginline=148;endline=163;md5=57e5ab0c0f964533fc59d93dec5695bb \
                     file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
                     file://COPYING-MIT;md5=e8200955c773b2a0fd6cea36ea5e87be"
 
@@ -15,8 +15,8 @@ SRC_URI = "\
   file://no-static-link.patch \
 "
 
-SRC_URI[archive.md5sum] = "b9091b7438d3de1552e28862d2971cd1"
-SRC_URI[archive.sha256sum] = "05e48835fe445ff327dcd373f49d9970e0b828a07cd4d08a23264507a742d616"
+SRC_URI[archive.md5sum] = "6df8fa7fe8b680d93248da1f8d4fcd12"
+SRC_URI[archive.sha256sum] = "c0d673fe99a9de07239eabe77c798f1b043f60c02afaec1430ceaf59d7501a4f"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
1.9.2


