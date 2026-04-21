Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F09F8FA6D
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 12:18:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26159.1776773893316730591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 05:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JIKk7iC9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2635322E6
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:18:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 63E843F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776773892; bh=ILXq7HQiTJ9GWZrmNs+ZDXOftFBj4bd2apQaQGe3o7g=;
	h=From:To:Subject:Date:From;
	b=JIKk7iC9A4PHePuH1c6YRMRiaOHIIZRON1513wtzAmPwRiVJAudI0iVVLXID/gRbl
	 KuSzVQs4wRjAr9L64GFd66HP7EL6Bg79vUU/4IGi1dzCkPIJ6bMRBkFpajqCQHZ86w
	 QIKW3J2MicpMgjFGzFOHnmq3p5/8QKz54s0Cihfk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.2.0 -> 1.2.1
Date: Tue, 21 Apr 2026 13:18:08 +0100
Message-ID: <20260421121808.3992301-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 12:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235674

Changelog:

- d7b646d database: cvelist: check for vendor when using packageName
- 2854399 spdx3: Prepare code to be compatible with shacl2code >=3D 1.0.0
- fe63ba9 pyproject: require spdx_python_model version 0.0.4 explicitly

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-sbom-cve-check_1.2.0.bb =3D> python3-sbom-cve-check_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.2.=
0.bb =3D> python3-sbom-cve-check_1.2.1.bb} (84%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_=
1.2.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.=
2.1.bb
similarity index 84%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1=
.2.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2=
.1.bb
index 2a09d8ea4c3..6717874998e 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.b=
b
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.1.b=
b
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D570a9b3749dd0463a1778803b12a6=
dce"
=20
 PYPI_PACKAGE =3D "sbom_cve_check"
-SRC_URI[sha256sum] =3D "0b01474c541fb4b9d29d36f86fae6d0f27ff2b991fcb59b2=
fbeb70c1eaa09664"
+SRC_URI[sha256sum] =3D "d7dfca05cf0cee6b439802fe10689790b9395d436d0d9af6=
170e23603c2ea5cb"
=20
 SRC_URI +=3D "file://0001-export_yocto-use-correct-type-for-the-version-=
attrib.patch"
=20
--=20
2.43.0


