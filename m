Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA064C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:47:07 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.7668.1741340818082523423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8Ax3eKPwMpnPoeNAA--.6132S3;
	Fri, 07 Mar 2025 17:46:55 +0800 (CST)
Received: from localhost.localdomain (unknown [192.168.100.1])
	by front1 (Coremail) with SMTP id qMiowMBxHcWOwMpnWH87AA--.22233S2;
	Fri, 07 Mar 2025 17:46:54 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH] Use LoongArch as host for LLVM architecture
Date: Fri,  7 Mar 2025 17:46:44 +0800
Message-ID: <20250307094644.286251-1-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMBxHcWOwMpnWH87AA--.22233S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQEOCGfKJUsJGQADsW
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFWUCrW3Zr47WF1UJF43Jwc_yoWfCrb_Jr
	W7uFW3XayjqFn09a97WFWrGr17Ca4vy3WkCF4SgrsxX3WxWw1rGw4UJFsYgF4akw1ktrnx
	Gw4UAry8uF13ZosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212422

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/recipes-devtools/llvm/llvm_19.1.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.7.bb b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
index 029a1fb4c5..8e861939e0 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.7.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
@@ -43,6 +43,7 @@ def get_llvm_arch(bb, d, arch_var):
     elif re.match(r'armeb$', a):                        return 'ARM'
     elif re.match(r'aarch64$', a):                      return 'AArch64'
     elif re.match(r'aarch64_be$', a):                   return 'AArch64'
+    elif re.match(r'loongarch(32|64|)$', a):            return 'LoongArch'
     elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
     elif re.match(r'riscv(32|64)(eb|)$', a):            return 'RISCV'
     elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
-- 
2.46.0


