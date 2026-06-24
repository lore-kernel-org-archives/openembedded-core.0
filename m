Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64FDCDE006
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:54:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12172.1782320057337368106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i9lfsFIv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABC14C6B3B7;
	Wed, 24 Jun 2026 16:54:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A64F2601C5;
	Wed, 24 Jun 2026 16:54:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29B4B106C8210;
	Wed, 24 Jun 2026 18:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782320055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=amdfZDWAcJiQ0gAbeQIX/ENjkJO8oJCy8Gjt57C0v58=;
	b=i9lfsFIvJdq/Jbq4qR1wWHFBHsWmyoH9VyL0yw1vdOJjT5lI7QE2ytcoHA0PLWsbkL4cXt
	QFwkYy9pVeuW3JOFJiE4ym9hMDUrcKmNpnVk4yJz6FMRQLVX+TyGI6liQW11qJJGS9n9ZE
	OsWjh/S6G5tQFGBaQ1z/mB+wvuiHoMNK41BmwLMX6kQxLWDDq+WPsUidrwr9i3TU+6tVz2
	9SEgWYZIiskbW0ilu/ONrPA6XLtv+Z5ZxLbVXpXR/asBMEe0BnkwLU/vR4+2BXMNm5dOwC
	D2NoOxJEzt50kcLYRhWbaJ925b/n155y0bD3LJFtoo6oJokwR7kCUyqQPDznkA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 24 Jun 2026 18:53:56 +0200
Subject: [PATCH 4/4] sbom-cve-check-update-nvd-native: update to version
 2026.06.24-000003
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-update-sbom-cve-check-1-3-2-v1-4-f7ab738bd785@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239530

Update fkie-cad/nvd-json-data-feeds to the CVE database from 2026-06-24.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...-000006.bb => sbom-cve-check-update-nvd-native_2026.06.24-000003.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
index 2917c89e6289..73d9e7769296 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "7ff4a0622bfdf5313c79635951112d2a45bbe9fd"
+SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


