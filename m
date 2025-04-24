Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB67FC369D5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 21:40:09 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.540.1745530800273938510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 14:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 6D3301E74
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 23:39:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u84IY-3P16un0; Thu, 24 Apr 2025 23:39:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] default-providers.inc: add entries for virtual/libsdl2
Date: Thu, 24 Apr 2025 23:39:51 +0200
Message-ID: <20250424213951.2514902-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745530798-6D7F99F0-47090915/0/0 CLEAN NORMAL
X-TOI-MSGID: 62759085-5894-4059-9ede-0a735e8d5b28
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 21:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215406

virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat' where t=
he latter
is a replacement for libsdl2 that uses libsdl3 behind the scenes and shou=
ld
be favored if applicable.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/default-providers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index cebd0400f4..ee91af8796 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -4,6 +4,8 @@
 BB_RECIPE_VIRTUAL_PROVIDERS =3D "virtual/cross-cc virtual/cross-c++ virt=
ual/cross-binutils virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++=
 virtual/nativesdk-cross-binutils"
 PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libsdl2 ?=3D "libsdl2"
+PREFERRED_PROVIDER_virtual/libsdl2-native ?=3D "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa"
@@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwcloc=
k"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
 VIRTUAL-RUNTIME_dbus ?=3D "dbus"
+VIRTUAL-RUNTIME_libsdl2 ?=3D "libsdl2"
=20
 #
 # Default recipe providers
@@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-nat=
ive"
 PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
+PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "nativesdk-libsdl2"
=20
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
--=20
2.49.0


