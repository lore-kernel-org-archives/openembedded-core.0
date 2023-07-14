Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F61DEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 14:53:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.771.1689346403241264317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 07:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 838861576;
	Fri, 14 Jul 2023 07:54:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C87963F740;
	Fri, 14 Jul 2023 07:53:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] python3: ignore CVE-2023-36632
Date: Fri, 14 Jul 2023 15:53:19 +0100
Message-Id: <20230714145319.231385-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714145319.231385-1-ross.burton@arm.com>
References: <20230714145319.231385-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 14:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184269

From: Ross Burton <ross.burton@arm.com>

This CVE shouldn't have been filed as the "exploit" is described in the
documentation as how the library behaves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipe=
s-devtools/python/python3_3.11.4.bb
index 2d7b1bac2c6..7a277facf7a 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -56,6 +56,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2020-15523 CVE-2022-26488"
 # The mailcap module is insecure by design, so this can't be fixed in a =
meaningful way.
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_IGNORE +=3D "CVE-2015-20107"
+# Not an issue, in fact expected behaviour
+CVE_CHECK_IGNORE +=3D "CVE-2023-36632"
=20
 PYTHON_MAJMIN =3D "3.11"
=20
--=20
2.34.1


