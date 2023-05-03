Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C003C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:52:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15031.1683107567040265788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EnERKOv9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F6E1E000B;
	Wed,  3 May 2023 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683107564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bZyh7rOqIVyETW1YUhTC5T5f5WsSyrUZt1tFVwjCLBY=;
	b=EnERKOv9Dq7ENnzMg1COc1ijNqDl0xE8aosCrPz/k3pnlGEm5saNAsRo+QRWHooTwzlY8c
	x6IYQ7ANqEWt6fU/JssM0O42w70PzgT0swV4pQ9N2UtHJUQ0+jHChdeXI0mGLtRq14vWSM
	JwJdvX1Mww2MEKdxQzw7AFSQrziWCohpNNNn1pS7Kyc1IXlb4a/Kqyqy8F+jepzjVgWSwx
	ILfEVwFn0kvAYn5TI2Jbm6lgRAFwbCjwa+LGzGMzq7HUbx5vM3eknw1Uk9699TELA/+DF7
	Flm9QvmQCLCuPcIGRZ/n05YyJ1msDXRpGesB3nV073ePqQuddSjTUNct/l7vVg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
Date: Wed,  3 May 2023 11:52:39 +0200
Message-Id: <20230503095239.2487980-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180803

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

xz is necessary to extract the uninative binary shims

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f552..2a6aefc01a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -529,7 +529,7 @@ HOSTTOOLS += " \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs zstd \
+    uniq wc wget which xargs xz zstd \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.34.1


