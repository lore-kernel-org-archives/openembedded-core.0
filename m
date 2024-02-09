Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E4BC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:24:35 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by mx.groups.io with SMTP id smtpd.web11.8982.1707477871469966853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 03:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=IqzWOwCO;
 spf=pass (domain: 163.com, ip: 117.135.210.4, mailfrom: chen_heyun@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tWNMP
	VaDOzb9zNGcARlvNa/8MRbeJ0h7ZgnVyJJ+CQI=; b=IqzWOwCOvYd7Nj9ixf3X7
	AEXoYtP/U+DPnNN36ATL6udsPa4uvLldgjJdh4uuoJBD1DDbvtISd2HuolwyZ/8t
	Yr/VOROsw9uVQ3bk7cJRZz0veEW8tTO7Igs7Tmsl2MkoOiV0eac3YnsyXCMxdkr0
	XVZcy6RtLlsiDV+E9Nm+v4=
Received: from ubuntu.localdomain (unknown [119.86.47.226])
	by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wD3n4FnC8ZlZEbyAA--.1773S2;
	Fri, 09 Feb 2024 19:24:23 +0800 (CST)
From: chenheyun <chen_heyun@163.com>
To: openembedded-core@lists.openembedded.org
Cc: chenheyun <chen_heyun@163.com>
Subject: [PATCH] Add user space utility:dropwatch
Date: Fri,  9 Feb 2024 03:24:21 -0800
Message-Id: <20240209112421.45771-1-chen_heyun@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wD3n4FnC8ZlZEbyAA--.1773S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW5Wr18XryrWFWrJw1kXwb_yoW8Jw4kpa
	yrCrn0kw48Jr12g3s3C3W7Kw4Sqw4vv34rA347Xw4avFy5Cr98JrWFyryfWF1fGF4Syr4U
	X3srXF4rWayxG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR4lkhUUUUU=
X-Originating-IP: [119.86.47.226]
X-CM-SenderInfo: xfkh0spkh130i6rwjhhfrp/1tbiTgp-RmVOBlFxNQAAsF
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 11:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195199

Signed-off-by: chenheyun <chen_heyun@163.com>
---
 .../dropwatch/dropwatch_git.bb                | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 meta/recipes-extended/dropwatch/dropwatch_git.bb

diff --git a/meta/recipes-extended/dropwatch/dropwatch_git.bb b/meta/recipe=
s-extended/dropwatch/dropwatch_git.bb
new file mode 100755
index 0000000000..62a1eab777
--- /dev/null
+++ b/meta/recipes-extended/dropwatch/dropwatch_git.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2024 chenheyun <chen_heyun@163.com>=0D
+# Released under the MIT license (see COPYING.MIT for the terms)=0D
+=0D
+SUMMARY  =3D "User space utility to diagnose to NetWorking packets are get=
ting dropped"=0D
+DESCRIPTION =3D "Dropwatch is an utility to interface to the kernel to mon=
itor for dropped \=0D
+               network packets"=0D
+                   =0D
+HOMEPAGE =3D "https://github.com/nhorman/dropwatch/"=0D
+LICENSE =3D "GPLv2+"=0D
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a"=0D
+DEPENDS =3D "libnl readline libpcap binutils"=0D
+=0D
+PV =3D "1.0.0"=0D
+=0D
+SRC_URI =3D "git://github.com/nhorman/dropwatch/;branch=3Dmaster;protocol=
=3Dhttps"=0D
+SRCREV =3D "853457b77dbc3d6665a379f3fe31ec53f11b6f61"=0D
+=0D
+S =3D "${WORKDIR}/git"=0D
+=0D
+inherit autotools pkgconfig gettext=0D
+=0D
+BBCLASSEXTEND =3D "native nativesdk"=0D
--=20
2.25.1


