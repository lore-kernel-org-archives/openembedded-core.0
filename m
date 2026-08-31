Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00E0C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25595.1788167069033954990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HEK35has;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 607014E41464
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34F9160231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15C4011C78AD2;
	Mon, 31 Aug 2026 11:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167062; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=akFaFJqAFh4hOjgiAv59rR+XBXL2eXW7jJYCXKL5+Gs=;
	b=HEK35hasPQSdONa2MomWLyfY4uyXUBuK/lgrb2D8j+s/l0O3GZ75WkI6Py6J/jCk/PZrWV
	dNgzOaPevCPYBD0SJ/ssC+jiwrgreyYzCeSp82/xV7IZAxUwVl9688zCGmzpknswid/CMQ
	inmNlHV42Eo4cczXSvBWivKVfE3K9ljNe9wZeB/mMqYYAzFobiHIOaS2TXCnZ9UP+y8yWi
	D9bCMksCYxajM2qLwgLekRRHbPzdyyV8Yy56/tM5QEJnDMHa4ZtQqBCwDKIINtQuhb/bmD
	s7FVtOrC8qN+3OrFJDjCuAG56Z83+ToXpVZygPKRptqvQa7BBBUUu95CpXu38g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:39 +0200
Subject: [PATCH 7/9] re2c: upgrade 4.5.1 -> 4.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-7-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=1269;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=2z15hN5sIAJfXQIjPgqi++8lPwyrQ1KLqiIB6nncEpw=;
 b=aiPrfi7qp/pH0QAIbBENFxMTVfTmpp/a59psgtxB0pTVYfugxgYJL1SPgabDyFA6YvpYCHM6B
 EI/NitLPhyGAZUXC7vJ55wxt2CnxmOeL2vBKlfubxNm1Ati6eaWHXyp
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244749

Source: CHANGELOG

4.6 (2026-08-29)
~~~~~~~~~~~~~~~~

- Added support for Zig labeled continue optimization.
  (`#580 <https://github.com/skvadrik/re2c/pull/580>`_).

- Updated C/C++ examples to use re2c features available in version 4.0 or higher.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-support/re2c/{re2c_4.5.1.bb => re2c_4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/re2c/re2c_4.5.1.bb b/meta/recipes-support/re2c/re2c_4.6.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.5.1.bb
rename to meta/recipes-support/re2c/re2c_4.6.bb
index ad33ef6a0b80..70ce9c82e852 100644
--- a/meta/recipes-support/re2c/re2c_4.5.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ffea067c11aa668bcb42885be6e6cd000302000b7747d2bb213299ec66b7864e"
+SRC_URI[sha256sum] = "75bf2696445e831d0d44e0d9f2909eeffc18c09757f222b2fb025f7e59fe130b"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"

-- 
2.47.3


