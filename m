Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BA5C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:26:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89230.1754058361129077661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAF1C1516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:25:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 591E13F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:26:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libx11: drop dependency on autoconf-archive-native
Date: Fri,  1 Aug 2025 15:25:52 +0100
Message-ID: <20250801142554.3273064-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142554.3273064-1-ross.burton@arm.com>
References: <20250801142554.3273064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221352

The tarball includes the relevant M4 macros, so autoconf-archive is not
needed to reconfigure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recip=
es-graphics/xorg-lib/libx11_1.8.12.bb
index 5ce54817432..580e44889df 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
@@ -13,7 +13,6 @@ DEPENDS +=3D "xorgproto \
             xtrans \
             libxcb \
             xorgproto-native \
-            autoconf-archive-native \
             "
=20
 PROVIDES =3D "virtual/libx11"
--=20
2.43.0


