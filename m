Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CF3EC873B
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 15:30:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16113.1694100644892987984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 08:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48E2E176C;
	Thu,  7 Sep 2023 08:31:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC8663F67D;
	Thu,  7 Sep 2023 08:30:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] linux: update CVE exclusions
Date: Thu,  7 Sep 2023 16:30:42 +0100
Message-Id: <20230907153042.1000698-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 15:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187389

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 8 ++++----
 meta/recipes-kernel/linux/cve-exclusion_6.4.inc | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 59883271037..41ee8bcad59 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-05 05:17:33.070404+00:00 for version 6.1.46
+# Generated at 2023-09-07 15:29:54.983415+00:00 for version 6.1.51
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.1.46"
+    this_version =3D "6.1.51"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -4966,9 +4966,9 @@ CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport:=
 Backported in 6.1.40"
=20
 # CVE-2023-37454 has no known resolution
=20
-# CVE-2023-3772 needs backporting (fixed from 6.1.47)
+CVE_STATUS[CVE-2023-3772] =3D "cpe-stable-backport: Backported in 6.1.47=
"
=20
-# CVE-2023-3773 needs backporting (fixed from 6.1.47)
+CVE_STATUS[CVE-2023-3773] =3D "cpe-stable-backport: Backported in 6.1.47=
"
=20
 CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.1.40=
"
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.4.inc
index 712794428de..5a5eb9a755f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,9 +1,9 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-05 05:17:35.599561+00:00 for version 6.4.11
+# Generated at 2023-09-07 15:30:03.897686+00:00 for version 6.4.14
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.4.11"
+    this_version =3D "6.4.14"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -4966,9 +4966,9 @@ CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport:=
 Backported in 6.4.5"
=20
 # CVE-2023-37454 has no known resolution
=20
-# CVE-2023-3772 needs backporting (fixed from 6.4.12)
+CVE_STATUS[CVE-2023-3772] =3D "cpe-stable-backport: Backported in 6.4.12=
"
=20
-# CVE-2023-3773 needs backporting (fixed from 6.4.12)
+CVE_STATUS[CVE-2023-3773] =3D "cpe-stable-backport: Backported in 6.4.12=
"
=20
 CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.4.5"
=20
--=20
2.34.1


