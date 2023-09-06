Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38314EE14CC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:14:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6280.1694024067897391609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82847106F;
	Wed,  6 Sep 2023 11:15:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D2323F67D;
	Wed,  6 Sep 2023 11:14:26 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/7] harfbuzz: update PACKAGECONFIG
Date: Wed,  6 Sep 2023 19:14:16 +0100
Message-Id: <20230906181420.795510-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906181420.795510-1-ross.burton@arm.com>
References: <20230906181420.795510-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187344

From: Ross Burton <ross.burton@arm.com>

Add a chafa PACKAGECONFIG so that we explicitly disable it, and update
the graphite PACKAGECONFIG to use the graphite2 option as the old name is
deprecated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb b/meta/reci=
pes-graphics/harfbuzz/harfbuzz_8.1.1.bb
index 110248a5cb4..9422db20055 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
@@ -22,9 +22,10 @@ GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG ??=3D "cairo freetype glib icu"
 PACKAGECONFIG[cairo] =3D "-Dcairo=3Denabled,-Dcairo=3Ddisabled,cairo"
+PACKAGECONFIG[chafa] =3D "-Dchafa=3Denabled,-Dchafa=3Ddisabled,chafa"
 PACKAGECONFIG[freetype] =3D "-Dfreetype=3Denabled,-Dfreetype=3Ddisabled,=
freetype"
 PACKAGECONFIG[glib] =3D "-Dglib=3Denabled,-Dglib=3Ddisabled,glib-2.0"
-PACKAGECONFIG[graphite] =3D "-Dgraphite=3Denabled,-Dgraphite=3Ddisabled,=
graphite2"
+PACKAGECONFIG[graphite] =3D "-Dgraphite2=3Denabled,-Dgraphite2=3Ddisable=
d,graphite2"
 PACKAGECONFIG[icu] =3D "-Dicu=3Denabled,-Dicu=3Ddisabled,icu"
=20
 PACKAGES =3D+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
--=20
2.34.1


