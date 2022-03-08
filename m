Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A515AC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 19:31:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12623.1646767895416485695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 11:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0C31650
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 11:31:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8D743FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 11:31:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-scons: remove PIP_INSTALL_DIST_PATH
Date: Tue,  8 Mar 2022 19:31:27 +0000
Message-Id: <20220308193128.1036345-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 19:31:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162944

The default is good now, so remove this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-scons_4.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-scons_4.3.0.bb b/meta/r=
ecipes-devtools/python/python3-scons_4.3.0.bb
index cfb075f65f..624f974805 100644
--- a/meta/recipes-devtools/python/python3-scons_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
@@ -8,7 +8,6 @@ SRC_URI +=3D " file://0001-Fix-man-page-installation.patc=
h"
 SRC_URI[sha256sum] =3D "d47081587e3675cc168f1f54f0d74a69b328a2fc90ec4feb=
85f728677419b879"
=20
 PYPI_PACKAGE =3D "SCons"
-PIP_INSTALL_DIST_PATH =3D "${B}/build/dist"
=20
 inherit pypi setuptools3
=20
--=20
2.25.1


