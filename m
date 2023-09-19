Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16DFCD54B0
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 10:18:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5154.1695118690283611064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 03:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D25D1FB;
	Tue, 19 Sep 2023 03:18:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6D953F67D;
	Tue, 19 Sep 2023 03:18:08 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libwebp: upgrade to 1.3.2
Date: Tue, 19 Sep 2023 11:18:06 +0100
Message-Id: <20230919101806.3488392-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 10:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187852

From: Ross Burton <ross.burton@arm.com>

This is a point release with just one change:

  * security fix for lossless decoder (chromium: #1479274, CVE-2023-4863)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../webp/{libwebp_1.3.1.bb =3D> libwebp_1.3.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.3.1.bb =3D> libwebp_1.3.2=
.bb} (96%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb b/meta/recipes=
-multimedia/webp/libwebp_1.3.2.bb
similarity index 96%
rename from meta/recipes-multimedia/webp/libwebp_1.3.1.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.2.bb
index b9e763b08e3..63b0fd9a6c9 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932c26=
f2dab503abf70c96d8bb \
                     file://PATENTS;md5=3Dc6926d0cb07d296f886ab6e0cc5a85b=
7"
=20
 SRC_URI =3D "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz=
"
-SRC_URI[sha256sum] =3D "b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c=
8c0c9e6cd3c4ef66"
+SRC_URI[sha256sum] =3D "2a499607df669e40258e53d0ade8035ba4ec0175244869d1=
025d460562aa09b4"
=20
 UPSTREAM_CHECK_URI =3D "http://downloads.webmproject.org/releases/webp/i=
ndex.html"
=20
--=20
2.34.1


