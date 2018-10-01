Return-Path: <chin.huat.ang@intel.com>
X-Greylist: delayed 570 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Oct 2018 05:19:29 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4AD7A395
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 05:19:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Sep 2018 22:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,326,1534834800"; d="scan'208";a="77692308"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([172.30.199.118])
	by orsmga008.jf.intel.com with ESMTP; 30 Sep 2018 22:09:59 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2018 13:09:45 +0800
Message-Id: <1538370585-31649-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] meta-ide-support: add cmake-native
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
X-List-Received-Date: Mon, 01 Oct 2018 05:19:30 -0000

Include cmake as part of build tree toolchain so that it is populated
into meta-ide-support's recipe-sysroot-native which is prepended to
$PATH, this ensures cmake-native is picked up first before host cmake.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 meta/recipes-core/meta/meta-ide-support.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 0692ec8..768f6f4 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -2,7 +2,7 @@ SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native"
 PR = "r3"
 RM_WORK_EXCLUDE += "${PN}"
 
-- 
2.7.4


