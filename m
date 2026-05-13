Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72D7CD4F3F
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 19:53:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5899.1778701996497520526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 12:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BP/CkvKc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5B921A35A5;
	Wed, 13 May 2026 19:53:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BADCA5FE21;
	Wed, 13 May 2026 19:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4617D11AF9038;
	Wed, 13 May 2026 21:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778701994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3O5+LiRiUKJQlcdk24HEiemCLHeZ50SzDyQ16FcqjD8=;
	b=BP/CkvKcsxxtpESacPuoMnjaXNUjA5VHgv1OtT47wEcC+ZCYX/1CQ5WRoeOXEYAEiCzc3Z
	+mhWyXNewrXxREV+SLKbaLwylPQjub38L9E7LIRxOG6WhSinjO/N83WXG4yZ+9XI9PCRs7
	0RXWz2oliQOl+WBCVjBKaHSUKPuTxzQgdl/6b/OKSr8ktikEQeHXwmoSgP7pHP1v3EVci9
	N+g1KzR7KfdF1USdUNerp9uDhiCDIMulHpLG7DdY36Vi2aP6iOH2n4sQoYRgVj1hQl9z7B
	W+Vo8fhLQURsqzbCPpFZcamL6KJrPRVEVGTUtHDDmQUGJ66SCOJ88Qed8p5Dyw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 13 May 2026 21:53:01 +0200
Subject: [wrynose][PATCH 3/3] sbom-cve-check-update-nvd-native: Update
 source revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-update-sbom-cve-check-wrynose-v1-3-e6e368932274@bootlin.com>
References: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
In-Reply-To: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237005

Update source revision to v2026.05.07-000006

(cherry picked from commit 332514c320eff2e74246e41cd49592f6c3c5dc6c)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
index c868ba09c18d..26a14e6eb169 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.03.19-010002
-SRCREV = "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+# v2026.05.07-000006
+SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


