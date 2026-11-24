Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14766.1795513778223554530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cSZmFVCA;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1272; q=dns/txt;
  s=iport01; t=1795513778; x=1796723378;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=i5Z1GRkWnd46PnaBiyT1YTSbjXVbv5NJQWzCuKbQhuE=;
  b=cSZmFVCAfM6g9hWzVwCpkzJ9NVSUASNLSDtvW3n6K/PkWu6n2BqTaB0I
   J/ZgBAxz/c5bpEsOMGM8ATXouenkT7wV5sYOikXrVEkcnD7ue8eHOQWXV
   QZgvresympl1lhqtcs+AnY/MsfWv4XsD85pH0lpWwV/EB6qfWJQFnEZHq
   obvlVA6xTJclwEX00cBefdbNWodG9KQpbNKGZF+10ActGn2xghv8LpmiR
   ceZl9yvjqRdCg5eLtMHOJRNjYxgyAYPvfZ+SldzVJKSNzj8Q/xwG6rDRJ
   M7GB1rGLFZpwnJsiYgDCPK3De2OkGbpJeV7J5pCn5zg+EfvC+gnnANZNg
   A==;
X-CSE-ConnectionGUID: tKVVwfdgSCipbMRNEu3QkA==
X-CSE-MsgGUID: oMacWjdiTyKH455n/ulxEg==
X-IPAS-Result: =?us-ascii?q?A0BFAgBOXQVr/9BK/pBaglmCV3VgQ0mUKoIknimBfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBGAE9IDErKxmDAgGCdAMRumKCLIEBgykBPwJDUNszA?=
 =?us-ascii?q?QsUAYE4hUKIJHUBhH0nGxuBcoQJdoEFgVwEGIIThXkEgiKBDI5rihpIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIA?=
 =?us-ascii?q?g0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB5QUg?=
 =?us-ascii?q?xqBDiwEgRdRpjWhEQoog3mMJJU6GjOqcguYfaNyaYRqgWg8gVlwFYMiCUoZD?=
 =?us-ascii?q?445iH7JSCYyAjsBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:wTWeIK+OkuV4pITKRo+hDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2UaUWyHOP/YMDGgc9xxPomz9R5Q7ZXVy4JmSVc9+StEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kqHrMm5eh7Dlpl9
 OQSDQorQw3YvuGflefTpulE3qzPLeHiMZlavjRryivUSK55B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YM3WjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCzaIaJI4DbHq25mG6fg
 2vNwGb1Ay0LF/zDlGeDtW+olsLAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:LzPPbKA5Cnftk23lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3A+gm8VGly9txxzkKnbTxZ8/tI55vXOWH+8knPLUO?=
 =?us-ascii?q?3Mk1oULewc3m95fhdkOM7zg=3D=3D?=
X-Talos-MUID: 9a23:UKnKLQZjziTjreBTsBrljw5gOMZU8oeOVB1Ql9Ibv9mpOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60441493"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:34 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 6346F18000248
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:34 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 1A6A8CC2EFA; Tue, 24 Nov 2026 01:49:33 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/2] zlib: Ignore CVE-2026-76844
Date: Tue, 24 Nov 2026 01:49:33 -0800
Message-Id: <20261124094933.1559995-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124094933.1559995-1-devanshp@cisco.com>
References: <20261124094933.1559995-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250995
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- The corrected CVE record identifies webpack-dev-middleware and its
  getFilenameFromUrl() path traversal, rather than zlib. [1]
- The package affected by this record is unrelated to zlib's gzip
  writer; the zlib writer defect is CVE-2026-85091. [2]
- Hence ignore this CVE for zlib using cpe-incorrect. This applies to
  the target, native and nativesdk variants of the recipe.

Reference:
[1] https://www.cve.org/CVERecord?id=CVE-2026-76844
[2] https://www.cve.org/CVERecord?id=CVE-2026-85091

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index bfcf8ea2..0c2b63c3 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -52,3 +52,6 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
 
 CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"
+
+# The corrected record describes webpack-dev-middleware, not zlib.
+CVE_STATUS[CVE-2026-76844] = "cpe-incorrect: CVE applies to webpack-dev-middleware, not zlib"
-- 
2.35.6

