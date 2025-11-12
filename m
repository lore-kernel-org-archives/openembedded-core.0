Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10910CD484C
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 21:07:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8383.1762981613811481458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 13:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D01951595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 13:06:45 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26F273F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 13:06:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] recipes: remove obsolete S in recipes that inherit gnomebase
Date: Wed, 12 Nov 2025 21:06:51 +0000
Message-ID: <20251112210651.1868279-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112210651.1868279-1-ross.burton@arm.com>
References: <20251112210651.1868279-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 21:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226220

Now that S is set using GNOMEBN by gnomebase, we can remove these
redundant assignments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb       | 2 --
 meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb      | 2 --
 meta/recipes-support/libsoup/libsoup_3.6.5.bb | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome=
/gnome/gconf_3.2.6.bb
index 45de01d9b1b..49ff165f84e 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -22,8 +22,6 @@ SRC_URI +=3D "\
=20
 SRC_URI[archive.sha256sum] =3D "1912b91803ab09a5eed34d364bf09fe3a2a9c967=
51fde03a4e0cfa51a04d784c"
=20
-S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
-
 EXTRA_OECONF =3D "--enable-shared --disable-static \
                 --disable-orbit --with-openldap=3Dno --disable-gtk"
=20
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.51.bb
index 690d5a2dcd6..35f99b2de0c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
@@ -24,8 +24,6 @@ SRC_URI +=3D "\
            "
 SRC_URI[archive.sha256sum] =3D "0013877c6bd23c2dbe42ad7c70a053d0e449be66=
736574e37867c49c5f905a4f"
=20
-S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 GSETTINGS_PACKAGE:class-native =3D ""
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes=
-support/libsoup/libsoup_3.6.5.bb
index a9f1e0d96ae..549bbb79810 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -13,8 +13,6 @@ SRC_URI[archive.sha256sum] =3D "6891765aac3e949017945c3=
eaebd8cc8216df772456dc9f460
=20
 PROVIDES =3D "libsoup-3.0"
=20
-S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
-
 inherit gettext gnomebase upstream-version-is-even gobject-introspection=
 gi-docgen vala
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
--=20
2.43.0


