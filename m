Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2918DD3EE77
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40253.1769096086421554616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71D361515
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F0163F632
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] wget: ensure manpage generation is deterministic
Date: Thu, 22 Jan 2026 15:34:37 +0000
Message-ID: <20260122153438.1546221-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122153438.1546221-1-ross.burton@arm.com>
References: <20260122153438.1546221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229851

Add pod2man-native to DEPENDS to ensure that pod2man is always available
and manpage generation is deterministic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/wget/wget_1.25.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index 87ccdeade2..f0d3458462 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6f65012d1daf=
98cb09b386cfb68df26b"
=20
 inherit autotools gettext texinfo update-alternatives pkgconfig
=20
-DEPENDS +=3D "autoconf-archive-native"
+DEPENDS +=3D "autoconf-archive-native pod2man-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
--=20
2.43.0


