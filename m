Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922CFF5A8B6
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:08:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1310.1776712075893373664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gHrgVwad;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D6C22E6
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 050213F915
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776712075; bh=9lJGftGrE5hk/RBJu2fsdUA8112TyDJUu5WFvO8u6aM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gHrgVwadu/XBYp7RANfTYq6BATzY3aRNQVXnFMABFODTmoS/ALbVyyMRe1wg+IgBU
	 TlpjmMrDW3Rv2hS0OqlIsq+v7/3nbcuZxOO3QWhR62HH8INh8LUXpO860qY4GXEz8x
	 +k/ZMCzGy/7N0YGhSpNVjwXLq/gB2vAsXiZ0Qvj4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] xz: mark several CVEs as fixed
Date: Mon, 20 Apr 2026 20:07:47 +0100
Message-ID: <20260420190749.1280090-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420190749.1280090-1-ross.burton@arm.com>
References: <20260420190749.1280090-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 19:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235584

- CVE-2024-47611 was fixed in 5.6.3 and is Windows-specific.
- CVE-2025-31115 was fixed in 5.8.1.
- CVE-2025-58058 is specific to the Go xz module, not this recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/xz/xz_5.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended=
/xz/xz_5.8.2.bb
index 982f5054c3a..7ada44d9f58 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.2.bb
@@ -72,3 +72,7 @@ do_install_ptest () {
     ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scripts/xzdiff
     ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scripts/xzgrep
 }
+
+CVE_STATUS[CVE-2024-47611] =3D "fixed-version: fixed in 5.6.3 and Window=
s-specific"
+CVE_STATUS[CVE-2025-31115] =3D "fixed-version: fixed in 5.8.1"
+CVE_STATUS[CVE-2025-58058] =3D "cpe-incorrect: this is specific to the G=
o xz module"
--=20
2.43.0


