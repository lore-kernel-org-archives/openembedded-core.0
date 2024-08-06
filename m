Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79C8C52D73
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11878.1722962252543548665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02801FEC
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5C0B3F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] python3-tomli: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:23 +0100
Message-Id: <20240806163723.2186196-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163723.2186196-1-ross.burton@arm.com>
References: <20240806163723.2186196-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203037

Most packages use tomllib and fall back to tomli. The last user in core
was python3-setuptools-scm, removed in 5c8a0a2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 -
 .../python/python3-tomli_2.0.1.bb              | 18 ------------------
 2 files changed, 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-tomli_2.0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 33ce99e4e2f..0875b2cbd31 100644
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
-RECIPE_MAINTAINER:pn-python3-tomli =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D "Trevor Gamblin <tgam=
blin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify =3D "Alexander Kanavin <alex.kana=
vin@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb b/meta/r=
ecipes-devtools/python/python3-tomli_2.0.1.bb
deleted file mode 100644
index 9401ed897fb..00000000000
--- a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "A lil' TOML parser"
-DESCRIPTION =3D "Tomli is a Python library for parsing TOML. Tomli is fu=
lly \
-compatible with TOML v1.0.0."
-HOMEPAGE =3D "https://github.com/hukkin/tomli"
-BUGTRACKER =3D "https://github.com/hukkin/tomli/issues"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daaaaf0879d17df0110d1aa8c8c9f4=
6f5"
-
-inherit pypi python_flit_core
-
-SRC_URI[sha256sum] =3D "de526c12914f0c550d15924c62d72abc48d6fe7364aa8732=
8337a31007fe8a4f"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-RDEPENDS:${PN} +=3D " \
-    python3-datetime \
-    python3-stringold \
-"
--=20
2.34.1


