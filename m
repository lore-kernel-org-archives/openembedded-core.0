Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F057C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:44:32 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.86060.1684151060614056865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 04:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8BxrOoPG2JkFs0IAA--.15349S3;
	Mon, 15 May 2023 19:44:16 +0800 (CST)
Received: from yocto-kvm.. (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxn7MOG2JkyfZfAA--.35623S4;
	Mon, 15 May 2023 19:44:15 +0800 (CST)
From: zhangjialing@loongson.cn
To: openembedded-core@lists.openembedded.org
Cc: Jialing Zhang <zhangjialing@loongson.cn>,
	Qizheng Zhu <zhuqizheng@loongson.cn>
Subject: [PATCH] add support for loongarch64
Date: Mon, 15 May 2023 19:44:13 +0800
Message-Id: <20230515114413.1996716-1-zhangjialing@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxn7MOG2JkyfZfAA--.35623S4
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQAMB2Rgz30SugAAsU
X-Coremail-Antispam: 1Uk129KBjvJXoWxWr47Xr4xAFy8XrWrAr1DJrb_yoW5XFW3pr
	saya48GF1xCFWrCan29w1qqr4UXFs3Aa4UZF15ta10gr90kryDJF1fCFnxGF1kAF4UGayx
	Wr4DZw4a9a1UZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b4kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rVAKj4xxMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2DGOUUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 11:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181244

From: Jialing Zhang <zhangjialing@loongson.cn>

linuxloader,core-image-minimal-initramfs,initramfs-module-install add
support for loongarch64

Signed-off-by: Jialing Zhang <zhangjialing@loongson.cn>
Signed-off-by: Qizheng Zhu <zhuqizheng@loongson.cn>
---
 meta/classes-recipe/linuxloader.bbclass                         | 2 ++
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 2 +-
 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/linuxloader.bbclass b/meta/classes-recipe/linuxloader.bbclass
index 1dfb95e31d..2ea1b62254 100644
--- a/meta/classes-recipe/linuxloader.bbclass
+++ b/meta/classes-recipe/linuxloader.bbclass
@@ -46,6 +46,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
     elif targetarch.startswith("mips"):
         dynamic_loader = "${base_libdir}/ld.so.1"
+    elif targetarch.startswith("loongarch64"):
+        dynamic_loader = "${base_libdir}/ld-linux-loongarch-lp64d.so.1"
     elif targetarch == "powerpc64le":
         dynamic_loader = "${base_libdir}/ld64.so.2"
     elif targetarch == "powerpc64":
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 664fe7310e..0b51187d51 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -29,4 +29,4 @@ IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
 # Use the same restriction as initramfs-module-install
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*)-(linux.*|freebsd.*)'
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 4d48d54e9e..0fc2c004c4 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -5,7 +5,7 @@ RDEPENDS:${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-lin
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 # The same restriction as grub
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST:armv7a = 'null'
 COMPATIBLE_HOST:armv7ve = 'null'
 
-- 
2.34.1


