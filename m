Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31F8C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 07:39:33 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web10.58450.1707118767410535420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 23:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tkos.co.il header.s=default header.b=hcHrq8zG;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 01B5D4406EF;
	Mon,  5 Feb 2024 09:38:58 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707118739;
	bh=rYuUpVK3ULMfXicPusFh0h/nOgG9LG9zgx7tQhHhB6A=;
	h=From:To:Cc:Subject:Date:From;
	b=hcHrq8zGiExoWNAKdZBNXeKzEgveTiOTJ6txysqljG6t82eWUGYMWjUlLzVn4moJE
	 I685phiMNxCEWih/quOCu33p7FeZ0BZ2Tks6UN/YyfvhZ4U209+v+d+rxlodUq1zvv
	 g6v9Akzc2+d9uH+kQ0GTRv0pWIMWryPhJ66zfWFXm1CWuIPE534vksY8vMeCGzfQNG
	 ijgYXcXaqOl8FfEhzWpnefNPfLY2d7wEgQDWV4WvLvjYOsxdSgtl7W/qCZp6quyk2t
	 4yei8RKLbY+TRlKz9MR2fIWexnS+B5wnnDCQJdwIEHJCd8O9LajMgFLiToJ5EmLq+n
	 v5an5SWBC87nw==
From: Baruch Siach <baruch@tkos.co.il>
To: openembedded-core@lists.openembedded.org
Cc: Baruch Siach <baruch@tkos.co.il>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] overlayfs: add missing closing parenthesis in selftest
Date: Mon,  5 Feb 2024 09:39:03 +0200
Message-ID: <f5c320e4510ce97bc1e346103ef3f54cb70c5c01.1707118743.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194921

Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb =
b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
index 88c8998cf9ee..3b59e3761977 100644
--- a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -18,5 +18,5 @@ do_install() {
=20
 FILES:${PN} +=3D "\
     ${exec_prefix} \
-    ${sysconfdir \
+    ${sysconfdir} \
 "
--=20
2.43.0


