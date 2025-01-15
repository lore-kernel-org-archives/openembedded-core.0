Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBE7C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 16:33:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25932.1736958811420052883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 08:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68D9011FB
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:33:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A29CB3F673
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:33:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libtool: remove obsolete ACLOCALEXTRAPATH
Date: Wed, 15 Jan 2025 16:33:17 +0000
Message-ID: <20250115163318.1110804-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115163318.1110804-1-ross.burton@arm.com>
References: <20250115163318.1110804-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209921

This variable no longer exists, and would have had the effect of not
letting the target libtool see the contents of the native aclocal
directory.

I don't understand why this was needed but autotools has improved
dramatically in the last eight years, so it's most likely obsolete now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/libtool/libtool_2.5.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool_2.5.4.bb b/meta/recipe=
s-devtools/libtool/libtool_2.5.4.bb
index 835f2da9948..fa16d09d21a 100644
--- a/meta/recipes-devtools/libtool/libtool_2.5.4.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.5.4.bb
@@ -12,8 +12,6 @@ SYSROOT_DIRS_IGNORE +=3D " \
     ${datadir}/libtool/build-aux \
 "
=20
-ACLOCALEXTRAPATH:class-target =3D ""
-
 inherit multilib_script
=20
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/libtool"
--=20
2.43.0


