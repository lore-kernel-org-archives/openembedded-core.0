Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3119.1792487076035040005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=LYtX8MAU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BA3741A12A5
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:04:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FF0160393
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:04:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60270103289A8;
	Tue, 20 Oct 2026 11:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792487073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=coXBTaj7aaSfUAqCXZX2u3SOhlUejgfuXn7UzmWZRzU=;
	b=LYtX8MAUb926K+of0Ga3yavehekxtwdTnWtZyvgZqOX6tkDMaZE4smrH/qRGOVk3p8bHn7
	jPvUw5h45FKxF8gxRykhLPszP5qCP3rHsXgPkeid/lyGEQUIO19wpevtVWPdbMTjc+z6Y6
	3i4LIvNwd0FirnPXnCgqNCeqgHfF8jhSUQS95Av04TLFRe3W+/DVgOehmAJswjtWOTNkax
	rohQYoEzX9TmEYOR2cLU9lBlmDe9UWwkA8cr8kEtqLya9YlvcRlcilmr9KSu7fp8CYmN5G
	RNA0VuLdVHNL2dijUfJL4i/pRhomFNHeByT2Qf67sUPwiXpcE5oQ3Ccj7eAg9Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Oct 2026 11:04:24 +0200
Subject: [PATCH] python3-sphinx: update 9.1.0 -> 9.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-sphinx-9-1-1-v1-1-c05629a47a6b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOwqAMBBF0a3I1AYmwf9WxMLPqGMRJaMSEPduV
 F51incvEHJMAlV0gaOThVcboOMI+rm1EykegsGgyTQaVLLNbL0qlQ4rUWOKeVK0XQLhsjka2X+
 5uvktR7dQv78NuO8HUHMz33AAAAA=
X-Change-ID: 20261020-sphinx-9-1-1-901050748ab4
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1976;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TOdpK9ExNmn7l2bq5FLbDpPSshYDr6MwTT7Prjn+ty0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq1y6YlP69tVUChxWPpDEaXpcPvv3xbkHMn6ems
 SbeOtrznGeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCatcumAAKCRDRgEFAKaOo
 NkiOEACjk7bHdggg4phRMEaHuVFFhOod5sdfLu1UwoW2cEOQgV95GeeHgQnZ3cC/EKrVXq6Lc8H
 Q2ismOeUjKXICv+OP0wDKKM9Bc6z8O5Zprus4s8dFa5LS9eZ3tV9TLQYPcqLMB5OJ4EJegkSfCX
 zHb2Ok0Ql4Qsy54H2fq00j8KRu7Vsp66vpayDDXgS7FzwqysHDi7aXT8XbIW5NE9E8XBXvcFyoL
 RSEwekj5JeebsB+hZKwvzDTbNkFp+HHH2TTUpBuCIepglsvTG9g8FTFaoQKfhG/+GhKQMhkskjd
 5LvFMvfB4iKD3oFU8Q6w6UXzIMAuDeKEVt1iL2Wd2pi9gkgQ9exWpR3ZRkNvBuqt0lHx/KzJc4W
 1oFjd5XIvyYfThnHu4K60KMrVvoX6/MuKRgsT5cl/1Jrp5oNtmXCWmk8sNztDYQAX8hv/C58d7l
 8cgT2KfHgU8BJRa77ZFp595gBF16R4mFrcDTItf26YaIii69HpG9oWCGpWYF63QUDadu9I3emUg
 qiQsFw61D6exbrBQFVyXqPSlgZXknAR3bLXL0XtnRfx5mloKT0BVtALJq7dZMj6wEHVOU9m4MCb
 2o+n9U9/lHVbWeCHYNWndCePjaSVchKPEG4e03RhrKzOIDrv4Bhw5w4SM6vm+7mOX+n6UrWpSEl
 4miXZ1NysD6xOsQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248254

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

---
base-commit: 7993331246ac675eef1712ea7fba770518cef5b1
change-id: 20261020-sphinx-9-1-1-901050748ab4

