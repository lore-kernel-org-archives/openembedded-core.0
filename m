Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ECCEE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 10:26:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.55216.1694427977312107609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 03:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B00FD75;
	Mon, 11 Sep 2023 03:26:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95DD03F5A1;
	Mon, 11 Sep 2023 03:26:15 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] packagegroup-core-x11-xserver: add modesetting driver to default XSERVER
Date: Mon, 11 Sep 2023 11:26:12 +0100
Message-Id: <20230911102614.377841-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187486

From: Ross Burton <ross.burton@arm.com>

On modern systems, both real and virtual hardware, the modesetting
driver is preferred over the dumb framebuffer driver as it is more
functional and is essentially the default Xorg video driver.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-core-x11-xserver.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xs=
erver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xser=
ver.bb
index 3bb308fbba4..b1087859311 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.b=
b
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.b=
b
@@ -11,7 +11,10 @@ inherit packagegroup features_check
 # rdepends on XSERVER
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-XSERVER ?=3D "xserver-xorg xf86-video-fbdev"
+XSERVER ?=3D "xserver-xorg \
+            xf86-video-fbdev \
+            xf86-video-modesetting \
+            "
 XSERVERCODECS ?=3D ""
=20
 RDEPENDS:${PN} =3D "\
--=20
2.34.1


