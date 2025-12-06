Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB705D3B7D1
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 17:26:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11356.1765041978137901991
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 09:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n3Zqwi4l;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ECB15C19665
	for <openembedded-core@lists.openembedded.org>; Sat,  6 Dec 2025 17:25:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A3CF606AC;
	Sat,  6 Dec 2025 17:26:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B37AC102F1D00;
	Sat,  6 Dec 2025 18:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765041976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yjjvwRq2Q37kwkcom1WS5vmct1YrnUvXxWg7OxROgPc=;
	b=n3Zqwi4loXr1OhjEc+qG/IfKZZ+rIAf7darMa12sJLSPBYT2pexuE3UOQAL31sVxA3UbDe
	/GOsv43u2IYYgR8Bt4bhO3w7URLOJW0eVNOuPVTYbsxuMlHlAs3FIwUl475+ES0HNr55gi
	MHK35BRVl73TCWETNHsK/fpwc3AyczvL+XHtwBIskhYcv35BAj694si8pLxG2JtqnoyDm+
	fyQq7qqxKjsCCNgvZOMxHi1sxtz0Usu2LUkXECIC5g2qqpPaMVeFKCBCBWvxPCtUct/cgo
	NBvpTJj6k3NAwEgpj5Cs9rWj+d119Nn+NS2oe3+iJalACv1yI63d2p7hVCZW9Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 06 Dec 2025 18:25:51 +0100
Subject: [PATCH 1/2] qemu: upgrade 10.0.6 -> 10.0.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-mathieu-qemu-image-sizes-v1-1-144f17f417a3@bootlin.com>
References: <20251206-mathieu-qemu-image-sizes-v1-0-144f17f417a3@bootlin.com>
In-Reply-To: <20251206-mathieu-qemu-image-sizes-v1-0-144f17f417a3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Mason <jon.mason@arm.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765041973; l=1972;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=QglmrWgGDhGAkDJwrsZHo9FrhYsV7DZmsv53Nzh/XUA=;
 b=k/pHIs4DVDB2Fb9mvizgCEWdMLDzWWqSzDtgsunHdb6PUEF/eONc11G4sKagJgfOzDA2N5jeH
 bOkRk7RkP+tDxb4U2NJYER/jgY+wZRMy7m3dFrV4uZEtcf8nGf1Pg3/
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 17:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227368

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../qemu/{qemu-native_10.0.6.bb => qemu-native_10.0.7.bb}               | 0
 .../qemu/{qemu-system-native_10.0.6.bb => qemu-system-native_10.0.7.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                                     | 2 +-
 meta/recipes-devtools/qemu/{qemu_10.0.6.bb => qemu_10.0.7.bb}           | 0
 4 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.6.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.7.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.6.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.7.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.6.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.6.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3ed5dcc671ad..e02ebd656751 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "c7c40c4b166871e775804e97fce4da65665d1cc93a5c6c9e2ede9d9ee992e7a0"
+SRC_URI[sha256sum] = "faeea5d45a4d9bdde60716814eafadac4286f8a03ce757be632671e0eaa4ce0b"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.6.bb b/meta/recipes-devtools/qemu/qemu_10.0.7.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.6.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.7.bb

-- 
2.47.3


