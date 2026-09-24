Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FDAC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:16:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3544.1790270217829920834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 10:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WzQmTbyP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4781E4D
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 10:16:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9358F3F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790270217; bh=BeohPm50+zauv5HlMlJ0Q9q/V4gdlzVcO55jK9H2sOk=;
	h=From:To:Subject:Date:From;
	b=WzQmTbyPgJCGZo/QPtCvWWApfB6LdedMPAHtzGEarsJiwMjsgJMwXK8UYKSnQS8Zk
	 ifa4qrmFGvotiiSn0BwFkR9mpnKLNtRLc9CftfjULhQKTveXkPNeKqFHFinfVw4TxD
	 tmV5r7zlNyZBF03zMk5xvJBZFAxdJNRK1gsquNC8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xxhash: inherit lib_package
Date: Thu, 24 Sep 2026 18:16:51 +0100
Message-ID: <20260924171651.498944-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 17:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246594

This is a library with some tools, so inherit lib_package so the tools
are packaged separately from the library.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/xxhash/xxhash_0.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.4.bb b/meta/recipes-s=
upport/xxhash/xxhash_0.8.4.bb
index 736270435b2..5e1df1ed9ca 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.4.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.4.bb
@@ -12,6 +12,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 SRCREV =3D "c87183a77d67f7d37e3d2d1b7eaac5e7c695e4f0"
=20
+inherit lib_package
+
 CFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH=
_NO_INLINE_HINTS', '', d)}"
=20
 do_compile () {
--=20
2.43.0


