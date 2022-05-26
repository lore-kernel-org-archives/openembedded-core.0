Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AA6C433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22513.1653585008349200418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE0E1688;
	Thu, 26 May 2022 10:10:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 706CE3F66F;
	Thu, 26 May 2022 10:10:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 01/10] python3-pluggy: add BBCLASSEXTEND for
 native/nativesdk
Date: Thu, 26 May 2022 18:09:52 +0100
Message-Id: <20220526171001.4074388-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166186

This is a dependency of Hatchling, another Python build tool, so we need
it natively.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pluggy_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/=
recipes-devtools/python/python3-pluggy_1.0.0.bb
index 3f2895a061b..2935acf95fa 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
@@ -24,3 +24,5 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/testing
 	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


