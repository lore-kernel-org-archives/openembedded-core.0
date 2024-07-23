Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756FCC52D6F
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45843.1721746307226057788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3487A1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6471F3F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/37] python3-beartype: add missing RDEPENDS
Date: Tue, 23 Jul 2024 15:51:09 +0100
Message-Id: <20240723145137.74198-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202376

These parts of the standard library are imported by beartype.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-beartype_0.18.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/me=
ta/recipes-devtools/python/python3-beartype_0.18.5.bb
index 04fbd3139fb..00554dd60c5 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] =3D "264ddc2f1da9ec94ff639141fbe33d22e=
12a9f75aa863b83b7046ffff1
=20
 inherit setuptools3 pypi
=20
+RDEPENDS:${PN} +=3D "python3-numbers python3-io"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


