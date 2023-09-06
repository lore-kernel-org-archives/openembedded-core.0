Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74831CCF9FA
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:27:15 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.1830.1693963634042197094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8Dx_+tw1fdkWAIgAA--.63324S3;
	Wed, 06 Sep 2023 09:27:12 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbSNu1fdkB9VtAA--.18727S2;
	Wed, 06 Sep 2023 09:27:11 +0800 (CST)
From: Zang Ruochen <zangruochen@loongson.cn>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] [OE-core][PATCH] gcc-sanitizers: Add loongarch as a compatible architecture.
Date: Wed,  6 Sep 2023 09:27:10 +0800
Message-Id: <20230906012710.3275-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxbSNu1fdkB9VtAA--.18727S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw4xXF47uw4rGw18KrWfZwc_yoW8Jw4DpF
	nY9Fy8Jw1xJF40k3y3W3WIqry3AFsIq3srtF13Gw4rZr9rWryqqr18KFyIkF17Z3y3Xayx
	XFWF9F98Wa45uagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187262

https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=600413c4f3d70392285192fb99634bcbeb97f83f

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 9016f7f937..524ebd4ba4 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -78,8 +78,8 @@ do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlib
 do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 
-# Only x86, powerpc, sparc, s390, arm, and aarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
+# Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.20.1


