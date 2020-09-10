Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.10591.1599697674356891287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: saul.wold@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08A0Rnww008366
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 9 Sep 2020 17:27:50 -0700 (PDT)
Received: from soho-swold-l2.localdomain (147.11.14.8) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Sep 2020 17:27:48 -0700
From: "Saul Wold" <Saul.Wold@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
CC: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH] gnupg: uprev 2.2.22 -> 2.2.23
Date: Wed, 9 Sep 2020 17:27:48 -0700
Message-ID: <20200910002748.3160313-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 08A0Rnww008366
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Saul Wold <sgw@linux.intel.com>

This addresses CVE-2020-25125 and provides some other minor
updates and translations.

Updated commits for reference:
  e234d04c3 Werner Koch Release 2.2.23
  aeb8272ca Werner Koch gpg: Fix AEAD preference list overflow
  038314665 Werner Koch po: auto update
  1a4b0fd79 Yuri Chornoivan po: Update Ukrainian translation
  93d10403a Jakub Bogusz po: Update Polish translation
  a8a8105bc Werner Koch po: Add key-check.c to the list of translatable s=
ources.
  cad9955ac Petr Pisar po: Update Czech translation.
  896c528ba Werner Koch gpg: Fix segv importing certain keys.
  0a9665187 NIIBE Yutaka scd: Fix a regression for OpenPGP card.
  bcae9cd4e Nagy Ferenc L=C3=A1szl=C3=B3 po: Minor update to the Hungaria=
n translation.
  d2fe2ffd7 Werner Koch sm: Fix a bug in the rfc2253 parser
  f799b3ddb Werner Koch Post release updates

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.22.bb =3D> gnupg_2.2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.22.bb =3D> gnupg_2.2.23.bb}=
 (96%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.22.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.2.23.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.2.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.23.bb
index 161add79f4..c624b67a0b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.23.bb
@@ -20,7 +20,7 @@ SRC_URI_append_class-native =3D " file://0001-configure=
.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "7c1370565e1910b9d8c4e0fb57b9de34aa062ec7bb91abad=
5803d791f38d855b"
+SRC_URI[sha256sum] =3D "10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f=
486ed23d1cd1da5c"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \
--=20
2.25.1

