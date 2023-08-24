Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FC7C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:21:58 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.7091.1692868911046591867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id 6DCF62C757
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 11:21:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.18]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ6XC-2o53c90; Thu, 24 Aug 2023 11:21:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] qemu: fix libudev packageconfig for systemd images
Date: Thu, 24 Aug 2023 11:21:40 +0200
Message-ID: <20230824092140.102373-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692868906-291F0649-546E2DF0/0/0 CLEAN NORMAL
X-TOI-MSGID: 7f89820c-edbb-4c38-8866-ce61cf862547
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186654

eudev is needed to provide libudev when not using systemd,
but including eudev breaks things for systemd. We can't
include eudev here since systemd provides libudev itself.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index ea02bf0c73..4311414d4a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -199,7 +199,7 @@ PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--di=
sable-usb-redir,usbredir"
 PACKAGECONFIG[snappy] =3D "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs,glu=
sterfs"
 PACKAGECONFIG[xkbcommon] =3D "--enable-xkbcommon,--disable-xkbcommon,lib=
xkbcommon"
-PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-libudev,eudev"
+PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-libudev,udev"
 PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
--=20
2.41.0


