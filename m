Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6BAC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:10:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12316.1676560208567516969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 07:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF1821042;
	Thu, 16 Feb 2023 07:10:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A00DF3F703;
	Thu, 16 Feb 2023 07:10:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] python3-atomicwrites: add BBCLASSEXTEND
Date: Thu, 16 Feb 2023 15:10:03 +0000
Message-Id: <20230216151005.3469200-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177291

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb b=
/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
index d4d15cea509..9f58a4bf1ff 100644
--- a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
@@ -22,3 +22,5 @@ do_install_ptest() {
 }
=20
 RDEPENDS:${PN} =3D "${PYTHON_PN}-misc"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


