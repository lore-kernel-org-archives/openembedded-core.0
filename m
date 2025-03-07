Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EE6C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:46:47 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.7598.1741340802767826612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8Axz3N9wMpnNoeNAA--.44960S3;
	Fri, 07 Mar 2025 17:46:38 +0800 (CST)
Received: from localhost.localdomain (unknown [192.168.100.1])
	by front1 (Coremail) with SMTP id qMiowMBxLsd8wMpnPn87AA--.26633S2;
	Fri, 07 Mar 2025 17:46:36 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH] lib/oe/elf.py: Add loongarch64 architecture definition for musl
Date: Fri,  7 Mar 2025 17:46:27 +0800
Message-ID: <20250307094627.286183-1-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMBxLsd8wMpnPn87AA--.26633S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAgEOCGfKLF8K8AAAsh
X-Coremail-Antispam: 1Uk129KBj9xXoWrWr17JFWUZFy3CFyDCrWUKFX_yoWxWrc_X3
	y7ur4xW3WFvayava43trs5Wwnak3ZxA34Y9Fn7GrW0qa48t3W5C3yUXFn2yF93AFZ5XrWa
	v3yfWr1akr1fXosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212421

Add the ELF definition for the loongarch64 architecture when building
with musl as libc.

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/lib/oe/elf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index e1bc7b8984..9794453092 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -88,6 +88,7 @@ def machine_dict(d):
                   "i586":       (   3,     0,    0,          True,          32),
                   "i686":       (   3,     0,    0,          True,          32),
                   "x86_64":     (  62,     0,    0,          True,          64),
+                  "loongarch64":( 258,     0,    0,          True,          64),
                   "mips":       (   8,     0,    0,          False,         32),
                   "mipsel":     (   8,     0,    0,          True,          32),
                   "mips64":     (   8,     0,    0,          False,         64),
-- 
2.46.0


