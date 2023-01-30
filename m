Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2742C636CD
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:07:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39341.1675080432832001040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69B1F1756;
	Mon, 30 Jan 2023 04:07:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECBAE3F71E;
	Mon, 30 Jan 2023 04:07:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] git: upgrade to 2.39.1
Date: Mon, 30 Jan 2023 12:07:07 +0000
Message-Id: <20230130120709.2079554-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176486

This fixes CVE-2022-41903 and CVE-2022-23521.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/git/{git_2.39.0.bb =3D> git_2.39.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.0.bb =3D> git_2.39.1.bb} (98%=
)

diff --git a/meta/recipes-devtools/git/git_2.39.0.bb b/meta/recipes-devto=
ols/git/git_2.39.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.0.bb
rename to meta/recipes-devtools/git/git_2.39.1.bb
index 3622b9709d5..8577d86eac8 100644
--- a/meta/recipes-devtools/git/git_2.39.0.bb
+++ b/meta/recipes-devtools/git/git_2.39.1.bb
@@ -166,4 +166,4 @@ EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno =
\
                  "
 EXTRA_OEMAKE +=3D "NO_GETTEXT=3D1"
=20
-SRC_URI[tarball.sha256sum] =3D "d929fe67cef7ac3ca709d2b56a9920f17112d5a5=
24bf8112af37ec045a7a5109"
+SRC_URI[tarball.sha256sum] =3D "ae8d3427e4ccd677abc931f16183c0ec953e3bfc=
d866493601351e04a2b97398"
--=20
2.34.1


