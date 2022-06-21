Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A456BCCA483
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 13:10:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.43158.1655817015252198755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 06:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 583E21688;
	Tue, 21 Jun 2022 06:10:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B58CD3F534;
	Tue, 21 Jun 2022 06:10:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v3 2/5] Add python3-pathspec (from meta-python)
Date: Tue, 21 Jun 2022 14:10:08 +0100
Message-Id: <20220621131011.96980-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621131011.96980-1-ross.burton@arm.com>
References: <20220621131011.96980-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 13:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167148

This is a dependency of the Hatch build system, to be added as
python3-hatchling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc              |  1 +
 .../recipes-devtools/python/python3-pathspec_0.9.0.bb | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pathspec_0.9.0.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 40b6ee9ce65..62e0ac24e35 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -633,6 +633,7 @@ RECIPE_MAINTAINER:pn-python3-ndg-httpsclient =3D "Tim=
 Orling <tim.orling@konsulko.
 RECIPE_MAINTAINER:pn-python3-numpy =3D "Oleksandr Kravchuk <open.source@=
oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-packaging =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 =3D "Tim Orling <tim.orling@konsul=
ko.com>"
+RECIPE_MAINTAINER:pn-python3-pathspec =3D "Ross Burton <ross.burton@arm.=
com>"
 RECIPE_MAINTAINER:pn-python3-pbr =3D "Zang Ruochen <zangrc.fnst@fujitsu.=
com>"
 RECIPE_MAINTAINER:pn-python3-pip =3D "Zang Ruochen <zangrc.fnst@fujitsu.=
com>"
 RECIPE_MAINTAINER:pn-python3-pluggy =3D "Tim Orling <tim.orling@konsulko=
.com>"
diff --git a/meta/recipes-devtools/python/python3-pathspec_0.9.0.bb b/met=
a/recipes-devtools/python/python3-pathspec_0.9.0.bb
new file mode 100644
index 00000000000..641f1cfd87c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pathspec_0.9.0.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Utility library for gitignore style pattern matching of fil=
e paths."
+HOMEPAGE =3D "https://github.com/cpburnz/python-path-specification"
+SECTION =3D "devel/python"
+LICENSE =3D "MPL-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab123=
dad"
+
+SRC_URI[sha256sum] =3D "e564499435a2673d586f6b2130bb5b95f04a3ba06f81b8f8=
95b651a3c76aabb1"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


