Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F2FEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:04:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13429.1688551462527999081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B10C16F8;
	Wed,  5 Jul 2023 03:05:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1A813F762;
	Wed,  5 Jul 2023 03:04:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] pkgconf: update SRC_URI
Date: Wed,  5 Jul 2023 11:04:19 +0100
Message-Id: <20230705100419.3696292-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705100419.3696292-1-ross.burton@arm.com>
References: <20230705100419.3696292-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 10:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183882

From: Ross Burton <ross.burton@arm.com>

dereferenced.org is now longer controlled by the pkgconf maintainers[1],
so use the the new hosting location.

[1] https://github.com/pkgconf/pkgconf/commit/437c2a3218bfcb1cae7fa38a4cc=
d0cb29575ff07

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_1.9.5.bb
index 4bdf03c574c..ab1d1c84e8f 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
@@ -15,7 +15,7 @@ LICENSE =3D "pkgconf"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2214222ec1a820bd6cc75167a5692=
5e0"
=20
 SRC_URI =3D "\
-    https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
+    https://distfiles.ariadne.space/pkgconf/pkgconf-${PV}.tar.xz \
     file://pkg-config-wrapper \
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
--=20
2.34.1


