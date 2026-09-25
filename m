Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D32C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 12:48:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7368.1790340514035675798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 05:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pUkOhpKm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 171E816F8;
	Fri, 25 Sep 2026 05:48:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 236A63F86C;
	Fri, 25 Sep 2026 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790340513; bh=kLTti6YBgZY8bRjePlkChMaCcn7YbeaOg5s3jxdHg5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pUkOhpKmbmSFkFTRbvDFGnIRjIXVbJwtyFehwrvj2keK319h6gPq5WexQU7Dd9Rkv
	 xULjUT01wEInTHhMMODtdoPfbFSt2nZNAx+OmToa0TnJPafHbFxAOY06wi/WSYurKQ
	 wjTG0NBr1Rga6Jtph8J9fwrCw0zRAH7imIV1JLI0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [PATCH 2/2] python3-dtschema-wrapper: remove obsolete recipe
Date: Fri, 25 Sep 2026 13:48:25 +0100
Message-ID: <20260925124825.1868909-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925124825.1868909-1-ross.burton@arm.com>
References: <20260925124825.1868909-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 12:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246618

This recipe was added so that the 5.16-rc4 kernel wouldn't depend on
python3-dtschema-native to validate the DeviceTree files at build time.

However, that requirement was removed in -rc5, so this recipe is not
required.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../python3-dtschema-wrapper/dt-doc-validate  | 20 -------------------
 .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 -------------------
 .../dtc/python3-dtschema-wrapper/dt-validate  | 20 -------------------
 .../dtc/python3-dtschema-wrapper_2021.10.bb   | 19 ------------------
 5 files changed, 80 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-d=
oc-validate
 delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-m=
k-schema
 delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-v=
alidate
 delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021=
.10.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 53f5e6bf92a..d3dddaaee97 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -645,7 +645,6 @@ RECIPE_MAINTAINER:pn-python3-dbusmock =3D "Trevor Gam=
blin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-docutils =3D "Trevor Gamblin <tgamblin@bayl=
ibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtc =3D "Trevor Gamblin <tgamblin@baylibre.=
com>"
 RECIPE_MAINTAINER:pn-python3-dtschema =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D "Bruce Ashfield <bruce=
.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-editables =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-extras =3D "Trevor Gamblin <tgamblin@baylib=
re.com>"
 RECIPE_MAINTAINER:pn-python3-flit-core =3D "Tim Orling <tim.orling@konsu=
lko.com>"
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-vali=
date b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
deleted file mode 100644
index 2aa57851c7e..00000000000
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-# dt-doc-validate wrapper to allow kernel dt-validation to pass
-#
-# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)
-
-for arg; do
-    case "$arg" in
-        --version)
-            echo "v2021.10"
-            ;;
-    esac
-done
-
-# TBD: left for future consideration
-# exec dt-doc-validate.real "$@"
-
-# we always succeed
-exit 0
-
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schem=
a b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
deleted file mode 100644
index 24b89d86198..00000000000
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-# dt-mk-schema wrapper to allow kernel dt-validation to pass
-#
-# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)
-
-for arg; do
-    case "$arg" in
-        --version)
-            echo "v2021.10"
-            ;;
-    esac
-done
-
-# TBD: left for future consideration
-# exec dt-mk-schema.real "$@"
-
-# we always succeed
-exit 0
-
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate=
 b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
deleted file mode 100644
index 8a4710a7eda..00000000000
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-# dt-validate wrapper to allow kernel dt-validation to pass
-#
-# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)
-
-for arg; do
-    case "$arg" in
-        --version)
-            echo "v2021.10"
-            ;;
-    esac
-done
-
-# TBD: left for future consideration
-# exec dt-validate.real "$@"
-
-# we always succeed
-exit 0
-
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb =
b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
deleted file mode 100644
index b19f53e20d8..00000000000
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "Wrapper for tooling for devicetree validation using YAML an=
d jsonschema"
-HOMEPAGE =3D "https://yoctoproject.org"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-
-SRC_URI =3D "file://dt-doc-validate \
-           file://dt-mk-schema \
-           file://dt-validate"
-
-S =3D "${UNPACKDIR}"
-
-do_install() {
-    install -d ${D}${bindir}/
-    install -m 755 ${UNPACKDIR}/dt-doc-validate ${D}${bindir}/
-    install -m 755 ${UNPACKDIR}/dt-mk-schema ${D}${bindir}/
-    install -m 755 ${UNPACKDIR}/dt-validate ${D}${bindir}/
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


