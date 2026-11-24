Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14770.1795513788957387537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Eim4pEWA;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1068; q=dns/txt;
  s=iport01; t=1795513789; x=1796723389;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D/pVGZFDjDBoTEEvFFPR2+IiiMXadhK+m0P/RUk8hTE=;
  b=Eim4pEWA0ARChpRL4F7OWgSzLFCvJwGo3Mj5ViZ7zUKQcaLkk2YarVLX
   o1sODuMf0EVr55k6PrA1ujHuO/WL/yxhuWypFV4g/3BQs1ITDav4vOHxZ
   wCIXeachaGkFW/v1hNp66NgnrOhFBF63JNlM9J2hyB1LQkrkSsxlnm/5s
   sM2XzF/Rbn4ZT3tAAJ8CDbP96hw7AnJeLtGAUren7xWqNpXXEMzT6P9PQ
   r18EUefE7CeBslu3i7skeCAGcufI1BDKlGqcyTgCMr5oA/ZmJL1PLwow6
   94pkPvUQ3gvg0Re4UpKhH6q8gMk20jU5FdeiPidfNKoev/WyzzUdr9RaU
   A==;
X-CSE-ConnectionGUID: CWW3HWT+QXWpxqcDvDAQCQ==
X-CSE-MsgGUID: Cvaj7A1NTJ+B9ONaYgs9IA==
X-IPAS-Result: =?us-ascii?q?A0BAAgBZWwVr/9JK/pBaglmCV3VgQ0kDlCegTYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDZBLARgBXVxEgwIBgnQDEbpkgiyBAYMpAT8CQ1DbMwELFAGBOIVCiCR1A?=
 =?us-ascii?q?YR9JxsbgXKBFYNqgQWBXAICGIIThXkEgiKBDI5rihpIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgxqBDiwEgWhAk?=
 =?us-ascii?q?xGSZKERCiiDeYwklToaM6pyC5h9jgqVaGmEaoFoPIFZcBWDIglKGQ+OOYNrh?=
 =?us-ascii?q?RPJSCYyAgwvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:SQ6VyqioqCAmyJlHjBMWMdRcX161NBEKZh0ujC45NGQN5FlHY01je
 htvDWHQbP7fMWH1KNwiOYTi8hkBvJ6GztZrSQU9qC42FCNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUzxdksIV5yt
 sUoFygddxuvmc6f+ZmCH7wEasQLdKEHPasWt2slyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKLIYDXHp0Jzi50o
 Ert4W37XThDEuC9ihDU1VSlt+DUzALSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:MB3ejqhYbyOGexd7IYprEqi7o3BQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:PCv2s25nEIbEenOMV9ss33ErQeAaTj7k/EjIM1azJXhFYYS+cArF
X-Talos-MUID: =?us-ascii?q?9a23=3AjHnYKQ164wDI3J+QNG2pUSiK/zUjyLqnCh8kyLM?=
 =?us-ascii?q?6mYquZAtWMgaSl2WWa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="63453048"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:45 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 149E818000121
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:45 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id BF271CC2EFA; Tue, 24 Nov 2026 01:49:43 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH] zlib: Ignore CVE-2026-76844
Date: Tue, 24 Nov 2026 01:49:43 -0800
Message-Id: <20261124094943.1560218-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250997
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- The corrected CVE record identifies webpack-dev-middleware [1].
- Its affected product and source fix are unrelated to zlib [2].
- Hence ignoring the CVE for zlib with a cpe-incorrect annotation.

Tested with bitbake zlib zlib-native.

Reference:
[1] https://www.cve.org/CVERecord?id=CVE-2026-76844
[2] https://github.com/webpack/webpack-dev-middleware/security/advisories/GHSA-g84c-rxfj-3j2c

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-core/zlib/zlib_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
index 8a23d98c..3792af55 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -50,3 +50,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
+
+CVE_STATUS[CVE-2026-76844] = "cpe-incorrect: Applies to webpack-dev-middleware, not zlib"
-- 
2.35.6

