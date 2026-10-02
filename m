Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730DFCA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6197.1790926588420814830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LZuINfKl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8689B4E4110A
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B1E4603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90F1510328448;
	Fri,  2 Oct 2026 09:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p1xDwYXMBf58JNxv7tK3mQbVEQCla2dyDeuabApfsUU=;
	b=LZuINfKlqRfyubXrvOJddsYTb8IWAZMPZWDFwlVTJ+uZ/vUaTti/MvNeR3kp2HqyI7Bt2V
	8ZyerbaEYG325+bKAc9CvuRnBwe7mKKBMzeVRJjz7q82dTsMooxxyaTeR4PX60qwPgaUgb
	E1h8lyTFBTvgjTjz38NMwPac/X+iPxaAavkJE5Oue0vcHgXV/E1zZpqmVEM7VoRTa1MT9W
	Vp+f+69GWWVq4zXS0Gj0s9WBohRV13w6XlOzNWQBxuAItFxJ+O0zvwP2tWxu9q+IvFgb4I
	uXQDfhg5XdNV8PfutG1QtfQfzExvMq6QtAsLm8sQCDSvarLP2lfjdzcAppHByA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:05 +0200
Subject: [PATCH 2/9] python3-git: upgrade 3.1.62 -> 3.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-2-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=1171;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=s2bbG7Z+sQkaPmOjOLWXoxre5QEEEy8OFFtD47AaRMM=;
 b=EFiM2Zi8VCyMJTriIcr+vTFVjR7WU40LpDjeRldlWbz9Ad84qU8z641nw5/yPokF2Xt8O5O9U
 Rj2/UQsXr4BAM328iOGw/bWJaycjDS4ZB1A1vyeZhpA9jmUIM5TH/EM
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247073

Changelog:
Drops support for Python 3.7 (5 years after its EOL).
Security fixes for

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.2.0

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-git_3.1.62.bb => python3-git_3.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.62.bb b/meta/recipes-devtools/python/python3-git_3.2.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.62.bb
rename to meta/recipes-devtools/python/python3-git_3.2.0.bb
index ad912886bbc5..990507fb7666 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.62.bb
+++ b/meta/recipes-devtools/python/python3-git_3.2.0.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1791de66309bc0c7cfca40bf8d2e3de7ca091cbf94e6051be1ad0722c61062af"
+SRC_URI[sha256sum] = "fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e"
 
 DEPENDS += " python3-gitdb"
 

-- 
2.47.3


