Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008D6C5B552
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10727.1749137715015730325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14C35168F
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:34:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 301DF3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/16] libsass: put version in recipe filename
Date: Thu,  5 Jun 2025 16:34:56 +0100
Message-ID: <20250605153508.961682-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218040

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, drop the explicit PV, and set the tag
name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/sass/{libsass_git.bb =3D> libsass_3.6.6.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/sass/{libsass_git.bb =3D> libsass_3.6.6.bb} =
(80%)

diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-supp=
ort/sass/libsass_3.6.6.bb
similarity index 80%
rename from meta/recipes-support/sass/libsass_git.bb
rename to meta/recipes-support/sass/libsass_3.6.6.bb
index 890cbf8e631..342061ceb64 100644
--- a/meta/recipes-support/sass/libsass_git.bb
+++ b/meta/recipes-support/sass/libsass_3.6.6.bb
@@ -5,11 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f34396ca205=
f5e119ee77aae91fa27d"
=20
 inherit autotools
=20
-SRC_URI =3D "git://github.com/sass/libsass.git;branch=3Dmaster;protocol=3D=
https \
+SRC_URI =3D "git://github.com/sass/libsass.git;protocol=3Dhttps;branch=3D=
master;tag=3D${PV} \
            file://0001-Remove-version.h-from-source-directory.patch"
=20
 SRCREV =3D "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
-PV =3D "3.6.6"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


