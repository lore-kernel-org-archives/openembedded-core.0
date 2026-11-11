Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3329.1794374735153528165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e5AFpVBC;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2838; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EqQPfC2cr+UViCLSuSm6Pm/ogaJuIrbOnt1rpfh83Vw=;
  b=e5AFpVBCMO9ZKzbqm+Wi559VwhmWXZD6Yn9dKVBNbSNbU9HJqv7nscEC
   SJ8VydvnFxx3r2bHzasVXGd9Z5CT7eFpuhZJ283OKHoNLBYQ9gXTysiVv
   2RL/Lhyat9nK3YFY9zv6iYyLI4hS843gV3yXXg1KFARkkL53EuwcEpAVp
   yTYjetxisaqWxiUmVV1PsyPetmhaO+nBmCNvpnCQDiSEaebVwO007ZmYb
   YT+wDTlFDX97J0F0mvzKX2Uv+ryhQR65PPFABFlSQ3scq/5dKdGDa7FV0
   APjYnkebWNFFRYzXtmguCd9enUhOZ1LKFZzcDjTKfEhkCf7U/rp1pN5VB
   Q==;
X-CSE-ConnectionGUID: 1aaD7UvlRhuTWeKXIDHv/w==
X-CSE-MsgGUID: 4Kl/JRzrTPelR2IHv63wYA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAG+/Nq/5L/Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?iKBfg8BAQEPRA0EAQGEP0YCjh4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG5V?=
 =?us-ascii?q?oF5M4EBgykBPwJDUNlLgWgBCxQBBYEzhUIyh3JdGAGEfScbgUlEhH6BBYFcA?=
 =?us-ascii?q?QGCLYV5BIMcEoFajRoCgU+HJUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeSboMUAQFYNQErgUN6K6MZgiGhEYQqgWiKPJU6GjOqcguYfY4Kl?=
 =?us-ascii?q?lGEaoFoPIFHCwczGggbFYMiCUoZD44uCwuDYIF/gxTJSCYyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:rPc+WKpjqNwzm6f3x8IhTOiY3aheBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmDOP3ZZmb9eYokPtu/pExSvp/dmINmTwdsqS8xQi9Gp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8Uo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r9+CE0Ry
 OIcEjAQUi+OpNKX7JKlDfY506zPLOGzVG8ekmtrwTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVvrSn8/w7pX7WzRCsFOJvaMf6GnIxws327/oWDbQUoHRH58LxxbJ+
 woq+UylIRVdFuaN0wa9/3aW3M7vg32gR7M7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:GSN7wKDvx94fNaHlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:RgP2yWz5DjtktBzpN6egBgVNE8kJLUDDyE3QPnOHBEVZaZG1VxiPrfY=
X-Talos-MUID: 9a23:/f2pNwgHy8H2Br1okZtb8sMpaORspIaUGloxqZgCgZOlFTIuYCispWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="532261895"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 7A5E218000230;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id CF70CCBEF83; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 10/10] sqlite3: fix CVE-2026-119591
Date: Tue, 10 Nov 2026 21:25:32 -0800
Message-Id: <20261111052532.1258975-10-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249950
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1] for stack exhaustion in the
count-of-view optimization. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2
[2] https://sqlite.org/src/info/ab621a3e11ee4acc

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119591

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119591.patch      | 40 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
new file mode 100644
index 0000000000..57ca37d909
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
@@ -0,0 +1,40 @@
+From 5dbe255431ad2b935db31e8e3c2c66284e2709ef Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 12:18:23 +0000
+Subject: [PATCH] Prevent the expression generated by the count-of-view
+ optimization from getting too deep and causing a CPU stack overflow.
+ [bugs:/info/2026-10-04T05:34:47Z|Bug 2026-10-04T05:34:47Z]
+
+FossilOrigin-Name: ab621a3e11ee4accce14bf6c90a7cc273d9c25a7c3d9dd2466f2bdc2bbbf8084
+
+CVE: CVE-2026-119591
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2]
+
+Backport Changes:
+- Ported the src/select.c change into the amalgamated sqlite3.c.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source layout.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index dc245c4..d814a1c 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -156251,6 +156251,10 @@ static int countOfViewOptimization(Parse *pParse, Select *p){
+     }else{
+       pExpr = sqlite3PExpr(pParse, TK_PLUS, pTerm, pExpr);
+     }
++    if( pParse->nErr ){
++      sqlite3ExprDelete(db, pExpr);
++      pExpr = 0;
++    }
+     pSub = pPrior;
+   }
+   p->pEList->a[0].pExpr = pExpr;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 93ee778292..f616c70073 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119378.patch \
 	file://CVE-2026-119376.patch \
 	file://CVE-2026-119371.patch \
+	file://CVE-2026-119591.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

