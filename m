Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7357F5A8BA
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:08:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1306.1776712074667482746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KxbV/V9C;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8984922E6
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C43A93F915
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776712074; bh=9VQIOjIjHPoM128jAAMPvijLdG28xLWl8E/7m1wBXdw=;
	h=From:To:Subject:Date:From;
	b=KxbV/V9CYjWrlWIUoj7JvT7AO6JKF5cY3KDRP664sMYNbreL9lKvnu7g5/WiQc5lT
	 iWePH7Gk63Nak111+TmQCnM0MH8Kq1DyWlSwEYRHZVGaKfUagno0nF1wQSDskqEKE2
	 cnwYY72VlcNRI3k7XYgJJChXhONFEB/t/kjf4yJE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] bluez5: mark two CVEs as being in the wrong product
Date: Mon, 20 Apr 2026 20:07:45 +0100
Message-ID: <20260420190749.1280090-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 19:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235582

CVE-2020-12351 and CVE-2020-12352 ("BleedingTooth") are actually issues
in the Linux kernel, not BlueZ as reported in the CVE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.86.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.86.bb b/meta/recip=
es-connectivity/bluez5/bluez5_5.86.bb
index 2d56fc642de..8974a2c69c9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
@@ -5,6 +5,8 @@ LDFLAGS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-lld', '-Wl,-z,nostar
 SRC_URI[sha256sum] =3D "99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a=
29cf72ded339621d"
=20
 CVE_STATUS[CVE-2020-24490] =3D "cpe-incorrect: This issue has kernel fix=
es rather than bluez fixes"
+CVE_STATUS[CVE-2020-12351] =3D "cpe-incorrect: This issue has kernel fix=
es rather than bluez fixes"
+CVE_STATUS[CVE-2020-12352] =3D "cpe-incorrect: This issue has kernel fix=
es rather than bluez fixes"
=20
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
--=20
2.43.0


