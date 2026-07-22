Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E36C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:12:58 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44570.1784715174856552406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aWlyamLU;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3743; q=dns/txt;
  s=iport01; t=1784715174; x=1785924774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CTuKXiRShPZ5Iw8em3xg29m3XQhEZhKdkE1cEh6yODk=;
  b=aWlyamLU2qgWzvNyg2QZfMW9ghdWIccaBfogS1kIKISyZLsNogn/f0FC
   og7A6AHlDY/bISP+IY+Y6hLI7YIX0pINjnn8L7oCCfrjzQEkQta0VxNlm
   krtcsAda2QriZK0oNxmPiw+H1Mz0XViLKt8WnQAyfTHtsd9LxeaOXmz+U
   2whqz6kLEFv7Fx4J6XAtXYKrH7xqwA9ls2TAGbClmmg0sowVW2pQ78dAe
   6krJL/6WeiiHa8ux5NHvs7jJuGmMe5h0JMBTdnk8ItQD/RvwaRDtgUagl
   8VVj2T1ZKtun8t6lRttv89o61PRM5fH619cM2Epj4H2/MFWgXPSvslmrf
   Q==;
X-CSE-ConnectionGUID: HpBg8NJNS4iVUojY0Zm6Fg==
X-CSE-MsgGUID: zoQRF0SHTW+0KFiFgQwYVA==
X-IPAS-Result: =?us-ascii?q?A0BHAgBEl2Bq/5H/Ja1aHgEBCxIMggULgld0XkNJlk2LZ?=
 =?us-ascii?q?JI3gX4PAQEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLyALIwgZgwIBgjoDNwMRw?=
 =?us-ascii?q?RWCLIEBgygBPwJDUNhJDYJYAQsUAQWBM4U/gn2FI1wYAYR8JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBGkIBgUmGXQSCIoEMgVoYBpAiSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgR2BLoEChG4jHwM5f4EvdUp3LWkBEheBJoIUgToCgQMDCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB41pI4JAgQ4BKgGVZAeSN6AecQoog3WMIY8+hXwaM6psC5h9j?=
 =?us-ascii?q?gqECZJHhGmBaDyBRwsHcBWDIglKGQ+OKg4Lg2CBf8wSJzICCTIBAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:YuIsv637lLAR8J+XT/bD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzEBy
 DdMCG7TaavbMWvxL9pwaY/i8BkA75TSydY2QVBv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLFkcMt0+2MBMXWBwy
 PsaGWg/a06tiLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeG2a4GFIoHQLSlTtlSfn
 1jop1/ZPi5ZbP+xyBSKy22duMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:WJ3Cwq7/6tKcc5WvZQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:QSUq9WOMQja7NO5DeDFN+x4yOOYeLnzj8XDSEheKDDhHR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3As5jkBQ9UgroPTKo5T2G7qHSQf9Vv2p6AUHstrap?=
 =?us-ascii?q?F4+qqNAJ/Aiissh3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513338052"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:12:54 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id E9FA218000472;
	Wed, 22 Jul 2026 10:12:53 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 9929ACC12A6; Wed, 22 Jul 2026 03:12:53 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/4] wget: Fix CVE-2026-58470
Date: Wed, 22 Jul 2026 03:12:28 -0700
Message-Id: <20260722101230.34771-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722101230.34771-1-hthakar@cisco.com>
References: <20260722101230.34771-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241651

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..7ee4e87344
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From bfbab29e0a94160b283a8101e122d07684104955 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf]
+
+(cherry picked from commit 43d3ba9336bc94937e6fae2365c6ffd30c34ffcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 116a93a3..4dc6b70f 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+ 
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '-' || !c_isdigit (*(hdr + 1)))
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr = num;
+-  ++hdr;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '/')
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '/')
+     return false;
+   *last_byte_ptr = num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) == '*'))
++  if (!(c_isdigit (*hdr) || *hdr == '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr == '*')
+     num = -1;
+   else
+-    for (num = 0; c_isdigit (*hdr); hdr++)
+-      num = 10 * num + (*hdr - '0');
++    {
++      errno = 0;
++      num = strtol(hdr, NULL, 10);
++      if (errno == ERANGE)
++        return false;
++    }
+   *entity_length_ptr = num;
+   if ((*entity_length_ptr <= *last_byte_ptr) && *entity_length_ptr != -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index cb05ff34f8..50df38aab1 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -5,6 +5,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58470.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.35.6


