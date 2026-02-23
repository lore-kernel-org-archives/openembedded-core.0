Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA36E98E09
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:11:33 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31355.1771834292477596637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GYZCYtmT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BDBAEC111B4;
	Mon, 23 Feb 2026 08:11:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFEE65FD43;
	Mon, 23 Feb 2026 08:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C4FC10368EAA;
	Mon, 23 Feb 2026 09:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771834289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1b14l2cFQN+Po+wBC2UqeauZCC8vsILwAtTRwZ+AcwY=;
	b=GYZCYtmTriltYsCBjmXqW0Q3PfMRN1993vs64qmqbcJe66pZ2EiohC+LAt2DElI8lJigFR
	cDuTdViAft5Edh7NTDPbvV+plYZcm5fC0+j02RkqFEaNvdtQzcFhn+IMkFkceQLWuOxG9U
	9thLc0tmsknvZorPl2v5n+dPVmRRE/0t5ZV4Qor1L3pGo6AukSy13LbR9+Oxa9T0a2K9+T
	0Y1rhfB4F+C8HDyWLEULntamk0HIWS6b4HVmDvR/HPXUQFIyxStsWZ4IpDCXNBQEs1VbHG
	uiM1fWW0lzvV02xBthoCItfFrjyjo3/V7yflO1hm9DvFe9x27eE1rMCDE+7AxA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 23 Feb 2026 09:11:09 +0100
Subject: [PATCH v2 2/2] lz4: Remove a reference to the rejected
 CVE-2025-62813
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-update-patch-with-rejected-cve-v2-2-851e6f96b910@bootlin.com>
References: <20260223-update-patch-with-rejected-cve-v2-0-851e6f96b910@bootlin.com>
In-Reply-To: <20260223-update-patch-with-rejected-cve-v2-0-851e6f96b910@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, thomas.petazzoni@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
 jpewhacker@gmail.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Peter Marko <peter.marko@siemens.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231653

The CVE-2025-62813 is rejected so do not reference it anymore.
So keep the patch but without referencing the CVE identifier.

The CVE database indicates the following reason:
  This candidate was withdrawn by its CNA. Further investigation
  showed that it was not a security issue.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch}     | 1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb                                  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
similarity index 99%
rename from meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
rename to meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
index 4fa0373ff778..1527cc759124 100644
--- a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
+++ b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
@@ -4,7 +4,6 @@ Date: Mon, 31 Mar 2025 20:48:52 +0200
 Subject: [PATCH] fix(null) : improve error handlings when passing a null
  pointer to some functions from lz4frame
 
-CVE: CVE-2025-62813
 Upstream-Status: Backport [https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index f2a86036b56a..fae5796c2b9a 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -15,7 +15,7 @@ SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://reproducibility.patch \
            file://run-ptest \
-           file://CVE-2025-62813.patch \
+           file://fix-null-error-handling.patch \
 "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 

-- 
2.53.0


