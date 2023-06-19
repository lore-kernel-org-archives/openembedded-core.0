Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76AEEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 10:32:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4551.1687170724592427279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 03:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FDC9150C;
	Mon, 19 Jun 2023 03:32:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 084443F64C;
	Mon, 19 Jun 2023 03:32:02 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] cve-extra-exclusions: call out an Ubuntu-specific issue explicitly
Date: Mon, 19 Jun 2023 11:31:58 +0100
Message-Id: <20230619103200.516550-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183097

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index f42253bff6e..6641126ec46 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -73,7 +73,10 @@ CVE_CHECK_IGNORE +=3D "CVE-2011-0640 CVE-2014-2648 CVE=
-2014-8171 CVE-2016-0774 CVE
                      CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE=
-2017-6264"
 # 2018
 CVE_CHECK_IGNORE +=3D "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CV=
E-2018-10882 CVE-2018-10901 CVE-2018-10902 \
-                     CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-20=
18-5873 CVE-2018-6559"
+                     CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-20=
18-5873"
+
+# This is specific to Ubuntu
+CVE_CHECK_IGNORE +=3D "CVE-2018-6559"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2019-3016
 # Fixed with 5.6
--=20
2.34.1


