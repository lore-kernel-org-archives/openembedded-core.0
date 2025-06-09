Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE782C71134
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.57255.1749467996261626790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD58014BF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 624AB3F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 05/16] sassc: put version in recipe filename
Date: Mon,  9 Jun 2025 12:19:37 +0100
Message-ID: <20250609111948.2282441-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111948.2282441-1-ross.burton@arm.com>
References: <20250609111948.2282441-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218274

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename and drop the explicit PV.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/sass/{sassc_git.bb =3D> sassc_3.6.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/sass/{sassc_git.bb =3D> sassc_3.6.2.bb} (84%=
)

diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-suppor=
t/sass/sassc_3.6.2.bb
similarity index 84%
rename from meta/recipes-support/sass/sassc_git.bb
rename to meta/recipes-support/sass/sassc_3.6.2.bb
index 64e92f48cfd..4d4dbc03fe2 100644
--- a/meta/recipes-support/sass/sassc_git.bb
+++ b/meta/recipes-support/sass/sassc_3.6.2.bb
@@ -7,12 +7,11 @@ DEPENDS =3D "libsass"
=20
 inherit autotools pkgconfig
=20
-SRC_URI =3D "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=3D=
https \
+SRC_URI =3D "git://github.com/sass/sassc.git;protocol=3Dhttps;branch=3Dm=
aster \
            file://0001-Remove-sassc_version.h-from-source-directory.patc=
h"
=20
 SRCREV =3D "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S =3D "${WORKDIR}/git"
-PV =3D "3.6.2"
=20
 CVE_STATUS[CVE-2022-43357] =3D "cpe-incorrect: this is CVE for libsass, =
not sassc wrapper"
=20
--=20
2.43.0


