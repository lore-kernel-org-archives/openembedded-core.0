Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27756.1793856505221509612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mjya69Tk;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3081; q=dns/txt;
  s=iport01; t=1793856505; x=1795066105;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=knXAL2fC0MlNS+7ZXb8Kcn9ggaTnvc7pET9YckiIZ4A=;
  b=Mjya69TkZF+LHtRxiysYB1s0ReLk7gclokAIvygLD6PfLeX9Id3b/Z3E
   MqSTmdVbjdMbGQRjDhI3mpj4eb+r6ObRvVhVqQuIyytFTxGlkaaU2GFYL
   AcGpyW2m7gbUKpwQgW7pjvUvHQeJ3hNrgsjV7F1S1YznKDbT1XoUOIFBG
   3rFrRr/VyXVYFwPIskzXR+NUYYtQU15nfS/41xBjomFrX6GAiuwPc7TPp
   EMU4zbjy3ntC59WAc/2WngARhARTfwGucWoY5r19Q0tmFB4QIB8R/Bbm/
   +GSjuhHLeoo7OqrB56eFKw/DqwjL1g5ueSihvY0vlBRaSf7bSbzvoAruv
   g==;
X-CSE-ConnectionGUID: wtcOyvcZTLC7l18HfCZbOQ==
X-CSE-MsgGUID: WEXcGp+qTF2SkFMmM6S75A==
X-IPAS-Result: =?us-ascii?q?A0BFAgCDEuxq/4r/Ja1aglmCV3VgQ0mWS54kgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9Gjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgEqCwEYAS0sAwECWiMhgwIBgnQDEbw6gXkzgQGDKQE/AkNQ2?=
 =?us-ascii?q?UuBaAELFAEFgTOFQDKHcV0YAYR9JxuBSUSEfoEFgVwBAYEnhn8Egy6BWo0YA?=
 =?us-ascii?q?oFShnBIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB?=
 =?us-ascii?q?12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hki+DEAEBg?=
 =?us-ascii?q?Q0BK4IFOKNEgiGhEYQqgWiKPJU6GjOEBJQZklQLmH2OCpZRhGmBaDxGgQELB?=
 =?us-ascii?q?zMaCBsVgyIJShkPji4LC4NggX+DFMlEJjICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:JkcIVqOtKZCXwyTvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUon0D0Pz
 WRKXz+DPfnbZDSjf4x3YNiw8kIG7JGGy4JmHHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+pyB2YnI4YqxsJcXmUXp
 dwWAwIHSSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJskhOa0nnDXeDxDo1XTrq0yi4TW5FEti+W9a4eMJLRmQ+1qs3aTi
 XqF5ljXWCoZGvma7GS+rS+F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:xK4Hs6vMvEkG3h6+rbyvMMKm7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:0+FkWG22DWVVsg+MopuUzbxfBdwuVWzDx0XsB2TnDT85aLO+e1W3wfYx
X-Talos-MUID: 9a23:OShrDAuazGJlOoXqI82nuxxSP+hwoL2SJho2krsjvuzaDnMtEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543583516"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:28:24 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 24DE51800030D;
	Thu,  5 Nov 2026 05:28:24 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id BFE3CCC2EF1; Wed,  4 Nov 2026 21:28:23 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 04/10] sqlite3: fix CVE-2026-119375
Date: Wed,  4 Nov 2026 21:28:22 -0800
Message-Id: <20261105052822.2445547-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249428
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which fully initializes the
page read when the WAL and database page sizes differ, preventing
disclosure of uninitialized page data. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e5bf119821f25be1d7f10ef0a2edbe175289166e
[2] https://sqlite.org/src/info/f9b4ee369557c36c

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119375

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119375.patch      | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
new file mode 100644
index 0000000000..94bf2752a3
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
@@ -0,0 +1,47 @@
+From 01d00d78bc2c756021a2f8f01733d58af7dec1ef Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Aug 2026 10:49:39 +0000
+Subject: [PATCH] When reading a frame from a WAL file where the WAL pagesize
+ and the database pagesize disagree, be sure to fully initialize the page that
+ is read.
+
+FossilOrigin-Name: f9b4ee369557c36c606666bd7e6d8dc4685d87531993d3ce4e7a718aa814a5ac
+
+CVE: CVE-2026-119375
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e5bf119821f25be1d7f10ef0a2edbe175289166e]
+
+Backport Changes:
+- Applied the src/wal.c change to sqlite3.c because the recipe source
+  uses the amalgamated SQLite layout.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed in this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1889632086..bcd317206b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -70412,11 +70412,15 @@ SQLITE_PRIVATE int sqlite3WalReadFrame(
+   i64 iOffset;
+   sz = pWal->hdr.szPage;
+   sz = (sz&0xfe00) + ((sz&0x0001)<<16);
++  if( nOut>sz ){
++    memset(pOut+sz, 0, nOut-sz);
++    nOut = sz;
++  }
+   testcase( sz<=32768 );
+   testcase( sz>=65536 );
+   iOffset = walFrameOffset(iRead, sz) + WAL_FRAME_HDRSIZE;
+   /* testcase( IS_BIG_INT(iOffset) ); // requires a 4GiB WAL */
+-  return sqlite3OsRead(pWal->pWalFd, pOut, (nOut>sz ? sz : nOut), iOffset);
++  return sqlite3OsRead(pWal->pWalFd, pOut, nOut, iOffset);
+ }
+ 
+ /*
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index f76ca8bd56..79d12d4b03 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -15,4 +15,5 @@ SRC_URI += "\
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
+	file://CVE-2026-119375.patch \
 "
-- 
2.35.6

