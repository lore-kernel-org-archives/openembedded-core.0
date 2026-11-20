Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3711.1795172268930103159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hZeSV79I;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2658; q=dns/txt;
  s=iport01; t=1795172269; x=1796381869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HRaFNy7fdRl2Jo9VioG0fI7AXGcfV/dN03+hvIINcns=;
  b=hZeSV79IJ4l9Hn7bNyPnA0f4geSKkKKkLj7oNpn8SlghOfZlDqwprxWc
   2EXgdxwwV5/RDmynKj0HPq4AvBzW6C6B86fpTQIL6I1CjarWwo53wlR3r
   +iL9oISQ8xjS/IZLTriaWpQJogT0o96TZtz5dhiB7tFfLV2JwpKcFmPMj
   VmKZBpekyhZ14PtEIZhmKBQ2h3xIMFjeq7WvuuxDhXzmgRa2oENyv8MtD
   dsbi4kI5B7xu6PyNDCUcsokyxz5JwqK9cVFY8ufq5XPRfSlOK6MvC4SiS
   +ApqDzYAllHX7CXTZx7EM+BKdFbWbjHVPOg8wWLffjhzuyt9RN9KrrfUC
   A==;
X-CSE-ConnectionGUID: u5E/X1HaStGDQif+exqU8A==
X-CSE-MsgGUID: hHHFo8BfRL6S5hwreFNQtw==
X-IPAS-Result: =?us-ascii?q?A0BHAgDrJQBr/9NK/pBaglmCV3VhQkkDlkgDnimBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwFGEBwDAQIvKyMIGYMCAYJ0AgERuCQbN4F5M4EBh?=
 =?us-ascii?q?H7bMwELFAEFgTOFQogkXRgBhH0nGxuBcoEVg2qBBYFcAoEngQaFeQSCIoEMg?=
 =?us-ascii?q?VQYBox5AoFPiCZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeTbIMSB4EOASsgggwcoziCIaERCiiDeYwklToaM4VbpRcLm?=
 =?us-ascii?q?H2OCpVjboRqgWg8gVlwFYMiCUoZD44uCwuDYIQHylQjNQsDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQACyBUgEB?=
IronPort-Data: A9a23:/BCdO6gPGdsBLoF8r8u2/sr+X161NBEKZh0ujC45NGQN5FlHY01je
 htvC2/Vbv6Damr0edt3Pdzn8k8FvsWHz9ZkQAs/rHthRCJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8UoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUFp8swMThu/
 McEBxw0bx7AivKv/eKSH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKIK4LSGZ4Fzi50o
 ErG30TXBUEwOua7lwHY8m22i8HppD/kDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:yTbj26oc4zpKCcOE1q0JkLwaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:bwNX5mNN7j5R4O5DRXRKs35NOskeblLx9XbeYEKoEFs5YejA
X-Talos-MUID: 9a23:z8HFIgj+Ean+3eKaZlrcacMpNOdIzaP+Ik43tcs95smbLyFeHQ6Bk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59604388"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:46 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id A474F18000B6C;
	Fri, 20 Nov 2026 10:57:46 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id D33AECBF22E; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 6/8] cups: Fix CVE-2026-107890
Date: Fri, 20 Nov 2026 02:57:18 -0800
Message-Id: <20261120105720.2197092-7-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120105720.2197092-1-asparmar@cisco.com>
References: <20261120105720.2197092-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250771
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/f3fb41912e4e29dbbbe7c4afd4fe48508af21bc0
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-wjc4-qhjr-5m5x

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2b63c448c6..6605236049 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -30,6 +30,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-55480.patch \
            file://CVE-2026-61702.patch \
            file://CVE-2026-107888.patch \
+           file://CVE-2026-107890.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107890.patch b/meta/recipes-extended/cups/cups/CVE-2026-107890.patch
new file mode 100644
index 0000000000..df6d8b227a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107890.patch
@@ -0,0 +1,44 @@
+From 0179c09faa71c08e355352d3024ce021fc6f1803 Mon Sep 17 00:00:00 2001
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
+index cbea543e..cbeaf841 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -7,6 +7,8 @@ Changes in CUPS v2.4.16 (2025-12-04)
+ 
+ - SECURITY-4.1: Held jobs for temporary print queues could crash the scheduler
+   (GHSA-qqm8-4q5h-jg55)
++- SECURITY-3.3: The scheduler did not filter out group separators from job
++  submissions (GHSA-wjc4-qhjr-5m5x)
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+ - Fixed cupsd crash if user does not exist (Issue #1555)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 0e44ec46..8ea32d4b 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -2124,7 +2124,7 @@ add_job_subscriptions(
+   {
+     next = attr->next;
+ 
+-    if (attr->group_tag == IPP_TAG_SUBSCRIPTION ||
++    if (!attr->name || attr->group_tag == IPP_TAG_SUBSCRIPTION ||
+         attr->group_tag == IPP_TAG_ZERO)
+     {
+      /*
+-- 
+2.35.6
+
-- 
2.35.6

