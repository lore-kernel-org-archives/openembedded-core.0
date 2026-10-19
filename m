Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127.1792429855070103246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 10:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jKL+Ve7N;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20BF92103
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:10:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0790A3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792429854; bh=Xzrldf3fV3/H7GnA5TZ1orJeKf7NRn+5JHECgxz1Y54=;
	h=From:To:Subject:Date:From;
	b=jKL+Ve7NIa8si7jduFCVHtsctCUJ05o0/xZmiGqQo7fSLYFSB89tB5zBYqGBSTPHy
	 ieospncj5GHVYnQ21LIjfUuIDzT5iLzHE/PJAWaT6TxpzF3KU2wCk8PkAfkpgVIfce
	 RUR/ue7pHPFpkG6BQu5GbO2qzH8Cf2OmT9SpmDbQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pkgconf: upgrade 3.0.8 -> 3.0.10
Date: Mon, 19 Oct 2026 18:10:48 +0100
Message-ID: <20261019171050.634776-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 17:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248199
Content-Type: text/plain; charset="utf-8"

No relevant changes to the code, but we can upgrade to silence AUH:

  - Update the Meson version number to 3.0.10, I forgot to do it last
    time.

  - The Autotools build now includes and runs the spdxtool utility API
    tests, ensuring that they are included in release tarballs. Patch by
    commitmaniac.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/{pkgconf_3.0.8.bb =3D> pkgconf_3.0.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.8.bb =3D> pkgconf_3.0.=
10.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.10.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
index cd55484c30b..e8746c1cebc 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "943f0bc88bcaeceb630b00262e2a8ad5ea4fac3fba72a426=
7d8b9ec6b35d1194"
+SRC_URI[sha256sum] =3D "9371b2f6372da574d4c6dc96fe9b1463037bcf6afcb6671c=
1555afde7b17e2de"
 UPSTREAM_CHECK_REGEX =3D "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
=20
 inherit autotools pkgconfig
--=20
2.43.0

