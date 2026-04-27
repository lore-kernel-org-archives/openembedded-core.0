Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8CAFF8870
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 20:46:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5990.1777322809579212451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 13:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tbbInC6v;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4083C497
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CE9E3F763
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777322808; bh=AIm4iRRIaZDt/DNKYgYmnNy+wP3i13flbHQQyRVIjHI=;
	h=From:To:Subject:Date:From;
	b=tbbInC6vG5SbUti72wR+OJJ5Q9nOKrRpO796lV3ZHp27AsNrII+zX11MwlB4DU423
	 yfIGQRBdHKCHoTP9QaLs2IVycvZz6VQvKzqzXJhTcNCsCcI8cNX2s/7KQoM11mf3mv
	 9XZyxOPHKmg03WpWJSNiS68l7VRCJmcPJEmvlS9M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] p11-kit: remove obsolete compile error workaround
Date: Mon, 27 Apr 2026 21:46:37 +0100
Message-ID: <20260427204640.2003231-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 20:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236021

I couldn't replicate this compile error from 2024 so it's presumably no
longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.2.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.26.2.bb
index 5f553f11bbb..aa8b28e0e71 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -33,14 +33,4 @@ INSANE_SKIP:${PN} =3D "dev-so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-# # This one is reproducible only on 32bit MACHINEs
-# http://errors.yoctoproject.org/Errors/Details/766969/
-# git/p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_=
asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
-# git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_=
asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
-# git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_=
asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
-# git/p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_=
asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
-# git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_=
asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
-# git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_=
asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
-
 CVE_STATUS[CVE-2026-2100] =3D "fixed-version: fixed since 0.26.2"
--=20
2.43.0


