Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DFFC624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25555.1788167063976127155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E4NBbZQI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 56DEC1A18D9
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2655E60231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F52811C78A62;
	Mon, 31 Aug 2026 11:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1fHIj1s0cBPVBxzIgM1Ek1lrUUFt0AWP+nsOqXhB/yI=;
	b=E4NBbZQIFu2cBJNZJy3i/m8uzsjcSk+4CHYrW4J5BP90oiNeQOLRk/FfC0X4Cn5UrYBnr0
	f/WkQKzZJGQl+rGZiuENTQlSEPkRZ8QkZeyQVena3jLOWCjcb8m61MhNZPEbFkudCj2hCm
	6Jctk6Wcb4ErvyeUKuhOpHJ13zRkVh6xo0snYI8cJbbMQXiwDZUHz5npf/ioVDTHQXnL2C
	wtzVV1NNxQFiiFWL6/L7rbP7nvNIiEZs0fRtImjhOEx6x4enH4ofQWkpAqHChcuSrtvebz
	C/nhNK7DE/TuuBMOuV5bWue863lFCl+6s/vrjWunk9Cy1W+Drjv4+0OJhyudQg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:38 +0200
Subject: [PATCH 6/9] python3-hypothesis: upgrade 6.165.10 -> 6.167.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-6-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=2707;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=N3jFg3I0XjjgHAJ/eXPmqLJiadeyRiaoaC42pvpVU58=;
 b=NUBcFtapws0NQFaeMnUcZQv33XCCWSD+PaP6TKBrd6sx0m1X2HGJE+tYqJrc9eYhJHNIxLGN+
 w+e3XA/Ejm4A2e31Pt2njFFqHTJSZviCb4ctVnkEwY0PvnwFxsueZuv
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244748

6.167.1 - 2026-08-30
- This patch improves shrinking and generation for collection strategies
  which reject some drawn elements, such as lists() with unique=True.
  Rejected elements are now marked as discarded, so the shrinker can
  delete them wholesale and generation avoids revisiting choices that
  would be rejected again.

6.167.0 - 2026-08-30
- Test case observations from observability now give more detail about
  why a test case failed or was abandoned (issue #3845). metadata
  includes a new status_reason_location key: a filename:lineno location
  for the status_reason, if known - for example the location of a
  failing assume() call, the .filter() call whose predicate rejected the
  last drawn value, or the exception for failing tests.
- Test cases which exceeded the maximum allowed size now also report a
  nonempty status_reason.

6.166.0 - 2026-08-29
- The Phase.explain phase now also varies interactive draws from data(),
  annotating each freely-variable Draw n: ... line with an # or any
  other generated value comment, just like @given arguments (issue
  #4403).
- This release also fixes two explain-phase bugs: failing test cases
  found just as the set of possible inputs was fully enumerated were
  reported without running the Phase.shrink and Phase.explain phases,
  and the explain phase could fail to report that the commented parts
  can be varied together if the failing example ended with an
  uncommented part.

6.165.11 - 2026-08-29
- This patch fixes the redistribute_numeric_pairs shrink pass, which
  incorrectly checked node1.type instead of node2.type when guarding
  against float precision loss above MAX_PRECISE_INTEGER.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{python3-hypothesis_6.165.10.bb => python3-hypothesis_6.167.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb b/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
index ccb6c6cf8f7e..4ab6e27f84a2 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "68b45e09834cd80523cb1eb274463073c7a9af4e4ef7cff34d9615f355572d32"
+SRC_URI[sha256sum] = "23a60707a2bc5e0c59ef95e94264c4e8fd1c54b4ca1b95cbde74fb68b9c2eeef"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

-- 
2.47.3


