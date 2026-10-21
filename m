Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5956.1792566763833474350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Od2WyoEa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C7B184E41294
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96AE160763
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E44DB10328D20;
	Wed, 21 Oct 2026 09:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792566761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=61uvyXVoNhvm+mLpTuN4cLkgEpwa2zD4E98GKPTeHyE=;
	b=Od2WyoEaxjbVDeEemWP2//KJ0Id5iigaNNpOfk4Y+0q7xqsp7XZYToY5w2M3tPl1JyPbld
	YMOvmlfLcTW+RGfkLklHV4scBVXBjbe7KiNI6T7KTE42jE6bYVW0kfBvXAEc3nIi36iytH
	J2VNXIV3GFWII7fqMFVCbIGbgjU40+dR45X+Oac9EXS/ZY38YPctK0xKAThss9H2Jsmewh
	5xwbpWBxF4mvLzlvAGDPG+SCrsgF37YhWz5CNkQp3lUzQlxa93bMXHFfoz3++/Iq64cELb
	cHlNshlYBE/2Ca8vsetkfCPiUUtCDGCTDsqijU58zkX7adMmDgV3EP4yjrkD4A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 21 Oct 2026 09:12:17 +0200
Subject: [PATCH v2 1/2] python3-sphinx: update 9.1.0 -> 9.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-sphinx-9-1-1-v2-1-d6414fff7bef@bootlin.com>
References: <20261021-sphinx-9-1-1-v2-0-d6414fff7bef@bootlin.com>
In-Reply-To: <20261021-sphinx-9-1-1-v2-0-d6414fff7bef@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4yvy34WN5iEHMv/kqwBdt4lnTmfN0PblJAYPnwbuYdg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2GXZtlQ9m1aamllvBteNu5gknd2YHET9CSDvP
 8vR8OSJEnqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCathl2QAKCRDRgEFAKaOo
 Np9zD/9lLxB6wng6SMxLV7vAx0KxsPycKNaRBJXYoqTCqxdHS5echCvJ2qjhjAvHrmnBaukypWZ
 xomzQYd7t2V3r2mcfuwKZkrOD5lp4n/ilML297vZEezM8Wn943Yv2K4bIPpk7eP+j9Mfl3Rz6W0
 oY3fi1Kf0IBwQIvLOLB0zec2Md0ra+H/LwlqCEROkBFYvnKFkb/Jk77XpEBTVpvk/J/usq/YRpJ
 vhrrulgSYXsISvN1mo8OSi+EUWccWXCbGwMmqwJDgON/XWDZwfs5AGRM0gc0yq6UE64NBdQjXiU
 aXZdwN3RW1dJUqjHBWFNz9/5vhm+vtdYHtFHWUdAnCMBJZ+I/GA6ukZBY1osytv4fQcVK0A918w
 lb9jpekwTQPkpYulYzP0+b9WeZDKnjlZa3yIS1Jedj5g31p8i6Evc74Cbcj/T78agvv0w/Nl4NA
 WurqJJ+dO/zFXLEa6ISEFjs1ITgA7H+8+9267fobO9trp2ccavxCJCwe39ofSOrUyhzC1xKl5uf
 ApKipHsQ609cpjEYm0coBpCmGQNkMWFXtHs47EIkVyirTgLt0z+N1seama8gMY/4X5yoa4sRHpI
 bFZxL07MfXd7LJm8NS/KBBUNaO+TY7mJ9XILB8zRoM+SEMeB+m6ESfAs5TI3AgGu0vsADt1bfRq
 BQcRpzHVy1OtcMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248368

Changelog:

- LaTeX: PDF build crash since LaTeX June 2026 release if tables are
  styled with 'colorrows' (which is the default). Patch by Jean-Fran=C3=A7=
ois
  B.
- Fix JavaScript search for languages whose stemmer class name does not
  match the language name, such as Chinese (which reuses the English
  stemmer) and Dutch (which uses the Dutch Porter stemmer). Patch by
  Hugo van Kemenade.
- Fixed support for Python 3.16 alpha 0 (changes in the enum module).
  Patch by Adam Turner.

Tested a buildtools-docs-tarball and an HTML documentation build with it
with no issues.

License-Update: only a year change from 2025 to 2026
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../python/{python3-sphinx_9.1.0.bb =3D> python3-sphinx_9.1.1.bb}       =
| 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/=
recipes-devtools/python/python3-sphinx_9.1.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
index 44ed739fc9..36aed3a155 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
@@ -2,9 +2,9 @@ SUMMARY =3D "Python documentation generator"
 HOMEPAGE =3D "http://sphinx-doc.org/"
 SECTION =3D "devel/python"
 LICENSE =3D "BSD-2-Clause AND MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3De30c37a2b7fb0afa3adc0d72b=
85e8b04"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D00d5910f77dc7db0f754b71c3=
c11317b"
=20
-SRC_URI[sha256sum] =3D "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4=
df5404da95930ddb"
+SRC_URI[sha256sum] =3D "48b627f02908f22c601b3ba9c7b17265b4f315dd05c8bc64=
cd4da41183f44fbc"
=20
 SRC_URI +=3D "file://0001-Revert-singlehtml-deprecate-the-fix_refuris-he=
lper-f.patch"
=20

--=20
2.55.0

