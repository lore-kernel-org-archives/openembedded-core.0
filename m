Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C041CC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:06:37 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7811.1784268391497481329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W0eB60oW;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3052; q=dns/txt;
  s=iport01; t=1784268391; x=1785477991;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Cr8ejVUL6Xg7Irbm14pTRUZMmCumLOizFzZ+z9oGFXM=;
  b=W0eB60oWh3qQ5h+/6zm8bN3COsvlMHW+042fDqIS3T/E8Nc9zpoyZWG2
   sLklptbD1lpfEAZdhkMHY8FPxvI7LSAecLyXD3PvrPQaxx4U2Uv0etVzZ
   h8fUgMoj6kv8pO3q52aBBpKYuQ33pfrBa07+8m5swh4Rt58sJ8G4uwh4U
   +z41Yq0E9t0mzkEU1q28fO3bdhtZTfGPpExlQg7ytVNG2SWinKWrwekGa
   x1/Wb+AlQ9cl6lFg/rqN65e9HFZmvGWPqpoWjM5Vsp0PM3BtP4JCG/ujB
   bKECgOmHVx+WlnwT5DwgJkUCzBNAtcMJOrgki6RltkmldWP2nwf3zD0In
   A==;
X-CSE-ConnectionGUID: uETBRzFKRAKbYAm9pwrV4g==
X-CSE-MsgGUID: IJXiKXZ9SCamzwj2Q7JFDw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBWw1lq/5D/Ja1aHgEBCxIMggULgld0X0JJlCmCJ?=
 =?us-ascii?q?ItkkjeBfg8BAQEPRA0EAQGEP0YCjVICJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbx6GjeBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOIU/gn2FI1wYAYR8Jxsbg?=
 =?us-ascii?q?XKEfoEFgRpCAQGIJQSCIoEMgVoehHOLDkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1qEheBToIUgT4DCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB41II4I/gQ4BK4FDplygIXEKKIN1jCGPPoV8GjOqbAuYfY4Kh?=
 =?us-ascii?q?AmSR4RpgWg8gSgfCwdwFYJuATMJShkPjjiDa4F/zEE8NQIJMgEBBwIHDgMLg?=
 =?us-ascii?q?WiRfgEB?=
IronPort-Data: A9a23:WcXMWa9NpQiMp/sWdvSqDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DQdWTuCOqzZYGD0KN8gO4zipEwBu5KDmIQ3SwNkqnxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTtKs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2krELEywPRZIltn1
 vYpATVcdg+Zub65lefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYONJ4TVHZsE9qqej
 kPkz2XaMiNLD/eWzCia8CiV2c3hsTyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:YMZjVa3EhfwzNPbCA9tf1gqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3ArwtrbmmOp7P25gyhoXfSnf0tY+HXOWDw8F3qMWG?=
 =?us-ascii?q?bM09KQoy8TA6I57laz8U7zg=3D=3D?=
X-Talos-MUID: 9a23:QPzQ/AnbzZ7TKnEuAKJLdnpDFvdpwJScWXsmmJAUpMveDHNSFRuC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="510507069"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:06:30 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 36A68180003C9
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:06:30 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 58A23CC037D; Fri, 17 Jul 2026 11:36:28 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 09/10] expat: fix CVE-2026-56407
Date: Fri, 17 Jul 2026 11:34:36 +0530
Message-Id: <20260717060437.2910653-10-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241148

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56407

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56407.patch          | 41 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
new file mode 100644
index 0000000000..56fb91e6c5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
@@ -0,0 +1,41 @@
+From d1cd2bd7da8ed830e9432660616e9b4831df959a Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 11:59:01 +0530
+Subject: [PATCH 12/17] cap entity textLen against signed integer overflow
+
+CVE: CVE-2026-56407
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13]
+
+(cherry picked from commit 30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9f07b860..8439dc0e 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5655,6 +5655,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
+             XML_ACCOUNT_NONE);
+         if (parser->m_declEntity) {
++          /* Detect and prevent signed integer overflow */
++          if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
++            return XML_ERROR_NO_MEMORY;
++          }
+           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
+           parser->m_declEntity->textLen
+               = (int)(poolLength(&dtd->entityValuePool));
+@@ -7076,6 +7080,11 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
++  /* Detect and prevent signed integer overflow */
++  if ((size_t)poolLength(pool) > (size_t)INT_MAX) {
++    poolDiscard(pool);
++    return XML_ERROR_NO_MEMORY;
++  }
+   entity->textPtr = poolStart(pool);
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 3a880882ae..92e62e2233 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -62,6 +62,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
+           file://CVE-2026-56407.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

