Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E458C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 17:11:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21545.1785863509624251118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 10:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=u3OF3W6w;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E94CF165C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:11:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65F963F632
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863509; bh=ckk+y6FHfnDlAjJ+nvKugWKR48cQX50HNFE+Mia8Tp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u3OF3W6weumIICgiNPm9K2SRC8LF+HJAyju4+QjxyIrsRn3TZshsI3ZTI/VlZjM4W
	 0sdpHEgb0Bi2K7+hn055Lwqch4wQJf16JXvkAjfdCHChgiGpSbsXujBQomD6u0Psj9
	 fj/QDiRh7aJYIS+MWQA8aXOhbKASvKUAFTnWZBSg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] xvinfo: use meson to build
Date: Tue,  4 Aug 2026 18:11:43 +0100
Message-ID: <20260804171144.665123-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804171144.665123-1-ross.burton@arm.com>
References: <20260804171144.665123-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 17:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242792

Since 1.1.6 xvinfo can use meson to build, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb b/meta/recipe=
s-graphics/xorg-app/xvinfo_1.1.6.bb
index 75f9b26a85d..9b411dd7679 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
@@ -12,3 +12,5 @@ PE =3D "1"
=20
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "a436945e6a4ab70590358eec2b85d26970f7de480d27e8a2=
5af8fe8421e88ae2"
+
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


