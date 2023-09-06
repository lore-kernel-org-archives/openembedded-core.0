Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9325EE14A8
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 15:17:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1045.1694013411780992078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 08:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 511FD106F;
	Wed,  6 Sep 2023 08:17:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0D7B3F7B4;
	Wed,  6 Sep 2023 08:16:50 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] qemu-system-native: enable PNG support
Date: Wed,  6 Sep 2023 16:16:47 +0100
Message-Id: <20230906151648.313352-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 15:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187320

From: Ross Burton <ross.burton@arm.com>

It might be useful to grab screenshots from qemu-system-native (for
example, for QA purposes).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_8.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.0.4.bb b/met=
a/recipes-devtools/qemu/qemu-system-native_8.0.4.bb
index 04c7c2a6acf..558a416f7b4 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_8.0.4.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_8.0.4.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0-native zlib-native pixman-native =
qemu-native bison-native me
=20
 EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_system_target_list=
(d)}"
=20
-PACKAGECONFIG ??=3D "fdt alsa kvm pie slirp \
+PACKAGECONFIG ??=3D "fdt alsa kvm pie slirp png \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epo=
xy', '', d)} \
 "
=20
--=20
2.34.1


