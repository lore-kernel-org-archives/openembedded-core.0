Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B8DC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11253.1789038254967183166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MoNC9Vvk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20520C2C672
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB6B3602B8
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 278C911C78965;
	Thu, 10 Sep 2026 13:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tNDR+cN5KdOd65+qVsGUjp57bjOXzEE3YeA1lAlQ7r8=;
	b=MoNC9Vvkdx6rs/wOYazqoDbpCxsVEE+xLMOCQuzrAzzL5Xwzeknfxcw70tz8JA4yRdKsyR
	7Q6R2XkCeQMHtsrTGloG5KMUuCTjcvfzbINM8HjrmYqJJ+yzUBNRsvX+C5VIwzX71c58y1
	G96X2BKl3xsHYxsoFXPCFLa5YQSEqOozMTby0fWuhVHZmBAqHl3/GKHk0UHPg7iwnmLoRR
	+IlLXDvzCJZMjxKL5XIm8MvGxY4lNFknwL2tPtgBGz9tjKNqV9tDhvw2urhKEO5nXVXHeu
	sI9Z9zIE1A0xYacPpXYj9Z50kPYIDSEEzv/vF7rY+A8DQCOJ+gMhvtdw+lwdCg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 10 Sep 2026 13:03:54 +0200
Subject: [PATCH 1/7] python3-meson-python: upgrade 0.20.0 -> 0.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-1-da1b555eace9@bootlin.com>
References: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
In-Reply-To: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=1557;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Crf98SRWPWwEQRIaWNuMxzp3+oethyH9TrE5bGX4LzU=;
 b=4E72MGo4q17lhOfwSK8DtQataxpGTT68P7J4kXXwYRSIQJbsDJl16Kb3xxwsN1CGtq/TBK1ea
 wgGW5V3kKlaClZ63H9v9ETrYTbT4ao8jVsySU2Hko9k+cVL5XWd0a4K
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245551

Changelog:

- Add support for the stable ABI for free-threaded interpreters (``abi3t``).
- Add support for the stable ABI extension modules' platform-specific filename
  suffixes introduced in Python 3.15.
- Allow specifying ``editable-verbose`` in ``pyproject.toml``.
- Improve the default behavior of editable installs by capturing and reporting
  build errors when rebuilding.
- Use ``.start`` files (PEP 829) instead of ``.pth`` files to implement editable
  wheels for Python 3.15 and later.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{python3-meson-python_0.20.0.bb => python3-meson-python_0.21.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.20.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
index 19902f6e4c8d..69fb461c1feb 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "6d9726ae6cd37e22f210c74b364b30180a68c20442e97ff09f3c566a414af738"
+SRC_URI[sha256sum] = "595c2f40b76692c78274c87b733379d86562583e9ffb975487b9eafada03055b"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 

-- 
2.47.3


