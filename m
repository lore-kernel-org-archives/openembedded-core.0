Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5699C60FD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 11:26:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2013 03:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,877,1378882800"; d="scan'208";a="423513797"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.252])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2013 03:26:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 11:25:52 +0000
Message-Id: <9db5f3aa5c1f76fbb383fa04cab2220e77ff7040.1386847526.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386847526.git.paul.eggleton@linux.intel.com>
References: <cover.1386847526.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386847526.git.paul.eggleton@linux.intel.com>
References: <cover.1386847526.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/module_strip: remove
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
X-List-Received-Date: Thu, 12 Dec 2013 11:26:02 -0000

This class has been empty since 2010, so we shouldn't need it anymore. A
check of common layers suggests there shouldn't be any references to it
outside of OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel.bbclass       | 2 +-
 meta/classes/module-base.bbclass  | 2 --
 meta/classes/module_strip.bbclass | 0
 3 files changed, 1 insertion(+), 3 deletions(-)
 delete mode 100644 meta/classes/module_strip.bbclass

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 24ac778..5fef446 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base module_strip kernel-module-split
+inherit linux-kernel-base kernel-module-split
 
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 1589a90..9537ba9 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,5 +1,3 @@
-inherit module_strip
-
 inherit kernel-arch
 
 export OS = "${TARGET_OS}"
diff --git a/meta/classes/module_strip.bbclass b/meta/classes/module_strip.bbclass
deleted file mode 100644
index e69de29..0000000
-- 
1.8.1.2


