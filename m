Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6490DCE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:34:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.33501.1695202448229749264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wd8HPVrj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4991E000A;
	Wed, 20 Sep 2023 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695202446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfF4vcaMz9OGgcFEG00QavKX5JsqOR0LowQKTwGii80=;
	b=Wd8HPVrjQcPT2IpHcRMsxs40svDApVy8caRJaqcecFTkb6sYlpd134/CFUVSb7Iq4SBuiT
	/qpXwKIISJM7xdwtIEmcWJpnwYVfUlqslOGZXw5QO1XKBnEuMlc2cB2zifZ1MO6C8Z5Goz
	Q65Fpx8ganXboyh1frOB8zI2DU5QY0CvKtj4gvYhF4PknziDoZ4n9N4aZZthNr0Q/BLEgp
	9RRk35bNl8FkfT/juxHh6nObymKN2tl7zulXRGIxC+DEnUlmPGclw8lyt6t2cAPa3wJLLn
	WcNm3+U8lI0Nb/gVZNThpAKZv+3D7HY/aCH11IW+Ty0BJ9UU1/eRrniRNtmtnQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] libevent: fix patch Upstream-Status
Date: Wed, 20 Sep 2023 11:33:23 +0200
Message-Id: <20230920093323.2020324-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920093323.2020324-1-michael.opdenacker@bootlin.com>
References: <20230920093323.2020324-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187911

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...test-retriable-tests-are-marked-failed-only-when-all-a.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
index ea17e876ea..26b707ad31 100644
--- a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] test: retriable tests are marked failed only when all
 
 Fixes: #1193
 
-Upstream-Status: Accepted
+Upstream-Status: Backport [https://github.com/libevent/libevent/commit/3daebf308a01b4b2d3fb867be3d6631f7b5a2dbb]
 
 Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
 ---
-- 
2.34.1


