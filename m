Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC07C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:37:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11703.1679402272360423013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 05:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC0EAD7;
	Tue, 21 Mar 2023 05:38:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AB3C3F71E;
	Tue, 21 Mar 2023 05:37:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 04/17] python3-unittest-automake-output: add new recipe for ptest integration
Date: Tue, 21 Mar 2023 12:37:32 +0000
Message-Id: <20230321123745.1248462-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321123745.1248462-1-ross.burton@arm.com>
References: <20230321123745.1248462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178857

This package contains modules for both unittest and pytest that alter
the output to look like automake's 'make check' output, for better
integration with ptest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc            |  1 +
 .../python/python3-unittest-automake-output_0.1.bb  | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-unittest-automak=
e-output_0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index ec7ea90d16a..b43a94aae71 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -699,6 +699,7 @@ RECIPE_MAINTAINER:pn-python3-toml =3D "Tim Orling <ti=
m.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify =3D "Alexander Kanavin <alex.kana=
vin@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-unittest-automake-output =3D "Ross Burton <=
ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth =3D "Tim Orling <tim.orling@konsulk=
o.com>"
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.1.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_=
0.1.bb
new file mode 100644
index 00000000000..ba58c18df07
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.b=
b
@@ -0,0 +1,13 @@
+SUMMARY =3D "Modules to make unittest and pytest look like Automake outp=
ut, for ptest"
+HOMEPAGE =3D "https://gitlab.com/rossburton/python-unittest-automake-out=
put"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb7349f06609329f1ab=
93b"
+
+SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain"
+SRCREV =3D "06537edb18f3641c70bce25256f6ecf5f5164ead"
+
+S =3D "${WORKDIR}/git"
+
+inherit python_flit_core
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


