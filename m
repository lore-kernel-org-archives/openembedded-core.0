Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6888C52D73
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11939.1722962251147426192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F44BFEC
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DFEA3F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] pytest-runner: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:20 +0100
Message-Id: <20240806163723.2186196-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163723.2186196-1-ross.burton@arm.com>
References: <20240806163723.2186196-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203034

This is a deprecated package so rarely used now.

The last user in core was python3-chardet, removed in 55b49e9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 -
 .../python/python3-pytest-runner_6.0.1.bb         | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pytest-runner_6.=
0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index b0bc22ccfa3..87a3fdcfa60 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -680,7 +680,6 @@ RECIPE_MAINTAINER:pn-python3-pyparsing =3D "Trevor Ga=
mblin <tgamblin@baylibre.com>
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-pytest =3D "Trevor Gamblin <tgamblin@baylib=
re.com>"
-RECIPE_MAINTAINER:pn-python3-pytest-runner =3D "Tim Orling <tim.orling@k=
onsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-pyyaml =3D "Tim Orling <tim.orling@konsulko=
.com>"
diff --git a/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb =
b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
deleted file mode 100644
index e5e5e048bd4..00000000000
--- a/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Invoke py.test as distutils command with dependency resolut=
ion"
-HOMEPAGE =3D "https://pypi.org/project/pytest-runner/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e068206290f3fe9f8d6c713=
ea6"
-
-SRC_URI[sha256sum] =3D "70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb=
3316c88882f0f49b"
-
-inherit pypi python_setuptools_build_meta
-
-DEPENDS +=3D " \
-    python3-setuptools-scm-native"
-
-RDEPENDS:${PN} =3D "python3-setuptools python3-debugger python3-json pyt=
hon3-io"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


