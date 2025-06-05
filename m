Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241E3C61DB8
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10962.1749137717061369098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20E7C1688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:34:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23BDF3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/16] mobile-broadband-provider-info: put version in recipe filename
Date: Thu,  5 Jun 2025 16:34:59 +0100
Message-ID: <20250605153508.961682-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218043

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, drop the explicit PV, and set the tag
name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...fo_git.bb =3D> mobile-broadband-provider-info_20240407.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-=
broadband-provider-info_git.bb =3D> mobile-broadband-provider-info_202404=
07.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mob=
ile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-bro=
adband-provider-info/mobile-broadband-provider-info_20240407.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobi=
le-broadband-provider-info_git.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile=
-broadband-provider-info_20240407.bb
index 06ded459344..48e9eeaef7e 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_20240407.bb
@@ -5,11 +5,11 @@ SECTION =3D "network"
 LICENSE =3D "PD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D87964579b2a8ece4bc6744d2dc9a8=
b04"
=20
-SRCREV =3D "55ba955d53305df96123534488fd160ea882b4dd"
-PV =3D "20240407"
 PE =3D "1"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info=
.git;protocol=3Dhttps;branch=3Dmain"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info=
.git;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}"
+SRCREV =3D "55ba955d53305df96123534488fd160ea882b4dd"
+
 S =3D "${WORKDIR}/git"
=20
 inherit meson
--=20
2.43.0


