Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA04177060
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:33 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525561"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:25 +0300
Message-Id: <2c80371efca7ac436873e2754bdb82445437b18e.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/28] gcr: disable gtk-doc on x86_64
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:34 -0000

For same reason that introspection is disabled: the transient binary goes into infinite loop.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.20.0.bb b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
index bcce57d..11bca0f 100644
--- a/meta/recipes-gnome/gcr/gcr_3.20.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
@@ -33,7 +33,7 @@ ARM_INSTRUCTION_SET = "arm"
 # gcrypt-Message: select() error: Bad address
 #
 # This will be investigated later.
-EXTRA_OECONF_append_x86-64 = " --disable-introspection"
+EXTRA_OECONF_append_x86-64 = " --disable-introspection --disable-gtk-doc"
 
 # Gcr-3.broken: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
-- 
2.9.3


