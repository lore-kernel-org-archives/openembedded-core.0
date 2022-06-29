Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA54C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 15:15:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12789.1656515724401602571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 388B0152B;
	Wed, 29 Jun 2022 08:15:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B4CD3F792;
	Wed, 29 Jun 2022 08:15:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] cups: ignore CVE-2022-26691
Date: Wed, 29 Jun 2022 16:15:18 +0100
Message-Id: <20220629151519.1179173-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 15:15:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167381

This is fixed in 2.4.2, which we have, but the complex CPE in that CVE
isn't parsed by cve-check correctly so it thinks that we're vulnerable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 8f2ad8a0098..45929807660 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -26,6 +26,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2008-1033"
 CVE_CHECK_IGNORE +=3D "CVE-2009-0032"
 # This is an Ubuntu only issue.
 CVE_CHECK_IGNORE +=3D "CVE-2018-6553"
+# This is fixed in 2.4.2 but the cve-check class still reports it
+CVE_CHECK_IGNORE +=3D "CVE-2022-26691"
=20
 LEAD_SONAME =3D "libcupsdriver.so"
=20
--=20
2.25.1


