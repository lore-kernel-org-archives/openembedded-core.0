Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1266BE7718F
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:12:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.129765.1734617516011481120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A10F61762
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:12:23 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A4343F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:11:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] subversion: add explicit DEPENDS on expat
Date: Thu, 19 Dec 2024 14:11:46 +0000
Message-ID: <20241219141151.2592031-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219141151.2592031-1-ross.burton@arm.com>
References: <20241219141151.2592031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208911

The configure script looks explicitly for expat, so add it to DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/subversion/subversion_1.14.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta=
/recipes-devtools/subversion/subversion_1.14.5.bb
index c8a2e12f4f0..b1347906204 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -5,7 +5,7 @@ SECTION =3D "console/network"
 LICENSE =3D "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6487ae7094d359fa90fb9c4096e52=
e2b"
=20
-DEPENDS =3D "apr-util serf sqlite3 file lz4"
+DEPENDS =3D "apr-util serf sqlite3 file lz4 expat"
 DEPENDS:append:class-native =3D " file-replacement-native"
=20
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
--=20
2.43.0


