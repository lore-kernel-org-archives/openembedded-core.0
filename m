Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A63FB7CE69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 00:54:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2K0sALB021590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 17:54:10 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 19 Mar 2019 17:54:10 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 17:54:10 -0700
Message-ID: <20190320005410.254810-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20190320005410.254810-1-joe.slater@windriver.com>
References: <20190320005410.254810-1-joe.slater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemumips64: change tune to mips64r2
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
X-List-Received-Date: Wed, 20 Mar 2019 00:54:10 -0000
Content-Type: text/plain

Allows for mips32 multilib to be mips32r2, like qemumips.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/conf/machine/qemumips64.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index a166a10..970c0ce 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -3,9 +3,11 @@
 #@DESCRIPTION: mti-malta64-be
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips64.inc
+require conf/machine/include/tune-mips64r2.inc
 require conf/machine/include/qemuboot-mips.inc
 
+QB_CPU = "-cpu MIPS64R2-generic"
+
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-- 
2.7.4


