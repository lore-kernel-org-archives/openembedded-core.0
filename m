Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C50AC7EE2C
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:52:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8294.1685973166124409507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 06:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4083215BF;
	Mon,  5 Jun 2023 06:53:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AB5E3F663;
	Mon,  5 Jun 2023 06:52:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/4] pkgconf: upgrade 1.9.4 -> 1.9.5
Date: Mon,  5 Jun 2023 14:52:41 +0100
Message-Id: <20230605135241.2568169-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605135241.2568169-1-ross.burton@arm.com>
References: <20230605135241.2568169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 13:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182384

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/{pkgconf_1.9.4.bb =3D> pkgconf_1.9.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.4.bb =3D> pkgconf_1.9.=
5.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_1.9.5.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
index ab0f371093f..4bdf03c574c 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "daccf1bbe5a30d149b556c7d2ffffeafd76d7b514e249271=
abdd501533c1d8ae"
+SRC_URI[sha256sum] =3D "1ac1656debb27497563036f7bffc281490f83f9b8457c0d6=
0bcfb638fb6b6171"
=20
 inherit autotools
=20
--=20
2.34.1


