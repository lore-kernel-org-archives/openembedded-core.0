Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD27C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:10:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10494.1747393829999520434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 04:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D64D169C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 04:10:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DBD53F673
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 04:10:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "xserver-xorg: mark CVEs fixed in 21.1.16 as fixed"
Date: Fri, 16 May 2025 12:10:27 +0100
Message-ID: <20250516111027.1710115-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216745

The CPE data in the NVD database is now complete, so these overrides are
no longer needed.

This reverts commit e3419fbaf2999a821e1890a12ab27285cc25b577.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index fbe860c6ea2..7645f11c146 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -154,7 +154,3 @@ python add_xorg_abi_depends() {
 PACKAGEFUNCS =3D+ "add_xorg_abi_provides add_xorg_abi_depends"
=20
 CVE_STATUS[CVE-2023-5574] =3D "${@bb.utils.contains('PACKAGECONFIG', 'xv=
fb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
-
-CVE_STATUS_GROUPS =3D "CVE_STATUS_REDHAT"
-CVE_STATUS_REDHAT =3D "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-=
2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
-CVE_STATUS_REDHAT[status] =3D "fixed-version: these are tracked as versi=
onless redhat CVEs in NVD DB, fixed in 21.1.16"
--=20
2.43.0


