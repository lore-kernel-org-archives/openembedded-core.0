Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9066BC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:45:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12936.1707759945138154293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01048DA7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:46:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57EB43F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:45:44 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] xz: remove redundant PTEST_ENABLED conditional
Date: Mon, 12 Feb 2024 17:45:41 +0000
Message-Id: <20240212174542.1200514-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195353

From: Ross Burton <ross.burton@arm.com>

There's no need to conditionally include run-ptest in the SRC_URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/xz/xz_5.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb b/meta/recipes-extended=
/xz/xz_5.4.5.bb
index 0f0849c3e5b..ad519e56894 100644
--- a/meta/recipes-extended/xz/xz_5.4.5.bb
+++ b/meta/recipes-extended/xz/xz_5.4.5.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ea84ebe7b9=
3cce676b54355dc6b2c0 \
                     "
=20
 SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz \
-           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
, '', d)} \
+           file://run-ptest \
           "
 SRC_URI[sha256sum] =3D "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c=
357a873709e5b7d6"
 UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
--=20
2.34.1


