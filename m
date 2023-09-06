Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D96BCCF9F9
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:28:45 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.1839.1693963722245737309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxjuvH1fdksAIgAA--.61905S3;
	Wed, 06 Sep 2023 09:28:39 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF83G1fdkhNVtAA--.64525S2;
	Wed, 06 Sep 2023 09:28:39 +0800 (CST)
From: Zang Ruochen <zangruochen@loongson.cn>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] [OE-core][PATCH] kernel-devsrc: Fixed missing loongarch64 kernel source code when test_kernelmodules
Date: Wed,  6 Sep 2023 09:28:38 +0800
Message-Id: <20230906012838.3539-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxF83G1fdkhNVtAA--.64525S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFyxAr4DCF4fGrW5KF4fXrc_yoW8Jw4kpa
	nxZF18Jr4fG3W7Ga4DGwn8urWrX3ZxC3WagasxKayrAryjqF12qF1fZF9xWF1aqa10gFW0
	vr1UXw48Kw48u3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187266

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 6764598d48..ce5777fbe9 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -318,6 +318,15 @@ do_install() {
 	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/mips/tools/elf-entry.c $kerneldir/build 2>/dev/null || :
 	fi
+	
+	if [ "${ARCH}" = "loongarch" ]; then
+	    cp -a --parents arch/loongarch/kernel/asm-offsets.c $kerneldir/build
+	    cp -a --parents Kbuild $kerneldir/build
+	    cp -a --parents arch/loongarch/vdso/*.S $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/loongarch/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/loongarch/vdso/*getcpu.* $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/loongarch/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
+	fi
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
-- 
2.20.1


