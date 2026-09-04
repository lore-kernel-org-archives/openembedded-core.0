Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D73C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:06:03 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12312.1788523561661860986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KZNQAtkx;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6193; q=dns/txt;
  s=iport01; t=1788523561; x=1789733161;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BGCwtF0RASwJVOe76K0cPYVFHslJkxsMnss02ronzEc=;
  b=KZNQAtkx0Ee+3dyBWZD9A6iHsJeH5fqMsFQDmITpPXaVmU6DmsUavQEw
   QUxX2N6Ly9YOvC91a2DgJGdTmXdMOi/m9FNYj0Wyr1411B6loOk/ZfBEb
   NK7cquy1cJpwks7OdrblFLB6OZ0vh8TTTXRqu1sQxA/olxX1HNE9GmgQy
   UTl0LxGJk6vu4EQ8wLmgoyOKxnQRG2V6znJ4JVnhMrxycYoneF1fnJh58
   dEvd3J+cq/Tsuj9/VbM67S9Hcia3P+calHezkpiyszgHY8tBcUQ06ZnR9
   E/Z068saShCkhtclQ7j5qpd75vpbuRKhQkd7bx+eEXFsNE8VwvLjbf7mM
   g==;
X-CSE-ConnectionGUID: 3/GoLrWAReaRas6iL/yYww==
X-CSE-MsgGUID: FM1m88rmSaKvrq9NhZVw9w==
X-IPAS-Result: =?us-ascii?q?A0AbAABCs5pq/5IQJK1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0YENJjHKVP5I3gX4PAQEBD0QNBAEBhQWOBAImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDZAcAQIBNQEYAS0sAwECTwsjI?=
 =?us-ascii?q?YMCAYI6AzcDEcJjgiyBAYMoAT8CQ9kbDYJZAQsUAQWBMwGFPoJ/hSNdGAGEf?=
 =?us-ascii?q?CcbG4FygRWDaYEFgRpCAYFJhl0EgiKBDIFaGAaRb0iBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBBxsGBYEdgSeDPyMZNnqBCV6BKylgARIXgQmCCAKCV?=
 =?us-ascii?q?IIDAgFJQw4HR1MJJ0EECxgNSBEsNxUZBD5uB45fH4JQgQ4BByMBlWQHkjegH?=
 =?us-ascii?q?nEKKIN2jCKPPoV8GjOqbQuYfY4KhAmSR4RpgWg8gUcLB3AVgyIJShkPjisOC?=
 =?us-ascii?q?4NggX/KOicyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:SW9Nwakc7Q/OaunvRKEjusno5gydJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNUW+EaKmIYjH2KtsiOt7np0sGvpGBy9QySFNl/C01FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpFs/7b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdZf1eFTG15nz
 /EREjkWMBGnwPOH363uH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FYIGMJ4TaGZoE9qqej
 kzjpmGpUgsfD9W81yCco1SstNHQzDyuDer+E5X9rJaGmma7w2UPCBwbSB23vPO+i1X7UcheI
 koY0iApqrQ29UrtRd74NzWioXWEtwQQHcJNCeE75SmJy6zJ8wieG24IRyJAb9pgs9U5LRQtz
 lKPktbjCDBjvbHQQnWH+5+QrCiuIm4SNWIEaCoOQAcJ7tWlp5s85i8jVf5qFKqzy9mwEjbqz
 nXS/W41hq4YiogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:8/AWRq7mtVb6FHjtDgPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:UM7QIm8hl0lTOUHa1jKVvxVTNccBaEL09nrZGUajV2dND6ykVkDFrQ==
X-Talos-MUID: 9a23:zSny5An0zJnRIGmPMwkidnpMEZ5ts/S0DXsEsoscopiiNR5OJGaC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="831508479"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:06:00 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 97F2C1800047C;
	Fri,  4 Sep 2026 12:06:00 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 2F800CCD9B2; Fri,  4 Sep 2026 05:06:00 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose][PATCH v2] wget: Fix CVE-2026-58470
Date: Fri,  4 Sep 2026 05:05:35 -0700
Message-Id: <20260904120535.1687717-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245091

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].
It also includes the upstream follow-up in [3],
which preserves 64-bit wgint parsing on 32-bit targets.

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
[3] https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 9b2b418a1546ae4bd6d044474765fa817e9a95f8)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- Added the regression commit
---
 .../wget/wget/CVE-2026-58470-regression.patch | 48 +++++++++++
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
new file mode 100644
index 0000000000..c452261a9a
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
@@ -0,0 +1,48 @@
+From 01ff771caac1958662ca8665eed2021ec386a7af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 12 Aug 2026 19:45:21 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Use strtoll instead of
+ strtol.
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af]
+
+(cherry picked from commit 01ff771caac1958662ca8665eed2021ec386a7af)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index e5e75ee695..8170a43c27 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -949,7 +949,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     return false;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -959,7 +959,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   *first_byte_ptr = num;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -976,7 +976,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   else
+     {
+       errno = 0;
+-      num = strtol(hdr, NULL, 10);
++      num = strtoll(hdr, NULL, 10);
+       if (errno == ERANGE)
+         return false;
+     }
+-- 
+2.35.6
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..5d864c5fda
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From 8740efcdd0d9e7eb04122f63bdb151f1f4d94af8 Mon Sep 17 00:00:00 2001
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
+index 07af1867..ea2e591b 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index fb77754965..34c3e2eb5e 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58470.patch \
+           file://CVE-2026-58470-regression.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.35.6


