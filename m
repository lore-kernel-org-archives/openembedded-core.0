Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C156C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 13:15:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8651.1787058898367040795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 06:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l4ogBMeJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B2F004E412AC
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:14:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8230B60355
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72FB511C7051C;
	Tue, 18 Aug 2026 15:14:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787058892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=72IBQ2BHHLxUele8JkEAaumyhWb0+OCfx8J1QFgAQns=;
	b=l4ogBMeJgtNjaqc81jn6zkCWs61BVMYWacToI+oko0R2dCO0AGXLWJbqUwimCWYjAg64AX
	TWEwtVUKzldcN28cwQhAhV2jq1YssrjtoNW8RQz+d91ru3DQn3kHtq021etuxxt6IG6yOO
	cRnpQQ+QVDkl5yrecjbD86P25s0KMZWbUYeGEcdVMZ7VQLSymew2TP5IG7hP68AsbzJE8b
	n19mfagJePTB6oy54dmIJZ0zjYFElTQ2vnI8HDtoCKGhqyHNOB+JKrfXsRND8jNmUXFtqo
	RGb4QZgJlyhEGzbhPsYKh2iZxZ+dKx95A+AD8jVorTq2c8kJo3U4kjds39P7wQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Aug 2026 15:14:38 +0200
Subject: [PATCH v2] python3-pygments: update 2.20.0 -> 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-update-pygments-v2-1-83a2b77d9b6e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2hqKltfK/zAs+hhgjLSkLURC+
 HcB1y5Pcu65KwT0hAHqZAWPMwVydofskoDupe2QkdkZsjTL05IXbBqNjMjGpRvQxsC4EkVVlaI
 VmsO+Gj229DmLz+bHYVIv1PHIHEZPITq/nJczP7z/9ZkzzowsbzlKVeX39KGci2+yV+0GaLZt+
 wJTmbIgwgAAAA==
X-Change-ID: 20260817-update-pygments-1b579985f5c1
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XhSEDXWRVZfxbcuEIGAqaprBIzdWPW4pC/L4CgPifl4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqhFrLfv3HXMZD/cLlqJK+r3fdj0uVfMc4V67XC
 aI38DL8f1GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoRaywAKCRDRgEFAKaOo
 Npu5EAC+6R+Be/yZI8jfpr3rgPGZEeU7gXLyTIFlHulzb+EKQdqNl1390tmVKKA+afWaDoJaY0Q
 WE3Nn8WL/0+jDv8KsdALelp1bNeSayuuoGwmvBcBgdH12PtOH/5nb2mmHz+Tq56daiMFHStdM2P
 TP06tBlG78fgJhuepG8dWolD6Qc56IfneFKOZ2vHRtybwXvndbnbiVddQpYAS9p0Be/QWVgsPwf
 sUKRJYpgFH5alltQ+7gylshOwEYsuU2yZSwvFlmCxvNtURfCZToxF6UFz2UHZb1Qmbe2smy6Tev
 KKwEXxTJ6OWkCMZ2jwwdt/Opwtnpa8IbnHGGQjuRPdsm1rpPQiOc9sxMv8DHTVq5c2/NDxejfOm
 IzpjVJIoOoelQUyDoljIJN4GnFsjgu5D/Zh6/yGsA6SRHwvWubPI4iDlKMtCHSK7qrFxtYdMbTn
 kOBE7lJIHUiYplWeiejU7j8FMALGmlb8lTHfiT45PBmuu48GHbS2XnOAunGECkKrh8mxm2mQeuI
 zllPioolAWfMW+dGGhC2aX77tgp9fz1uMfYpB3Kfo7fRy21xGEHu/dPc2ImA19j+gtkHMmD8+Ba
 DblpHghR6mY9KF9ViKq5GKbWmRfcSCHHyr/UzlpGLplxDcO4o19k0oDdSmY7vLoMEhtfzD1+/5R
 w8vPaWm8w1BfUnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243682

One notable change from this update is the addition of a Bitbake lexer,
which will allow us to do proper Bitbake syntax coloring in our
documentation.

Full list of changes:
https://github.com/pygments/pygments/releases/tag/2.21.0

The project also introduced a runtime dependency on python3-html with
0f97e7c37d44 ("Harden the HTML formatter against CSS."), so add it to
RDEPENDS.

Tested using this version for the documentation with our
buildtools-docs-tarball recipe.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add missing python3-html runtime dependency, observed during ptest
  package testing
- Link to v1: https://patch.msgid.link/20260817-update-pygments-v1-1-da836eab9640@bootlin.com
---
 .../python/{python3-pygments_2.20.0.bb => python3-pygments_2.21.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.20.0.bb b/meta/recipes-devtools/python/python3-pygments_2.21.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-pygments_2.20.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.21.0.bb
index abe6205292..b58e58a745 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.21.0.bb
@@ -5,7 +5,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
+SRC_URI[sha256sum] = "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
+
+RDEPENDS:${PN} += "python3-html"
 
 inherit pypi
 

---
base-commit: 07a342aa80c7349dd014f743a695a5e006add8df
change-id: 20260817-update-pygments-1b579985f5c1


