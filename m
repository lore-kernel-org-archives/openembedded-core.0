Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45F2CE9D44
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 14:58:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91618.1767711482932900056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 06:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E3FB497
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 06:57:55 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09EBB3F5A1
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 06:58:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-hatchling: remove redundant logic
Date: Tue,  6 Jan 2026 14:57:55 +0000
Message-ID: <20260106145755.522769-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228892

There's no need to remove the self-dependency as bitbake does that, and
the assignment of PYTHONPATH is no longer needed as pypa-build does the
right thing when invoking the in-tree hatchling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-hatchling_1.28.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.28.0.bb
index b5a55a0790..6be0de39a5 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
@@ -6,12 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbe2fd33f=
c9297692812fc94b7d27fd9"
 inherit pypi python_hatchling
=20
 DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native python3-trove-classifiers-native"
-DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
 SRC_URI[sha256sum] =3D "4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde=
75bf41a21ab004c8"
=20
-do_compile:prepend() {
-    export PYTHONPATH=3Dsrc
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


