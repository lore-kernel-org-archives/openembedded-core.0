Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CED1C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 07:43:11 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.15394.1702021381369513779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 23:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.81.42.212])
	by gateway (Coremail) with SMTP id _____8BxuOj6yHJlpeg_AA--.26530S3;
	Fri, 08 Dec 2023 15:42:51 +0800 (CST)
Received: from ubuntu.localdomain (unknown [112.81.42.212])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxjd70yHJl0TlYAA--.953S2;
	Fri, 08 Dec 2023 15:42:44 +0800 (CST)
From: zangruochen@loongson.cn
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] musl: add typedefs for Elf64_Relr and Elf32_Relr
Date: Thu,  7 Dec 2023 23:42:44 -0800
Message-Id: <20231208074244.2876883-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxjd70yHJl0TlYAA--.953S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGr1UAF1xAr4kZr48CrW3Arc_yoW5Xw18pF
	n8tFn8JrWrWFy7ArsFyF12vF43GaykAr18ur43Ww4S9rW7Za4vvw1UCr1DKFWkuF1YyFW0
	vryDGw4ruw4xZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rV
	AKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7na9DUUU
	U
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 07:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192013

From: Zang Ruochen <zangruochen@loongson.cn>

The absence of this typedef causes elfutils to report the following error:
/usr/include/gelf.h:86:9: error: unknown type name 'Elf64_Relr'

https://git.musl-libc.org/cgit/musl/commit/?id=6be76895f6863100a311d474a42abdbb6466189d

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 ...pedefs-for-Elf64_Relr-and-Elf32_Relr.patch | 37 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch

diff --git a/meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch b/meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch
new file mode 100644
index 0000000000..45d40cd5b4
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch
@@ -0,0 +1,37 @@
+From 65b0ac0d998bf0f36924a7c27ed9e702b2a5a453 Mon Sep 17 00:00:00 2001
+From: Violet Purcell <vimproved@inventati.org>
+Date: Sat, 4 Nov 2023 12:09:20 -0400
+Subject: [PATCH] elf.h: add typedefs for Elf64_Relr and Elf32_Relr
+
+These were overlooked when DT_RELR was added in commit
+d32dadd60efb9d3b255351a3b532f8e4c3dd0db1, potentially breaking
+software that treats presence of the DT_RELR macro as implying they
+exist.
+
+Upstream-Status: Backport [1.2.5]
+
+Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
+
+---
+ include/elf.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/elf.h b/include/elf.h
+index 23f2c4bc..72d17c3a 100644
+--- a/include/elf.h
++++ b/include/elf.h
+@@ -558,6 +558,11 @@ typedef struct {
+ 
+ 
+ 
++typedef Elf32_Word Elf32_Relr;
++typedef Elf64_Xword Elf64_Relr;
++
++
++
+ #define ELF32_R_SYM(val)		((val) >> 8)
+ #define ELF32_R_TYPE(val)		((val) & 0xff)
+ #define ELF32_R_INFO(sym, type)		(((sym) << 8) + ((type) & 0xff))
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 7dd949ffaf..324269a968 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -13,6 +13,7 @@ PV = "${BASEVER}+git"
 SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


