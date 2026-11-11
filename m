Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3241.1794374735021977710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xn9ow8hT;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3212; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=669SM/KE6Se+XIYzm29Z3NWMZc51EYPHVzDKJIGpMZg=;
  b=Xn9ow8hT1FfFDt36MxTr+bd0QfHZPpdn7N4DS6DCFkXToHtBGcmJC9VK
   rPPzbHsW6Tkk3rOZzkanI2LySXKd2j9QE+j/peXXvejoUhATVPP8F4fbG
   gFlKZrCQgHTJySE30r/R3uGGCpt7KQ2rtCfAUC7uZpVJsdsfRgdRVaE1B
   KVHLHBl55qobxB4IoicAgYDrY92E7quwv8JfzX5vS7OjHmqAKlewaZYDs
   fo2FX4p8nSnX1Gd6/ZzxnJb2nWu759iDG1nDaM08OpMaIOLr+d+SCPCEM
   YQVCwkLj8QfxUyBETQkVynx326zAq1MoIK+aVtL8v3VqenxkVaI1BBYe4
   A==;
X-CSE-ConnectionGUID: CKgEhCQeQgG7wqn7X7SV/w==
X-CSE-MsgGUID: z/7Olts6Rlm0GixYylCy2g==
X-IPAS-Result: =?us-ascii?q?A0BIAgAG+/Nq/5H/Ja1aglmCV3VgQ0mWSwOeIoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOHgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEblWgXkzgQGDK?=
 =?us-ascii?q?QE/AkNQ2UuBaAELFAEFgTOFQjKHcl0YAYR9JxuBSUSEfoEFgVwBAYEnhn8Eg?=
 =?us-ascii?q?xwSgVqNGgKBT4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKfhgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5JugxQBAVg1ASuCBTijRIIhoRGEKoFoijyVOhozhASUGpJUC5h9jgqWUYRqg?=
 =?us-ascii?q?Wg8RoEBCwczGggbFYMiCUoZD44uCwuDYIF/gxTJSCYyAgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAgX4BAQ?=
IronPort-Data: A9a23:8bncE6OPAhh5/bvvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUoj1mBTy
 2dLCm3Saf7fZDOkeoh1b4+09RsHvpeGxt5hS3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gmcsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj695NA2w2FrQVw+lYXn5X8
 6ModwszKQ/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMXwsYDUXUrsTIJskhOa0nnDXeDxDo1XTrq0yi4TW5FEtjuW3YIKFKrRmQ+1H2Rm/o
 n7doV79B0k1Ncyu2D6u4yij07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:H9sSFqxCWTcQLy2fCmyVKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:8WN1fWOKd/6EDO5Dcwpo2U4/I80cfVKC027WfH/nMlguV+jA
X-Talos-MUID: 9a23:DHr00ASwNzIhB27bRXT+w25FMNtzvZ6qDRgikIU3qs2vJHZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546528088"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 156801800044B;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id AE82ACBF230; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 04/10] sqlite3: fix CVE-2026-119375
Date: Tue, 10 Nov 2026 21:25:26 -0800
Message-Id: <20261111052532.1258975-4-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249945
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
new file mode 100644
index 0000000000..149889f90c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
@@ -0,0 +1,47 @@
+From c9e05db641c387aad309081b35afa3e703aa075d Mon Sep 17 00:00:00 2001
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
+index 4fb0674..04f4eea 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -71183,11 +71183,15 @@ SQLITE_PRIVATE int sqlite3WalReadFrame(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 0c7b713728..29187e75b4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
+	file://CVE-2026-119375.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

