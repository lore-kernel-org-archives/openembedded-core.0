Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3242.1794374735135445517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=htKjh6T3;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4170; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xVTOL/Wnc6Jdvw14ZV4Ay5UxD9tbPaVyI/GJMRbIRrw=;
  b=htKjh6T3D1K4l+c7x54nMlqEU5VAgHFiOtp2GZfUwUwB4Vzmzt6SbanO
   0YcxSaSJAp8VQ6YXi05wPgMEvO66B6uJRHCAjJ0jC9imbWp44KkxdI9s/
   v9+iOlZt58Bj0btMr+3a1HDYtn06RqgQVb7EzoiDwFfu8J2VRdUYzTerf
   qwTijrYRSE0NhJVvbgA8yiXxqSLIQGBigns9DX8WcUqrgC8b4NxNBrCaX
   UYHICCGJjxBn9l00WtDze9WcekG3SF3xSaLI3v6sq46IcPq/b34hEO1G8
   SLsX5LWuJ94PwVuNV5hftU7EjrJtIbLgn1j7dUrfporXUjC0n1SspLnhE
   w==;
X-CSE-ConnectionGUID: KJfEiatETS+HtqfKfMwUAQ==
X-CSE-MsgGUID: vYi4WS2gSZi1PvSZitI9OA==
X-IPAS-Result: =?us-ascii?q?A0AaAAAG+/Nq/5P/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWQOeIoF+DwEBAQ9EDQQBAYQ/RgKOHgImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QH?=
 =?us-ascii?q?AMBAi8rIwgZgwIBgnQDEblWgXkzgQGCZkMBPwJDUNlLgWgBCxQBBYEzAYVBM?=
 =?us-ascii?q?odyXRgBhH0nG4FJRIR+gQWBXAEBiCYEgxwSgVqNGgKBT4clSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgRyBHoESgQddgSsoXQEhgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0O?=
 =?us-ascii?q?RAwHiQvBRomPhsKfhgNSBEsNxUZBD5uB5JugxUBWDUBK4EFQGIWo0SCIaERh?=
 =?us-ascii?q?CqBaIo8lToaM4VbpRcLmH2OCpZRhGqBaDxGgQELBzMaCBsVgyIJShkPjisDC?=
 =?us-ascii?q?wuDYIF/gxTJSCYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:OvBu66sHK0vsgWefJrFJ2Ka5cOfnVABfMUV32f8akzHdYApBsoF/q
 tZmKW6FOa6CMDCnL4tyPo229kkC65CBytFmSwE9/C1jRngTgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2cR5LGBH6
 dEkE3MtcgmNpOyT34+Sc7w57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XeidAqU6NrII84nPYy0p6172F3N/9J4DUGZoFxxbCz
 o7A13rIA00lD4aQ8giEq0qyvd3OgQKqf6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:UZf6869M///hACbmwuxuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AG6E5dWtMpetFz/colFGdsxui6IsGUHPwzX7MDnO?=
 =?us-ascii?q?DSkZ1UbO2R3qPxYpdxp8=3D?=
X-Talos-MUID: 9a23:VP2tLwWnJFzACrrq/CHdhW1dD51n2JavUXgTqqcHp+jVEgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546478182"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 115691800025B;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id AABE3CBF22F; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 03/10] sqlite3: fix CVE-2026-119374
Date: Tue, 10 Nov 2026 21:25:25 -0800
Message-Id: <20261111052532.1258975-3-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249946
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which addresses an FTS5
secure-delete buffer overrun when handling a corrupted database.
The GitHub mirror commit [1] corresponds to the SQLite Fossil
check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960704d9
[2] https://sqlite.org/src/info/9cd4f9e920

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119374

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 78 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 0000000000..15ca70d338
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,78 @@
+From 6875e24f0c0612feccb97ab4c3f92c8444833373 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Tue, 11 Aug 2026 14:16:12 +0000
+Subject: [PATCH] Fix a problem in fts5 secure-delete code that could lead to a
+ buffer overrun when dealing with a strategically corrupted database. Problem
+ reported by YEONBA.
+
+FossilOrigin-Name: 9cd4f9e9205c5a5096388397a39349db9ff5377d19095c6b20388ff799969c31
+
+CVE: CVE-2026-119374
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960704d9]
+
+Backport Changes:
+- Applied the fix from ext/fts5/fts5_index.c to sqlite3.c because the
+  recipe uses SQLite's amalgamated source.
+- Omitted ext/fts5/test/fts5corruptB.test because the extracted source
+  does not include the upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 06ceecf..4fb0674 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -256381,34 +256381,38 @@ static void fts5DoSecureDelete(
+   if( p->rc==SQLITE_OK ){
+     const int nMove = nPg - iNextOff;     /* Number of bytes to move */
+     int nShift = iNextOff - iOff;         /* Distance to move them */
+-
++    int nNewPg = 0;
+     int iPrevKeyOut = 0;
+-    int iKeyIn = 0;
++    i64 iKeyIn = 0;
+ 
+     if( nMove>0 ){
+       memmove(&aPg[iOff], &aPg[iNextOff], nMove);
+     }
+     iPgIdx -= nShift;
+-    nPg = iPgIdx;
++    nNewPg = iPgIdx;
+     fts5PutU16(&aPg[2], iPgIdx);
+ 
+     for(iIdx=0; iIdx<nIdx; /* no-op */){
+       u32 iVal = 0;
+       iIdx += fts5GetVarint32(&aIdx[iIdx], iVal);
+       iKeyIn += iVal;
++      if( iKeyIn>nPg ){
++        FTS5_CORRUPT_IDX(p);
++        break;
++      }
+       if( iKeyIn!=iDelKeyOff ){
+         int iKeyOut = (iKeyIn - (iKeyIn>iOff ? nShift : 0));
+-        nPg += sqlite3Fts5PutVarint(&aPg[nPg], iKeyOut - iPrevKeyOut);
++        nNewPg += sqlite3Fts5PutVarint(&aPg[nNewPg], iKeyOut - iPrevKeyOut);
+         iPrevKeyOut = iKeyOut;
+       }
+     }
+ 
+-    if( iPgIdx==nPg && nIdx>0 && pSeg->iLeafPgno!=1 ){
++    if( p->rc==SQLITE_OK && iPgIdx==nNewPg && nIdx>0 && pSeg->iLeafPgno!=1 ){
+       fts5SecureDeleteIdxEntry(p, iSegid, pSeg->iLeafPgno);
+     }
+ 
+-    assert_nc( nPg>4 || fts5GetU16(aPg)==0 );
+-    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nPg);
++    assert_nc( nNewPg>4 || fts5GetU16(aPg)==0 );
++    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nNewPg);
+   }
+   sqlite3_free(aIdx);
+ }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 4ec6eb230e..0c7b713728 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
+	file://CVE-2026-119374.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

