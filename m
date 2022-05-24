Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76AAC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10816.1653405846900852848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AFD723A;
	Tue, 24 May 2022 08:24:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21E93F70D;
	Tue, 24 May 2022 08:24:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/9] mtd-utils: disable LZO by default
Date: Tue, 24 May 2022 16:23:55 +0100
Message-Id: <20220524152401.1663317-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166073

LZO is a fairly obsolete compression format these days, so disable it by
default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 3318277477f..8931e870324 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -23,7 +23,7 @@ S =3D "${WORKDIR}/git"
 # xattr support creates an additional compile-time dependency on acl bec=
ause
 # the sys/acl.h header is needed. libacl is not needed and thus enabling=
 xattr
 # regardless whether acl is enabled or disabled in the distro should be =
okay.
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} =
lzo jffs ubifs"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} =
jffs ubifs"
 PACKAGECONFIG[lzo] =3D "--with-lzo,--without-lzo,lzo"
 PACKAGECONFIG[xattr] =3D "--with-xattr,--without-xattr,acl"
 PACKAGECONFIG[crypto] =3D "--with-crypto,--without-crypto,openssl"
--=20
2.25.1


