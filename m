Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00F0C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 15:02:35 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7452.1667401351004613080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 08:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=d/aQvMvE;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZaF7X3Se774rvCCtPbXWLZivjyQs0/dXFvnSfksJXNE=; b=d/aQvMvEm/LVOhidlg9vYt5Ijh
	5cQKNOOXgS42bPpmZzDSKywH6GRi8ADE8MvrXrVDQFbbzx9RUuj14L+gKaZILRX0pssnrdky06YGF
	pGoQYKkcbAm2sRosJRuNbswLOfYRZW8R3tWeZGu5CfEo+/nZMm9FmAGRewiaF0OOiG3KGk3OBZvdh
	dG8dYkMo08wZjYqurbSkl1hLEXyT9Njmtc15C1cLB1S/eF7942fpMt/yr9pnLVXsfAEbG/eFl8Yr6
	cqcsmfKZ58YmF8MwWkclt72ny8s9uRtLzWtka7Z4d9chEBsVu5a8VckaxgBKUBf6oCzlquh6h6TL1
	KARKZRCw==;
Received: from lan.nucleusys.com ([92.247.61.126]:41372 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oqFHf-00056B-2f;
	Wed, 02 Nov 2022 17:02:30 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-manifest.json: Fix re in core
Date: Wed,  2 Nov 2022 17:02:17 +0200
Message-Id: <20221102150217.3103640-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 15:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172592

Following the update from 3.10.6 to 3.11.0, the source code of
module re for regular expression operations has been moved to
Lib/re/. File python3-manifest.json has been modified according
to the new path.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 02c918d6e5..2fa9d5dc78 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -290,7 +290,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re.py",
+            "${libdir}/python${PYTHON_MAJMIN}/re/*",
             "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
             "${libdir}/python${PYTHON_MAJMIN}/runpy.py",
-- 
2.30.2


