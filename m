Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A78C6FA90
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 15:51:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8121.1663775488744907125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 08:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B3A13D5;
	Wed, 21 Sep 2022 08:51:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 971793F73D;
	Wed, 21 Sep 2022 08:51:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] glibc: mark a CVE where we have merged the fix
Date: Wed, 21 Sep 2022 16:51:25 +0100
Message-Id: <20220921155125.2642185-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 15:51:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170952

The fix for this CVE has been merged into the 2.36 branch and fixed in
oe-core as of 055ce284.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.36.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.36.bb b/meta/recipes-core/gl=
ibc/glibc_2.36.bb
index 1cfa8101efa..45bc784b337 100644
--- a/meta/recipes-core/glibc/glibc_2.36.bb
+++ b/meta/recipes-core/glibc/glibc_2.36.bb
@@ -16,6 +16,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-1010022 CVE-2019-101002=
3 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=3D2=
2853
 CVE_CHECK_IGNORE +=3D "CVE-2019-1010025"
=20
+# This has been integrated into the 2.36 branch as of c399271 so is now =
fixed
+CVE_CHECK_IGNORE +=3D "CVE-2022-39046"
+
 DEPENDS +=3D "gperf-native bison-native"
=20
 NATIVESDKFIXES ?=3D ""
--=20
2.34.1


