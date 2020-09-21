Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.50568.1600720079026377675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 13:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0779147A
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 13:27:57 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717FF3F718
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 13:27:57 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gettext: no need to depend on bison-native
Date: Mon, 21 Sep 2020 21:27:55 +0100
Message-Id: <20200921202755.3849912-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This was needed because of a backported patch, this patch was dropped
in oe-core c9f8b48 but the removal of the dependency was missed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/gettext/gettext_0.21.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-cor=
e/gettext/gettext_0.21.bb
index 54305623dd..3af77bb4c8 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -8,11 +8,8 @@ SECTION =3D "libs"
 LICENSE =3D "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
=20
-# Because po-gram-gen.y has been modified by fix-CVE-2018-18751.patch,
-# it requires yacc which provided by bison-native
-# Please remove bison-native from DEPENDS* when next upgrade
-DEPENDS =3D "bison-native gettext-native virtual/libiconv"
-DEPENDS_class-native =3D "bison-native gettext-minimal-native"
+DEPENDS =3D "gettext-native virtual/libiconv"
+DEPENDS_class-native =3D "gettext-minimal-native"
 PROVIDES =3D "virtual/libintl virtual/gettext"
 PROVIDES_class-native =3D "virtual/gettext-native"
 RCONFLICTS_${PN} =3D "proxy-libintl"
--=20
2.28.0

