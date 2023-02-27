Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1748C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 16:21:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.94597.1677514893539392590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 08:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3500CFEC;
	Mon, 27 Feb 2023 08:22:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AAC33F881;
	Mon, 27 Feb 2023 08:21:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] glibc: remove obsolete CVE ignores
Date: Mon, 27 Feb 2023 16:21:29 +0000
Message-Id: <20230227162129.879178-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227162129.879178-1-ross.burton@arm.com>
References: <20230227162129.879178-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 16:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177801

Remove some obsolete CVE ignores now that releases have been made, CPEs
updated, or upgrades done:

CVE-2020-10029 is marked as fixed in 2.32.

CVE-2021-27645 is marked as fixed in 2.34.

CVE-2022-39046 is marked as fixed in 2.37.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/gl=
ibc/glibc_2.37.bb
index 31c94929b93..762a2793ad3 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -1,8 +1,6 @@
 require glibc.inc
 require glibc-version.inc
=20
-CVE_CHECK_IGNORE +=3D "CVE-2020-10029 CVE-2021-27645"
-
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010=
022
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010=
023
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010=
024
@@ -16,9 +14,6 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-1010022 CVE-2019-101002=
3 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=3D2=
2853
 CVE_CHECK_IGNORE +=3D "CVE-2019-1010025"
=20
-# This has been integrated into the 2.36 branch as of c399271 so is now =
fixed
-CVE_CHECK_IGNORE +=3D "CVE-2022-39046"
-
 # This is integrated into the 2.37 branch as of 07b9521fc6
 CVE_CHECK_IGNORE +=3D "CVE-2023-25139"
=20
--=20
2.34.1


