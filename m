Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9F5C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:28:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.34873.1749220113033848348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE8C152B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E15F3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 11/16] unfs3: put version in recipe filename
Date: Fri,  6 Jun 2025 15:28:16 +0100
Message-ID: <20250606142822.3387675-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606142822.3387675-1-ross.burton@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218152

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, and drop the explicit PV.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/unfs3/{unfs3_git.bb =3D> unfs3_0.10.0.bb} | 2 --
 1 file changed, 2 deletions(-)
 rename meta/recipes-devtools/unfs3/{unfs3_git.bb =3D> unfs3_0.10.0.bb} (=
98%)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devt=
ools/unfs3/unfs3_0.10.0.bb
similarity index 98%
rename from meta/recipes-devtools/unfs3/unfs3_git.bb
rename to meta/recipes-devtools/unfs3/unfs3_0.10.0.bb
index 0a274d6ffd4..045e496ccdb 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.10.0.bb
@@ -22,8 +22,6 @@ SRC_URI =3D "git://github.com/unfs3/unfs3.git;protocol=3D=
https;branch=3Dmaster \
 SRCREV =3D "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX =3D "unfs3\-(?P<pver>\d+(\.\d+)+)"
=20
-PV =3D "0.10.0"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit autotools pkgconfig
--=20
2.43.0


