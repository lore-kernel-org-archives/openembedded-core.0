Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91511C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:19:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.57253.1749467994059108903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CE2D14BF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2A893F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 01/16] libmodulemd: put version in recipe filename
Date: Mon,  9 Jun 2025 12:19:33 +0100
Message-ID: <20250609111948.2282441-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218270

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, and drop the explicit PV.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libmodulemd/{libmodulemd_git.bb =3D> libmodulemd_2.15.1.bb}    | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_git.bb =3D> libmod=
ulemd_2.15.1.bb} (98%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/=
recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
similarity index 98%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
index 0c730329230..4bdc587f4f9 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D25a3927bff3ee4=
f5b21bcb0ed3fcd6bb"
=20
 SRC_URI =3D "git://github.com/fedora-modularity/libmodulemd;protocol=3Dh=
ttps;branch=3Dmain"
=20
-PV =3D "2.15.1"
 SRCREV =3D "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


