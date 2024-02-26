Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F86C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 08:13:57 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.16250.1708935232313940089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 00:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.40.24.15])
	by gateway (Coremail) with SMTP id _____8BxTOk+SNxlDIMRAA--.34636S3;
	Mon, 26 Feb 2024 16:13:50 +0800 (CST)
Received: from 3a6kpc.. (unknown [10.40.24.15])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxbs01SNxlANtEAA--.47845S3;
	Mon, 26 Feb 2024 16:13:49 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: Xiaotian Wu <yetist@gmail.com>,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v2 1/1] openssl: Match target name for loongarch64
Date: Mon, 26 Feb 2024 16:13:37 +0800
Message-ID: <20240226081335.501590-4-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226081335.501590-2-wuxiaotian@loongson.cn>
References: <20240226081335.501590-2-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxbs01SNxlANtEAA--.47845S3
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQATCGXa+mQFoQANsS
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gr1ftw4DJr4kAFyxCFyUJwc_yoWDAFX_ua
	yxZr48XrW8CFW8C3ZFvw4Ykw1Sqw4rJFyUX3Wjgr4Yvw4jqa13uFWvvF1I9rn8ur18uFWU
	Ar1rKr1a9F4IqosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 08:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196186

From: Xiaotian Wu <yetist@gmail.com>

This is updated in openssl [1] since opensssl 3.2.0-alpha1 onwards

[1] https://github.com/openssl/openssl/commit/b625e21e67666213ffd3ba6b1f2cd8a847ba6b66

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/recipes-connectivity/openssl/openssl_3.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index d3bf6248e3..1682b6f8cc 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -96,6 +96,9 @@ do_configure () {
 	linux-gnu64-x86_64)
 		target=linux-x86_64
 		;;
+	linux-loongarch64)
+		target=linux64-loongarch64
+		;;
 	linux-mips | linux-mipsel)
 		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
 		target="linux-mips32 ${TARGET_CC_ARCH}"
-- 
2.43.0


