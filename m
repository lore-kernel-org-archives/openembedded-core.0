Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994D9C43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:15:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68919.1782998142347378716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tsYpuXuc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2AE514E40C31
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 13:15:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC36F5FF03;
	Thu,  2 Jul 2026 13:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97620104C9557;
	Thu,  2 Jul 2026 15:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782998139; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RkYWxL/A/PTj3Pc3qheHvxzJrE0rgWCU+/I95IZ/8gU=;
	b=tsYpuXuc0YcxDgOIFa+4XCItWf6xQ7VrZzx8v/ap9x10loWYF8DVP8+Umvabk4wxlT/FNj
	KsRML7xAxPmjvcq0giMIgZPC+RKaTTQPVQV2TTuqJ7biaFxjK89n6j014oCccLoSMW8yUc
	cUmbyLo8I7QFLL3pEnr7ijW9MHd9X572AnZR3K/uG6I9/WH7EJ5H4BrqiNOL184hnWnNCy
	mdbwsSlT3X98CgByrDOKgyWc3hxPhE1lG0Uk+bO4gJpchueHho+4EcMxEXXzEwuahMjnVq
	ce10pEIenTsYc8Y4X6qhdmK+dXHQpUhEhQoS1Am/js0wH73DypUmJlXWMQ5JrA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Thu, 02 Jul 2026 15:15:37 +0200
Subject: [scarthgap][PATCH] openssh: CVE-2026-35387 patch also fixes
 CVE-2026-35414
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-openssh-cve-2026-35414-v1-1-bb863c2c82f5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBCF4Vchs3aS3rDqqxAWtY50XJSmg8SE8
 O4WXX4nOf8GQpVJ4NZtUGll4Tk36FMHMYU8EfKjGYwyZ+WVwblQFkkYV8JjRNs77VB5d3W+t/p
 iA7RzqfTkzy88jH/L+/6iuBy1QWKoS5pCGWHfv52XmlCFAAAA
X-Change-ID: 20260702-openssh-cve-2026-35414-07494753183a
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240046

An explanation can be found on debian repository:
https://salsa.debian.org/ssh-team/openssh/-/commit/ae190b6440b7c599d759527965334eeb49cc75b3

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../{CVE-2026-35387.patch => CVE-2026-35414-CVE-2026-35387.patch}       | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
rename to meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
index c4806bd9935c..4839d76fa808 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
@@ -14,7 +14,7 @@ Reported by Christos Papakonstantinou of Cantina and Spearbit.
 
 OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
 
-CVE: CVE-2026-35387
+CVE: CVE-2026-35414 CVE-2026-35387
 Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa]
 Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
 ---
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ea158b56b419..4193bc8a5b41 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -35,7 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984_CVE-2026-35386.patch \
            file://CVE-2026-35385.patch \
-           file://CVE-2026-35387.patch \
+           file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"

---
base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
change-id: 20260702-openssh-cve-2026-35414-07494753183a

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


