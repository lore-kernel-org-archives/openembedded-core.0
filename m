Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF170C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 21:33:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7793.1693863205440026386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 14:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24E7143D;
	Mon,  4 Sep 2023 14:34:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 446533F7F4;
	Mon,  4 Sep 2023 14:33:24 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] linux: review some historic CVE_STATUS
Date: Mon,  4 Sep 2023 22:33:22 +0100
Message-Id: <20230904213322.383010-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 21:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187193

From: Ross Burton <ross.burton@arm.com>

Do manual review and disposition these CVEs as appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc |  4 +---
 meta/recipes-kernel/linux/cve-exclusion.inc       | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index 51926f342a1..cfee028e5ba 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -68,9 +68,7 @@ replacing bdb with supported and open source friendly a=
lternatives. As a result
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_HISTORIC"
=20
 CVE_STATUS_KERNEL_HISTORIC =3D "CVE-1999-0524 CVE-1999-0656 CVE-2006-293=
2 CVE-2007-2764 CVE-2007-4998 \=20
-                              CVE-2008-2544 CVE-2008-4609 CVE-2010-0298 =
CVE-2010-4563 CVE-2011-0640 \
-                              CVE-2014-2648 CVE-2016-0774 CVE-2016-3695 =
CVE-2016-3699 CVE-2017-1000377 \
-                              CVE-2017-6264"
+                              CVE-2008-2544 CVE-2008-4609 CVE-2010-0298 =
CVE-2010-4563 CVE-2011-0640"
 CVE_STATUS_KERNEL_HISTORIC[status] =3D "ignored"
=20
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 42f1c195c9a..28f9c8ff2b6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -1,3 +1,15 @@
+CVE_STATUS[CVE-2014-2648] =3D "cpe-incorrect: not Linux"
+
+CVE_STATUS[CVE-2016-0774] =3D "ignored: result of incomplete backport"
+
+CVE_STATUS[CVE-2016-3695] =3D "not-applicable-platform: specific to RHEL=
 with securelevel patches"
+
+CVE_STATUS[CVE-2016-3699] =3D "not-applicable-platform: specific to RHEL=
 with securelevel patches"
+
+CVE_STATUS[CVE-2017-6264] =3D "not-applicable-platform: Android specific=
"
+
+CVE_STATUS[CVE-2017-1000377] =3D "not-applicable-platform: GRSecurity sp=
ecific"
+
 CVE_STATUS[CVE-2018-6559] =3D "not-applicable-platform: Issue only affec=
ts Ubuntu"
=20
 CVE_STATUS[CVE-2020-11935] =3D "not-applicable-config: Issue only affect=
s aufs, which is not in linux-yocto"
--=20
2.34.1


