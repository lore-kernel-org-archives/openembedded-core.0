Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F1298606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 21:18:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 12 May 2016 14:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="974681177"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 14:18:08 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 16:18:40 -0500
Message-Id: <1463087920-28798-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] qemu: Upgrade to 2.5.1.1 for fix CVE-2016-3710 and CVE-2016-3712
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
X-List-Received-Date: Thu, 12 May 2016 21:18:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a minor upgrade only comes with security fixes in qemu VGA
and UART code to avoid corruptions.

For review details,
http://git.qemu.org/?p=qemu.git;a=log;h=v2.5.1.1

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/qemu/{qemu_2.5.1.bb => qemu_2.5.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.5.1.bb => qemu_2.5.1.1.bb} (88%)

diff --git a/meta/recipes-devtools/qemu/qemu_2.5.1.bb b/meta/recipes-devtools/qemu/qemu_2.5.1.1.bb
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu_2.5.1.bb
rename to meta/recipes-devtools/qemu/qemu_2.5.1.1.bb
index 3db6e36..ba2dfc6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.1.1.bb
@@ -15,8 +15,8 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-2858.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "42e73182dea8b9213fa7050e168a4615"
-SRC_URI[sha256sum] = "028752c33bb786abbfe496ba57315dc5a7d0a33b5a7a767f6d7a29020c525d2c"
+SRC_URI[md5sum] = "f5ff0e71398b9e428b4f177001ba4285"
+SRC_URI[sha256sum] = "28d9946e43765a44ccccca3cba5f4f9034f2759ec1f2ce16594ddb6776c8efe6"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.1.4


