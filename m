Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F19C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:46:27 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.7666.1741340786637012341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8CxeXFrwMpnH4eNAA--.45121S3;
	Fri, 07 Mar 2025 17:46:20 +0800 (CST)
Received: from localhost.localdomain (unknown [192.168.100.1])
	by front1 (Coremail) with SMTP id qMiowMDx_MRowMpnCn87AA--.21997S2;
	Fri, 07 Mar 2025 17:46:17 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH] grub2: Add loongarch64 as grub target
Date: Fri,  7 Mar 2025 17:46:04 +0800
Message-ID: <20250307094604.286109-1-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMDx_MRowMpnCn87AA--.21997S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAgEOCGfKLF8K7gAAs-
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4ktw17Kr43JF1rKFy8WFX_yoW8CFyxpr
	n8WFySvr1fWrW7WrZruFySq3yDXasru343CFZ3Kw4fCr98KrWUJFn5tF9rGFy7Jay7C345
	WF1kGry3ta1kZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212420

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/recipes-bsp/grub/grub-efi_2.12.bb | 2 ++
 meta/recipes-bsp/grub/grub2.inc        | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
index 7df77deca3..6dbc0ccf7f 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -30,6 +30,8 @@ python __anonymous () {
         grubtarget = 'riscv64'
     elif re.match('riscv32', target):
         grubtarget = 'riscv32'
+    elif re.match('loongarch64', target):
+        grubtarget = 'loongarch64'
     else:
         raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
     grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 07b4000e04..26bcb5197e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,7 +31,7 @@ CVE_STATUS[CVE-2023-4693]  = "cpe-incorrect: Fixed in version 2.12 already"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
+GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*|riscv.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
 # Grub doesn't support hard float toolchain and won't be able to forcefully
 # disable it on some of the target CPUs. See 'configure.ac' for
@@ -44,6 +44,7 @@ COMPATIBLE_HOST:armv7ve = "${@'null' if bb.utils.contains('TUNE_CCARGS_MFLOAT',
 
 GRUBPLATFORM:arm = "efi"
 GRUBPLATFORM:aarch64 = "efi"
+GRUBPLATFORM:loongarch64 = "efi"
 GRUBPLATFORM:riscv32 = "efi"
 GRUBPLATFORM:riscv64 = "efi"
 GRUBPLATFORM ??= "pc"
-- 
2.46.0


