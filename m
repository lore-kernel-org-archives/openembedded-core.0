Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14021.1795509646710928550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hvouhQTC;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2809; q=dns/txt;
  s=iport01; t=1795509647; x=1796719247;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=shJc5PNKisol5DQwqnUAyQ8t+vD/nFqJKr7gFluW+40=;
  b=hvouhQTCxL+awUoUPYVOGtEXirN/Jf53HGmn4Mpje1SuiHVnpyMtUsyr
   YJm+F/yDbDHhyYVsBHXvUW1FJceeHZvWaoGNQ750WRN7WU4irwL3MC9qh
   11QMErfNzsQdnfT8Nw/xr3LbpAj9RZfSmMjP+uqhG6vbHoyBj4305r2Gk
   Nd7aGpuLkbdOZkmRYZQh1jiGuj5E41JNn5+Yjg+edpsp0UWz3n+QUkGs8
   MCDDXUYbxS3UP+47HJtLbeODE1lnm/iBKFMoJX1Qo9F2IJp150x1f0CPT
   7G0My8roEX6YsdoleG5PtgBtpum06gQEIohesw0NWmv6clWl5To4YfCMS
   Q==;
X-CSE-ConnectionGUID: rCeNl5d1SpyxHvyudYuWVQ==
X-CSE-MsgGUID: hXDRoY4tQ0mxgrCaR5MWQQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgCTSwVr/9RK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAVYcAwECLysjCBmDAgGCdAIBEboZGzeBeTOBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVg2qBBYFcAoEnEXWFeQSCIoEMg?=
 =?us-ascii?q?VQYBox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELG?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QUgxp7EwEqASCCDJM3AZAcgiGhEQoog3mMJJU6GjOFW?=
 =?us-ascii?q?6UXC5h9jgqVYwVphGqBaDyBWXAVgyIJShkPji4LC4NghAfKVCM1CwMvAQEHA?=
 =?us-ascii?q?gcOAwuBaIRhix8BJwSBUgEB?=
IronPort-Data: A9a23:Xq8IiaJr5N5aueFIFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS1jdTx
 2sZXDzTPqyDa2vyL4x+O97loRxU6pbdx4M1SgQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10J0wQOdAUo91vEHFu6
 +0FJAEQUS660rfeLLKTEoGAh+wqIdOuOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NnwsYDUXUrsTIJslhO6yg3DlWzZZs1mS46Ew5gA/ySQviue9a4qEK7RmQ+1Vrmqio
 VOa412hBwEVLveW82egzUuV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIk/OS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:dnMSqqEGI+lloFcWpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3Aka08vGujm9CXGlfrs2skKwf16Is/WXD7yCrcenS?=
 =?us-ascii?q?gGHZJVqyIRW6Nx51dxp8=3D?=
X-Talos-MUID: 9a23:+757YwhKUEwjMkZnk9gZ08MpNPdE2aOfVFw0yZAWtNOvPBYtHgiktWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62783899"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:44 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 47854180007DD
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:44 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 78C55CBF22E; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 6/8] cups: Fix CVE-2026-107890
Date: Tue, 24 Nov 2026 00:40:31 -0800
Message-Id: <20261124084033.72286-7-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250974
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-107890 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/f3fb41912e4e29dbbbe7c4afd4fe48508af21bc0
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-wjc4-qhjr-5m5x

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index a28080f053..2b8f96b189 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -37,6 +37,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-55480.patch \
            file://CVE-2026-61702.patch \
            file://CVE-2026-107888.patch \
+           file://CVE-2026-107890.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107890.patch b/meta/recipes-extended/cups/cups/CVE-2026-107890.patch
new file mode 100644
index 0000000000..2e7d8433d2
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107890.patch
@@ -0,0 +1,41 @@
+From bb1e6f1be6c2d73b26c2334e4dae73390cd31e52 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Thu, 1 Oct 2026 17:19:28 -0400
+Subject: [PATCH] Filter out group separators in job creation requests
+ (GHSA-wjc4-qhjr-5m5x)
+
+CVE: CVE-2026-107890
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/f3fb41912e4e29dbbbe7c4afd4fe48508af21bc0]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      | 2 ++
+ scheduler/ipp.c | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 833021a203..580b557b44 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -11,6 +11,8 @@ Changes in CUPS v2.4.11 (2024-09-30)
+   mode.
+ - SECURITY-4.1: Held jobs for temporary print queues could crash the scheduler
+   (GHSA-qqm8-4q5h-jg55)
++- SECURITY-3.3: The scheduler did not filter out group separators from job
++  submissions (GHSA-wjc4-qhjr-5m5x)
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 6a62382cd5..239454f069 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -2112,7 +2112,7 @@ add_job_subscriptions(
+   {
+     next = attr->next;
+ 
+-    if (attr->group_tag == IPP_TAG_SUBSCRIPTION ||
++    if (!attr->name || attr->group_tag == IPP_TAG_SUBSCRIPTION ||
+         attr->group_tag == IPP_TAG_ZERO)
+     {
+      /*
-- 
2.35.6

