Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F83EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 15:51:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.683.1689868312503628082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 08:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63FB22F4;
	Thu, 20 Jul 2023 08:52:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E08A3F738;
	Thu, 20 Jul 2023 08:51:51 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] ltp: add RDEPENDS on findutils
Date: Thu, 20 Jul 2023 16:51:49 +0100
Message-Id: <20230720155150.4048211-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184640

From: Ross Burton <ross.burton@arm.com>

With busybox find some of the test script fails, so depend on GNU find.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/ltp/ltp_20230516.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-ext=
ended/ltp/ltp_20230516.bb
index ddc6523e302..e9407d3148e 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -93,6 +93,7 @@ RDEPENDS:${PN} =3D "\
     e2fsprogs-mke2fs \
     expect \
     file \
+    findutils \
     gawk \
     gdb \
     gzip \
--=20
2.34.1


