Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8461B6E4C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442600459"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:58:59 -0800
Message-Id: <f99804649506c107b644bfa54ba0c30c7c03f89a.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 14/19] genericx86: Use new x86 tune files
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:10 -0000

Use the new names for the x86 tunes files (x86 instead of ia32).

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../conf/machine/include/genericx86-common.inc     |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
index c5ef358..66bfd19 100644
--- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -1,16 +1,16 @@
-include conf/machine/include/ia32-base.inc
+include conf/machine/include/x86-base.inc
 MACHINE_FEATURES += "wifi efi pcbios"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "3.10%"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-XSERVER ?= "${XSERVER_IA32_BASE} \
-            ${XSERVER_IA32_EXT} \
-            ${XSERVER_IA32_I915} \
-            ${XSERVER_IA32_I965} \
-            ${XSERVER_IA32_FBDEV} \
-            ${XSERVER_IA32_VESA} \
-            ${XSERVER_IA32_MODESETTING} \
+XSERVER ?= "${XSERVER_X86_BASE} \
+            ${XSERVER_X86_EXT} \
+            ${XSERVER_X86_I915} \
+            ${XSERVER_X86_I965} \
+            ${XSERVER_X86_FBDEV} \
+            ${XSERVER_X86_VESA} \
+            ${XSERVER_X86_MODESETTING} \
            "
 
 MACHINE_EXTRA_RRECOMMENDS += "linux-firmware v86d eee-acpi-scripts"
-- 
1.7.9.5


