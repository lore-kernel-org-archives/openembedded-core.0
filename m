Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC138C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11877.1722962252016726093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72BFEFEC
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61D163F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] python3-toml: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:22 +0100
Message-Id: <20240806163723.2186196-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163723.2186196-1-ross.burton@arm.com>
References: <20240806163723.2186196-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203036

There are no potential users of this recipe now that importlib_metadata
has been removed, and importlib_metadata used tomllib anyway.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 -
 .../python/python3-toml_0.10.2.bb                 | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-toml_0.10.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 90fde4f8546..33ce99e4e2f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -711,7 +711,6 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializin=
ghtml =3D "Tim Orling <tim.or
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme =3D "Tim Orling <tim.orlin=
g@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-subunit =3D "Trevor Gamblin <tgamblin@bayli=
bre.com>"
 RECIPE_MAINTAINER:pn-python3-testtools =3D "Trevor Gamblin <tgamblin@bay=
libre.com>"
-RECIPE_MAINTAINER:pn-python3-toml =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-tomli =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D "Trevor Gamblin <tgam=
blin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-toml_0.10.2.bb b/meta/r=
ecipes-devtools/python/python3-toml_0.10.2.bb
deleted file mode 100644
index 649464b961b..00000000000
--- a/meta/recipes-devtools/python/python3-toml_0.10.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Python Library for Tom's Obvious, Minimal Language"
-HOMEPAGE =3D "https://github.com/uiri/toml"
-LICENSE =3D "MIT"
-SECTION =3D "devel/python"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D16c77b2b1050d2f03cb9c2ed0edaf=
4f0"
-
-SRC_URI[sha256sum] =3D "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200=
bded2f839ccbe68f"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-RDEPENDS:${PN} +=3D " \
-    python3-misc \
-"
--=20
2.34.1


