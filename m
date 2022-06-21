Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866E1C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 13:10:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32641.1655817015893667083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 06:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6266165C;
	Tue, 21 Jun 2022 06:10:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F5FD3F534;
	Tue, 21 Jun 2022 06:10:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v3 4/5] python3-hatch-vcs: add new recipe
Date: Tue, 21 Jun 2022 14:10:10 +0100
Message-Id: <20220621131011.96980-4-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/167149

This recipe (a VCS plugin for Hatch) is needed by the new
python3-jsonschema to build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc             |  1 +
 .../python/python3-hatch-vcs_0.2.0.bb                | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.=
bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index cf7723deb08..18b0624af72 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -613,6 +613,7 @@ RECIPE_MAINTAINER:pn-python3-flit-core =3D "Tim Orlin=
g <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-git =3D "Oleksandr Kravchuk <open.source@ol=
eksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb =3D "Oleksandr Kravchuk <open.source@=
oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-hatchling =3D "Ross Burton <ross.burton@arm=
.com>"
+RECIPE_MAINTAINER:pn-python3-hatch-vcs =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis =3D "Tim Orling <tim.orling@kons=
ulko.com>"
 RECIPE_MAINTAINER:pn-python3-idna =3D "Bruce Ashfield <bruce.ashfield@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize =3D "Tim Orling <tim.orling@konsu=
lko.com>"
diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb b/me=
ta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
new file mode 100644
index 00000000000..100099c130c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Hatch plugin for versioning with your preferred VCS"
+HOMEPAGE =3D "https://pypi.org/project/hatch-vcs/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D26501cfd0bbddf830ee820e95=
551fa3d"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE =3D "hatch_vcs"
+
+SRC_URI[sha256sum] =3D "9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce64=
3c36d09ca908abff"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


