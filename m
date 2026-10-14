Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B4DCC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:57:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15757.1791989871034990932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sHGRSTS2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B3141570
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 477F73F673
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791989870; bh=y02NBI4+X1ArQH/WkPWqI6B88DebZO2UdyRgFWMI4js=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sHGRSTS2OC0zNGfbPftSSOIpPPwUBAdHV1yH3MXHADQ6N5JlLDNYJPDFVc9lvpUfa
	 DRfteBwKXxBsMXiD/cTM1XaQACaCYcznDUnQjgMUcgSoTYRzliw475FE0crFGjgyxZ
	 czg91bPyNttm6oVF7kOtZ3tV5GWOoAUt9apOg1z4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] pkgconf: upgrade 3.0.7 -> 3.0.8
Date: Wed, 14 Oct 2026 15:57:43 +0100
Message-ID: <20261014145744.1818933-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014145744.1818933-1-ross.burton@arm.com>
References: <20261014145744.1818933-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247777

* Correctness and portability fixes:
  - spdxtool now percent-encodes problematic ASCII characters in
    generated SPDX URLs and URNs.
  - The built-in pc_path, pc_system_libdirs and pc_system_includedirs
    variables now use the platform path separator, fixing their output
    for multiple paths on Windows.

* Documentation and build fixes:
  - Correct the pkgconf(1) description of --variable to document that it
    prints values for every module specified on the command line.
  - Update the bug-report URL embedded by Meson builds to point to the
    pkgconf issue tracker on GitHub.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/{pkgconf_3.0.7.bb =3D> pkgconf_3.0.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.7.bb =3D> pkgconf_3.0.=
8.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.8.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
index 4579476ae4d..cd55484c30b 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519=
338f2cdfabe6940a"
+SRC_URI[sha256sum] =3D "943f0bc88bcaeceb630b00262e2a8ad5ea4fac3fba72a426=
7d8b9ec6b35d1194"
 UPSTREAM_CHECK_REGEX =3D "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
=20
 inherit autotools pkgconfig
--=20
2.43.0


