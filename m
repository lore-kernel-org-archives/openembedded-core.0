Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BBFC0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:31:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40811.1738848682654250492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 05:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878FEFEC
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 05:31:45 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8C533F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 05:31:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] nfs-utils: remove python hashbang rewrites
Date: Thu,  6 Feb 2025 13:31:12 +0000
Message-ID: <20250206133114.2974225-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 13:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210935

These were replaced with python3 in 2.5.2 (commit d1683f).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 18c4a249b33..ff02a3aea01 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -149,7 +149,4 @@ do_install:append () {
 	# chown the directories and files
 	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
 	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
-
-	# Make python tools use python 3
-	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}/mountst=
ats ${D}${sbindir}/nfsiostat
 }
--=20
2.43.0


