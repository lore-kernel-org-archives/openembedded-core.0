Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF65601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 23:23:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9ONO0Ku014248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 16:24:00 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 24 Oct 2017 16:23:59 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Oct 2017 16:23:59 -0700
Message-ID: <20171024232359.63328-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Tue, 24 Oct 2017 23:23:59 -0000
Content-Type: text/plain

qemu-usermode is only available for mips64 and o32 code.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/conf/machine/qemumips64.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 3f91cbe..8feefc4 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -12,3 +12,7 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+
+# no qemu-usermode for libn32
+MACHINE_FEATURES_remove_mipsarchn32 = "qemu-usermode"
+
-- 
2.7.4


