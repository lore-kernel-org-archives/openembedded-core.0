Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015DBC001B2
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 19:30:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24586.1670527835796612749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 11:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0907923A;
	Thu,  8 Dec 2022 11:30:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB9223F71A;
	Thu,  8 Dec 2022 11:30:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] python3-hatchling: remove python3-tomli DEPENDS
Date: Thu,  8 Dec 2022 19:30:22 +0000
Message-Id: <20221208193024.3189494-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 19:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174409

Now that we have Python 3.11, hatchling will use the internal tomllib
instead of tomli.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-hatchling_1.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.11.1.bb
index d98d8746062..04f5f5fd4c3 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbe2fd33fc=
9297692812fc94b7d27fd9"
=20
 inherit pypi python_hatchling
=20
-DEPENDS +=3D "python3-pluggy-native python3-tomli-native python3-pathspe=
c-native python3-packaging-native python3-editables-native"
+DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native"
 DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
 SRC_URI[sha256sum] =3D "9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb=
6a473c1c9b08e1d0"
--=20
2.34.1


