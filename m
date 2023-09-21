Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E597AE71072
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:48:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17971.1695304115787547849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD1A169E;
	Thu, 21 Sep 2023 06:49:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB4B73F59C;
	Thu, 21 Sep 2023 06:48:34 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/8] oeqa/runtime/parselogs: remove unused imports
Date: Thu, 21 Sep 2023 14:48:26 +0100
Message-Id: <20230921134833.582827-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921134833.582827-1-ross.burton@arm.com>
References: <20230921134833.582827-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187997

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index e67d3750dad..8fd5a86e141 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -10,8 +10,6 @@ from subprocess import check_output
 from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.data import skipIfDataVar
-from oeqa.runtime.decorator.package import OEHasPackage
=20
 #in the future these lists could be moved outside of module
 errors =3D ["error", "cannot", "can\'t", "failed"]
--=20
2.34.1


