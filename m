Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4350EC7EE25
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 13:10:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58110.1686575434688268920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 06:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6E432F4;
	Mon, 12 Jun 2023 06:11:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F45E3F587;
	Mon, 12 Jun 2023 06:10:33 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] cve-extra-exclusions: remove 2019 blanket ignores
Date: Mon, 12 Jun 2023 14:10:31 +0100
Message-Id: <20230612131031.932073-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612131031.932073-1-ross.burton@arm.com>
References: <20230612131031.932073-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 13:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182670

From: Ross Burton <ross.burton@arm.com>

Remove the blanket ignore and handle the CVEs individually.

CVE-2019-14899 is related to network interface configuration across
multiple operating systems, so leave this as unresolved.

-3016, -3819 and -3887 are pending CPE updates, so ignore them.

The others have accurate CPE information now so are handled correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index 41d751a7aed..f42253bff6e 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -74,8 +74,19 @@ CVE_CHECK_IGNORE +=3D "CVE-2011-0640 CVE-2014-2648 CVE=
-2014-8171 CVE-2016-0774 CVE
 # 2018
 CVE_CHECK_IGNORE +=3D "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CV=
E-2018-10882 CVE-2018-10901 CVE-2018-10902 \
                      CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-20=
18-5873 CVE-2018-6559"
-# 2019
-CVE_CHECK_IGNORE +=3D "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-=
2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
+
+# https://www.linuxkernelcves.com/cves/CVE-2019-3016
+# Fixed with 5.6
+CVE_CHECK_IGNORE +=3D "CVE-2019-3016"
+
+# https://www.linuxkernelcves.com/cves/CVE-2019-3819
+# Fixed with 5.1
+CVE_CHECK_IGNORE +=3D "CVE-2019-3819"
+
+# https://www.linuxkernelcves.com/cves/CVE-2019-3887
+# Fixed with 5.2
+CVE_CHECK_IGNORE +=3D "CVE-2019-3887"
+
 # 2020
 CVE_CHECK_IGNORE +=3D "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-=
2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
=20
--=20
2.34.1


