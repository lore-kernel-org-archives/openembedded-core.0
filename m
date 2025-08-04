Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3ABCA0EC0
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5177.1754337164888145772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 12:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BAF61E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CFBA3F5A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] gtk: set correct bug tracker
Date: Mon,  4 Aug 2025 20:52:35 +0100
Message-ID: <20250804195237.149379-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804195237.149379-1-ross.burton@arm.com>
References: <20250804195237.149379-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221441

GTK hasn't used bugzilla for many years, switch the bug tracker fields
to gitlab.gnome.org.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb | 2 +-
 meta/recipes-gnome/gtk+/gtk4_4.18.6.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.43.bb
index 5892bb31397..5d58c41c6dd 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Multi-platform toolkit for creating GUIs"
 DESCRIPTION =3D "GTK+ is a multi-platform toolkit for creating graphical=
 user interfaces. Offering a complete \
 set of widgets, GTK+ is suitable for projects ranging from small one-off=
 projects to complete application suites."
 HOMEPAGE =3D "http://www.gtk.org"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
 SECTION =3D "libs"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2 \
                     file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa262=
87a271dce88af737 \
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.18.6.bb
index 397277a8150..2d24468dcc2 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Multi-platform toolkit for creating GUIs"
 DESCRIPTION =3D "GTK is a multi-platform toolkit for creating graphical =
user interfaces. Offering a complete \
 set of widgets, GTK is suitable for projects ranging from small one-off =
projects to complete application suites."
 HOMEPAGE =3D "http://www.gtk.org"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
 SECTION =3D "libs"
=20
 DEPENDS =3D " \
--=20
2.43.0


