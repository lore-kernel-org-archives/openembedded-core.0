Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DF0C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.88630.1684157401472590806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA8B44B3;
	Mon, 15 May 2023 06:30:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A91633F67D;
	Mon, 15 May 2023 06:30:00 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/8] glib-networking: fix LICENSE statement
Date: Mon, 15 May 2023 14:29:53 +0100
Message-Id: <20230515132955.2231164-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515132955.2231164-1-ross.burton@arm.com>
References: <20230515132955.2231164-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181256

From: Ross Burton <ross.burton@arm.com>

The glib-networking license is LGPLv2.1 _or later_ and also has an
additional exception if OpenSSL is being used.

Add source comments to the checksum, and extend LICENSE if the openssl
PACKAGECONFIG has been enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glib-networking/glib-networking_2.74.0.bb            | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
index b3a88aca8db..ebf9e260508 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
@@ -3,8 +3,13 @@ DESCRIPTION =3D "glib-networking contains the implementa=
tions of certain GLib netw
 HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/glib-networking/"
 BUGTRACKER =3D "http://bugzilla.gnome.org"
=20
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+LICENSE =3D "LGPL-2.1-or-later"
+LICENSE:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' &=
 Glib-Networking-OpenSSL-Exception', '', d)}"
+NO_GENERIC_LICENSE[Glib-Networking-OpenSSL-Exception] =3D "LICENSE_EXCEP=
TION"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
+                    file://LICENSE_EXCEPTION;md5=3D0f5be697951b5e71aff00=
f4a4ce66be8 \
+                    file://tls/base/gtlsconnection-base.c;beginline=3D7;=
endline=3D22;md5=3Dab641ac307f3337811008ea9afe7059f"
=20
 SECTION =3D "libs"
 DEPENDS =3D "glib-2.0-native glib-2.0"
--=20
2.34.1


