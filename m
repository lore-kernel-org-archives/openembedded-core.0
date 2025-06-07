Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B18C5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 15:37:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.20774.1749310657118047953
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 08:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 37DA562A
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Jun 2025 17:37:35 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.249]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uNvby-0xVzHt0; Sat, 7 Jun 2025 17:37:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] mesa: update 25.1.1 -> 25.1.3
Date: Sat,  7 Jun 2025 17:37:28 +0200
Message-ID: <20250607153728.4024672-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1749310654-4A226946-85F8A7B3/0/0 CLEAN NORMAL
X-TOI-MSGID: cf325467-e12f-4ae0-88d3-bdc03f75b5e0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 15:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218202

Mesa 25.1.3 Release Notes / 2025-06-07
Mesa 25.1.3 is a bug fix release which fixes bugs found since the 25.1.2 =
release.
Mesa 25.1.3 implements the OpenGL 4.6 API, but the version reported by gl=
GetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) / glGetIntegerv(=
GL_MINOR_VERSION) depends on the particular driver being used. Some drive=
rs don=E2=80=99t support all the features required in OpenGL 4.6. OpenGL =
4.6 is only available if requested at context creation. Compatibility con=
texts may report a lower version depending on each driver.
Mesa 25.1.3 implements the Vulkan 1.4 API, but the version reported by th=
e apiVersion property of the VkPhysicalDeviceProperties struct depends on=
 the particular driver being used.

New features
    None

Bug fixes
    25.1.2 - instant crash on upgrade, very first attempt at a new surfac=
e

Mesa 25.1.2 Release Notes / 2025-06-04
Mesa 25.1.2 is a bug fix release which fixes bugs found since the 25.1.1 =
release.
Mesa 25.1.2 implements the OpenGL 4.6 API, but the version reported by gl=
GetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) / glGetIntegerv(=
GL_MINOR_VERSION) depends on the particular driver being used. Some drive=
rs don=E2=80=99t support all the features required in OpenGL 4.6. OpenGL =
4.6 is only available if requested at context creation. Compatibility con=
texts may report a lower version depending on each driver.
Mesa 25.1.2 implements the Vulkan 1.4 API, but the version reported by th=
e apiVersion property of the VkPhysicalDeviceProperties struct depends on=
 the particular driver being used.

New features
    None

Bug fixes
    Confidential issue #13281
    anv, regression: Missing terrain in It Takes Two on BMG
    =E2=80=9Cbreaking-limit=E2=80=9D benchmark will Freeze before startin=
g.
    rusticl: CL_MEM_HOST_READ_ONLY cl_image2d reads zeroes from host on A=
MD Vega8
    Bug (bad code optimization?) in the GLSL (compute) shader compiler
    nvk: Broken lighting in Trine 5
    RX9070 hard crash with Mafia Definitive Edition
    RADV: Potential bug with vulkan fragment shader interpolation (on out=
puts from mesh shaders?)
    In the game =E2=80=9CFoundation=E2=80=9D a buildings areas of effect =
is missing
    ANV: Dota 2 May 22 2025 update crashing in vkCmdBindDescriptorSets wi=
th no validation error
    Vulkan Video engages during playback of format which is not supported=
 by my Fiji GPU
    Weston hangs on virtio (non-accelerated version) on QEMU with Mesa ma=
in
    KVM/qemu: GDM fails to start / gnome-shell crashes after update to me=
sa-dri-drivers-25.0.3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...01-meson-stop-building-XA-by-default.patch | 33 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  5 ++-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-stop-buil=
ding-XA-by-default.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-stop-building-XA=
-by-default.patch b/meta/recipes-graphics/mesa/files/0001-meson-stop-buil=
ding-XA-by-default.patch
deleted file mode 100644
index 4372675952..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson-stop-building-XA-by-def=
ault.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 31a835dd2573c17d77efa8803c7fb28e0d58abc6 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Thu, 22 May 2025 20:11:46 +0300
-Subject: [PATCH] meson: stop building XA by default
-
-Commit cf40099730c4 ("meson: deprecate gallium-xa") deprecated XA
-tracker, but didn't disable it by default. Thus any attempt to disable
-it would cause a deprecated option warning. Flip the default to disable
-XA tracker by default.
-
-Fixes: cf40099730c4 ("meson: deprecate gallium-xa")
-Backport-to: 25.1
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/31cf6b94ad1dfaf4272b22a39d7e2805d03f9375]
----
- meson.options | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.options b/meson.options
-index e6c9567ade86..a56bcef6e2ca 100644
---- a/meson.options
-+++ b/meson.options
-@@ -127,6 +127,7 @@ option(
- option(
-   'gallium-xa',
-   type : 'feature',
-+  value : 'disabled',
-   description : 'enable gallium xa frontend.',
-   deprecated: true,
- )
---=20
-2.47.2
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 4b1e427ad5..b222e72fdd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,11 +18,10 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.ta=
r.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
            file://0001-dont-build-clover-frontend.patch \
-           file://0001-meson-stop-building-XA-by-default.patch \
 "
=20
-SRC_URI[sha256sum] =3D "cf942a18b7b9e9b88524dcbf0b31fed3cde18e6d52b3375b=
0ab6587a14415bce"
-PV =3D "25.1.1"
+SRC_URI[sha256sum] =3D "ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f658=
5436ca6e3cddba7f"
+PV =3D "25.1.3"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.49.0


