Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E50C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 11:10:50 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.5897.1665486639157959579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 04:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Np36LAHW;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PNkwqyr95WeswSL6E5csUeFsX0lGbfmma/K87Q9Y3Wc=; b=Np36LAHWF53QOU91CEu4PeAkO0
	MfSYW+jjIHGCy/UFFaJ5FMvysw9zfzRUh5RtP01+/79Uo+O6Bz13+EfvlTcqFxBDTs2J6H3//QFzp
	uk04270XJSzdd5m1j6372VqJwi9RRa7D0rmwn0zm+i2IaxOKHbh9nQXIeKGXMl27MNLvM7uAMFJgl
	Uiykh8W8Hlt0ZsF4Dg6ZQo6O5ktkoNnT3xZoMuuijLebo8jriCbzkc/Zli7YE0wcbWLCSjKXCxHMI
	dY1KNRHwZVSXy6fxOfMOtQzTuwwck4lRuiTXSYJe7GYSBluNalP7uIaXdJJzHJqSY6YQzFYxFZnIm
	oGTGR0Ew==;
Received: from lan.nucleusys.com ([92.247.61.126]:53940 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oiDA1-0005BA-9q;
	Tue, 11 Oct 2022 14:10:37 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-manifest.json: Move urllib to netclient
Date: Tue, 11 Oct 2022 14:10:28 +0300
Message-Id: <20221011111028.590084-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 11:10:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171620

Move urllib from core to netclient because it imports base64.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3/python3-manifest.json               | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 2205cf2d2d..02c918d6e5 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -315,8 +315,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
             "${libdir}/python${PYTHON_MAJMIN}/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/typing.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
@@ -402,9 +400,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
         ]
     },
     "crypt": {
@@ -876,6 +872,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
@@ -888,6 +886,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
         ]
     },
-- 
2.30.2


