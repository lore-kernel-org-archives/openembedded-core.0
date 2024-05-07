Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A16BC25B5F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 13:51:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12263.1715089910805845290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 06:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 390921063
	for <openembedded-core@lists.openembedded.org>; Tue,  7 May 2024 06:52:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDF133F6A8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 May 2024 06:51:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] curl: locale-base-en-us isn't glibc-specific
Date: Tue,  7 May 2024 13:51:47 +0000
Message-Id: <20240507135148.2783699-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 13:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199095

The musl-locales package provides this too, so we can depend without a
libc override.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index c74416d7e9d..3fdad6a4cf8 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -120,6 +120,7 @@ do_install_ptest() {
=20
 RDEPENDS:${PN}-ptest +=3D " \
 	bash \
+	locale-base-en-us \
 	perl-module-b \
 	perl-module-base \
 	perl-module-cwd \
@@ -135,7 +136,6 @@ RDEPENDS:${PN}-ptest +=3D " \
 	perl-module-storable \
 	perl-module-time-hires \
 "
-RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us"
=20
 PACKAGES =3D+ "lib${BPN}"
=20
--=20
2.34.1


