Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6842FC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 17:19:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16300.1721841574480468960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 10:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8404FFEC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:19:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB8823F766
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:19:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-unittest-automake-output: add dependency on unittest
Date: Wed, 24 Jul 2024 18:19:24 +0100
Message-Id: <20240724171926.3724005-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 17:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202471

This module can be used as a wrapper around unittest, so depend on that.

Don't also depend on pytest as that's a much larger dependency, and
in ptest images we want as little pulled in as possible.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-unittest-automake-output_0.2.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_=
0.2.bb
index 1fc6180d0eb..fefd4654c72 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.b=
b
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.b=
b
@@ -10,4 +10,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit python_flit_core
=20
+RDEPENDS:${PN} +=3D "python3-unittest"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


