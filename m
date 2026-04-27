Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87859FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:09:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6359.1777324132532623078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=px3pbH3k;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96DDB16F2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8FF03F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777324132; bh=iNhCROtt9o9nw5wqXkLZtokkOFbv4EU+HfTt4fa6hqY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=px3pbH3kqxPGUSEbjhvo03GT/DsliS3qV4KdxXlALHSx1Sd2w7e3+Z31tfZzAQrBB
	 9M/FXPCK/WuKg0p7EmSDuUVu7URpICwnLY3iTV8CLgq3d27j7RUAhZQPusI2R+aEVq
	 EZr3797y5y295rcacDcW9L5zKXXdLE+oTliuAe0M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] gobject-introspection: remove obsolete explicit debug packaging
Date: Mon, 27 Apr 2026 22:08:46 +0100
Message-ID: <20260427210847.3027890-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427210847.3027890-1-ross.burton@arm.com>
References: <20260427210847.3027890-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236028

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gobject-introspection/gobject-introspection_1.86.0.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.86.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.86.0.bb
index fbba8fd6ec4..51cae5fff60 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86=
.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86=
.0.bb
@@ -195,7 +195,6 @@ FILES:${PN}-dev:append =3D " ${datadir}/gobject-intro=
spection-1.0/gdump.c \
 FILES:${PN}-dev:append =3D " ${datadir}/gobject-introspection-1.0/tests/=
*.c \
                            ${datadir}/gobject-introspection-1.0/tests/*.=
h"
=20
-FILES:${PN}-dbg +=3D "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES:${PN}-staticdev +=3D "${libdir}/gobject-introspection/giscanner/*.=
a"
=20
 # glib-2.0 is required for libgirepository
--=20
2.43.0


