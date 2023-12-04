Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5A0C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 06:23:39 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.63733.1701671009892002783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 22:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.81.42.212])
	by gateway (Coremail) with SMTP id _____8DxqOpZcG1lEKo+AA--.23861S3;
	Mon, 04 Dec 2023 14:23:22 +0800 (CST)
Received: from ubuntu.localdomain (unknown [112.81.42.212])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxnd5UcG1lBvdTAA--.55799S2;
	Mon, 04 Dec 2023 14:23:16 +0800 (CST)
From: zangruochen@loongson.cn
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [PATCH] ell: upgrade 0.60 -> 0.61
Date: Sun,  3 Dec 2023 22:23:14 -0800
Message-Id: <20231204062314.3721567-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxnd5UcG1lBvdTAA--.55799S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruFyDXFW3Ar18JFWDGr17Jwc_yoWkJrX_Jw
	4xXrWrJrW8Aaya93WIqrnYkFnrZ3s3tr15CFW8KFsFqw1Fq3W8ur1kJ3Z5ur42grn8Kr15
	tw4Fv395C34SqosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAKzVCY07xG64
	k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUa9-UUUUU
	=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 06:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191721

From: Zang Ruochen <zangruochen@loongson.cn>

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-core/ell/{ell_0.60.bb => ell_0.61.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.60.bb => ell_0.61.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.60.bb b/meta/recipes-core/ell/ell_0.61.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.60.bb
rename to meta/recipes-core/ell/ell_0.61.bb
index 4e414f3b90..5472714646 100644
--- a/meta/recipes-core/ell/ell_0.60.bb
+++ b/meta/recipes-core/ell/ell_0.61.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "61cec2df694b548e51afa3e7ffd1e1ad31a9fea7bedb93a3a3cc60894390c70f"
+SRC_URI[sha256sum] = "c21ba3530d530c736f9b3e6acc954d4404c1ce4abaf2a4694e46ecec17653fa0"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


