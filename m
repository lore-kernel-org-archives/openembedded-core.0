Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BCFC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 13:10:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.43004.1655817014500318973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 06:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC830165C;
	Tue, 21 Jun 2022 06:10:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 145843F534;
	Tue, 21 Jun 2022 06:10:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v3 1/5] Add python3-editables (from meta-python)
Date: Tue, 21 Jun 2022 14:10:07 +0100
Message-Id: <20220621131011.96980-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 13:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167146

This is a dependency of the Hatch build system, to be added as
python3-hatchling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc              |  1 +
 meta/recipes-devtools/python/python3-editables_0.3.bb | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-editables_0.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 6ab2ed9a9f5..40b6ee9ce65 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -604,6 +604,7 @@ RECIPE_MAINTAINER:pn-python3-dbusmock =3D "Oleksandr =
Kravchuk <open.source@oleksan
 RECIPE_MAINTAINER:pn-python3-docutils =3D "Oleksandr Kravchuk <open.sour=
ce@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D "Bruce Ashfield <bruce=
.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-editables =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome =3D "Joshua Watt <JPEWhacker@g=
mail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex =3D "Joshua Watt <JPEWhacker@=
gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent =3D "Bruce Ashfield <bruce.ashfi=
eld@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-editables_0.3.bb b/meta=
/recipes-devtools/python/python3-editables_0.3.bb
new file mode 100644
index 00000000000..b42ff068728
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-editables_0.3.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "A Python library for creating editable wheels"
+HOMEPAGE =3D "https://github.com/pfmoore/editables"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D41bc1be47b7bb8240db3ef928=
c7cb0bf"
+
+SRC_URI[sha256sum] =3D "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f=
7b410cde16161b1a"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


