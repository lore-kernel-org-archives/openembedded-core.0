Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7734.1794563611922899422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OB+iL6fp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 246D21595
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 01:53:28 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C09763F85F
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794563611; bh=k+sPtz9JyiXaQtGU8vPZ9LYy2cdBuBkhdOxpcFSElgg=;
	h=From:To:Subject:Date:From;
	b=OB+iL6fpSMkedBZcnKouFCveA2o0SFjjQo55vnTq3Vbmt2MvMuxGP26RlmBHXYxOg
	 Jcb7VGgBaCqfdoCP1DOoLZnkE0d/A5GLexwTBvXSJnY9MT+Q6gGywkwnEp4apzyVCX
	 7FGULjHsg+I0XEwwvWNVItRgSokRygPLOaLd8ou4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-subunit: remove redundant PYPI_PACKAGE_SDIST
Date: Fri, 13 Nov 2026 09:53:25 +0000
Message-ID: <20261113095325.4075909-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 09:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250155
Content-Type: text/plain; charset="utf-8"

This is the default value, so remove the assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-subunit_1.4.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.6.bb b/meta=
/recipes-devtools/python/python3-subunit_1.4.6.bb
index 809aa7309a1..2a7de882a38 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.6.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.6.bb
@@ -5,7 +5,6 @@ LICENSE =3D "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D1;endline=3D20;md5=3Db1=
121e68d06c8d9ea544fcd895df0d39"
=20
 PYPI_PACKAGE =3D "python-subunit"
-PYPI_PACKAGE_SDIST =3D "python_subunit"
=20
 SRC_URI[sha256sum] =3D "31fe6a7b35550b0d72da98caaa6ba64c547d9346c2846b84=
5cb5c781849e2762"
=20
--=20
2.43.0

