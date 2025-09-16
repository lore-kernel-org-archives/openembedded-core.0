Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88875CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 12:41:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19011.1758026501588787264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 05:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D21C712FC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:41:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA2633F673
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:41:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fontconfig: clean up LICENSE
Date: Tue, 16 Sep 2025 13:41:37 +0100
Message-ID: <20250916124137.705324-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 12:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223548

"MIT & MIT" is not a useful license statement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index 48151fe4f5f..22bdfb139cc 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -11,7 +11,7 @@ rasterize fonts."
 HOMEPAGE =3D "http://www.fontconfig.org"
 BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dfon=
tconfig"
=20
-LICENSE =3D "MIT & MIT & PD"
+LICENSE =3D "MIT & PD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D00252fd272bf2e722925613ad74cb=
6c7 \
                     file://src/fcfreetype.c;endline=3D23;md5=3Df7c0140c1=
b0387cf4cf45420b059847c \
                     "
--=20
2.43.0


