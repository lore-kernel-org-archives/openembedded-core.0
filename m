Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA5CD711D7
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:23:46 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.21896.1732127018915133637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id DD9BE386
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:23:27 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.173]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tDpMN-1ATUC90; Wed, 20 Nov 2024 19:23:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [meta-gnome][PATCH] gdm: allow to unlock keyring when logging in
Date: Wed, 20 Nov 2024 19:25:52 +0100
Message-ID: <20241120182552.1948-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732127007-21FEF6C2-C451A970/0/0 CLEAN NORMAL
X-TOI-MSGID: 022259ee-e4f0-4317-8404-dcad8210c4a7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207470

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_47.0.bb
index aede4b071..45f23b49b 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -40,6 +40,8 @@ do_install:prepend() {
=20
 do_install:append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
+    echo "auth       optional     pam_gnome_keyring.so" >> ${D}${sysconf=
dir}/pam.d/gdm-password
+    echo "session    optional     pam_gnome_keyring.so auto_start" >> ${=
D}${sysconfdir}/pam.d/gdm-password
 }
=20
 USERADD_PACKAGES =3D "${PN}"
--=20
2.47.0


