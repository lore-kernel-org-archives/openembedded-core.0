Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CABC3DA7E
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39106.1721921439337102058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 08:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AA441007
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:31:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BF273F766
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:30:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-numpy: ignore pep517-backend warnings
Date: Thu, 25 Jul 2024 16:30:28 +0100
Message-Id: <20240725153029.828624-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725153029.828624-1-ross.burton@arm.com>
References: <20240725153029.828624-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 15:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202509

Upstream has a pyproject.toml but it's marked as experimental and does
not currently work at all with the meson-python release we currently
have.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.4.bb
index ccd08147af6..914245507c7 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -61,4 +61,7 @@ RDEPENDS:${PN}-ptest +=3D "python3-pytest \
                          ldd \
 "
=20
+# Upstream has a pyproject.toml but as of 1.26.4 it's marked as experime=
ntal
+INSANE_SKIP =3D "pep517-backend"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


