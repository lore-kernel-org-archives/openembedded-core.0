Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E35CC52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11938.1722962249452362410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC11EFEC
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A98B13F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] python3-pathlib2: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:17 +0100
Message-Id: <20240806163723.2186196-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203031

This recipe is a backport of pathlib intended for older releases of
Python but as we have a modern release of Python it shouldn't be needed.

There are no users in oe-core, so move to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc             |  1 -
 .../python/python3-pathlib2_2.3.7.bb                 | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pathlib2_2.3.7.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index cf9fda812f7..dcab241f6be 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -661,7 +661,6 @@ RECIPE_MAINTAINER:pn-python3-more-itertools =3D "Tim =
Orling <tim.orling@konsulko.c
 RECIPE_MAINTAINER:pn-python3-ndg-httpsclient =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-numpy =3D "Trevor Gamblin <tgamblin@baylibr=
e.com>"
 RECIPE_MAINTAINER:pn-python3-packaging =3D "Tim Orling <tim.orling@konsu=
lko.com>"
-RECIPE_MAINTAINER:pn-python3-pathlib2 =3D "Tim Orling <tim.orling@konsul=
ko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec =3D "Ross Burton <ross.burton@arm.=
com>"
 RECIPE_MAINTAINER:pn-python3-pbr =3D "Zang Ruochen <zangruochen@loongson=
.cn>"
 RECIPE_MAINTAINER:pn-python3-pip =3D "Zang Ruochen <zangruochen@loongson=
.cn>"
diff --git a/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb b/met=
a/recipes-devtools/python/python3-pathlib2_2.3.7.bb
deleted file mode 100644
index d4de40893a6..00000000000
--- a/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "Object-oriented filesystem paths"
-HOMEPAGE =3D "https://github.com/mcmtroffaes/pathlib2"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D2dc08586cce3ab91bfa091b65=
5c0e440"
-
-SRC_URI[sha256sum] =3D "7a4329d67beff9a712e1d3ae147e4e3e108b0bfd284ffdea=
03a635126c76b3c0"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} +=3D "python3-six python3-ctypes"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


