Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E261C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:39:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.756.1713803930269505733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7716150C;
	Mon, 22 Apr 2024 09:39:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 344E53F7BD;
	Mon, 22 Apr 2024 09:38:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/5] waffle: remove dependency on udev
Date: Mon, 22 Apr 2024 16:38:42 +0000
Message-Id: <20240422163846.1012183-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198597

Waffle 1.8.0 dropped the use of libudev and instead uses libdrm[1] in
the gbm code. Update the depends.

[1] https://gitlab.freedesktop.org/mesa/waffle/-/commit/6bf58d4bb9044a7c6=
5818d5de5d4ca747766e77f

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/waffle/waffle_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.8.0.bb b/meta/recipes-=
graphics/waffle/waffle_1.8.0.bb
index 12b31dcff1c..ad8649b40ef 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.0.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[glx] =3D "-Dglx=3Denabled,-Dglx=3Ddisable=
d,virtual/${MLPREFIX}libgl libx
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,vir=
tual/${MLPREFIX}egl wayland wayland-native wayland-protocols"
=20
 # wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled,virtual/${MLPRE=
FIX}egl virtual/${MLPREFIX}libgbm udev"
+PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled,virtual/${MLPRE=
FIX}egl virtual/${MLPREFIX}libgbm libdrm"
=20
 # wants egl.pc
 PACKAGECONFIG[x11-egl] =3D "-Dx11_egl=3Denabled,-Dx11_egl=3Ddisabled,vir=
tual/${MLPREFIX}egl libxcb"
--=20
2.34.1


