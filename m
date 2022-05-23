Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A82C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:15:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26802.1653308094692575972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E641063;
	Mon, 23 May 2022 05:14:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6EE33F70D;
	Mon, 23 May 2022 05:14:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] tiff: mark CVE-2022-1622 and CVE-2022-1623 as invalid
Date: Mon, 23 May 2022 13:14:50 +0100
Message-Id: <20220523121450.2619221-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166010

These issues only affect libtiff post-4.3.0 but before 4.4.0, caused by
3079627e and fixed by b4e79bfa.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.3.0.bb
index 9c9108a6afd..c5e964ec8c1 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -28,6 +28,9 @@ UPSTREAM_CHECK_REGEX =3D "tiff-(?P<pver>\d+(\.\d+)+).ta=
r"
 # Tested with check from https://security-tracker.debian.org/tracker/CVE=
-2015-7313
 # and 4.3.0 doesn't have the issue
 CVE_CHECK_IGNORE +=3D "CVE-2015-7313"
+# These issues only affect libtiff post-4.3.0 but before 4.4.0,
+# caused by 3079627e and fixed by b4e79bfa.
+CVE_CHECK_IGNORE +=3D "CVE-2022-1622 CVE-2022-1623"
=20
 inherit autotools multilib_header
=20
--=20
2.25.1


