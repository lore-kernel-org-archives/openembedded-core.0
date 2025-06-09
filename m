Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C086CC71136
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.56841.1749467998049807437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9C4114BF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 578513F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 08/16] squashfs-tools: put version in recipe filename
Date: Mon,  9 Jun 2025 12:19:40 +0100
Message-ID: <20250609111948.2282441-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111948.2282441-1-ross.burton@arm.com>
References: <20250609111948.2282441-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218277

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, drop the explicit PV, and set the tag
name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{squashfs-tools_git.bb =3D> squashfs-tools_4.6.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_git.bb =3D> =
squashfs-tools_4.6.1.bb} (99%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
similarity index 99%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
index 982a43f8899..51a2fbdb934 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
@@ -7,9 +7,9 @@ SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-PV =3D "4.6.1"
-SRCREV =3D "d8cb82d9840330f9344ec37b992595b5d7b44184"
 SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dv6.1.1"
+SRCREV =3D "d8cb82d9840330f9344ec37b992595b5d7b44184"
+
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


