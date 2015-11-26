Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 166AD6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2015 06:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574898"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:31 +0200
Message-Id: <eb66da0b2f052e8d4aac8b1781bffdc24ffa3fe9.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/29] libsecret: disable gobject-introspection on mips64
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index 5eecf27..6b123b0 100644
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
2.6.2


