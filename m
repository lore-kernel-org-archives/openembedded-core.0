Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82747C3DA70
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 17:19:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16531.1721841575006931476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 10:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A9FB1007
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:20:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 437A03F766
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:19:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-idna: generalise RDEPENDS
Date: Wed, 24 Jul 2024 18:19:25 +0100
Message-Id: <20240724171926.3724005-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724171926.3724005-1-ross.burton@arm.com>
References: <20240724171926.3724005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 17:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202472

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-idna_3.7.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-idna_3.7.bb b/meta/reci=
pes-devtools/python/python3-idna_3.7.bb
index 729aff1c462..20c92d65372 100644
--- a/meta/recipes-devtools/python/python3-idna_3.7.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "028ff3aadf0609c1fd278d8ea30892994=
12a7a8b9bd005dd08b9f8285b
=20
 inherit pypi python_flit_core
=20
-RDEPENDS:${PN}:class-target =3D "\
-    python3-codecs \
-"
+RDEPENDS:${PN} +=3D "python3-codecs"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


