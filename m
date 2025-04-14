Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688D3C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 19:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3454.1744658535532962926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 12:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3B411595
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 12:22:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7F923F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 12:22:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: remove obsolete deletion of .la files
Date: Mon, 14 Apr 2025 20:22:09 +0100
Message-ID: <20250414192210.18008-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 19:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214807

As Mesa is built with Meson now, there's no need to delete the .la files
as they're not installed in the first place.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index aca34983e97..2a0c88c89a4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -279,12 +279,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
             "
=20
 do_install:append () {
-    # Drivers never need libtool .la files
-    rm -f ${D}${libdir}/dri/*.la
-    rm -f ${D}${libdir}/egl/*.la
-    rm -f ${D}${libdir}/gallium-pipe/*.la
-    rm -f ${D}${libdir}/gbm/*.la
-
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
--=20
2.43.0


