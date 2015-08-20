Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 791BB76AAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:32:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 01:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787609115"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 01:32:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:31:59 +0100
Message-Id: <2889e6e9cb3328965cf3f2fdb7895b85cd73176d.1440059460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] service: tweak example recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 08:32:09 -0000

* Drop PR = "r0"
* Reorder lines so that packaging definitions are at the end

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-skeleton/recipes-skeleton/service/service_0.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index a3ad6cc..c5cd7a9 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -2,16 +2,12 @@ SUMMARY = "The canonical example of init scripts"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
-RDEPENDS_${PN} = "initscripts"
-PR = "r0"
 
 SRC_URI = "file://skeleton \
 	   file://skeleton_test.c \
 	   file://COPYRIGHT \
 	   "
 
-CONFFILES_${PN} += "${sysconfdir}/init.d/skeleton"
-
 do_compile () {
 	${CC} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
 }
@@ -30,3 +26,6 @@ do_install () {
 	install -m 0755 ${WORKDIR}/skeleton-test ${D}${sbindir}/
 }
 
+RDEPENDS_${PN} = "initscripts"
+
+CONFFILES_${PN} += "${sysconfdir}/init.d/skeleton"
-- 
2.1.0


