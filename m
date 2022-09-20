Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E23AECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 10:20:27 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.9979.1663669222091746073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=MHjhw60J;
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
	bh=FDSM9hufMs5ykAxnLZdP2MOp/x/iKIZpBmzATBdCKkg=; b=MHjhw60Jj/x+VaDaJ8X9LvFb6y
	B4hRtOnuVwcPgU0tDgugcpyy/TGRMUkoMC+BW7vNcwRw+vfArhHoe7D/6d2mZEStEvhJyqbObSKdp
	HF1f53KE2GjYHW5Ek4228TLhYzBuD0SS9ghN9DXGM7O68S3iHjt0koH1d9YzeCpZjVWw9bL97I5Ze
	M2HNzC7J/U7+Od6PBjlSIex5Sim3r1z2wcG7GjjNjMey6XkJ+9tmqgzE3yHl2DqTEGCg+fUDP1C7k
	q/vAXFNDPmL/KX1UgAFkKoPY0npMLbSDua5ya/KlhwTJqG8qEhv5BskbvNwvtly5/kYIKTUuHcSQi
	gmrficlw==;
Received: from lan.nucleusys.com ([92.247.61.126]:51852 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oaaMv-0004mn-S2;
	Tue, 20 Sep 2022 13:20:20 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-manifest.json: Add zoneinfo
Date: Tue, 20 Sep 2022 13:20:09 +0300
Message-Id: <20220920102009.1101262-1-leon.anavi@konsulko.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 10:20:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170891

The zoneinfo module provides a concrete time zone implementation
to support the IANA time zone database as originally specified in
PEP 615.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3/python3-manifest.json              | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 2f5dad6486..2205cf2d2d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1248,5 +1248,16 @@
             "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
         ],
         "cached": []
+    },
+    "zoneinfo": {
+        "summary": "IANA time zone support",
+        "rdepends": [
+            "core"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/zoneinfo",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zoneinfo.*.so"
+        ],
+       "cached": []
     }
 }
-- 
2.30.2


