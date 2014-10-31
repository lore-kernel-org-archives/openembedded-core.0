Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 48E0071F48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 21:54:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2014 14:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="629256860"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.109])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2014 14:54:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 14:54:47 -0700
Message-Id: <1414792488-4932-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
References: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] yocto-bsp: Update qemu inclusion lists
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
X-List-Received-Date: Fri, 31 Oct 2014 21:54:49 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update qemu tune definitions to match changes in main qemu machines.

[YOCTO #6482]

(From meta-yocto rev: 0d78ffd509c6caba6c74c6e75c485fb8d923cd31)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
index 782ac21..77695ae 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
@@ -31,13 +31,14 @@ require conf/machine/include/qemu.inc
 require conf/machine/include/tune-i586.inc
 {{ if qemuarch == "x86_64": }}
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-x86_64.inc
+DEFAULTTUNE ?= "core2-64"
+require conf/machine/include/tune-core2.inc
 {{ if qemuarch == "arm": }}
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-arm926ejs.inc
 {{ if qemuarch == "powerpc": }}
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-ppc603e.inc
+require conf/machine/include/tune-ppc7400.inc
 {{ if qemuarch == "mips": }}
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-mips32.inc
-- 
1.8.3.1


