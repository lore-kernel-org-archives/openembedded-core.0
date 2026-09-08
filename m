Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108AFC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 13:07:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6838.1788872863661372268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 06:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Mi2cXplk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322F01476
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 06:07:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 740813F7B4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788872862; bh=H20rDYqYdAceGZkhrcW0XStqe9wWNYCPIqT8ghC/GXU=;
	h=From:To:Subject:Date:From;
	b=Mi2cXplk6tWdf3U/vct+xhBGfgKqLUBEbVXDt/a60PbLHlB8LxIrFwNv5RiUpDe7C
	 AcU4VMy+ReAouJu43RpxWzAkDuPz/hDp0Yjp0clx280mWQnB6svLZF4ize2x9r9jop
	 yS+/f/oSEShCNJrkEjvRAXQXNT1ckjIqEn7iZnzA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm: add tag to SRC_URI
Date: Tue,  8 Sep 2026 14:07:37 +0100
Message-ID: <20260908130737.91233-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 13:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245363

Add a tag=3D assignment to the SRC_URI, to validate the tag and SRCREV ar=
e
matching.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rpm/rpm_6.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtoo=
ls/rpm/rpm_6.0.2.bb
index b1adf9ec6cd..c27f58a0e86 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D066ecde17828e5c8911ec9eae8be7=
8f4"
=20
-SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-6=
.0.x;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/rpm-software-management/rpm;protocol=3Dhtt=
ps;branch=3Drpm-6.0.x;tag=3D${BP}-release \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-build=
ing.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-=
wit.patch \
--=20
2.43.0


