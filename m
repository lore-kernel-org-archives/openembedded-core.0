Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8803CA0EC0
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:26:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89229.1754058360590859350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1664D16A3
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:25:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A77B33F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:25:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] dbus: remove autoconf-archive-native DEPENDS
Date: Fri,  1 Aug 2025 15:25:51 +0100
Message-ID: <20250801142554.3273064-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142554.3273064-1-ross.burton@arm.com>
References: <20250801142554.3273064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221351

This recipe uses Meson to build now, so it doesn't need autoconf-archive
anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/db=
us/dbus_1.16.2.bb
index aabc4c3efb8..381dcec82a3 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[audit] =3D "-Dlibaudit=3Denabled,-Dlibaud=
it=3Ddisabled,audit"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
 PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=3Df=
alse"
=20
-DEPENDS =3D "expat virtual/libintl autoconf-archive-native glib-2.0"
+DEPENDS =3D "expat virtual/libintl glib-2.0"
 RDEPENDS:${PN} +=3D "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native =3D ""
=20
--=20
2.43.0


