Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8812CCAC5B6
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:07:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10913.1758715672309540775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED80497
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6ECD53F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] classes/cmake: set CMAKE_CROSSCOMPILING explicitly
Date: Wed, 24 Sep 2025 13:07:38 +0100
Message-ID: <20250924120745.2883969-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924120745.2883969-1-ross.burton@arm.com>
References: <20250924120745.2883969-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223965

Let's be explicit and ensure that CMAKE_CROSSCOMPILING is explicitly set
to true when we're cross-compiling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
index 0dc8ea143b2..b8cd622c2df 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -122,6 +122,7 @@ cmake_do_generate_toolchain_file() {
 	if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ]; then
 		cmake_crosscompiling=3D"set( CMAKE_CROSSCOMPILING FALSE )"
 	else
+		cmake_crosscompiling=3D"set( CMAKE_CROSSCOMPILING TRUE )"
 		cmake_sysroot=3D"set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )"
 	fi
=20
--=20
2.43.0


