Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B25C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:45:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19586.1785858297880561227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 08:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ri/p3j6Q;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06B3B1476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 08:44:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FB653F86F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785858297; bh=N5u0zt+9/aQEYQrtHKF7jX3utY0pnqPhe7QtC5kRlyk=;
	h=From:To:Subject:Date:From;
	b=Ri/p3j6QQba6QHL2A/3gdbhIr0cf+3WavUE1R8y9sDfgvCFs4zV05b4MmDSVdxwue
	 N5KxkJ3GWrqNnBqBinFjZQpJBV8aYofxDdOukcJA2FQOiu/PKoFJc4IDEWuDU/Sz5U
	 uvIoxC0AV7bYoyAfbPUKb8mHfp4lASngVzj2oKAY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libgit2: set correct homepage URL
Date: Tue,  4 Aug 2026 16:44:50 +0100
Message-ID: <20260804154451.2506951-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 15:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242777

libgit2.github.com no longer resolves, the homepage is now libgit2.org.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libgit2/libgit2_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes=
-support/libgit2/libgit2_1.9.4.bb
index 999ad6b05c8..6b01ab28c78 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "the Git linkable library"
-HOMEPAGE =3D "http://libgit2.github.com/"
+HOMEPAGE =3D "https://libgit2.org/"
 LICENSE =3D "GPL-2.0-only WITH GCC-exception-2.0 AND MIT AND OpenSSL AND=
 BSD-3-Clause AND Zlib AND ISC AND LGPL-2.1-or-later AND CC0-1.0 AND BSD-=
2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8eacfdc17c8f4d219e131a073973b=
97d"
=20
--=20
2.43.0


