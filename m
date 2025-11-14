Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0100CCE7B06
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:42:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17061.1763124142264076896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FFBF106F
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:42:14 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6326C3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:42:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] nfs-utils: remove obsolete 'make clean' call
Date: Fri, 14 Nov 2025 12:42:18 +0000
Message-ID: <20251114124218.3595920-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114124218.3595920-1-ross.burton@arm.com>
References: <20251114124218.3595920-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226295

The 1.2.8 release did indeed ship binary .o files, such as:

  nfs-utils-1.2.8/support/nfs/conffile.o

No recent release has done this though.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index fcbbadd914a..631f1819eb5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -123,12 +123,6 @@ do_configure:prepend() {
 		${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
 }
=20
-# Make clean needed because the package comes with
-# precompiled 64-bit objects that break the build
-do_compile:prepend() {
-	make clean
-}
-
 # Works on systemd only
 HIGH_RLIMIT_NOFILE ??=3D "4096"
=20
--=20
2.43.0


