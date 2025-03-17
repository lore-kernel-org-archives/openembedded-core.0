Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F16EC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:12:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55267.1742224342037570223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 977B71688
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 08:12:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 584F53F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 08:12:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libcap: upgrade to 2.75
Date: Mon, 17 Mar 2025 15:12:14 +0000
Message-ID: <20250317151216.3484052-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317151216.3484052-1-ross.burton@arm.com>
References: <20250317151216.3484052-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 15:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213107

Just one change, to fix the Go psx module build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libcap/{libcap_2.74.bb =3D> libcap_2.75.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.74.bb =3D> libcap_2.75.bb} =
(95%)

diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-su=
pport/libcap/libcap_2.75.bb
similarity index 95%
rename from meta/recipes-support/libcap/libcap_2.74.bb
rename to meta/recipes-support/libcap/libcap_2.75.bb
index 9240763e9a5..9178971d36c 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.75.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/li=
nux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk =3D " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-contain=
ing.patch \
            "
-SRC_URI[sha256sum] =3D "eb85271f2893188644b6451cec8ce99f4541498f16ff9f84=
877c2fc872717714"
+SRC_URI[sha256sum] =3D "de4e7e064c9ba451d5234dd46e897d7c71c96a9ebf9a0c44=
5bc04f4742d83632"
=20
 UPSTREAM_CHECK_URI =3D "https://www.kernel.org/pub/linux/libs/security/l=
inux-privs/${BPN}2/"
=20
--=20
2.43.0


