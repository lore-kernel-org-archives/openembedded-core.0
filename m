Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A02CC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:44:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6819.1789721074791029487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oC213xXB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89F82168F
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 01:44:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B54C93F86F
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789721074; bh=hnTnLGaZ9yD/C77faCr2jvdZyybTauraWS5QCcDDBH0=;
	h=From:To:Subject:Date:From;
	b=oC213xXBF51Bp5y6YRJExI8pNaY4U4N33oQLRHK5IntMTZvnQa8Lozau+lyo81aKt
	 7+K8ouGNMUQkwCWwVHQVsLSiesKyYfkkf9Fe0/FN5Lot1RQIz3iIwHi94ILKNjv2Gm
	 TRhl8Vr7xdg9LvqKRqNgCts/QB5uprv41KiPQyTw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-hatchling: upgrade 1.32.0 -> 1.32.3
Date: Fri, 18 Sep 2026 09:44:29 +0100
Message-ID: <20260918084430.2076213-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246200

Upstream changes:

- Preserve the version string exactly as written in core metadata, so
  stylized versions such as CalVer 2026.08.10 are no longer stripped of
  leading zeros. Distribution file names and .dist-info directories
  continue to use the PEP 440 normalized form.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.32.0.bb =3D> python3-hatchling_1.32.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.32.0.bb =3D> py=
thon3-hatchling_1.32.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.32.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.32.3.bb
index e0c82ff3677..a6e683c1009 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.32.3.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
=20
 DEPENDS +=3D "python3-packaging-native python3-pathspec-native python3-p=
luggy-native python3-tomlkit-native python3-trove-classifiers-native"
=20
-SRC_URI[sha256sum] =3D "0bdbde4a52b06c37e3eca395f85a762bf0ef06fe374fd8ae=
429dc6be10230f5f"
+SRC_URI[sha256sum] =3D "acdd4436d84d829c6e7ae6df723241d8f0bca9c5bad5a614=
8bd41f2ea6b8a792"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


