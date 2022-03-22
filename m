Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C6DC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:20:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8595.1647947991738089599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797ED153B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:19:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5FC3F66F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:19:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: ignore CVE-2022-26488
Date: Tue, 22 Mar 2022 11:19:48 +0000
Message-Id: <20220322111948.3407400-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 11:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163546

This CVE is specific to Microsoft Windows, so we can ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.10.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipe=
s-devtools/python/python3_3.10.2.bb
index 32da2a12c8d..227a72d3953 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -52,9 +52,8 @@ CVE_PRODUCT =3D "python"
 CVE_CHECK_IGNORE +=3D "CVE-2007-4559"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_IGNORE +=3D "CVE-2019-18348"
-
-# This is windows only issue.
-CVE_CHECK_IGNORE +=3D "CVE-2020-15523"
+# These are specific to Microsoft Windows
+CVE_CHECK_IGNORE +=3D "CVE-2020-15523 CVE-2022-26488"
=20
 PYTHON_MAJMIN =3D "3.10"
=20
--=20
2.25.1


