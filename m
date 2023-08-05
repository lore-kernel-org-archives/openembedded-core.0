Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78B2EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:03:59 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.1888.1691219031273424018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout05.t-online.de (Postfix) with SMTP id 9FC5A9998
	for <openembedded-core@lists.openembedded.org>; Sat,  5 Aug 2023 09:03:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.235]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qSBKG-3zwtAP0; Sat, 5 Aug 2023 09:03:48 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] systemd: add less to RRECOMMENDS
Date: Sat,  5 Aug 2023 09:03:34 +0200
Message-ID: <20230805070334.230324-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691219028-CCE269BF-99F57084/0/0 CLEAN NORMAL
X-TOI-MSGID: 79b19d91-4d99-4768-9e41-1bb3c9a936ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 07:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185548

journald uses less to display logs. less.busybox can do the
job, but it rips out support for color/highlighting.

So I would highly recommend to use the real 'less'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_253.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_253.7.bb b/meta/recipes-co=
re/systemd/systemd_253.7.bb
index 1fd4556afd..20dcda5823 100644
--- a/meta/recipes-core/systemd/systemd_253.7.bb
+++ b/meta/recipes-core/systemd/systemd_253.7.bb
@@ -679,6 +679,7 @@ RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-=
linux-umount udev (=3D ${EXTEND
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty=
-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
+RRECOMMENDS:${PN} +=3D "less"
 RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
                       udev-hwdb \
                       e2fsprogs-e2fsck \
--=20
2.41.0


