Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0582EF9011
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23100.1772642918818579751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE47F339
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 08:48:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0BC83F836
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 08:48:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/5] gperf: remove autoreconf tweaks
Date: Wed,  4 Mar 2026 16:48:30 +0000
Message-ID: <20260304164834.618765-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232386

Since gperf 3.3[1] gperf uses aclocal, so we don't need to do anything
special anymore to autoreconf.

[1] gperf e60835d ("build: Use Automake in lib/.")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/gperf/gperf_3.3.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-extended/gperf/gperf_3.3.bb b/meta/recipes-exte=
nded/gperf/gperf_3.3.bb
index 7af2130114..7f3ba692c6 100644
--- a/meta/recipes-extended/gperf/gperf_3.3.bb
+++ b/meta/recipes-extended/gperf/gperf_3.3.bb
@@ -10,10 +10,6 @@ SRC_URI[sha256sum] =3D "fd87e0aba7e43ae054837afd6cd4db=
03a3f2693deb3619085e6ed9d8d9
=20
 inherit autotools
=20
-# The nested configures don't find the parent aclocal.m4 out of the box,=
 so tell
-# it where to look explicitly (mirroring the behaviour of upstream's Mak=
efile.devel).
-EXTRA_AUTORECONF +=3D " -I ${S} --exclude=3Daclocal"
-
 CFLAGS +=3D "-std=3Dgnu17"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


