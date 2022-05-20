Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DABBC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:50:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.8305.1653051043577556615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pHB7Xgft;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E77AEFF813;
	Fri, 20 May 2022 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653051041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WKOHz1wkf9KockerqkyWtG7h61k0WMxd6f1r91jX8+g=;
	b=pHB7XgftG286Xtj6St2MruIf+uqv5wwQZ1ADEpow2Qe0y1PIBc2INHVtzgf1rqEm3vUeH7
	LnJaCuL/rQvq5W0AGupwdLdF2tqAY3huvZ+bNp/VlwnVSv3jFPH0CiQd61UVn4N9H2s8mT
	oqx1a9n0J4/rYNqcZHij7wvPg4p/TCGaVw+4ePn/czg6HpeYia7lnhsnN7zP7EHRv5zJlB
	CIjd8owohAGZNAg+Eae0uoq1pMOYuuivFWG7KvPNGuO5maogA9VQyRA7e0u59P6dW9RZB1
	8ecL3RccUwz4hs7Im4evccEZ+18NhDsFWjH8ADRX/GNBTWFaaaZBfa1UjiufDg==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] man-pages: add an alternative link name for
 crypt_r.3
Date: Fri, 20 May 2022 14:50:38 +0200
Message-Id: <20220520125038.3075574-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:50:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165934

Because crypt_r.3 is also provided by libxcrypt-doc.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-extended/man-pages/man-pages_5.13.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recipes-extended/man-pages/man-pages_5.13.bb
index c0198b77be8e..f8602c699ea5 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -30,7 +30,8 @@ FILES:${PN} = "${mandir}/*"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "passwd.5 getspnam.3 crypt.3"
-ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE:${PN} = "crypt.3 crypt_r.3 getspnam.3 passwd.5"
 ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
+ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
+ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-- 
2.35.3


