Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27908.1793856364275554252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kDhfreei;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3630; q=dns/txt;
  s=iport01; t=1793856364; x=1795065964;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wgO4NTcXtU8EHFDsLNRgqdNoMsE9J56rHIYL0xUVta8=;
  b=kDhfreeifjI2EtgW/6jwVZUa4+fIN6qYGkjfTcBwsRiveG3VAlMqV9Vn
   j8TwVLxL9JQG7D9y4PlSjfyrpMmTqHcGuZHeKtpSk0idnUZZPGo0qTgUK
   ovJMMNQN3TNQIMKqA0e+0XIivghytdrrrd65U5/j9CYCeCZFjNHj5Pogl
   6JQxZc6Rr04qSCaw1RL+4H3zLLK70yrQujWUGfFyjw6JqWFBwI1i/aXYT
   UYG/F2iBGpdvyJPgREANR2taR+djIk84sCZvolO0YaJA2Oh7jKP3KHSO0
   Oe6WeEsYjKP2ArJfLhwrfW4uBvbVmg+K3Xq+rlbfJg1pEFQIpNbCdd2SI
   w==;
X-CSE-ConnectionGUID: uQGreJAPRAKs7hpu4qDvTQ==
X-CSE-MsgGUID: vV94NlwvTrGhnXQA0Z542Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgAGE+xq/5D/Ja1aHgEBCxIMggULgld1YENJlkueJ?=
 =?us-ascii?q?BSBag8BAQEPRA0EAQGEP0aOHwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECASoLARgBLSwDAQIWRCMhgwIBgnQDEbw/gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2UuBaAELFAEFgTOFQDKHcV0YAYR9JxuBSUSEfoEFgVwBAYEZg?=
 =?us-ascii?q?QaGBwSDLoFagQOMFQKBUoZwSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5IvgxEBgQ0BK4I9o0SCIaERhCqBaIo8lToaM4VbpRYLmH2OCpZRh?=
 =?us-ascii?q?GmBaDyBRwsHMxoIGxWDIglKGQ+OLgsLg2CBf4MUyUgmMgIJMgEBBwIHDgMLg?=
 =?us-ascii?q?WiRfgEB?=
IronPort-Data: A9a23:LwJ/SKLZBqrD3tvdFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENShjYEz
 mpNWm2EafbfNGqhc4t2PI2y9U4P6pbWztE3HAYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1zNW4sMK8xwtxeInoR9
 eQFdCkhcCy60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLo3hv+pmmH2WzZZs1mS46Ew5gA/ySQsjOS8YIqKIoTiqcN9gHjJ+
 kTC4HrFGD4aMuym4GK3ry72v7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:2pKQsa3/efEIZi8PIL/CHwqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3ACrJfjGnvCRrWvW4xS2BuZ+7zobzXOWDk423dAWa?=
 =?us-ascii?q?AM09KU+KVUULM4Y96r/M7zg=3D=3D?=
X-Talos-MUID: 9a23:3TWD6gRNKWZdjz9RRXTyumA+EsN3/Zi0J0ALoawv4/vZaXZJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544988700"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:26:01 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 91AC4180004B8;
	Thu,  5 Nov 2026 05:26:01 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 37F19CC2EF1; Wed,  4 Nov 2026 21:26:01 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 02/10] sqlite3: fix CVE-2026-119373
Date: Wed,  4 Nov 2026 21:25:59 -0800
Message-Id: <20261105052559.2442748-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249420
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a buffer
overflow when merging FTS5 detail=none prefix lists with negative
docids. The GitHub mirror commit [1] corresponds to the SQLite Fossil
check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80
[2] https://sqlite.org/src/info/a7f8c92f62

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119373

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119373.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 0000000000..6bf27f3a1f
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,56 @@
+From ddb597d563f2b17e9f42911f78ef0573cae047ed Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Tue, 4 Aug 2026 11:04:17 +0000
+Subject: [PATCH] In fts5, account for the possibility of negative docids when
+ allocating a buffer to store the results of merging detail=none prefix lists.
+ Fix for report [bugs:/info/2026-08-04T08:49:27Z | 2026-08-04T08:49:27Z].
+
+FossilOrigin-Name: a7f8c92f623e9cbe8a61266d949916acc9e5110c94dff4aa6fd1ad2ea8a60d4e
+
+CVE: CVE-2026-119373
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80]
+
+Backport Changes:
+- Applied the FTS5 fix from ext/fts5/fts5_index.c to sqlite3.c because
+  the recipe source uses the amalgamated SQLite layout.
+- Omitted ext/fts5/test/fts5prefix2.test because the extracted source
+  does not include SQLite's Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index bb908566d4..bfd285777d 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -253340,7 +253340,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf==1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+ 
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -253348,12 +253348,12 @@ static void fts5MergeRowidLists(
+   while( i1>=0 || i2>=0 ){
+     if( i1>=0 && (i2<0 || iRowid1<iRowid2) ){
+       assert( iOut==0 || iRowid1>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid1 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid1 - (u64)iOut);
+       iOut = iRowid1;
+       fts5NextRowid(p1, &i1, &iRowid1);
+     }else{
+       assert( iOut==0 || iRowid2>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid2 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid2 - (u64)iOut);
+       iOut = iRowid2;
+       if( i1>=0 && iRowid1==iRowid2 ){
+         fts5NextRowid(p1, &i1, &iRowid1);
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 2f82176913..52e7659a8e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -13,4 +13,5 @@ SRC_URI += "\
 	file://CVE-2026-119377-dependent_p2.patch \
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
+	file://CVE-2026-119373.patch \
 "
-- 
2.35.6

