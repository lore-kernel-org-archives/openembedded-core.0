Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FF8C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 16:08:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1655.1692979713079414460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 09:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 140B41007;
	Fri, 25 Aug 2023 09:09:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B82E3F64C;
	Fri, 25 Aug 2023 09:08:32 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 2/2] linux-yocto: update CVE exclusions files
Date: Fri, 25 Aug 2023 17:08:30 +0100
Message-Id: <20230825160830.2139251-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825160830.2139251-1-ross.burton@arm.com>
References: <20230825160830.2139251-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 16:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186713

From: Ross Burton <ross.burton@arm.com>

No changes to the data, but the version checks are added.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 11 ++++++++++-
 meta/recipes-kernel/linux/cve-exclusion_6.4.inc | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 499785f6d2d..ce3a534cf34 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,5 +1,14 @@
+
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-21 12:41:13.991251 for version 6.1.43
+# Generated at 2023-08-25 12:42:35.329668 for version 6.1.46"
+
+python check_kernel_cve_status_version() {
+    this_version =3D "6.1.46"
+    kernel_version =3D d.getVar("LINUX_VERSION")
+    if kernel_version !=3D this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
+}
+do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
=20
 CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.4.inc
index b9210724bf0..63f0760b2d3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,5 +1,14 @@
+
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-21 12:41:33.545124 for version 6.4.9
+# Generated at 2023-08-25 12:42:28.369507 for version 6.4.11"
+
+python check_kernel_cve_status_version() {
+    this_version =3D "6.4.11"
+    kernel_version =3D d.getVar("LINUX_VERSION")
+    if kernel_version !=3D this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
+}
+do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
=20
 CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
=20
--=20
2.34.1


