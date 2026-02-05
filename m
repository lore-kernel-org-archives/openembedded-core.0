Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F105ECD985
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 16:12:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24623.1770307968862159852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 08:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBD5D339
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Feb 2026 08:12:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBA193F632
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Feb 2026 08:12:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-unittest-automake-output: upgrade to 0.4
Date: Thu,  5 Feb 2026 16:12:42 +0000
Message-ID: <20260205161243.3884987-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230583

Notable changes:

  pytest: handle skipping without custom message
  tests: update test output based on latest pytest

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ke-output_0.3.bb =3D> python3-unittest-automake-output_0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-unittest-automake-output_0.=
3.bb =3D> python3-unittest-automake-output_0.4.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.3.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_=
0.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-unittest-automake-output=
_0.3.bb
rename to meta/recipes-devtools/python/python3-unittest-automake-output_0=
.4.bb
index 66c1abee34..9b0c62f213 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.b=
b
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.b=
b
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb73=
49f06609329f1ab93b"
=20
 SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}"
=20
-SRCREV =3D "3376ff9bc319f8338849b7b9f63b9325d7b7663a"
+SRCREV =3D "4d64324a8910ad28b3157f902c35f19fcb479bc0"
=20
 inherit python_flit_core
=20
--=20
2.43.0


