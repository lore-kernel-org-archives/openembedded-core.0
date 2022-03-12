Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7390C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 08:02:38 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.2976.1647072157126951147
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 705366C30
	for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 09:02:34 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.239]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nSwhg-1rFxxJ0; Sat, 12 Mar 2022 09:02:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] x86-base.inc: replace intel i965 driver with crocus
Date: Sat, 12 Mar 2022 09:01:58 +0100
Message-Id: <20220312080158.2598-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647072140-00012DCC-B63611F2/0/0 CLEAN NORMAL
X-TOI-MSGID: 15ce16b1-db8e-4b19-9c69-0c90cc588dc0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 08:02:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163084

this fixes do_rootfs for core-image-sato after mesa update:

 Problem: package packagegroup-core-x11-base-1.0-r1.noarch requires packa=
gegroup-core-x11-xserver, but none of the providers can be installed
  - conflicting requests
  - nothing provides mesa-driver-i965 needed by packagegroup-core-x11-xse=
rver-1.0-r40.intel_corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/machine/include/x86/x86-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machi=
ne/include/x86/x86-base.inc
index e76251ea2b..b70924f7d9 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -36,7 +36,7 @@ XSERVER_X86_I915 =3D "xf86-video-intel \
            "
=20
 XSERVER_X86_I965 =3D "xf86-video-intel \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-drive=
r-i965', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-drive=
r-crocus', '', d)} \
            "
=20
 XSERVER_X86_VESA =3D "xf86-video-vesa"
--=20
2.25.1


