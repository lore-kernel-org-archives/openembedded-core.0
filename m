Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ED4D3ABE0
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66251.1731348830961284486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 501F81480
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 045F33F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] libpciaccess: add (and enable) the option for compressed pci.ids file
Date: Mon, 11 Nov 2024 18:13:39 +0000
Message-Id: <20241111181341.3296523-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206973

A small dependency allows the 1.3MB pci.ids file to be compressed down
to 300K.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb b/meta=
/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
index 247a14ac44e..7bcf51d56f2 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
@@ -16,4 +16,7 @@ SRC_URI[sha256sum] =3D "4af43444b38adb5545d0ed1c2ce46d9=
608cc47b31c2387fc5181656765
=20
 inherit pkgconfig meson
=20
+PACKAGECONFIG ?=3D "zlib"
+PACKAGECONFIG[zlib] =3D "-Dzlib=3Denabled,-Dzlib=3Ddisabled,zlib"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


