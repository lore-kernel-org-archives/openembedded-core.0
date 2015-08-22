Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 65F097665C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 17:00:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2015 10:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,728,1432623600"; d="scan'208";a="753503600"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2015 10:00:10 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Sat, 22 Aug 2015 09:55:18 -0700
Message-Id: <1440262519-13582-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
References: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 4/5] libgcc-common.inc: overrides for libc-baremetal
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
X-List-Received-Date: Sat, 22 Aug 2015 17:00:12 -0000

Added TCLIBC="baremetal" specific overrides.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 22da03b..b09ea65 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -45,6 +45,12 @@ do_install () {
 	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
 }
 
+do_install_append_libc-baremetal () {
+	rmdir ${D}${base_libdir}
+}
+
+RDEPENDS_${PN}-dev_libc-baremetal = ""
+
 BBCLASSEXTEND = "nativesdk"
 
 addtask multilib_install after do_install before do_package do_populate_sysroot
-- 
1.9.1


