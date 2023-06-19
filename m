Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9829EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 10:32:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4526.1687170724866410996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 03:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04827165C;
	Mon, 19 Jun 2023 03:32:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B25543F64C;
	Mon, 19 Jun 2023 03:32:03 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] cve-extra-exclusions: CVE-2023-3141 was backported in Linux 6.1.30
Date: Mon, 19 Jun 2023 11:31:59 +0100
Message-Id: <20230619103200.516550-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619103200.516550-1-ross.burton@arm.com>
References: <20230619103200.516550-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183098

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index 6641126ec46..1c3cc36c617 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -664,3 +664,6 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-33288"
 # https://www.linuxkernelcves.com/cves/CVE-2023-34256
 # Fixed in 6.1.29
 CVE_CHECK_IGNORE +=3D "CVE-2023-34256"
+
+# Backported to 6.1.30 as 9a342d4
+CVE_CHECK_IGNORE +=3D "CVE-2023-3141"
--=20
2.34.1


