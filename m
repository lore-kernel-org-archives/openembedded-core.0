Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8A2C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 17:11:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21550.1785863509371579516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 10:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Yt+y6Npz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D811476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:11:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 690F43F632
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863508; bh=G/z1BwK5bV5uC9XSqaxEM5Yu0x86s81G9UNrhM+FkmE=;
	h=From:To:Subject:Date:From;
	b=Yt+y6Npz0IOeqNPsnhJ/gtuNL0ogvSGCzoRh8v4S0DMH15dSMoR0hwSkeH9w9Y82K
	 IfbbbGE4HSKAjqFBQB1JwrLqI1iMQuVwzMQJKMBkBiLOqJwK6T6ZFDTHrx3mhdWETi
	 t8SMw6IteSGwCaPCu7B+E8AQzlOY6R/P2hH55BqU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] xmodmap: use meson to build
Date: Tue,  4 Aug 2026 18:11:42 +0100
Message-ID: <20260804171144.665123-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 17:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242791

Since 1.0.12 xmodmap can use meson to build, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb b/meta/reci=
pes-graphics/xorg-app/xmodmap_1.0.12.bb
index 633c70ee048..309aed15816 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
@@ -15,3 +15,5 @@ PE =3D "1"
 SRC_URI[sha256sum] =3D "fc54b9b5bbf2ae58ba8f9d42bd051c41c7438377400c42c1=
7d7496d19e1bb3ce"
=20
 SRC_URI_EXT =3D "xz"
+
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


