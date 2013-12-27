Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 10E1860D8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 18:15:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 27 Dec 2013 10:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,561,1384329600"; d="scan'208";a="450507638"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.249])
	by fmsmga001.fm.intel.com with ESMTP; 27 Dec 2013 10:15:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Dec 2013 10:15:37 -0800
Message-Id: <1388168137-13424-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] Remove Older Eglibc 2.17
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
X-List-Received-Date: Fri, 27 Dec 2013 18:15:38 -0000

Cover letter only since it's a large file list and patches

Sau!


Saul Wold (1):
  eglibc: Remove older version 2.17

 .../eglibc-2.17/0001-R_ARM_TLS_DTPOFF32.patch      |   56 -
 .../0001-eglibc-menuconfig-support.patch           | 1007 ---
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   36 -
 ...0002-eglibc-menuconfig-hex-string-options.patch |  169 -
 ...0003-eglibc-menuconfig-build-instructions.patch |  176 -
 .../eglibc/eglibc-2.17/GLRO_dl_debug_mask.patch    |  143 -
 .../eglibc/eglibc-2.17/IO-acquire-lock-fix.patch   |   17 -
 .../eglibc-2.17/add_resource_h_to_wait_h.patch     |   20 -
 .../eglibc-2.17/eglibc-2.17-PR15003-r22243.patch   |  207 -
 .../eglibc/eglibc-2.17/eglibc-2.17-r22178.patch    | 9472 --------------------
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
 .../eglibc_fix_findidx_parameters.patch            |   38 -
 .../recipes-core/eglibc/eglibc-2.17/etc/ld.so.conf |    0
 .../eglibc-2.17/fileops-without-wchar-io.patch     |   22 -
 .../eglibc/eglibc-2.17/fix-tibetian-locales.patch  |   38 -
 .../eglibc/eglibc-2.17/fix_for_centos_5.8.patch    |   18 -
 .../eglibc/eglibc-2.17/fsl-ppc-no-fsqrt.patch      |  100 -
 .../eglibc/eglibc-2.17/generate-supported.mk       |   11 -
 .../eglibc/eglibc-2.17/glibc.fix_sqrt2.patch       | 1491 ---
 .../eglibc/eglibc-2.17/initgroups_keys.patch       |   20 -
 .../eglibc/eglibc-2.17/ld-search-order.patch       |   56 -
 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch  |   31 -
 .../eglibc/eglibc-2.17/mips-rld-map-check.patch    |   26 -
 .../eglibc/eglibc-2.17/multilib_readlib.patch      |   17 -
 .../eglibc/eglibc-2.17/ppc-sqrt_finite.patch       |  184 -
 .../eglibc/eglibc-2.17/ppc_slow_ieee754_sqrt.patch |  365 -
 .../eglibc/eglibc-2.17/relocatable_sdk.patch       |  108 -
 .../eglibc-2.17/relocatable_sdk_fix_openpath.patch |   41 -
 .../eglibc/eglibc-2.17/tzselect-awk.patch          |   42 -
 .../eglibc/eglibc-2.17/tzselect-sh.patch           |  156 -
 meta/recipes-core/eglibc/eglibc-initial_2.17.bb    |   11 -
 meta/recipes-core/eglibc/eglibc-locale_2.17.bb     |    1 -
 meta/recipes-core/eglibc/eglibc-mtrace_2.17.bb     |    1 -
 meta/recipes-core/eglibc/eglibc-scripts_2.17.bb    |    1 -
 meta/recipes-core/eglibc/eglibc_2.17.bb            |  156 -
 35 files changed, 14258 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/0001-R_ARM_TLS_DTPOFF32.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/0001-eglibc-menuconfig-support.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/0002-eglibc-menuconfig-hex-string-options.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/0003-eglibc-menuconfig-build-instructions.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/GLRO_dl_debug_mask.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/IO-acquire-lock-fix.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/add_resource_h_to_wait_h.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-PR15003-r22243.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-r22178.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/eglibc-svn-arm-lowlevellock-include-tls.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/eglibc_fix_findidx_parameters.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/etc/ld.so.conf
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fileops-without-wchar-io.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix_for_centos_5.8.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fsl-ppc-no-fsqrt.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/generate-supported.mk
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/glibc.fix_sqrt2.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/initgroups_keys.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/ld-search-order.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/mips-rld-map-check.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/multilib_readlib.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/ppc-sqrt_finite.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/ppc_slow_ieee754_sqrt.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/tzselect-awk.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.17/tzselect-sh.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.17.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.17.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-mtrace_2.17.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-scripts_2.17.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc_2.17.bb

-- 
1.8.3.1


