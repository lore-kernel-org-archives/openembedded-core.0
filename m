Return-Path: <zhe@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD29C65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:11:53 +0000 (UTC)
Received: from ala-lpggp4.wrs.com (ala-lpggp4.wrs.com [147.11.103.217])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6HABrKY006337
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jul 2015 03:11:54 -0700 (PDT)
Received: (from zhe@localhost)
	by ala-lpggp4.wrs.com (8.13.8/8.13.8/Submit) id t6HABrkd003924;
	Fri, 17 Jul 2015 03:11:53 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 03:11:52 -0700
Message-Id: <1437127912-3881-3-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1437127912-3881-1-git-send-email-zhe.he@windriver.com>
References: <1437127912-3881-1-git-send-email-zhe.he@windriver.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 2/2] kernel: Pass sysroot mkimage to kernel makefile
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
X-List-Received-Date: Fri, 17 Jul 2015 10:11:56 -0000

Pass mkimage in sysroot to kernel makefile by NATIVE_MKIMAGE to avoid
depending on build machine's, if KEEPUIMAGE is "yes".

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 86ed28f..1d7fa48 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -141,7 +141,7 @@ UBOOT_ENTRYPOINT ?= "20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
 # Some Linux kernel configurations need additional parameters on the command line
-KERNEL_EXTRA_ARGS ?= ""
+KERNEL_EXTRA_ARGS ?= "NATIVE_MKIMAGE=${STAGING_BINDIR_NATIVE}/mkimage"
 
 # For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
 # We don't want to override kernel Makefile variables from the environment
-- 
2.3.5


