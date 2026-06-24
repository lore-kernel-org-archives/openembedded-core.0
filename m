Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A2FCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:54:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12170.1782320056761517854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C1LtijAT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8250FC6B3B5;
	Wed, 24 Jun 2026 16:54:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78615601C5;
	Wed, 24 Jun 2026 16:54:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6406106C846B;
	Wed, 24 Jun 2026 18:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782320053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDWqwh926T+OBg/iETJgvqz9zp1aPPFeI/LbCiY7UIY=;
	b=C1LtijATnqkTeIWeNwdYCFvzhRieVC9C+oN3u5Isr92HACIvjzecOlBgxodsnbs8uwmr7f
	u0FH/LwXSoRyDQ5DT2oT8IV1K9hu7nHc+lMgA+8iPMDIV+0TFocieQYaf0smgxlZY6zXxT
	oCfzFlprkozYSmxyvFfyIxJf2+g33OoA4V1jdNk/9qbz7vQbhfA9CykKqoxr0KbLHh9Z1x
	YohO5FdFKaAhePjCaC5xCSps9oy6nXM2m06wHPP2pxne4DX0EIYFcPrrYfSPwIRPuXJlSg
	C5g5WWVw/9eyRxHdEqQhG+ONDBMqkXCsQ4S2hqyBm5Na+gdqFeKgi3yU1n8UGw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 24 Jun 2026 18:53:55 +0200
Subject: [PATCH 3/4] sbom-cve-check-update-cvelist-native: update to
 version 2026-06-24
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-update-sbom-cve-check-1-3-2-v1-3-f7ab738bd785@bootlin.com>
References: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
In-Reply-To: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239529

Update cvelistV5 to the CVE database from 2026-06-24.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-06-24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
index 7670172c40bb..ca192bc9cf3b 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


