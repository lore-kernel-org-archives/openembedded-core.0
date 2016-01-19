Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 44E07731E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546162"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:27 +0000
Message-Id: <7ddd994738fef186fe4c2a01db8c29b9cdd6e886.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/9] python-pycurl: upgrade to 7.21.5
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:48 -0000

License checksum changed for file COPYING-MITLicense checksum changed for file README.rst

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python-pycurl_7.19.5.2.bb => python-pycurl_7.21.5.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.2.bb => python-pycurl_7.21.5.bb} (77%)

diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.5.2.bb b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
similarity index 77%
rename from meta/recipes-devtools/python/python-pycurl_7.19.5.2.bb
rename to meta/recipes-devtools/python/python-pycurl_7.21.5.bb
index 094105c..af517a1 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.5.2.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python bindings for libcurl"
 HOMEPAGE = "http://pycurl.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=182;md5=e5c36c3ca7e9f0bf6e144267dd760861 \
+LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=182;md5=a84a1caa65b89d4584b693d3680062fb \
                     file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
-                    file://COPYING-MIT;md5=0c3eb58d2e99f3102e2ce2db4eb172f1"
+                    file://COPYING-MIT;md5=b7e434aeb228ed731c00bcf177e79b19"
 
 DEPENDS = "curl python"
 RDEPENDS_${PN} = "python-core curl"
@@ -15,8 +15,8 @@ SRC_URI = "\
   file://no-static-link.patch \
 "
 
-SRC_URI[archive.md5sum] = "59cea96cc3027a1a7ed5020e69d4009a"
-SRC_URI[archive.sha256sum] = "98cc821555d152977fac99b6e5cb0f759275aabdf14e4928890c6fcc944ab736"
+SRC_URI[archive.md5sum] = "bca7bf47320082588db544ced2ba8717"
+SRC_URI[archive.sha256sum] = "8a1e0eb55573388275a1d6c2534ca4cfca5d7fa772b99b505c08fa149b27aed0"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
1.8.4.5


