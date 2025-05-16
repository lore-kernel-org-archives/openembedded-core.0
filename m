Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D63C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:09:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10499.1747393760245661605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 04:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71B9169C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 04:09:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 81F883F673
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 04:09:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "xwayland: mark CVEs fixed in 24.1.6 as fixed"
Date: Fri, 16 May 2025 12:09:17 +0100
Message-ID: <20250516110917.1707271-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216744

The CPE data in the NVD database is now complete, so these overrides are
no longer needed.

This reverts commit 76c7bb2b9c1b5300f957f11e1601816f8f90b501.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.6.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_24.1.6.bb
index 0774c1bbf5e..350b8e93cc6 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -48,7 +48,3 @@ do_install:append() {
 FILES:${PN} +=3D "${libdir}/xorg/protocol.txt"
=20
 RDEPENDS:${PN} +=3D "xkbcomp"
-
-CVE_STATUS_GROUPS =3D "CVE_STATUS_REDHAT"
-CVE_STATUS_REDHAT =3D "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-=
2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
-CVE_STATUS_REDHAT[status] =3D "fixed-version: these are tracked as versi=
onless redhat CVEs in NVD DB, fixed in 24.1.6"
--=20
2.43.0


