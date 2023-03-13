Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59EEC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:59:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18979.1678712350477320266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B178C1FB;
	Mon, 13 Mar 2023 05:59:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 970143F64C;
	Mon, 13 Mar 2023 05:59:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] lib/resulttool: fix typo breaking resulttool log --ptest
Date: Mon, 13 Mar 2023 12:59:07 +0000
Message-Id: <20230313125908.893096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178447

ptestresult_get_log() looked for a key called 'ptestresuls.sections',
which should be 'ptestresult.sections'

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resultto=
ol/resultutils.py
index 8917022d36e..7666331ba28 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -142,7 +142,7 @@ def generic_get_log(sectionname, results, section):
     return decode_log(ptest['log'])
=20
 def ptestresult_get_log(results, section):
-    return generic_get_log('ptestresuls.sections', results, section)
+    return generic_get_log('ptestresult.sections', results, section)
=20
 def generic_get_rawlogs(sectname, results):
     if sectname not in results:
--=20
2.34.1


