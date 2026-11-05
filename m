Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27789.1793856685136154306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=avo5oKPI;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2717; q=dns/txt;
  s=iport01; t=1793856685; x=1795066285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n/s+tWkyBMv0ngW9tBZ3a0fGsB4dmYvLRUbZeGIyDBg=;
  b=avo5oKPIKYyRBz+TYsJv3IS/b+2EzqYg9y9qFcOJ8L1CcApr0wWZ2nr6
   gezfJNiGjIFdJeKg1zhDwmo5QGgADMRHbp4K20I6GMN5LdQOQ+LPuBWtQ
   fHBrXrtidN837I8FlUFvB7rOHCbsN4a47SxBpTDq97wW+WaxbcAsmaZhM
   VKFk39d9UWsEPWLHJZ36xm9d/rOoCEBT19Jd9fGc1sFX96kgetuR1AsgF
   oMX5iZzt+YWfxdfROlrieDia9NLDC2162EE0jSdNJeY4fZeA90qWvGJwU
   1CIcviGxzITRblcrl8UjZMiuIy6s21xlU8qxpH87ryLKZ5S0f1mYejbz+
   A==;
X-CSE-ConnectionGUID: d1Siu5aTQN+/LASYlijxRA==
X-CSE-MsgGUID: P8CYbIcKRiGQW79PUFuaHg==
X-IPAS-Result: =?us-ascii?q?A0BFAgCDE+xq/4r/Ja1aHgEBCxIMggULgld1YENJlkueJ?=
 =?us-ascii?q?IF+DwEBAQ9EDQQBAYQ/Ro4fAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBKgsBGAEtLAMBAlojIYMCAYJ0AxG8P4F5M4EBg?=
 =?us-ascii?q?ykBPwJDUNlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEhH6BBYFcAQGCLYV5B?=
 =?us-ascii?q?IMugVqNGAKBUoZwSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5IvgxABAYENASuBQ3oroxmCIaERhCqBaIo8lToaM6pxC5h9jgqWUYRpgWg8g?=
 =?us-ascii?q?UcLBzMaCBsVgyIJShkPji4LC4NggX+DFMlIJjICCTIBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:hnv80qoqy/aSyrZoDEuFYsfdzCleBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmHM6mCMWr2Ldt2bti//UoC657XnYRkQANspS9kHylE8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uouOmBTq
 PUkERZOKTSqvNOywbCrcMA506zPLOGzVG8ekmtrwTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWPrSn8/w7pX7WzRCsFOJvaMf6GnIxws327/oWDbQUoHWGZoLwxjH+
 Aoq+UzBUjorPv2U6gCE3UuT2b73oA3mUaIdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:JuL9oK1pnF9qFCzvBtzBrgqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AP3VrvGk5kweeiKjYmOJUihxaHKDXOXGE93bNfka?=
 =?us-ascii?q?EMEAqD5m8cm6U+aF0qeM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AwvuWBA7O0EW3KClFWaK+MhADxoxQs4+fAmEGsq8?=
 =?us-ascii?q?HlPC7an1IBhmAhRS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544765676"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:22 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 2796818000306;
	Thu,  5 Nov 2026 05:31:22 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id C9F8DCC2EF1; Wed,  4 Nov 2026 21:31:21 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 10/10] sqlite3: fix CVE-2026-119591
Date: Wed,  4 Nov 2026 21:31:20 -0800
Message-Id: <20261105053120.2449836-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249434
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
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
new file mode 100644
index 0000000000..3b616842fb
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
@@ -0,0 +1,40 @@
+From 0894e1c6c54cde37d822bd1cb367fd1ed2765732 Mon Sep 17 00:00:00 2001
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
+index 19ab450812..f3f10400c4 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -154164,6 +154164,10 @@ static int countOfViewOptimization(Parse *pParse, Select *p){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 4073a48202..6347fcd8d5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -22,4 +22,5 @@ SRC_URI += "\
 	file://CVE-2026-119376.patch \
 	file://CVE-2026-119371-dependent.patch \
 	file://CVE-2026-119371.patch \
+	file://CVE-2026-119591.patch \
 "
-- 
2.35.6

