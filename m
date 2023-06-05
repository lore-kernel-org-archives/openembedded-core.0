Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9CAC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 15:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11631.1685979216249932917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 08:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4555DD75;
	Mon,  5 Jun 2023 08:34:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DE713F663;
	Mon,  5 Jun 2023 08:33:35 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] git: upgrade to 2.39.3
Date: Mon,  5 Jun 2023 16:33:33 +0100
Message-Id: <20230605153333.2772478-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 15:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182389

From: Ross Burton <ross.burton@arm.com>

This minor point release fixes CVE-2023-25652 and CVE-2023-29007.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/git/{git_2.39.2.bb =3D> git_2.39.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.2.bb =3D> git_2.39.3.bb} (98%=
)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devto=
ols/git/git_2.39.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.2.bb
rename to meta/recipes-devtools/git/git_2.39.3.bb
index 222e545f609..54a863acd29 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.3.bb
@@ -168,4 +168,4 @@ EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno =
\
                  "
 EXTRA_OEMAKE +=3D "NO_GETTEXT=3D1"
=20
-SRC_URI[tarball.sha256sum] =3D "fb6807d1eb4094bb2349ab97d203fe1e6c3eb28a=
f73ea391decfbd3a03c02e85"
+SRC_URI[tarball.sha256sum] =3D "2f9aa93c548941cc5aff641cedc24add15b912ad=
8c9b36ff5a41b1a9dcad783e"
--=20
2.34.1


