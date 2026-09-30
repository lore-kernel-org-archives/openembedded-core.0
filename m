Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F55CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8564.1790756212402750960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=atBNJFu5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BE42B1A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91D0260749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA3B2103298B2;
	Wed, 30 Sep 2026 10:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PT7bN2iaBQlksRmf9kXJ/yPw2rk2IAo97EeIFp0nNhw=;
	b=atBNJFu5wS4xdXhnRbuzBKlqV4/MKjh4m2ubE//PeOM1J5Xt9jDcG0TUplnaZ0UsPRTCib
	WSAbY9k6QsYcwi+lZ0X6AP31l329eZn9Oj0djq3LlieYkr1ZjR7WnNJqA1XqS7I8IGZGfb
	vM1V1V6bU87ZvB0S8U+pEe/oELE0u4zuY/Y1hyZdlftjPUCCh9Znv/wgC+QtT69sW7OFvY
	1rCSL/l8HDtS+7IsWKEo8QUeS4nKgArakHwPtXlHSRn8rc2IXKaiEzbOpA8bOoxn07Gun+
	KNRPLZJGMiWNXkBPNIdsRNwP5E9FKF0N3Z9pxMifspKchy35VkKLeOl+/uw3WQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:32 +0200
Subject: [PATCH 07/24] python3-pbr: upgrade 7.1.0 -> 7.1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-7-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1056;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=VTuwNqZYU34CcxGTtNG6VzFikcChwaw6BXO/TQjB1Jw=;
 b=ubM+w0UTaBlDyjcK3mEnOwzZgCpQA/ovAlGRW/Fz6hTUmUkXOtExQo0WPjqfiG3ZfD7NP1E82
 yRMdVa5o/uZAYv+FY0J7ZAvjDHBJQTWrwYv/EyV05gz1SsaCYztV7bt
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246931

Changelog:
7.1.2
- Set setuptools min in requirements.txt

7.1.1
- Fix hook ordering race that drops subpackages from wheels

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.2.bb
index 7fc227e6bbdb..9aeb50268df4 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "4639b87cc91d0d58471b7bda1f28b7d0849ba43d7935c4c482f3c74fef719804"

-- 
2.47.3


