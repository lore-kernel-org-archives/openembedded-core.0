Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4B89A75F44
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 17:00:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2015 10:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,728,1432623600"; d="scan'208";a="753503587"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2015 10:00:08 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Sat, 22 Aug 2015 09:55:16 -0700
Message-Id: <1440262519-13582-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
References: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 2/5] gcc-cross-canadian.inc: overrides for libc-baremetal
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
X-List-Received-Date: Sat, 22 Aug 2015 17:00:11 -0000

Modify configure arguments (EXTRA_OECONF) to support build for
TCLIBC="baremetal"

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 07ecfee..54e4881 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -169,5 +169,9 @@ EXTRA_OECONF += "\
     --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix} \
 "
 
+EXTRA_OECONF_append_libc-baremetal = " --without-headers"
+EXTRA_OECONF_remove_libc-baremetal = "--with-sysroot=/not/exist"
+EXTRA_OECONF_remove_libc-baremetal = "--with-build-sysroot=${STAGING_DIR_TARGET}"
+
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
1.9.1


