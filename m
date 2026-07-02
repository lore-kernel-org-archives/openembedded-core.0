Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F9FC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 18:20:22 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76246.1783016415333341403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 11:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6071820259C;
	Thu, 02 Jul 2026 20:20:12 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wfM1E-005mnR-0r;
	Thu, 02 Jul 2026 20:20:12 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/2] readyfd2sd: add recipe
Date: Thu,  2 Jul 2026 20:20:11 +0200
Message-ID: <20260702182012.2240881-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 18:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240067

Some services, such as seatd, only implement the s6 init ready notificati=
ons.
readyfd2sd translates those notifications to the systemd-notify format, t=
o
make them usable with the systemd init system.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 meta/recipes-core/readyfd2sd/readyfd2sd_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/readyfd2sd/readyfd2sd_git.bb

diff --git a/meta/recipes-core/readyfd2sd/readyfd2sd_git.bb b/meta/recipe=
s-core/readyfd2sd/readyfd2sd_git.bb
new file mode 100644
index 000000000000..5d4b23212d3a
--- /dev/null
+++ b/meta/recipes-core/readyfd2sd/readyfd2sd_git.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "s6 readyfd to systemd sd_notify adapter"
+HOMEPAGE =3D "https://git.sr.ht/~kennylevinsen/readyfd2sd"
+DESCRIPTION =3D "${SUMMARY}"
+SECTION =3D "base"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc50481d620cb912754d78d319eeec=
30a"
+
+DEPENDS =3D "systemd"
+
+PV =3D "0.1+git"
+SRC_URI =3D "git://git.sr.ht/~kennylevinsen/readyfd2sd;protocol=3Dhttps;=
branch=3Dmaster"
+SRCREV =3D "87c99ce10dca3f3c3e5c3a0d994ee7892e952b61"
+
+inherit meson pkgconfig systemd
--=20
2.47.3


