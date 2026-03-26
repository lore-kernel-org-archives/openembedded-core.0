Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB7C10A88ED
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53746.1774545341314471823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=o1csq2zx;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7EC2C43
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:15:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9605E3F641
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774545340; bh=GULrptl5vjFt9SsMAWcb/5LktcaPjJQ/CqV2ihEY19M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o1csq2zx2ozs+Slab3P5reeT7dNWptygxMe0UrBUu0Qk9bxb6QPxUTc928cdNz0m6
	 vjGJYTY5fszeZWwmelazH61t7ybZJoLSAWFtWlkx9D0+JzsUt2OLwyXmeFjf/YwXkd
	 90ny0nNnofp7bxPGfAvRNDl0DdGiIVrOnmdICD3s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-pyzstd: remove recipe
Date: Thu, 26 Mar 2026 17:15:34 +0000
Message-ID: <20260326171536.2014116-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171536.2014116-1-ross.burton@arm.com>
References: <20260326171536.2014116-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 17:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234032

There are no users of this in oe-core and Python 3.14 has built-in
support for zstd, so remove the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc        |  1 -
 meta/conf/distro/include/ptest-packagelists.inc |  1 -
 .../python/python3-pyzstd_0.19.1.bb             | 17 -----------------
 3 files changed, 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index f9a600ff114..9acf2da0a67 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -707,7 +707,6 @@ RECIPE_MAINTAINER:pn-python3-pytest =3D "Trevor Gambl=
in <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-pyyaml =3D "Tim Orling <tim.orling@konsulko=
.com>"
-RECIPE_MAINTAINER:pn-python3-pyzstd =3D "Koen Kooi <koen.kooi@oss.qualco=
mm.com>"
 RECIPE_MAINTAINER:pn-python3-rdflib =3D "Wang Mingyu <wangmy@fujitsu.com=
>"
 RECIPE_MAINTAINER:pn-python3-referencing =3D "Trevor Gamblin <tgamblin@b=
aylibre.com>"
 RECIPE_MAINTAINER:pn-python3-requests =3D "Tim Orling <tim.orling@konsul=
ko.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index a2d7a56e791..31fd5ae7ce6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -85,7 +85,6 @@ PTESTS_FAST =3D "\
     python3-pyasn1 \
     python3-pytz \
     python3-pyyaml \
-    python3-pyzstd \
     python3-rpds-py \
     python3-trove-classifiers \
     python3-uritools \
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.19.1.bb
deleted file mode 100644
index ccf37eacf33..00000000000
--- a/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "Pyzstd module provides classes and functions for compre=
ssing and \
-decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short=
 name) algorithm."
-SUMMARY =3D "Python bindings to Zstandard (zstd) compression library"
-HOMEPAGE =3D "https://github.com/animalize/pyzstd"
-SECTION =3D "devel/python"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974=
b9e"
-
-PYPI_PACKAGE =3D "pyzstd"
-
-SRC_URI[sha256sum] =3D "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d58=
6937830a8afc7d72"
-
-inherit pypi python_hatchling ptest-python-pytest
-
-DEPENDS +=3D "python3-hatch-vcs-native"
-
--=20
2.43.0


