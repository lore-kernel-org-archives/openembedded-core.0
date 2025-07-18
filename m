Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8414DC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 13:58:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21521.1752847124972972559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 06:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F314916A3
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 06:58:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D4E283F694
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 06:58:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] harfbuzz: disable building the tests
Date: Fri, 18 Jul 2025 14:58:39 +0100
Message-ID: <20250718135840.1969215-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 13:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220597

We don't (yet) install these, so don't build them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
index 71eada7f284..bc2c6acdaec 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
@@ -21,6 +21,8 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
+EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
+
 PACKAGECONFIG ??=3D "cairo freetype glib icu"
 PACKAGECONFIG[cairo] =3D "-Dcairo=3Denabled,-Dcairo=3Ddisabled,cairo"
 PACKAGECONFIG[chafa] =3D "-Dchafa=3Denabled,-Dchafa=3Ddisabled,chafa"
--=20
2.43.0


