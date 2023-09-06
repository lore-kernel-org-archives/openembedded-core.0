Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA58CCF9F7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:27:05 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.1801.1693963618588216845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8BxIvBc1fdkQQIgAA--.63740S3;
	Wed, 06 Sep 2023 09:26:53 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCNc1fdk79RtAA--.48434S2;
	Wed, 06 Sep 2023 09:26:52 +0800 (CST)
From: Zang Ruochen <zangruochen@loongson.cn>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] [OE-core][PATCH] tcf-agent: Disable non-building features on loongarch64
Date: Wed,  6 Sep 2023 09:26:52 +0800
Message-Id: <20230906012652.3216-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxLCNc1fdk79RtAA--.48434S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GrWxCr4xGFW7Zry3tFyDXFc_yoW3tFg_t3
	yDuw4UJr4rAr1Fv3WfCa9rur4Du3ZxtrW7CryrGw45Zw17Ga43JrWYyF1kArn0kFy5Gr4a
	yrs0yrZxZa13AosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jr0_JrylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187261

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 4d2ca5f1b0..59b9d7de78 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -49,6 +49,7 @@ CFLAGS:append:powerpc64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:powerpc64le = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
+CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.20.1


