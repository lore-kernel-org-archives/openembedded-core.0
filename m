Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1B2C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:07:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7379.1645621672686944389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A8BED1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:07:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E08673F70D
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:07:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] coreutils: remove obsolete ignored CVE list
Date: Wed, 23 Feb 2022 13:07:50 +0000
Message-Id: <20220223130750.2734611-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:07:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162260

Three CVEs were meant to be ignored via CVE_WHITELIST, but that wasn't
the correct variable name.

The CPEs for those CVEs mean that they don't get picked up in our report,
so just remove the assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/coreutils/coreutils_9.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-=
core/coreutils/coreutils_9.0.bb
index 6a97c4d5cc..e4633949f4 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -204,6 +204,3 @@ do_install_ptest () {
 }
=20
 FILES:${PN}-ptest +=3D "${bindir}/getlimits"
-
-# These are specific to Opensuse
-CVE_WHITELIST +=3D "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
--=20
2.25.1


