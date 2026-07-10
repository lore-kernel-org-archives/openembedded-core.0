Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35B6C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:31:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7852.1783668706897075688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=M1kQBPNe;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99BD54E40D3B;
	Fri, 10 Jul 2026 07:31:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E1C760341;
	Fri, 10 Jul 2026 07:31:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 612D311BD2603;
	Fri, 10 Jul 2026 09:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783668703; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GqskSCHwdyEGrOxcx1+YzT7NbhJwPnE0aPSSMC9NyqE=;
	b=M1kQBPNeUBziIROpFj3qjo2tgqyCGI/qntHJvVc8ITO8N9C50NjGe6+SzvuxcbjDo1CK4I
	AZUmKCPSABvHp9IlPUHNJgbUhX9jK8CFGytsb8Klq+qkkWMHcjBsK6+CH512pw0nVRGDqz
	Xy3URrya+NBpCRrP0n8ty9ThXWCSeREQxjSMu/ln/atTWAUzq3wUHXP0nzUqQU4SK0Nw2/
	bK9Fygw29Gtwg5N6c6401djgI5oD5CLN+1X6qvZ6jfEOgbHdTAxu4jISQIZ9Rildm+dYjy
	Ddp2URO+F8oiBin9EcQSexRBEbqPH9IGx3ZSnYsdRxL38bcw5kwqf/fBjz17WA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 10 Jul 2026 09:31:35 +0200
Subject: [PATCH] glib-2.0: add back Signed-off-by in CVE-2026-58016 patch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260710-glib-2-0-cve-2026-58016-master-fix-v1-1-152006542891@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCQAwAv1JyNpAsmKpfEQ/d3VgjWmXTFqH07
 271OHOYWcC1mDqcmgWKzub2GirwroF064Ze0XJlCBSEWibsHxYxIGGaFTeL+wOx4LPzUQte7YN
 yzK0ySeYoUEPvolX/JufLn32Kd03jVoZ1/QKkYwZ8hgAAAA==
X-Change-ID: 20260710-glib-2-0-cve-2026-58016-master-fix-69d7e106d1b6
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 yoann.congal@smile.fr, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240597

It had been deleted by mistake due to a lack of knowledge regarding how
to handle it.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch | 2 ++
 meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/me=
ta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index ee6321361455..2c4b248b97b7 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -13,6 +13,8 @@ Fix the check and add some unit tests for it.
 Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit te=
st
 uses example XML strings adapted from their report.
=20
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
 Fixes: #3932
=20
 CVE: CVE-2026-58016
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/me=
ta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a24e54016177..a61e35ad8a7c 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -14,6 +14,8 @@ complicated, and it=E2=80=99s possible that these deref=
erences of the
 Make failures like that more debuggable by adding an assertion on the
 length beforehand.
=20
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
 Helps: #3932
=20
 CVE: CVE-2026-58016

---
base-commit: 5a5f2ec43cbb9096f1fc52ba4c2a4f94526f103d
change-id: 20260710-glib-2-0-cve-2026-58016-master-fix-69d7e106d1b6

Best regards,
-- =20
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


