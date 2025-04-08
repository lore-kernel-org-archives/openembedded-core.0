Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144F9C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 18:21:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3106.1744136472605231509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 11:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8828740C61;
	Tue,  8 Apr 2025 18:21:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lD_Evvz1j8ji; Tue,  8 Apr 2025 18:21:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E20340800;
	Tue,  8 Apr 2025 18:21:10 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C3039165959;
	Tue,  8 Apr 2025 14:21:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] nativesdk-buildtools-perl-dummy: add more missing packages
Date: Tue,  8 Apr 2025 14:21:05 -0400
Message-Id: <20250408182105.2717340-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 18:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214552

From: Denys Dmytriyenko <denys@konsulko.com>

There could be several more nativesdk perl packages generated
based on flags and dependencies that should not be installed
into the SDK when "dummy-sdk-package" facility is used. Add
them to the exclusion list here.

[YOCTO #15552]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/=
meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index bb4e746237..2813fbc397 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -2,6 +2,7 @@ DUMMYARCH =3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
 DUMMYPROVIDES_PACKAGES =3D "\
     nativesdk-perl \
+    nativesdk-perl-dev \
     nativesdk-libxml-parser-perl \
     nativesdk-perl-module-bytes \
     nativesdk-perl-module-carp \
@@ -9,6 +10,7 @@ DUMMYPROVIDES_PACKAGES =3D "\
     nativesdk-perl-module-data-dumper \
     nativesdk-perl-module-errno \
     nativesdk-perl-module-exporter \
+    nativesdk-perl-module-feature \
     nativesdk-perl-module-file-basename \
     nativesdk-perl-module-file-compare \
     nativesdk-perl-module-file-copy \
@@ -16,15 +18,18 @@ DUMMYPROVIDES_PACKAGES =3D "\
     nativesdk-perl-module-file-glob \
     nativesdk-perl-module-file-path \
     nativesdk-perl-module-file-spec \
+    nativesdk-perl-module-file-spec-unix \
     nativesdk-perl-module-file-stat \
     nativesdk-perl-module-file-temp \
     nativesdk-perl-module-getopt-long \
+    nativesdk-perl-module-integer \
     nativesdk-perl-module-io-file \
     nativesdk-perl-module-list-util \
     nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
     nativesdk-perl-module-scalar-util \
     nativesdk-perl-module-strict \
+    nativesdk-perl-module-symbol \
     nativesdk-perl-module-text-parsewords \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
--=20
2.25.1


