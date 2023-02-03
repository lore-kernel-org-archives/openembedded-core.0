Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6A1C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 07:17:08 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.5511.1675408625482107339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 23:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8AxmOnwtNxjnkINAA--.22587S3;
	Fri, 03 Feb 2023 15:17:04 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXltNxjUm4oAA--.45244S5;
	Fri, 03 Feb 2023 15:17:03 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v2 3/5] binutils: disable gold on loongarch64
Date: Fri,  3 Feb 2023 07:16:14 +0000
Message-Id: <20230203071615.3501674-4-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
References: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOXltNxjUm4oAA--.45244S5
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQALCGPbp+8V7wAAsI
X-Coremail-Antispam: 1Uk129KBjvJXoW7CF4DWw1kCw1DCFWkWr4UJwb_yoW8Gw15pF
	4fZF97AryFqry5XFsxAasIv398Z3yIkay5XF17Jw4UAas7XryqqF92yFn2ga4qya1fZFW8
	ArZ5WFyY9ayIvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
	zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
	aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 07:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176710

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 98acf0a222..b2dbf241df 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -57,6 +57,7 @@ GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS:riscv64 = ""
 LDGOLD_ALTS:riscv32 = ""
+LDGOLD_ALTS:loongarch64 = ""
 LDGOLD_ALTS:libc-glibc:mipsarch = ""
 
 USE_ALTERNATIVES_FOR = " \
@@ -198,6 +199,6 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}:class-target = "${USE_ALTERNATIVES_FOR}"
 
 python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d) and bb.utils.contains_any('TARGET_ARCH', 'riscv32 riscv64', True, False, d):
-        bb.fatal("Gold linker does not _yet_ support RISC-V architecture please remove ld-is-gold from DISTRO_FEATURES")
+    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d) and bb.utils.contains_any('TARGET_ARCH', 'riscv32 riscv64 loongarch64', True, False, d):
+        bb.fatal("Gold linker does not _yet_ support RISC-V and LoongArch architecture please remove ld-is-gold from DISTRO_FEATURES")
 }
-- 
2.39.1


