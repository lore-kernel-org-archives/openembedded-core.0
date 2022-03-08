Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E23C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:32:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10284.1646757132144151472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE7231516
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A5923FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] bmap-tools: remove redundant PYPA_WHEEL
Date: Tue,  8 Mar 2022 16:32:03 +0000
Message-Id: <20220308163206.4039089-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308163206.4039089-1-ross.burton@arm.com>
References: <20220308163206.4039089-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 16:32:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162939

The default is good, this doesn't need to be set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/rec=
ipes-support/bmap-tools/bmap-tools_git.bb
index c5acdc5cbf..2999fdcea1 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -24,6 +24,5 @@ RDEPENDS:${PN} =3D "python3-core python3-compression py=
thon3-mmap python3-setuptoo
 inherit setuptools3
=20
 PIP_INSTALL_PACKAGE =3D "bmap_tools"
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${BASEVE=
R}-*.whl"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


