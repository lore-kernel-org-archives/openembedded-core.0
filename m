Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9357AC48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:51:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43203.1707922265243695634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 06:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3F861FB
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:51:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 865543F762
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:51:04 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-unittest-automake-output: upgrade to 0.2
Date: Wed, 14 Feb 2024 14:51:02 +0000
Message-Id: <20240214145102.2402214-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 14:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195481

From: Ross Burton <ross.burton@arm.com>

Specifically this fixes the issue where if a pytest test suite fails
during collection then the errors are hidden.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ke-output_0.1.bb =3D> python3-unittest-automake-output_0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-unittest-automake-output_0.=
1.bb =3D> python3-unittest-automake-output_0.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.1.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_=
0.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-unittest-automake-output=
_0.1.bb
rename to meta/recipes-devtools/python/python3-unittest-automake-output_0=
.2.bb
index ba58c18df07..1fc6180d0eb 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.b=
b
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.b=
b
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb7349f06609329f1ab=
93b"
=20
 SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain"
-SRCREV =3D "06537edb18f3641c70bce25256f6ecf5f5164ead"
+SRCREV =3D "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


