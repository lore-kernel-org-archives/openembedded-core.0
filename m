Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D1CC3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6629.1746866659294087369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0816B153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 973693F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/23] meson: remove sysroot from the native environment file
Date: Sat, 10 May 2025 09:43:55 +0100
Message-ID: <20250510084400.269726-22-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216270

The [properties]sys_root assignment doesn't actually do much in cross
builds, and does nothing in native builds (confirmed by the Meson
author).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson_1.8.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.8.0.bb b/meta/recipes-de=
vtools/meson/meson_1.8.0.bb
index 1d1011597b9..5d4fc39751b 100644
--- a/meta/recipes-devtools/meson/meson_1.8.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.0.bb
@@ -83,9 +83,6 @@ c_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${included=
ir_native}' , ${@var_list2s
 c_link_args =3D ${@generate_native_link_template(d)}
 cpp_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , $=
{@var_list2str('BUILD_OPTIMIZATION', d)}]
 cpp_link_args =3D ${@generate_native_link_template(d)}
-
-[properties]
-sys_root =3D '@OECORE_NATIVE_SYSROOT'
 EOF
 }
=20
--=20
2.43.0


