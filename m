Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3329.1794374735153528165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VoXBugIX;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3761; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kI37wRmVJpItNV/N2UpC01h8aJB/Y2pigqgJi+Rzfv4=;
  b=VoXBugIXy3eEHdfwBYJLhR6PY88BWWVHCot5vgygxxlt4A5emMm6XizS
   Wo+1nJueqN2XMxJim/Wt36SEW1vDCRYFKVsATa7R0L9w3Oj+eYytEQHev
   VWQ++D88ZkQkPvzYMgZBINEXWp6RDPpya9ibjqpb6JdeMvkA7lDCU6vxe
   gKqujkLMllfH8AR19zh9VYI+vwpK6Pe7tFIPajDUv0J+UKV4r3zvUinUX
   1d/MBRJwaQf09svGzxMgO9MZGRSmeaLaBXV2IX6u3Hdeh0qQgnevpwzBw
   4bCimTO90U1rT2JJk2rYsveihjKDbR10KuKYjeL0aoVnv84H2VJBvI+f5
   A==;
X-CSE-ConnectionGUID: MHZZ9RE4SPK5WDPjEHxcOg==
X-CSE-MsgGUID: GkskoFREQouMznIv/0HswA==
X-IPAS-Result: =?us-ascii?q?A0AnAAAG+/Nq/5T/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIhSBag8BAQEPRA0EAQGEP0YCjh4CJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIWG?=
 =?us-ascii?q?SsjCBmDAgGCdAMRuVaBeTOBAYMpAT8CQ1DZS4FoAQsUAQWBMwGFQTKHcl0YA?=
 =?us-ascii?q?YR9JxuBSUSEfoEFgVwBAYEZgQaGBwSDHBKBWoECjBgCgU+HJUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0Md?=
 =?us-ascii?q?DkQMB4kLwUaJj4bCn4YDUgRLDcVGQQ+bgeSboMVAVg1ASuCPaNEgiGhEYQqg?=
 =?us-ascii?q?WiKPJU6GjOFW6UXC5h9jgqWUYRqgWg8gUcLBzMaCBsVgyIJShkPji4LC4Ngg?=
 =?us-ascii?q?X+DFMlIJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:kg9MCaDeHTPNhxVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGx00mAGz
 zEcXT+BM/mONmXxKNogOty3900Ov5/dyN4wOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5tVcPhAMENEjwsUqPk129
 9E4ODsqYUXW7w626OrTpuhEnM8vKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY/BPjDS0Un1lM/AYgmnfuwj1H0ciZTrxSeoq9fD237kVcriua0YIuMEjCMbepWhUWfi
 FjrxmPkJwMcFcLYkRqe7Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIk/OS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:jIpxKq/7nqLLrCX22I5uk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:RHfDyGxy5Lbn2eVEAN5DBgUxOvIXI0fwkEzoABKHJV5rZZ2FQnifrfY=
X-Talos-MUID: 9a23:FuT++guqtBedROSxWc2nqzJ5N8BG2YmXD10og5MnpY7cFTdvEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="532261891"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 0EA8F1800024D;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id AA067CBF22E; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 02/10] sqlite3: fix CVE-2026-119373
Date: Tue, 10 Nov 2026 21:25:24 -0800
Message-Id: <20261111052532.1258975-2-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249943
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 0000000000..bb2eb09d0a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,56 @@
+From 2ea652e191b5fd3e2ff13eadd907519b74e3db94 Mon Sep 17 00:00:00 2001
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
+index 6130466..06ceecf 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -256971,7 +256971,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf==1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+ 
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -256979,12 +256979,12 @@ static void fts5MergeRowidLists(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index c7c081b393..4ec6eb230e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119377-dependent_p2.patch \
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
+	file://CVE-2026-119373.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

