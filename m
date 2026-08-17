Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6645C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 10:13:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27028.1786961614974940937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 03:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QMHmyJIj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C5F5E1A16DE
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:13:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95FA260352
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:13:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6902111C4FFDD;
	Mon, 17 Aug 2026 12:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786961608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DIFjRsFcv35m7hKw+EQMspv2LKX1FxtPr+k32pZ/e4s=;
	b=QMHmyJIjwvytU82Mgv8hbAdaRKRU+IbSBaOKEmGzpiJ2ji+L+bMobmNXMDOYEA+/JAeRcL
	Cj4EqMfVUNqRxCxaGWTPwzZV7Zg8EhLpqiUvyVhC/dzQdYgHPkbFptlISdLeZ01et8jkbS
	4c6jpJUjJDkIJApMDllitt75lMKh8hjvqVZCwGF4RyIV02dlsLOC34QFcWc1iGrYwnbLmM
	oiAdKHk+ZojwfGXjbdfzbk1YVTeQ+JtmvuxR3smc7CTdrnfxbQ/+gVsfd3oc6lxTbW3ggo
	TpoyFpisQmSwN9e+yZwfzj+2aRguzI6pKSXSx7B0epk0y+OtHq7E+AAgegEtMw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Aug 2026 12:13:20 +0200
Subject: [PATCH] python3-pygments: update 2.20.0 -> 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-update-pygments-v1-1-da836eab9640@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVRSf1dRSyowUhU0ykh4u6K5
 bd47wJGR8hQRRc43IlpNQEyjkBPrRlRUB8MaZJmSSFzsdm+9SjsOS5oPAvZqbwsCzUoLSFU1uF
 Ax3esm9+8dTNq/27gvh8X5lo5cwAAAA==
X-Change-ID: 20260817-update-pygments-1b579985f5c1
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EOaxL6uUdiuNuyzXJG3zkiamIuiiSJhetEM9lGfC9NY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqgt7HS3pwFbRaGlux4XJZZ/ljuD5IekG98HSVd
 d89tN8XdkKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoLexwAKCRDRgEFAKaOo
 NtaqEACdnGY71xFuC64QJ86YiuJF0SVqca2s49wQNwAdshviPpN7F9xlzJPsr+ZLqOV9VOdlN9I
 dmvuscGUksXiPnK5kabEyIEsc2KYI36mkPN0Ut3EQ/xFMC/ci3FbW4/bWtUAraYb6itlmTT2CzZ
 jz4bvjaPSEtHtapVa7cHAvZYNUcBT2rh+Pm2nXkGiJfBG6AB8lMy7m+y+gB4ThcKlrA2kH4zYCW
 p9F5T/45E/u+IwQ5Oz1qlCS/SUME60bR7UyllE7hN2AdADNJemrkRUJToy05cIxHo8Xyt36ILRY
 R6Hjx3XDiFo2fXWd4QO2pVZTLtLa4H0R9ZEilezOa0C/iHbAjuGjKGMrsCYOYv35Uw3Kye4s3Ku
 Xe3HZS51RlMW0GTko2FxbiEkVJEqr0OfgShZuv8J8sS9fP/Pv5S5UeB2YhbYNOofIZoWnj0UdTh
 xktBNZL0uhjoXRZFiCEcA4trNqMDZ1mKAHskZzo83kT4eu9dicekPb2jOvUrq86EBW1OQy8bLfv
 8aTb4pdUzNShvwThwXCIR3cAiafQyIiL/yGN7D09HmwZeq7vdNpuuZcYwD49O+LH9OTps1NvI5v
 hAMTo+oazhFRSCpsgQC+D04bNkIUuydPNvCwlzui9cbgMl4DX30wXLT42zvWpIVYO/gvQ1Z5Z9v
 C8RYKUfKtLW6EBw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243604

One notable change from this update is the addition of a Bitbake lexer,
which will allow us to do proper Bitbake syntax coloring in our
documentation.

Full list of changes:
https://github.com/pygments/pygments/releases/tag/2.21.0

Tested using this version for the documentation with our
buildtools-docs-tarball recipe.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../python/{python3-pygments_2.20.0.bb => python3-pygments_2.21.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.20.0.bb b/meta/recipes-devtools/python/python3-pygments_2.21.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.20.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.21.0.bb
index abe6205292..044014b134 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.21.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
+SRC_URI[sha256sum] = "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
 
 inherit pypi
 

---
base-commit: 07a342aa80c7349dd014f743a695a5e006add8df
change-id: 20260817-update-pygments-1b579985f5c1


