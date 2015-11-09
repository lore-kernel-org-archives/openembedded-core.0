Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ED586771B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917719"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:50 +0200
Message-Id: <cfdc0bf7bfd9ffe7d1c74a1faa253564e4da2290.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/29] webkitgtk: disable gobject-introspection on powerpc
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index f21dc4b..5402f5e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -74,3 +74,10 @@ FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET = "arm"
+
+# Invalid data memory access: 0x00000000
+# ...
+# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
+# Segmentation fault
+EXTRA_OECMAKE_append_powerpc = " -DENABLE_INTROSPECTION=OFF "
+
-- 
2.1.4


