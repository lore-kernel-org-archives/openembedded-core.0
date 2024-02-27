Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F459C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 15:51:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15544.1709049109677231037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 07:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7E88DA7
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:52:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E25523F762
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:51:48 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libexif: remove unused version_underscore
Date: Tue, 27 Feb 2024 15:51:44 +0000
Message-Id: <20240227155145.2679899-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 15:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196277

From: Ross Burton <ross.burton@arm.com>

This function hasn't been used since the upgrade to 0.6.23 in 2021[1]

[1] oe-core 65a54f72e15f59bdf9d8c4618f3ef8510541d134

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libexif/libexif_0.6.24.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipe=
s-support/libexif/libexif_0.6.24.bb
index 27e369a89a5..b407ee52de0 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -7,9 +7,6 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad"
=20
-def version_underscore(v):
-    return "_".join(v.split("."))
-
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
--=20
2.34.1


