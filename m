Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978E4CA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:16:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8560.1790756208238211582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wGmTqQij;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A3931A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47A1F60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8793D103298A9;
	Wed, 30 Sep 2026 10:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LW3KvIxjwPjQLgQOzRnTfK5M3PSzX990FgJcvZqQCdo=;
	b=wGmTqQijcIAo3KxaVj02r6TwbSFNQgtclxJoeaR0CZ7rJuDZFyh5VdEle6IPmhz4FT9Mtt
	mAIHt+XihhMM91uehrpCaaTqnY09tUBjfw0RguP7T5cCCE8MPuGZ6BjoRnn8OixaSObcin
	/z+u+F/h6nHPsri5pUAVaxDQlScbGENikhK5jWAC8mABsRylgIwiaigfgIcTz+GQpWN4pZ
	8C6A6BMEQegeLcHaWRmj1xJMgW5TZWV5qPaTQZZkIyTVEmJFBYWERSpFxedWe7ouaJLKKJ
	pNXfDV5XYPXRSkZM8KFMBlG5piL2j5nUxDOQ/mXFk15W16bNksGgCpxccCn//g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:26 +0200
Subject: [PATCH 01/24] python3-pytz: upgrade 2026.3.post1 -> 2026.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-1-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1115;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=DJqgJpcra89p47hhSexJKzXnkw9tTGZNLDbwoJBWDzY=;
 b=2Q50uOIcppeUPmXsGtPx1awpqm7r3b+7BgVzzcxq35Wv7D4a9kCOySzcjJaDF1fKrXJBUzMg8
 4JaWGIZLh2mCzvu+q5fZlaXkWv/efYJTclnH+2jx3b5c+L+YH+pOIld
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246924

Full changelog:
https://github.com/stub42/pytz/compare/release_2026.3.post1...release_2026.4

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb b/meta/recipes-devtools/python/python3-pytz_2026.4.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.4.bb
index 72a74db35776..4a2eda07a606 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.4.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "2211d3fcf9a797d3405cac96ac7f61d80e6a644f72a3309607282fe8a2010c5d"
+SRC_URI[sha256sum] = "464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \

-- 
2.47.3


