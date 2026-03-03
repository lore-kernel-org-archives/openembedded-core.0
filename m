Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635D2EDA6A0
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:46:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23211.1772556403261788129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 08:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=A0D5a3Nl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 800C0C40FA2;
	Tue,  3 Mar 2026 16:46:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2AE45FF29;
	Tue,  3 Mar 2026 16:46:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4431C10369754;
	Tue,  3 Mar 2026 17:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772556401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rscriIN/sYgct4EiFiQwUCos0wGBbHF55SJPCb0rUuI=;
	b=A0D5a3Nl4G0sw/2db8FB21+tWHTkmzj4W0xJXI/dx/iTpN8ox2RuJDwnILclLewss+HNwQ
	Bw4zlBkGv87ySCl88NkRbYJu0aBaqFcWKRqPHsaCSHVaL8zbZQe0imBX5Kj3u4dRNgb2dm
	X0FTVouoMY2SYvHJu+8tdxN/vOiJzqTM3EyA9GlLsIOb4/IO/Ja/DyRpzOYJljBHeJ6Xg1
	Q51Wr3+99AWF4831Eq+MDT3o6cdr2zdYZqvG+hVsssjOiGmMjz9OmwvjrQbRt8riEHsQ9j
	hPlWfHhfzKJxC98bpWA0CWHEuLZMX3MFwZFN5w3LZG0cX1x6RiNgl2nv0+AJjA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Tue, 03 Mar 2026 17:46:16 +0100
Subject: [PATCH scarthgap 2/3] lz4: Remove a reference to the rejected
 CVE-2025-62813
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260303-backport-fixes-scarthgap-v1-2-2dc803f921a9@bootlin.com>
References: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
In-Reply-To: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org, 
 JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232327

The CVE-2025-62813 is rejected so do not reference it anymore.
So keep the patch but without referencing the CVE identifier.

The CVE database indicates the following reason:
  This candidate was withdrawn by its CNA. Further investigation
  showed that it was not a security issue.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
(cherry picked from commit 9c840a69b62a5fdffb3679a44d68dd5630b2916c)
---
 .../lz4/files/{CVE-2025-62813.patch =3D> fix-null-error-handling.patch} =
  | 1 -
 meta/recipes-support/lz4/lz4_1.9.4.bb                                   =
| 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/r=
ecipes-support/lz4/files/fix-null-error-handling.patch
similarity index 99%
rename from meta/recipes-support/lz4/files/CVE-2025-62813.patch
rename to meta/recipes-support/lz4/files/fix-null-error-handling.patch
index bbd0f74541a0..14019360343d 100644
--- a/meta/recipes-support/lz4/files/CVE-2025-62813.patch
+++ b/meta/recipes-support/lz4/files/fix-null-error-handling.patch
@@ -8,7 +8,6 @@ Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
 Upstream-Status: Backport [Upstream commit https://github.com/lz4/lz4/co=
mmit/f64efec011c058bd70348576438abac222fe6c82]
-CVE: CVE-2025-62813
=20
 Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
 ---
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support=
/lz4/lz4_1.9.4.bb
index 8c96f9bab424..fdf0263080dc 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -14,7 +14,7 @@ SRCREV =3D "5ff839680134437dbf4678f3d0c7b371d84f4964"
=20
 SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dht=
tps \
            file://run-ptest \
-           file://CVE-2025-62813.patch \
+           file://fix-null-error-handling.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
=20

--=20
2.53.0


