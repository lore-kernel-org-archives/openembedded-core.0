Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RR6n7-0008M3-D7
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 19:34:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Nov 2011 10:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="76843936"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 17 Nov 2011 10:28:03 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 10:28:01 -0800
Message-Id: <3b3bf4134fdec13d31d98af3cdb31a7111a05e35.1321554390.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321554390.git.nitin.a.kamble@intel.com>
References: <cover.1321554390.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] gmp: also generate the libgmpcxx library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Nov 2011 18:34:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

configure runs few checks to make sure c++ compiler and runtime are working as expected
with the --enable-cxx=detect option.

Added a LEAD_SONAME line to avoid change in generated package names.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gmp/gmp.inc      |    4 ++++
 meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
 meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 66349e6..10c3b9d 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -14,3 +14,7 @@ ARM_INSTRUCTION_SET = "arm"
 acpaths = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OECONF += " --enable-cxx=detect"
+
+LEAD_SONAME = "libgmp.so"
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 74da6b8..97ac4b2 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://gmp-h.in;startline=6;endline=21;md5=5e25ffd16996faba8c1cd27b04b16099"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
            file://disable-stdc.patch"
diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-support/gmp/gmp_5.0.2.bb
index 16bdcbc..873fc3e 100644
--- a/meta/recipes-support/gmp/gmp_5.0.2.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
@@ -2,7 +2,7 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r1"
+PR = "r2"
 
 SRC_URI_append += "file://sh4-asmfix.patch \
                    file://use-includedir.patch "
-- 
1.7.6.4



