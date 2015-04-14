Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 142C373505
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:04:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E94kVr009752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:04:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:04:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:04:43 -0700
Message-ID: <abfe85931db6cd69b155b99f05f95460d2893f63.1429002178.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002178.git.liezhi.yang@windriver.com>
References: <cover.1429002178.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libgcc: remove libgcov-dev from PACKAGES
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
X-List-Received-Date: Tue, 14 Apr 2015 09:04:46 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../packagegroup-core-standalone-sdk-target.bb     |    1 -
 meta/recipes-devtools/gcc/libgcc.inc               |    5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 154a55c..5d1ce97 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -7,7 +7,6 @@ inherit packagegroup
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
-    libgcov-dev \
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 21cb8c1..35432c7 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -6,7 +6,6 @@ PACKAGES = "\
     ${PN} \
     ${PN}-dev \
     ${PN}-dbg \
-    libgcov-dev \
 "
 
 # All libgcc source is marked with the exception.
@@ -26,10 +25,9 @@ FILES_${PN}-dev = "\
     ${libdir}/${TARGET_SYS}/${BINV}/n32 \
     ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
     ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '', '${libdir}/${TARGET_SYS_NO_EXTENSION}', d)} \
-"
-FILES_libgcov-dev = "\
     ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
 "
+
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 LIBGCCBUILDTREENAME = "gcc-build-internal-"
@@ -40,5 +38,4 @@ do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 
 INSANE_SKIP_${PN}-dev = "staticdev"
-INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
 
-- 
1.7.9.5


