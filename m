Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FAFC43219
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:32:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10286.1646757132546144052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40C97139F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0D0C3FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] python3-markdown: use setuptools_build_meta
Date: Tue,  8 Mar 2022 16:32:04 +0000
Message-Id: <20220308163206.4039089-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308163206.4039089-1-ross.burton@arm.com>
References: <20220308163206.4039089-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 16:32:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162940

This project builds with setuptools_build_meta, so use that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-markdown_3.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb b/met=
a/recipes-devtools/python/python3-markdown_3.3.6.bb
index 7b64da6d5b..a46a9ae066 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://python-markdown.github.io/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D745aaad0c69c60039e638bff9f=
fc59ed"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 PYPI_PACKAGE =3D "Markdown"
 SRC_URI[sha256sum] =3D "76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed=
1ecdb1e8cefc7006"
--=20
2.25.1


