Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DC2C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:26:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89082.1754058361749096349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B82B1516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:25:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09A823F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:26:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] icu: drop dependency on autoconf-archive-native
Date: Fri,  1 Aug 2025 15:25:53 +0100
Message-ID: <20250801142554.3273064-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142554.3273064-1-ross.burton@arm.com>
References: <20250801142554.3273064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221353

The tarball includes the relevant M4 macros, so autoconf-archive is not
needed to reconfigure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/icu/icu_77-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/=
icu/icu_77-1.bb
index cd81a6c729d..43ea865f2d7 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -6,7 +6,7 @@ same results on all platforms."
 HOMEPAGE =3D "https://icu.unicode.org/"
=20
 LICENSE =3D "ICU"
-DEPENDS =3D "icu-native autoconf-archive-native"
+DEPENDS =3D "icu-native"
=20
 CVE_PRODUCT =3D "international_components_for_unicode"
=20
--=20
2.43.0


