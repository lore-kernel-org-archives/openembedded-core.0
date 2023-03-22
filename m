Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83DAC6FD20
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 02:57:10 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.34053.1679453824702002387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 19:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8Cxidl8bhpkf84PAA--.12101S3;
	Wed, 22 Mar 2023 10:57:01 +0800 (CST)
Received: from NUC.loongson.cn (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxeb18bhpk6VMJAA--.516S4;
	Wed, 22 Mar 2023 10:57:00 +0800 (CST)
From: zhangjialing@loongson.cn
To: openembedded-core@lists.openembedded.org
Cc: Jialing Zhang <zhangjialing@loongson.cn>,
	Qizheng Zhu <zhuqizheng@loongson.cn>
Subject: [PATCH] image-uefi: add support for loongarch64
Date: Wed, 22 Mar 2023 10:56:58 +0800
Message-Id: <20230322025658.257599-1-zhangjialing@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb18bhpk6VMJAA--.516S4
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQASB2QZnnYM8AAAs9
X-Coremail-Antispam: 1Uk129KBjvdXoWrtF1xtw4kXFWrtFWrZryUAwb_yoWxuFb_ta
	yxJrn7ur45tFyIk3yxX34rJw45Z3ykWryDGw1UKF4UXw1a9w15JFWkJwnYyr4F93yav3sI
	gFW7XFW0kr1UCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	77kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE6xkIj40Ew7xC0wCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1fcTPUUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178909

From: Jialing Zhang <zhangjialing@loongson.cn>

Signed-off-by: Jialing Zhang <zhangjialing@loongson.cn>
Signed-off-by: Qizheng Zhu <zhuqizheng@loongson.cn>
---
 meta/conf/image-uefi.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index 04a151f3a4..18351e7e3c 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -16,6 +16,7 @@ EFI_ARCH:aarch64 = "aa64"
 EFI_ARCH:arm = "arm"
 EFI_ARCH:riscv32 = "riscv32"
 EFI_ARCH:riscv64 = "riscv64"
+EFI_ARCH:loongarch64 = "loongarch64"
 
 # Determine name of bootloader image
 EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
-- 
2.34.1


