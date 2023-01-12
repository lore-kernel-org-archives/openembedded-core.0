Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15A5C677F1
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:23:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52585.1673522622029114318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 03:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B665BFEC;
	Thu, 12 Jan 2023 03:24:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30F613F67D;
	Thu, 12 Jan 2023 03:23:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/4] python3-build: add 0.10.0
Date: Thu, 12 Jan 2023 11:23:34 +0000
Message-Id: <20230112112336.2254765-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112112336.2254765-1-ross.burton@arm.com>
References: <20230112112336.2254765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 11:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175792

This is the PEP517 build frontend blessed by the Python Packaging
Authority, and now that Python 3.11 has been released and enough
packages have ported to flit, it can be used without a huge bootstraping
problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../python/python3-build_0.10.0.bb                 | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-build_0.10.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 83966a250b1..7254c749c51 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -600,6 +600,7 @@ RECIPE_MAINTAINER:pn-python3-atomicwrites =3D "Tim Or=
ling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-python3-attrs =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-babel =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-bcrypt =3D "Tim Orling <tim.orling@konsulko=
.com>"
+RECIPE_MAINTAINER:pn-python3-build =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-python3-certifi =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-cffi =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-chardet =3D "Tim Orling <tim.orling@konsulk=
o.com>"
diff --git a/meta/recipes-devtools/python/python3-build_0.10.0.bb b/meta/=
recipes-devtools/python/python3-build_0.10.0.bb
new file mode 100644
index 00000000000..bebc00a437d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-build_0.10.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "A simple, correct PEP517 package builder"
+HOMEPAGE =3D "https://github.com/pypa/build"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c2=
56c"
+
+SRC_URI[sha256sum] =3D "d5b71264afdb5951d6704482aac78de887c80691c52b88a9=
ad195983ca2c9269"
+
+inherit pypi python_flit_core
+
+DEPENDS +=3D "python3-packaging-native python3-pyproject-hooks-native"
+
+RDEPENDS:${PN} +=3D "python3-packaging python3-pyproject-hooks"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


