Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8B77508F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="218897604"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2018 04:54:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 4F6555803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:04 +0300
Message-Id: <1523274911-20401-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/8] libatomic-ops: upgrade to version 7.6.4
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:45 -0000

* Add RISC-V support
* Convert atomic_ops_malloc.c and tests to valid C++ code
* Eliminate 'function is never used' cppcheck warning for
* load_before_cas
* Eliminate 'using argument that points at uninitialized var' cppcheck
* error
* Fix 'AO_pt_lock undefined' error if cross-compiling manually (MinGW)
* Fix public headers inclusion from clients C++ code
* Remove gcc/nios2.h file (include gcc/generic.h directly for nios2)
* Support MIPS rel6

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libatomic-ops/{libatomic-ops_7.6.2.bb => libatomic-ops_7.6.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.2.bb => libatomic-ops_7.6.4.bb} (91%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.4.bb
similarity index 91%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.2.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.4.bb
index f7b4163..271721e 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 PV .= "+git${SRCPV}"
 SRCBRANCH ?= "release-7_6"
 
-SRCREV = "5ae4b4aeea2baf13752d07e3038c47f70f06dcac"
+SRCREV = "8d98e2811c2f6df99cc65e5cc6964047d8554ace"
 SRC_URI = "git://github.com/ivmai/libatomic_ops;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


