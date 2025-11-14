Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCDDCE7B02
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:28:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16811.1763123327174464806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28914106F
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:28:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A9813F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:28:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] mesa: remove obsolete deletion of libwayland-egl
Date: Fri, 14 Nov 2025 12:28:40 +0000
Message-ID: <20251114122841.649314-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114122841.649314-1-ross.burton@arm.com>
References: <20251114122841.649314-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226292

This library was removed from upstream in mesa 18.2[1].

[1] mesa b9361c9df05 ("egl: remove wayland-egl now that we're using libwa=
yland-egl")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 001be529fca..e0ec17bd47b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -244,12 +244,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              mesa-vdpau-drivers mesa-tools \
             "
=20
-do_install:append () {
-    # libwayland-egl has been moved to wayland 1.15+
-    rm -f ${D}${libdir}/libwayland-egl*
-    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-}
-
 # For the packages that make up the OpenGL interfaces, inject variables =
so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), a=
nd
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
--=20
2.43.0


