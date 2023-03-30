Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DF2C77B62
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 18:50:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34227.1680202209821924900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 11:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94668113E;
	Thu, 30 Mar 2023 11:50:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C27C13F663;
	Thu, 30 Mar 2023 11:50:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] libgit2: clean up CMake variables
Date: Thu, 30 Mar 2023 19:50:05 +0100
Message-Id: <20230330185006.306389-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330185006.306389-1-ross.burton@arm.com>
References: <20230330185006.306389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 18:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179349

LIB_INSTALL_DIR was removed in libgit2 1.0 when they moved to using
GNUInstallDirs.

BUILD_CLAR is now BUILD_TESTS as of libgit2 1.4.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libgit2/libgit2_1.6.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.6.3.bb b/meta/recipes=
-support/libgit2/libgit2_1.6.3.bb
index 554e18e4daf..cab7d7a20a8 100644
--- a/meta/recipes-support/libgit2/libgit2_1.6.3.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.6.3.bb
@@ -13,9 +13,8 @@ S =3D "${WORKDIR}/git"
 inherit cmake
=20
 EXTRA_OECMAKE =3D "\
-    -DBUILD_CLAR=3DOFF \
+    -DBUILD_TESTS=3DOFF \
     -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
-    -DLIB_INSTALL_DIR=3D${libdir} \
     -DREGEX_BACKEND=3D'pcre2' \
 "
=20
--=20
2.34.1


