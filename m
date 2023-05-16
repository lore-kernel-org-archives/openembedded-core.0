Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D6EC7EE2D
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:40:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30018.1684262440853254603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD761FB;
	Tue, 16 May 2023 11:41:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE0243F793;
	Tue, 16 May 2023 11:40:39 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	kubiznak@2n.com
Subject: [PATCH 4/7] gconf: remove explicit gobject-introspection DEPENDS
Date: Tue, 16 May 2023 19:40:28 +0100
Message-Id: <20230516184031.2255171-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516184031.2255171-1-ross.burton@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181417

From: Ross Burton <ross.burton@arm.com>

The gobject-introspection inherit does this for us.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome=
/gnome/gconf_3.2.6.bb
index e712e4729c3..4930aeb9f03 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/Archive/gconf"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
=20
-DEPENDS =3D "glib-2.0 glib-2.0-native gobject-introspection dbus dbus-gl=
ib libxml2 intltool-native"
+DEPENDS =3D "glib-2.0 glib-2.0-native dbus dbus-glib libxml2 intltool-na=
tive"
=20
 inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache
=20
--=20
2.34.1


