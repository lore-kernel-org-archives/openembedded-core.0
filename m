Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F00CC52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11875.1722962250408374980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF568FEC
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE3303F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] python3-py: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:19 +0100
Message-Id: <20240806163723.2186196-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163723.2186196-1-ross.burton@arm.com>
References: <20240806163723.2186196-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203033

The last user in core was pytest, removed in 0aee9a.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 -
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 14 --------------
 2 files changed, 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-py_1.11.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9da07540ce2..b0bc22ccfa3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -669,7 +669,6 @@ RECIPE_MAINTAINER:pn-python3-ply =3D "Tim Orling <tim=
.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-poetry-core =3D "Tim Orling <tim.orling@kon=
sulko.com>"
 RECIPE_MAINTAINER:pn-python3-pretend =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-psutil =3D "Tim Orling <tim.orling@konsulko=
.com>"
-RECIPE_MAINTAINER:pn-python3-py =3D "Tim Orling <tim.orling@konsulko.com=
>"
 RECIPE_MAINTAINER:pn-python3-pyasn1 =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo =3D "Zang Ruochen <zangruochen@loon=
gson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser =3D "Tim Orling <tim.orling@konsu=
lko.com>"
diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/rec=
ipes-devtools/python/python3-py_1.11.0.bb
deleted file mode 100644
index 31d5a377a7e..00000000000
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Library with cross-python path, ini-parsing, io, code, log =
facilities"
-HOMEPAGE =3D "http://py.readthedocs.io/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6bb0320b04a0a503f12f69fea479=
de9"
-
-SRC_URI[sha256sum] =3D "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa=
41e558e6f4a98719"
-
-DEPENDS +=3D "python3-setuptools-scm-native"
-
-inherit pypi python_setuptools_build_meta
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-RDEPENDS:${PN} +=3D "python3-netclient"
--=20
2.34.1


