Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF80C44512
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6584.1784124321237364609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZKFBEYX9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ED51152B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 671853F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124320; bh=/3xIzHLIe0Q9v7spwcSRj4uYhuajtHHV+Xz6szaD38A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZKFBEYX93ok3irqCL9Fve0evqWr1ikkcQsqRXNVKP4iK/ulmWz+o1u52dnCHN6PC8
	 jiaRwBIYjxD0rAheFOtLO0BNRadrKAFr/vyVJ5LHgMeepb4vwH0mKTmODv6fYoWPr+
	 057JgwYixvyiEu+slw6j3m+wkIlyMJWLCxmDseDs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] xrandr: build with meson
Date: Wed, 15 Jul 2026 15:05:06 +0100
Message-ID: <20260715140507.2329605-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240969

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb b/meta/recipe=
s-graphics/xorg-app/xrandr_1.5.4.bb
index ad864c8ed11..cabfa500236 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
@@ -14,4 +14,6 @@ PE =3D "1"
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "2cafccb2aaf2491a4068676117a0d4f90ab307724b96fffc=
54cd1da953779400"
=20
+XORGBUILDCLASS =3D "meson"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


