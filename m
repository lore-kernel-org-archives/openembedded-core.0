Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761C5C35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:54:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13304.1742403234821160625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71EA4113E
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:54:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECE163F673
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:53:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gtk+3: depend on the librsvg pixbuf loader in gtk3-demo
Date: Wed, 19 Mar 2025 16:53:51 +0000
Message-ID: <20250319165351.440245-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 16:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213346

The demo uses some SVG icons, so depend on the SVG pixbuf loader so that
they are visible.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.43.bb
index 2171880c502..15870dcc08b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -142,6 +142,7 @@ GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} gli=
bc-gconv-iso8859-1"
 RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
, "wayland-protocols", "", d)}"
+RDEPENDS:${PN}-demo +=3D "librsvg-gtk"
=20
 PACKAGES_DYNAMIC +=3D "^gtk3-immodule-.* ^gtk3-printbackend-.*"
=20
--=20
2.43.0


