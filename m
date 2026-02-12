Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB78EE36A6
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:43:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49968.1770914580343336908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0111F339
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:42:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E659D3F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:42:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] cmake: remove obsolete variable assignments
Date: Thu, 12 Feb 2026 16:42:48 +0000
Message-ID: <20260212164254.1110652-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231041

Remove obsolete assignments:

- KWSYS_CHAR_IS_SIGNED was removed in 3.5.0[1]
- KWSYS_LFS_WORKS was removed in 3.15.0[2]

[1] cmake ec1398d7ae ("KWSys 2015-12-14 (c1149ef6)")
[2] cmake 11fe7c9063 ("KWSys 2019-02-25 (833b2470)")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cmake/cmake_4.2.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_4.2.3.bb b/meta/recipes-de=
vtools/cmake/cmake_4.2.3.bb
index cfc5cb1b93..7c3dda2b15 100644
--- a/meta/recipes-devtools/cmake/cmake_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.2.3.bb
@@ -40,9 +40,7 @@ EXTRA_OECMAKE =3D " \
     -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
-    -DKWSYS_CHAR_IS_SIGNED=3D1 \
     -DBUILD_CursesDialog=3D0 \
-    -DKWSYS_LFS_WORKS=3D1 \
 "
=20
 PACKAGECONFIG ??=3D ""
--=20
2.43.0


