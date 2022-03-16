Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8D9C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 02:28:49 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.20637.1647397727300761694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 19:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22G2Sjmh012257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 19:28:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 15 Mar 2022 19:28:45 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 15 Mar 2022 19:28:44 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-pyparsing: rdepends on python3-html
Date: Wed, 16 Mar 2022 10:28:41 +0800
Message-ID: <20220316022841.34226-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 02:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163320

From: Kai Kang <kai.kang@windriver.com>

It fails to import python module 'pyparsing':

| root@qemux86-64:~# python3 -c 'import pyparsing'
| Traceback (most recent call last):
|   File "<string>", line 1, in <module>
|   File "/usr/lib64/python3.10/site-packages/pyparsing/__init__.py", line 141, in <module>
|     from .helpers import *
|   File "/usr/lib64/python3.10/site-packages/pyparsing/helpers.py", line 2, in <module>
|     import html.entities
| ModuleNotFoundError: No module named 'html'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
index 14faea6590..9c3896918f 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
@@ -19,6 +19,7 @@ inherit pypi setuptools3
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pprint \
-- 
2.17.1


