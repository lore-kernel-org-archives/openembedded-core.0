Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64720F4384C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 15:27:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21954.1776266865183724966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 08:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rpo1PXAm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00F2546FC
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 394183F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776266864; bh=iR64wXKuZ8TKGyfuA5lFIjHIxel5Etz55dveA4aTE6I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rpo1PXAmGBY1uc2h4RURljFa762NbTZAQC7jGhsmkGIAn8ITEn5f+7raQsrJgpdX3
	 /b2TKwWLDT0GgKCv1dcx9Nl73UL5wJnXa05nD8nVzFenpsBLb6igm+BB0+ATYTq6xP
	 ecZS/GbL7hlbNyBd1Gf42VTIuBr8KeXUqW4IDGVc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rsync: update comment about out-of-tree builds
Date: Wed, 15 Apr 2026 16:27:42 +0100
Message-ID: <20260415152742.1597025-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415152742.1597025-1-ross.burton@arm.com>
References: <20260415152742.1597025-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 15:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235310

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rsync/rsync_3.4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-de=
vtools/rsync/rsync_3.4.1.bb
index 6d3ed359db6..697cdee829c 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -19,7 +19,8 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/=
${BP}.tar.gz \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647c=
f69850d65fd88c52"
=20
-# Doesn't use automake
+# Out-of-tree builds don't install the documentation currently
+# https://github.com/RsyncProject/rsync/issues/846
 inherit autotools-brokensep
=20
 PACKAGECONFIG ??=3D "acl attr \
--=20
2.43.0


