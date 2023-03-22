Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E446CC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 06:50:51 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.36625.1679467842839373127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 23:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8Axz_89pRpkZNsPAA--.23996S3;
	Wed, 22 Mar 2023 14:50:38 +0800 (CST)
Received: from NUC.loongson.cn (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_748pRpkunQJAA--.37485S4;
	Wed, 22 Mar 2023 14:50:36 +0800 (CST)
From: zhangjialing@loongson.cn
To: openembedded-core@lists.openembedded.org
Cc: Jialing Zhang <zhangjialing@loongson.cn>,
	Qizheng Zhu <zhuqizheng@loongson.cn>
Subject: [PATCH v2] recipes: add support for loongarch64
Date: Wed, 22 Mar 2023 14:50:34 +0800
Message-Id: <20230322065034.268838-1-zhangjialing@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_748pRpkunQJAA--.37485S4
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQASB2QZnnYP4gAAss
X-Coremail-Antispam: 1Uk129KBjvJXoW7tr13ZFyUtw1DAFyDJF45Awb_yoW5Jry8pw
	1S9Fy8tr4xtFy7uFZF9a4DXw1UZas7W34YkF18Ka18J39xCryqqF1aqF12gF4Fya4rXa18
	XF48K3s8Xw4UZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAKzVCY07xG64k0F24l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUa9-UUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 06:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178916

From: Jialing Zhang <zhangjialing@loongson.cn>

glibc gcc vulkan add support for loongarch64

Signed-off-by: Jialing Zhang <zhangjialing@loongson.cn>
Signed-off-by: Qizheng Zhu <zhuqizheng@loongson.cn>
---
 meta/recipes-core/glibc/glibc-locale.inc           | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 1 +
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 7f70b3ca4f..760de9437b 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -20,7 +20,7 @@ ENABLE_BINARY_LOCALE_GENERATION:pn-nativesdk-glibc-locale = "1"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
+BINARY_LOCALE_ARCHES ?= "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64 loongarch64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index fa5b048dab..bccc8a5b89 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -38,6 +38,7 @@ RUNTIMELIBITM:nios2 = ""
 RUNTIMELIBITM:microblaze = ""
 RUNTIMELIBITM:riscv32 = ""
 RUNTIMELIBITM:riscv64 = ""
+RUNTIMELIBITM:loongarch64 = ""
 RUNTIMELIBSSP ?= ""
 RUNTIMELIBSSP:mingw32 ?= "libssp"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 20f39905b1..05babf4c91 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
-COMPATIBLE_HOST = "(x86_64|aarch64|mips64|powerpc64|riscv64).*-linux"
+COMPATIBLE_HOST = "(x86_64|aarch64|mips64|powerpc64|riscv64|loongarch64).*-linux"
 
 inherit cmake features_check
 
-- 
2.34.1


