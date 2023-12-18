Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEB6C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:18:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44858.1702909109889816863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 420662F4
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:19:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FCC13F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:18:28 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: update CVE exclusions
Date: Mon, 18 Dec 2023 14:18:25 +0000
Message-Id: <20231218141825.376246-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192643

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 meta/recipes-kernel/linux/cve-exclusion_6.5.inc | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 1e366481ff6..56766acc012 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-05 13:22:34.961692+00:00 for version 6.1.65
+# Generated at 2023-12-18 14:15:17.069657+00:00 for version 6.1.65
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.1.65"
@@ -5128,7 +5128,7 @@ CVE_STATUS[CVE-2023-5717] =3D "cpe-stable-backport:=
 Backported in 6.1.60"
=20
 CVE_STATUS[CVE-2023-6111] =3D "fixed-version: only affects 6.6rc3 onward=
s"
=20
-# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+CVE_STATUS[CVE-2023-6121] =3D "cpe-stable-backport: Backported in 6.1.65=
"
=20
 CVE_STATUS[CVE-2023-6176] =3D "cpe-stable-backport: Backported in 6.1.54=
"
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.5.inc
index 6304d80844c..da76a2e3fe0 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-05 13:22:43.339114+00:00 for version 6.5.13
+# Generated at 2023-12-18 14:15:23.952852+00:00 for version 6.5.13
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.5.13"
--=20
2.34.1


