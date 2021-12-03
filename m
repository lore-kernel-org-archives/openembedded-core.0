Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDE7C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 16:43:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13841.1638549826126588879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 08:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2A01477
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC1733F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:43:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] libxkbcommon: remove obsolete util-macros dependency
Date: Fri,  3 Dec 2021 16:43:36 +0000
Message-Id: <20211203164340.2963235-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203164340.2963235-1-ross.burton@arm.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 16:43:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159120

This is a hang-over from the autotools build system.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
index 0e75ed03dc..95accfc184 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.xkbcommon.org"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De525ed9809e1f8a07cf4bce8b09e8=
b87"
 LICENSE =3D "MIT & MIT-style"
=20
-DEPENDS =3D "util-macros flex-native bison-native"
+DEPENDS =3D "flex-native bison-native"
=20
 SRC_URI =3D "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
=20
--=20
2.25.1


