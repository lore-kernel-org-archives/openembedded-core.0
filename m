Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB6CC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 13:45:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12001.1636033532871843960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 06:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2CD51063
	for <openembedded-core@lists.openembedded.org>;
 Thu,  4 Nov 2021 06:45:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BDB83F7D7
	for <openembedded-core@lists.openembedded.org>;
 Thu,  4 Nov 2021 06:45:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: set objcopy in the cross and native toolchain files
Date: Thu,  4 Nov 2021 13:45:29 +0000
Message-Id: <20211104134529.3675718-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 13:45:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157843

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index da58cb4bec..4ba70de3dc 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -48,6 +48,7 @@ ar =3D ${@meson_array('AR', d)}
 nm =3D ${@meson_array('NM', d)}
 strip =3D ${@meson_array('STRIP', d)}
 readelf =3D ${@meson_array('READELF', d)}
+objcopy =3D ${@meson_array('OBJCOPY', d)}
 pkgconfig =3D 'pkg-config'
 llvm-config =3D 'llvm-config${LLVMVERSION}'
 cups-config =3D 'cups-config'
@@ -85,6 +86,7 @@ ar =3D ${@meson_array('BUILD_AR', d)}
 nm =3D ${@meson_array('BUILD_NM', d)}
 strip =3D ${@meson_array('BUILD_STRIP', d)}
 readelf =3D ${@meson_array('BUILD_READELF', d)}
+objcopy =3D ${@meson_array('BUILD_OBJCOPY', d)}
 pkgconfig =3D 'pkg-config-native'
=20
 [built-in options]
--=20
2.25.1


