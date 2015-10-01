Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 09922734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 21:44:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 01 Oct 2015 14:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,619,1437462000"; d="scan'208";a="572393999"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.68])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2015 14:44:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 16:44:07 -0500
Message-Id: <1443735847-9381-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Revert "qemu-native: Enable temporary debug info as default."
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
X-List-Received-Date: Thu, 01 Oct 2015 21:44:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We enabled qemu-native debug builds for debug [YOCTO #8143] now
is fixed and we don't need it for release.

This reverts commit 1fa9a0cc6e4c80a5a2bf40331390ae9da71686c2.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bbfdf78..abbace8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,9 +31,6 @@ SRC_URI_append_class-native = "\
 
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
-EXTRA_OECONF_append_class-native = " --enable-debug --enable-debug-info"
-INHIBIT_SYSROOT_STRIP = "1"
-
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
 				"
 export LIBTOOL="${HOST_SYS}-libtool"
-- 
1.9.1


