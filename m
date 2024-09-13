Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336F6FA3745
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 11:12:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.70906.1726225955464527504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 04:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5126A13D5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 04:13:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E4B43F64C
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 04:12:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: mark TCLIBCAPPEND as deprecated
Date: Fri, 13 Sep 2024 12:12:29 +0100
Message-Id: <20240913111229.1725391-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 11:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204480

In oe-core ebcd355 TCLIBCAPPEND (a string that is appended to TMPDIR) was
removed entirely.  Warn if this is being set by the distro as it will no
longer have any effect.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 04b288abc1c..ab4c6a2d9c9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -105,6 +105,7 @@ BB_RENAMED_VARIABLES[ICECC_SYSTEM_PACKAGE_BL] =3D "IC=
ECC_RECIPE_DISABLE"
 BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] =3D "is a deprecated variable an=
d no longer needed"
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] =3D "is a deprecated variable an=
d support has been removed"
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] =3D "LICENSE_FLAGS_ACCEPTE=
D"
+BB_RENAMED_VARIABLES[TCLIBCAPPEND] =3D "is no longer used, modify TMPDIR=
 directly if required"
=20
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] =3D "INCOMPATIBLE_LICENSE_E=
XCEPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] =3D "INCOMPATIBLE_LICEN=
SE_EXCEPTIONS"
--=20
2.34.1


