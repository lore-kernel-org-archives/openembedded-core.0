Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 444987615E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 07:23:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6L7NtFx002938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 00:23:55 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 21 Jul 2015 00:23:55 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jul 2015 15:23:50 +0800
Message-ID: <81b6a1d0e88aa6e5f616e77b136972541bbdc7bd.1437461993.git.zhe.he@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1437461993.git.zhe.he@windriver.com>
References: <cover.1437461993.git.zhe.he@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH v2 2/2] kernel: Pass sysroot mkimage to kernel makefile
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
X-List-Received-Date: Tue, 21 Jul 2015 07:23:55 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Pass mkimage in sysroot to kernel makefile by NATIVE_MKIMAGE to avoid
depending on build machine's when KEEPUIMAGE is "yes".

Fixes [YOCTO #6945].

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
2.1.0


