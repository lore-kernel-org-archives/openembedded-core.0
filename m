Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
 by mx.groups.io with SMTP id smtpd.web12.491.1622138788652506245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 11:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: nod.at, ip: 109.75.188.150, mailfrom: richard@nod.at)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 09ACA1817A0D5;
	Thu, 27 May 2021 20:06:27 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
	by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id A7lkJAO0XiHz; Thu, 27 May 2021 20:06:26 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
	by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dE3-X16fV44z; Thu, 27 May 2021 20:06:26 +0200 (CEST)
From: "Richard Weinberger" <richard@nod.at>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] erofs fixups
Date: Thu, 27 May 2021 20:06:20 +0200
Message-Id: <20210527180620.17441-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

- Rename to erofs-utils_1.2.1.bb and don't set PV
- Set correct package license
- Add lz4 and lz4hc variants to IMAGE_TYPES
- Add myself as package maintainer

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta/classes/image_types.bbclass                               | 2 +-
 meta/conf/distro/include/maintainers.inc                       | 2 +-
 .../erofs-utils/{erofs-utils_git.bb =3D> erofs-utils_1.2.1.bb}   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_git.bb =3D> erofs-=
utils_1.2.1.bb} (95%)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 4e95e0e2935e..2a45d45c7180 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -269,7 +269,7 @@ IMAGE_TYPES =3D " \
     wic wic.gz wic.bz2 wic.lzma wic.zst \
     container \
     f2fs \
-    erofs \
+    erofs erofs-lz4 erofs-lz4hc \
 "
=20
 # Compression is a special case of conversion. The old variable
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 7a9c0a776e19..57742fe5acaa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -171,7 +171,7 @@ RECIPE_MAINTAINER_pn-ell =3D "Zang Ruochen <zangrc.fn=
st@fujitsu.com>"
 RECIPE_MAINTAINER_pn-enchant2 =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings =3D "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
-RECIPE_MAINTAINER_pn-erofs-utils =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
+RECIPE_MAINTAINER_pn-erofs-utils =3D "Richard Weinberger <richard@nod.at=
>"
 RECIPE_MAINTAINER_pn-ethtool =3D "Changhyeok Bae <changhyeok.bae@gmail.c=
om>"
 RECIPE_MAINTAINER_pn-eudev =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_git.bb b/meta/=
recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
similarity index 95%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_git.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
index f0cc8032b02c..6435fea68cee 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_git.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
@@ -1,10 +1,9 @@
 SUMMARY =3D "Tools for erofs filesystems"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPLv2+"
 SECTION =3D "base"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94fa01670a2a8f2d3ab2de15004e0=
848"
 HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erof=
s-utils.git/tree/README"
=20
-PV =3D "1.2.1"
 SRCREV =3D "d1f4953edfcf4f51c71ba91586e21fc6ce9f6db9"
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-u=
tils.git"
=20
--=20
2.26.2

