Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9C3C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:23:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52584.1673522621529190636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 03:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1994FAD7;
	Thu, 12 Jan 2023 03:24:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83CA03F67D;
	Thu, 12 Jan 2023 03:23:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/4] python3-pyproject-hooks: add new recipe
Date: Thu, 12 Jan 2023 11:23:33 +0000
Message-Id: <20230112112336.2254765-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 11:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175791

This used to be known as python3-pep517 and is a key library used to
build modern Python code.

It is currently vendored into python3-picobuild but I plan to remove
that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc             |  1 +
 .../python/python3-pyproject-hooks_1.0.0.bb          | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyproject-hooks_=
1.0.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 508d10e091a..83966a250b1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -662,6 +662,7 @@ RECIPE_MAINTAINER:pn-python3-pygments =3D "Oleksandr =
Kravchuk <open.source@oleksan
 RECIPE_MAINTAINER:pn-python3-pygobject =3D "Zang Ruochen <zangrc.fnst@fu=
jitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing =3D "Oleksandr Kravchuk <open.sou=
rce@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-pyproject-hooks =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-pytest =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-runner =3D "Tim Orling <tim.orling@k=
onsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.b=
b b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
new file mode 100644
index 00000000000..10d8225c3d5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "A low-level library for calling build-backends in pyproject=
.toml-based projects"
+HOMEPAGE =3D "https://github.com/pypa/pyproject-hooks"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad69c93f605003e3342b174d9b07=
08c"
+
+SRC_URI[sha256sum] =3D "f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315=
c54cedaca0264ef5"
+
+inherit pypi python_flit_core
+
+PYPI_PACKAGE =3D "pyproject_hooks"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


