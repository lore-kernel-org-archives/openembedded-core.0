Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4214.1630675506386042163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F2B1D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB5843F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] libxfont: set precise BSD license
Date: Fri,  3 Sep 2021 14:24:52 +0100
Message-Id: <20210903132459.2560051-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Note that the actual license text is BSD 4-Clause with clause 3 rescinded=
:

https://gitlab.freedesktop.org/xorg/lib/libxfont/-/blob/master/COPYING#L1=
57

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/reci=
pes-graphics/xorg-lib/libxfont_1.5.4.bb
index 94c6c66e878..f04780cf046 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -6,7 +6,7 @@ such as freetype)."
=20
 require xorg-lib-common.inc
=20
-LICENSE =3D "MIT & MIT-style & BSD"
+LICENSE =3D "MIT & MIT-style & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da46c8040f2f737bcd0c435feb2ab1=
c2c"
=20
 DEPENDS +=3D "freetype xtrans xorgproto libfontenc zlib"
--=20
2.25.1

