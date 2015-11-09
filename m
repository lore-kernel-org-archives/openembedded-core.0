Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D491D771BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917715"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:49 +0200
Message-Id: <6661c5d5c10dc408568661f190bcbc78d7a84328.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/29] libsecret: disable gobject-introspection on mips64
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index 707838c..8f9d105 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -18,3 +18,8 @@ ARM_INSTRUCTION_SET = "arm"
 do_configure_prepend() {
     rm -f ${S}/build/m4/vapigen.m4
 }
+
+# Secret-1: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
+# qemu: uncaught target signal 6 (Aborted) - core dumped
+EXTRA_OECONF_append_mips64 = " --disable-introspection"
+
-- 
2.1.4


