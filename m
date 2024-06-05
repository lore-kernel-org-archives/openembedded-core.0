Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A1EC27C54
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 00:06:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3082.1717545994819454769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 17:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C63640CAA
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Jun 2024 00:06:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1oF7JXkTzGu
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2024 00:06:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1F48340C67
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Jun 2024 00:06:33 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7AFF5163F85;
	Tue,  4 Jun 2024 20:06:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] weston: upgrade 13.0.0 -> 13.0.1
Date: Tue,  4 Jun 2024 20:06:17 -0400
Message-Id: <20240605000617.1273011-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605000617.1273011-1-denis@denix.org>
References: <20240605000617.1273011-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 00:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200350

Weston 13.0.1, a bug fix release for 13.0.0 has been released.

Full changelog:
https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.ht=
ml

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...tools-Include-libgen.h-for-basename-signat.patch | 13 +++++--------
 .../wayland/{weston_13.0.0.bb =3D> weston_13.0.1.bb}  |  2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.0.bb =3D> weston_13.0.=
1.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-In=
clude-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/=
weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index 1d281fa832..fbec9f9d4e 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-l=
ibgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-l=
ibgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From 2b53236ac637dfa7fb0f438f7391a73f6ef92a06 Mon Sep 17 00:00:00 2001
+From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signatur=
e
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-dr=
m/libbacklight.c
-index ca7f2d68..74690fa7 100644
+index ca7f2d6..74690fa 100644
 --- a/libweston/backend-drm/libbacklight.c
 +++ b/libweston/backend-drm/libbacklight.c
 @@ -41,6 +41,7 @@
@@ -30,19 +30,16 @@ index ca7f2d68..74690fa7 100644
 +#include <libgen.h>
  #include <string.h>
  #include <errno.h>
-
+=20
 diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_im=
pl.c
-index 18f03015..9b460fa0 100644
+index 18f0301..9b460fa 100644
 --- a/tools/zunitc/src/zunitc_impl.c
 +++ b/tools/zunitc/src/zunitc_impl.c
 @@ -27,6 +27,7 @@
-
+=20
  #include <errno.h>
  #include <fcntl.h>
 +#include <libgen.h>
  #include <stdarg.h>
  #include <stdbool.h>
  #include <stdio.h>
---
-2.43.0
-
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipe=
s-graphics/wayland/weston_13.0.1.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.0.bb
rename to meta/recipes-graphics/wayland/weston_13.0.1.bb
index cb0024c5ca..eae13e1c21 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.1.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wes=
ton/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
=20
-SRC_URI[sha256sum] =3D "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd=
4aaf145d36fc795a"
+SRC_URI[sha256sum] =3D "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459=
213994094e02b29a"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/=
tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.25.1


