Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFBED5E36E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22783.1765892171750564069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20CFDFEC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9EB93F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] ttyrun: upgrade 2.39.0 -> 2.40.0
Date: Tue, 16 Dec 2025 13:35:58 +0000
Message-ID: <20251216133603.1003572-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133603.1003572-1-ross.burton@arm.com>
References: <20251216133603.1003572-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227951

No changed to ttyrun binary, just keeping up to date with upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.39.0.bb =3D> ttyrun_2.40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.39.0.bb =3D> ttyrun_2.40.0.bb}=
 (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb b/meta/recipes-cor=
e/ttyrun/ttyrun_2.40.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
index c7ca8f3ec3f..974b0a8aa0b 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df5118f167b055bfd7c3450803f184=
7af"
=20
 SRC_URI =3D "git://github.com/ibm-s390-linux/s390-tools;protocol=3Dhttps=
;branch=3Dmaster;tag=3Dv${PV}"
-SRCREV =3D "940ce6790021816f280fab66f443e4721d527833"
+SRCREV =3D "aca6704cfa27434452580369b4bc8a024bd0edee"
=20
 CVE_PRODUCT =3D "s390-tools"
=20
--=20
2.43.0


