Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB992C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10959.1749137713083085228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16CA51688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:34:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C25C3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/16] libmodulemd: put version in recipe filename
Date: Thu,  5 Jun 2025 16:34:53 +0100
Message-ID: <20250605153508.961682-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218037

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, and drop the explicit PV, and set the
tag name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libmodulemd/{libmodulemd_git.bb =3D> libmodulemd_2.15.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_git.bb =3D> libmod=
ulemd_2.15.1.bb} (95%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/=
recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
similarity index 95%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
index 0c730329230..10aa6c543c3 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
@@ -4,9 +4,8 @@ DESCRIPTION =3D "${SUMMARY}"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D25a3927bff3ee4f5b21bcb0ed3fcd=
6bb"
=20
-SRC_URI =3D "git://github.com/fedora-modularity/libmodulemd;protocol=3Dh=
ttps;branch=3Dmain"
+SRC_URI =3D "git://github.com/fedora-modularity/libmodulemd;protocol=3Dh=
ttps;branch=3Dmain;tag=3D${PV}"
=20
-PV =3D "2.15.1"
 SRCREV =3D "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


