Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA39C43219
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 10:16:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.7996.1666260980646122732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 03:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout09.t-online.de (Postfix) with SMTP id 3133B43E6
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 12:16:16 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.45.148]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1olSaz-1FEGcj0; Thu, 20 Oct 2022 12:16:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] wayland-protocols: upgrade 1.26 -> 1.27
Date: Thu, 20 Oct 2022 12:16:05 +0200
Message-Id: <20221020101605.158017-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1666260973-38FE681E-564ED264/0/0 CLEAN NORMAL
X-TOI-MSGID: b455f19f-49be-42b1-a7a9-7e2306a7815c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 10:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171990

wayland-protocols 1.27 is now available.

This release includes two new staging protocols:

 * Content type hint

This protocol enables clients to provide hints to the compositor about
what kind of content it provides, allowing compositors to optionally
adapt its behavior accordingly.

 * Idle notify

This extension allows compositors to notify clients about when the user
is idle.

Apart from these two new extensions, this release also brings the usual
clarifications, cleanups and fixes. Enjoy!

Daniel Stone (1):
      xdg-shell: ack_configure must be strictly monotonic

Emmanuel Gil Peyrot (1):
      staging/content-type: Content type hint support

Isaac Freund (1):
      ext-session-lock: add note on client termination

Jonas =C3=85dahl (1):
      build: Bump version to 1.27

Simon Ser (3):
      xdg-shell: forbid loops in set_parent
      ext-idle-notify: new protocol
      build: alphabetically sort list of staging protocols

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wayland-protocols_1.26.bb =3D> wayland-protocols_1.27.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.26.bb =3D> way=
land-protocols_1.27.bb} (79%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.27.bb
similarity index 79%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.27.bb
index 322f55dc71..5223a13f1a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb
@@ -9,9 +9,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38ca028ace54aae3d=
484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
-SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
-           "
-SRC_URI[sha256sum] =3D "c553384c1c68afd762fa537a2569cc9074fe7600da12d347=
2761e77a2ba56f13"
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "9046f10a425d4e2a00965a03acfb6b3fb575a56503ac72c2=
b86821c69653375c"
=20
 UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
=20
--=20
2.34.1


