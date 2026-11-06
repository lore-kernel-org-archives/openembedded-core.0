Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2175.1793955248651963828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VFuk9qPy;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3235; q=dns/txt;
  s=iport01; t=1793955248; x=1795164848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zju3WPbpgQWVaF2lVrqN3+LC7M1Xvoq5Mv9Q0eVgjhU=;
  b=VFuk9qPyvfPqcMQhqlNTm6mdFeYJoMGrviWFyUH6rlzkrkFFkcgO23tL
   Ra8zVz0TvAjkJjjUs4waDoodmCEOQknRPtn4hzFKhrrktdjxtya6s5D0r
   BH98Ak1LHxgC2s0k/RGFwDXXUomJOdVsffr3o+BdEeMXLvWhUiXQRkDc5
   Fuq4AF30CwpqMR7pDG10YmGIBrOFhkGm7faA/2EcOsNw/SRhhFUN8IgvU
   ZuciH5vbhMp+rfXK+BT84eGIkPsmCCMmR2inVEEQWiWofD18nkiWBRnnb
   d2GNLCPX48FDFPO8/vjIZghgGGTk43E9pajD4L5xmFgCD1n40Zy2FbmsY
   w==;
X-CSE-ConnectionGUID: x8hTQ2HnSdO3wYtM1j5O/g==
X-CSE-MsgGUID: f0hgo3lfSEKnkhcf2vtjUQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmlO1q/4v/Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZCYJ5AYJ0AxG8BoF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEhH6BBYFcAQGBJ4Z/B?=
 =?us-ascii?q?IMcEoFaHox6AoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hkj2DEQEBgQ0BKgGCBTijRIIhoRGEKoFoijyVOhozhASUGZJUC5h9jgqWU?=
 =?us-ascii?q?YRpgWg8RoEBCwczGggbFYMiCUoZD44uCwuDYIF/gxTGfSYyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAgX4BAQ?=
IronPort-Data: A9a23:8yaJe6+CGhUzG37nibayDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2sXXWjTO/zYN2H3fd1xPd639RlQupHVztQxSwJoripEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kmbY0kw7xXB1pC0
 qcHGSwoNxLeoKW5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+hnGH+byVRgFmUvqEwpWPUyWSd1ZCwbIaOK4zTH5s9ckCwq
 DrG8GOiBh8hGf+ZyjqO/Ciymu3ypHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:gVLRs6iRdMyZ7KqiT7534TRb0HBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3Am91QUWhC541scAbQVbPyNZZUojJuYi3d8E6KA0m?=
 =?us-ascii?q?DBUEyV4yJbAaSpYQjnJ87?=
X-Talos-MUID: 9a23:VJVGzAurxDX8ekZhns2nimliO8Az56qVJWMLkpUNtZOaKS5NAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544398126"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:07 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id A06D918000206;
	Fri,  6 Nov 2026 08:54:07 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 4B7A6CBF230; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 04/10] sqlite3: fix CVE-2026-119375
Date: Fri,  6 Nov 2026 00:53:59 -0800
Message-Id: <20261106085405.3517095-4-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249612
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
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
new file mode 100644
index 0000000000..390a3f5234
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
+index a397e4d36b..afcf2b1969 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -68201,11 +68201,15 @@ SQLITE_PRIVATE int sqlite3WalReadFrame(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 0476c71cae..db92177c08 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119377_p2.patch \
            file://CVE-2026-119373.patch \
            file://CVE-2026-119374.patch \
+           file://CVE-2026-119375.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

