Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090C9C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 16:26:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16934.1786724811017805786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O16BroEz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3254C1A1644
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0731B6046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 549EB11C4EED3;
	Fri, 14 Aug 2026 18:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786724804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mPUBUuTIf5ambjrX9Ou+s6wx623AJJlrCNAiTmNbZ58=;
	b=O16BroEzEWXOEySpnRvtAhtjROLPAxHKl2H8c4e9PsiZQbL7LG0dAzeyFhNtfLNQwRUcF6
	vKGBN1nqU6j875OwIEqY43ng7Q+PH2AeotToSlvdHCjmUo4c/ksffgOKVo3AU7nkfxNsLR
	+9UzH2Ppx9IB6sV1eUU9/MXvEWmJqbrjeFXYvm5zK6vUKt1T6kHqXMoBbmc0NC+CFfDF0d
	JXNAMHCa5+rxuaaMqxSuxz8vHE4mvObx4WTlg8q+N/uVipwPNmU9JiZnTPL380mttbh8f7
	pOYRPPE63Vf8F86rEah9OdPHt8NU88T1pXFIVOaAGfsho9qMjdlsMme50BTyLA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Aug 2026 18:26:34 +0200
Subject: [PATCH 1/4] scripts: scriptutils: Use LicenseRef-Proprietary
 LICENSE while fetching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-mathieu-devtool-v1-1-985e81a17bb3@bootlin.com>
References: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
In-Reply-To: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786724798; l=1093;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=kugYCJkFv7tigxtIoB6AOg2o04XNAOY5y1ApF1OQGu0=;
 b=euIwVn9uulgPMgYInd2tziDnPtxaOoRegg3AVPKwr3fQWB7kRuv1kuxK/qKOulk8F3RTURn6d
 6up8APSMCzTAchM3y2eiVlJyyAdgkqGXd7pIN4AxlhUvqUaO2XVI7Rj
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243460

Switching away of the "CLOSED" license, as devtool users would encounter
deprecation warnings on "devtool add" command.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/scriptutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 32e749dbb1a2..b4fb6cc1845f 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -170,7 +170,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
             logger.debug('Generating initial recipe %s for fetching' % fetchrecipe)
             with open(fetchrecipe, 'w') as f:
                 # We don't want to have to specify LIC_FILES_CHKSUM
-                f.write('LICENSE = "CLOSED"\n')
+                f.write('LICENSE = "LicenseRef-Proprietary"\n')
                 # We don't need the cross-compiler
                 f.write('INHIBIT_DEFAULT_DEPS = "1"\n')
                 # We don't have the checksums yet so we can't require them

-- 
2.47.3


