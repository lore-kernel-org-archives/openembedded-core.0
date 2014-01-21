Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6D76E7E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442541276"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:40:01 -0800
Message-Id: <d1a4be543de7779341b4546ac418ce5ba7137056.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 15/15] generixx86: Use require instead of include
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:05 -0000

Use require instead of include to avoid silent errors when the required
tune files change name or are moved. It's going to fail anyway, it might
as well fail with an error message that is immediately helpful.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta-yocto-bsp/conf/machine/genericx86-64.conf |    4 ++--
 meta-yocto-bsp/conf/machine/genericx86.conf    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
index a6154cd..f76e35a 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -4,5 +4,5 @@
 #@DESCRIPTION: Machine configuration for generic X86_64 (64-bit) PCs and servers. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
 
 DEFAULTTUNE ?= "core2-64"
-include conf/machine/include/tune-core2.inc
-include conf/machine/include/genericx86-common.inc
+require conf/machine/include/tune-core2.inc
+require conf/machine/include/genericx86-common.inc
diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
index 549fc8e..2642cab 100644
--- a/meta-yocto-bsp/conf/machine/genericx86.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86.conf
@@ -4,5 +4,5 @@
 #@DESCRIPTION: Machine configuration for generic X86 (32-bit) PCs. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
 
 DEFAULTTUNE ?= "core2-32"
-include conf/machine/include/tune-core2.inc
-include conf/machine/include/genericx86-common.inc
+require conf/machine/include/tune-core2.inc
+require conf/machine/include/genericx86-common.inc
-- 
1.7.9.5


