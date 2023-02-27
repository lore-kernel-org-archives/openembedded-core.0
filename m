Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09CFC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 16:21:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.94596.1677514892989460402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 08:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8989EC14;
	Mon, 27 Feb 2023 08:22:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDF743F881;
	Mon, 27 Feb 2023 08:21:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] glibc: add ignore for CVE-2023-25139
Date: Mon, 27 Feb 2023 16:21:28 +0000
Message-Id: <20230227162129.879178-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 16:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177800

This CVE has been fixed in the 2.37 release branch (07b9521fc6) and
we're now using a SHA that incorporates that commit, so manually mark it
as ignored.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/gl=
ibc/glibc_2.37.bb
index f299a3004a4..31c94929b93 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -19,6 +19,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-1010025"
 # This has been integrated into the 2.36 branch as of c399271 so is now =
fixed
 CVE_CHECK_IGNORE +=3D "CVE-2022-39046"
=20
+# This is integrated into the 2.37 branch as of 07b9521fc6
+CVE_CHECK_IGNORE +=3D "CVE-2023-25139"
+
 DEPENDS +=3D "gperf-native bison-native"
=20
 NATIVESDKFIXES ?=3D ""
--=20
2.34.1


