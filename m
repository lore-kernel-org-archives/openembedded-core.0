Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E13EE14D6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:14:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6282.1694024070988968933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93612106F;
	Wed,  6 Sep 2023 11:15:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D17A3F67D;
	Wed,  6 Sep 2023 11:14:29 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/7] wayland-utils: add libdrm PACKAGECONFIG
Date: Wed,  6 Sep 2023 19:14:20 +0100
Message-Id: <20230906181420.795510-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906181420.795510-1-ross.burton@arm.com>
References: <20230906181420.795510-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187348

From: Ross Burton <ross.burton@arm.com>

wayland-utils has optional libdrm support, so add a PACKAGECONFIG and
enable it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb b/meta/=
recipes-graphics/wayland/wayland-utils_1.1.0.bb
index dcee87e2cd2..48e1409be85 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
@@ -19,3 +19,6 @@ UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org=
/releases.html"
 inherit meson pkgconfig
=20
 DEPENDS +=3D "wayland wayland-native wayland-protocols"
+
+PACKAGECONFIG ??=3D "drm"
+PACKAGECONFIG[drm] =3D "-Ddrm=3Denabled,-Ddrm=3Ddisabled,libdrm"
--=20
2.34.1


