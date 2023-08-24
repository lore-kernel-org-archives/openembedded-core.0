Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28946C7113B
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 10:23:35 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.7627.1692872613914534538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 03:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id 4B2ED4046
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 12:23:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.18]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ7Ux-2C9xSM0; Thu, 24 Aug 2023 12:23:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] qemu: add packageconfigs for fuse and dbus-display
Date: Thu, 24 Aug 2023 12:23:17 +0200
Message-ID: <20230824102317.267403-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824102317.267403-1-f_l_k@t-online.de>
References: <20230824102317.267403-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692872611-6E7FBE98-847EAF67/0/0 CLEAN NORMAL
X-TOI-MSGID: a8eae146-0f28-44b8-bfc0-763ea6616c1d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 10:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186656

glib-2.0-native is needed to provide gdbus-codegen

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 4311414d4a..82a7b361b1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -195,6 +195,7 @@ PACKAGECONFIG[virglrenderer] =3D "--enable-virglrende=
rer,--disable-virglrenderer,v
 # spice will be in meta-networking layer
 PACKAGECONFIG[spice] =3D "--enable-spice,--disable-spice,spice"
 # usbredir will be in meta-networking layer
+PACKAGECONFIG[dbus-display] =3D "--enable-dbus-display,--disable-dbus-di=
splay,glib-2.0-native,dbus"
 PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--disable-usb-redir,usb=
redir"
 PACKAGECONFIG[snappy] =3D "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs,glu=
sterfs"
@@ -215,6 +216,7 @@ PACKAGECONFIG[bpf] =3D "--enable-bpf,--disable-bpf,li=
bbpf"
 PACKAGECONFIG[capstone] =3D "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] =3D "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] =3D "--enable-vde,--disable-vde"
+PACKAGECONFIG[fuse] =3D "--enable-fuse --enable-fuse-lseek,--disable-fus=
e --disable-fuse-lseek,fuse3"
 PACKAGECONFIG[slirp] =3D "--enable-slirp,--disable-slirp,libslirp"
 PACKAGECONFIG[brlapi] =3D "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack,"
--=20
2.41.0


