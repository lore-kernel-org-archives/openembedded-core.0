Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733E3C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:02:44 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.9867.1675324954977013576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8CxvOoYbttjLTcMAA--.25243S3;
	Thu, 02 Feb 2023 16:02:32 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxmb0NbttjxTknAA--.11392S7;
	Thu, 02 Feb 2023 16:02:32 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v1 5/5] uboot: loongarch64
Date: Thu,  2 Feb 2023 08:02:19 +0000
Message-Id: <20230202080219.3465767-6-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxmb0NbttjxTknAA--.11392S7
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQAKCGPaVm8S7wAAs+
X-Coremail-Antispam: 1Uk129KBjvdXoW7JFW5tr17KFW8KF4rKryxGrg_yoWxZFc_Ja
	y3uFW8tw4Fvr95Ww1xXwnxXwnxu3yFqr1Utan5Kr15Zr13Xw1DJ3Wqv3WkuF129rWUur43
	Aw4YyrWYkrnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
	V7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
	FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
	8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176681

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 0bdbce725a..09b3c3f68c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -24,6 +24,7 @@ SED_CONFIG_EFI:x86-64 = ''
 SED_CONFIG_EFI:arm = ''
 SED_CONFIG_EFI:armeb = ''
 SED_CONFIG_EFI:aarch64 = ''
+SED_CONFIG_EFI:loongarch64 = ''
 
 do_compile () {
 	# Yes, this is crazy. If you build on a system with git < 2.14 from scratch, the tree will
-- 
2.39.1


