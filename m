Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36804D3ABE7
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66463.1731348831358484158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 014D01CE0
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9C633F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] pango: don't use deprecated gtk_doc option flag
Date: Mon, 11 Nov 2024 18:13:40 +0000
Message-Id: <20241111181341.3296523-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206974

The correct meson flag for the documentation is 'documentation'.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/pango/pango_1.54.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/pango/pango_1.54.0.bb b/meta/recipes-g=
raphics/pango/pango_1.54.0.bb
index de6f8bb3619..31f3f3d27ce 100644
--- a/meta/recipes-graphics/pango/pango_1.54.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.54.0.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[x11] =3D ",,virtual/libx11 libxft"
 PACKAGECONFIG[thai] =3D "-Dlibthai=3Denabled,-Dlibthai=3Ddisabled,libtha=
i"
=20
 GIR_MESON_OPTION =3D 'introspection'
+GIDOCGEN_MESON_OPTION =3D 'documentation'
=20
 LEAD_SONAME =3D "libpango-1.0*"
=20
--=20
2.34.1


