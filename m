Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5510C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:25:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.18487.1691677515082969083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bj30Ip4f;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65F3BE0005;
	Thu, 10 Aug 2023 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691677512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CtJ76WsYJcb2FGp/II6kO1ByHEDFPnWqsNZKc2g2aaA=;
	b=bj30Ip4fsy9Eb4Ye6tRf6SQcv2FXnpFU1aED8a+BJILOPErAd8Pk8g2Mux1SgN8DJ59E0K
	zwRYOR4SYI+n3KFoj9LsCvWwuXuRywYhvJGL3kbNAZBLT/1RvEJOvi7I8dTwj6LmhTk7i8
	XK5CJhLmjZX+pR+cN9Sl/EJhtSe3aoupa6liNGhpl3zUoD2sMx1qV5DCjEz/Tu25h+nwXy
	iNidToK35uLutXy5G1qoCz44exg1ro6FB8dJWL2K9PX+37qSd3bdEbdjd7mLJttLFYsl5V
	mUGuWv2pjbByEB/O04xMypBHTg+Br1WDiiSK4IDKqZr1cXeuQwyA+BlCqR2uVg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] scripts/create-pull-request: update URLs to git repositories
Date: Thu, 10 Aug 2023 16:25:06 +0200
Message-Id: <20230810142506.989672-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185754

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also remove the git.pokylinux.org URL, no longer used.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/create-pull-request | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 2f91a355b0..885105fab3 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -149,13 +149,10 @@ fi
 WEB_URL=""
 case "$REMOTE_URL" in
 	*git.yoctoproject.org*)
-		WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
-		;;
-	*git.pokylinux.org*)
-		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="https://git.yoctoproject.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*git.openembedded.org*)
-		WEB_URL="http://cgit.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="https://git.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*github.com*)
 		WEB_URL="https://github.com/$REMOTE_REPO/tree/$BRANCH"
-- 
2.34.1


