Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363D8D5D683
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 18:35:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.62.1731004544696555430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 10:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3D8B497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 10:36:13 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0E073F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 10:35:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gzip: show full test log if ptests fail
Date: Thu,  7 Nov 2024 18:35:39 +0000
Message-Id: <20241107183539.279134-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 18:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206851

Enable verbose tests so that the output from the failing test is logged.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/gzip/files/run-ptest | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/gzip/files/run-ptest b/meta/recipes-ex=
tended/gzip/files/run-ptest
index cf7c64949ab..ee6b4326fac 100644
--- a/meta/recipes-extended/gzip/files/run-ptest
+++ b/meta/recipes-extended/gzip/files/run-ptest
@@ -1,6 +1,3 @@
 #!/bin/sh
=20
-cd src/tests
-
-make check
-
+VERBOSE=3D1 make -C src/tests check
--=20
2.34.1


