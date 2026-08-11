Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B78C5CFEB
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:36:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55860.1786458973685647803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 07:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OFOZ7tc1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5246A1516
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:36:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8DAA3F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786458973; bh=CGESz5gqGrgFX47gvN9QZm42yNrNaCxnrL4kn6xdh3U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OFOZ7tc1vmstD++zTJqDi9KOFtoXbC7QaFzrA9PpwP+TWhyDRMlQo7LM+8x/XYSqJ
	 fqaUm1UobSQ3qYpvqF0zcPx4UT7p0v7S/MLauotAeydMSNtltC5ihcUlPUKLQuG+yC
	 peRGRK8KrMB9kTBLEl1iYUqQNyHObSKvKKioZ3cE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] classes/python_mesonpy: remove wheel dependency
Date: Tue, 11 Aug 2026 15:36:05 +0100
Message-ID: <20260811143607.1200407-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811143607.1200407-1-ross.burton@arm.com>
References: <20260811143607.1200407-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 14:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243207

This class has never needed the wheel package, as it builds wheels on
its own.  I suspect this was copy-pasted from the setuptools classes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_mesonpy.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-re=
cipe/python_mesonpy.bbclass
index 3613ea19c76..0ad1c970a9f 100644
--- a/meta/classes-recipe/python_mesonpy.bbclass
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -17,7 +17,7 @@ meson_do_qa_configure () {
 # ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pic=
k one.
 MESONOPTS:remove =3D "--buildtype ${MESON_BUILDTYPE}"
=20
-DEPENDS +=3D "python3-wheel-native python3-meson-python-native"
+DEPENDS +=3D "python3-meson-python-native"
=20
 def mesonpy_get_args(d):
     vars =3D ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
--=20
2.43.0


