Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B5EC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:28:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.24149.1657729706659027437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3AD01C01;
	Wed, 13 Jul 2022 09:28:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42A43F792;
	Wed, 13 Jul 2022 09:28:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/8] python3-picobuild: add new recipe
Date: Wed, 13 Jul 2022 17:28:17 +0100
Message-Id: <20220713162821.974801-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713162821.974801-1-ross.burton@arm.com>
References: <20220713162821.974801-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167969

Picobuild is a pico-scale Python PEP517 build frontend, designed to have
minimal dependencies (via vendoring) to be well suited for building
source-based distributions, such as OpenEmbedded.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-picobuild_0.1.bb           | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-picobuild_0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index a69af3d7805..ac1a1ea1a79 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -638,6 +638,7 @@ RECIPE_MAINTAINER:pn-python3-packaging =3D "Tim Orlin=
g <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 =3D "Tim Orling <tim.orling@konsul=
ko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec =3D "Ross Burton <ross.burton@arm.=
com>"
 RECIPE_MAINTAINER:pn-python3-pbr =3D "Zang Ruochen <zangrc.fnst@fujitsu.=
com>"
+RECIPE_MAINTAINER:pn-python3-picobuild =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-pip =3D "Zang Ruochen <zangrc.fnst@fujitsu.=
com>"
 RECIPE_MAINTAINER:pn-python3-pluggy =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-python3-ply =3D "Tim Orling <tim.orling@konsulko.co=
m>"
diff --git a/meta/recipes-devtools/python/python3-picobuild_0.1.bb b/meta=
/recipes-devtools/python/python3-picobuild_0.1.bb
new file mode 100644
index 00000000000..7555d97f91a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-picobuild_0.1.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Library and tool for installing Python wheels"
+HOMEPAGE =3D "https://gitlab.com/rossburton/picobuild"
+LICENSE =3D "MIT & ( Apache-2.0 | BSD-2-Clause)"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6c811a9fbdf5641ff0b0d43fbbb44=
0e5 \
+                    file://picobuild/vendored/packaging/LICENSE.APACHE;m=
d5=3D2ee41112a44fe7014dce33e26468ba93 \
+                    file://picobuild/vendored/packaging/LICENSE.BSD;md5=3D=
7bef9bf4a8e4263634d0597e7ba100b8 \
+                    file://picobuild/vendored/pep517/LICENSE;md5=3Daad69=
c93f605003e3342b174d9b0708c \
+                    file://picobuild/vendored/pyparsing/LICENSE;md5=3D65=
7a566233888513e1f07ba13e2f47f1 \
+                    file://picobuild/vendored/tomli/LICENSE;md5=3Daaaaf0=
879d17df0110d1aa8c8c9f46f5 \
+                    "
+
+SRC_URI =3D "git://gitlab.com/rossburton/picobuild.git;protocol=3Dhttps;=
branch=3Dmain"
+SRCREV =3D "3441d5500a5ad23a44027576cf5261c3b7c1d6b0"
+PV .=3D "+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+inherit python_flit_core
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


