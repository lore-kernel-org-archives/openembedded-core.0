Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E691EC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 03:00:50 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.34128.1679454046809002078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 20:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8CxQMxdbxpkrM4PAA--.23729S3;
	Wed, 22 Mar 2023 11:00:45 +0800 (CST)
Received: from NUC.loongson.cn (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxur1dbxpkuVQJAA--.2244S4;
	Wed, 22 Mar 2023 11:00:45 +0800 (CST)
From: zhangjialing@loongson.cn
To: openembedded-core@lists.openembedded.org
Cc: Jialing Zhang <zhangjialing@loongson.cn>,
	Qizheng Zhu <zhuqizheng@loongson.cn>
Subject: [PATCH] add support for loongarch64
Date: Wed, 22 Mar 2023 11:00:44 +0800
Message-Id: <20230322030044.258025-1-zhangjialing@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur1dbxpkuVQJAA--.2244S4
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQASB2QZnnYNBQAAsJ
X-Coremail-Antispam: 1Uk129KBjvdXoWrtF1fCFW5ZrykuF1rXw1UZFb_yoWkWrX_Za
	y7Xw429r4DXrWaka4aq3ZIqrnavw48uFWfJ3W8tF4UJ34vy34Fqr4qg3Z3ZF93uFWjyryS
	kr9rCFyUCr1xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	77kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE6xkIj40Ew7xC0wCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1uMKtUUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 03:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178910

From: Jialing Zhang <zhangjialing@loongson.cn>

add locale_arch_options for loongarch64

Signed-off-by: Jialing Zhang <zhangjialing@loongson.cn>
Signed-off-by: Qizheng Zhu <zhuqizheng@loongson.cn>
---
 meta/lib/oe/package_manager/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index a6bf2fe219..0c313190cf 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -122,7 +122,8 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
         "riscv32": ["--uint32-align=4", "--little-endian"],
         "i586": ["--uint32-align=4", "--little-endian"],
         "i686": ["--uint32-align=4", "--little-endian"],
-        "x86_64": ["--uint32-align=4", "--little-endian"]
+        "x86_64": ["--uint32-align=4", "--little-endian"],
+        "loongarch64": ["--uint32-align=4", "--little-endian"]
     }
     if target_arch in locale_arch_options:
         arch_options = locale_arch_options[target_arch]
-- 
2.34.1


