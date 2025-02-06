Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668AAC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:31:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41062.1738848683915278588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 05:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC60BFEC
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 05:31:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A09E3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 05:31:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] nfs-utils: remove obsolete 'make clean' call
Date: Thu,  6 Feb 2025 13:31:14 +0000
Message-ID: <20250206133114.2974225-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206133114.2974225-1-ross.burton@arm.com>
References: <20250206133114.2974225-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 13:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210937

The 1.2.8 release did indeed ship binary .o files, but recent releases
do not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 4683939bff5..af5eee59aad 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -108,12 +108,6 @@ FILES:${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.=
a"
=20
 FILES:${PN} +=3D "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_li=
bdir}/modprobe.d"
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


