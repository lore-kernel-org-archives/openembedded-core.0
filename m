Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFEEC44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:08:40 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12265.1783688910923776748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=StxFEJCq;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2558; q=dns/txt;
  s=iport01; t=1783688910; x=1784898510;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9TfTS0XlbMDKUa0kTF1pQ1DM4WlhVto93lIqGvP4AuY=;
  b=StxFEJCqaR9TB1M/+jHHyHb8sOxeoLK8xFP9/hwZkS6KGZXyBwFez/rB
   EC3wNpeONKdfc5xZ53AiaM71xqalem1Em0KzFnafN10SxOSvigIKZYfRE
   hWGhPB0Jc883pzoYGxAflmUirZXLHaGCwpd7fn4C90ZotlFFw6PVKSP0F
   p7ykqg/erljVlvkqqakncF1QUX88ZpY0WIjvbfAacaQ7jG35lso1ng28G
   jxwW/Z7O0ee465m0zRKya8s2DGaOXOQwjJY/CMJBbv2P4Yht5rhDpw1GL
   opy8ohfjYZpML2YBTiwOkKGrcZnEW3OFwXCpW/sTOfkZwy2vGeeElcmwV
   g==;
X-CSE-ConnectionGUID: WYSv+KBUQPCWx5suCCk7VA==
X-CSE-MsgGUID: FT2LT9IqSv6hHyyt/hnOQg==
X-IPAS-Result: =?us-ascii?q?A0BDAgA+7VBq/5T/Ja1aglmCV3RfQkmUKaA/gX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD+OFQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZaATgBGAFZAwECWiMhgwIBgnMCARG5TRo3giyBAYMoAT8CQ1DbLgELF?=
 =?us-ascii?q?AGBOIU/iB9bGAGEfCcbG4FygRWDaYEFgVwBAYIthXgEgiKBDIFaHoUHimtIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYFZgQKEeSMfAzl/g?=
 =?us-ascii?q?TB1SnktcxIeCoFSghZUAwsYDUgRLDcUGwQ+bgeNPhcPgj4xXSyBQ0GmHqEPC?=
 =?us-ascii?q?iiDdYwhlToaM6psC5h9jgqWUIRpgWg8gSgBGgQLB3AVgm4BMwlKGQ+OOINrg?=
 =?us-ascii?q?X/MWyQ1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:Qt/1WaoOSVXDB2MKiB7Aazo7+WleBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnSaaqLNmvxL4ogb4m0p09U7ZLTm9E1SFZkqXo0Fn5B8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8EM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tlGOn8N1
 tYlEQgmUQDenP+d67HkdMA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHZoEwhfJ/
 DiuE2LRLC1AEODO6CO+7Cyspv7egWT7XqUrG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:WYQvX62zUXXSMO5RNnM8hwqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoWpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:F/7iaGEMWDetjZtUqmJYxXUKWeMPT0Tl50jAflSlIk1qF4O8HAo=
X-Talos-MUID: 9a23:gEWZyQTAUNUuLZHjRXTCuGtGCJZJ+p+wVkAtgIQa/MmCEhV/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507949922"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:08:30 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 011E718000153
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:30 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id A371ECC2EC3; Fri, 10 Jul 2026 06:08:29 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 02/10] expat: fix CVE-2026-56408
Date: Fri, 10 Jul 2026 06:08:23 -0700
Message-ID: <20260710130824.2819975-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240642

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].
The fix is adapted to the existing Expat 2.7.5 copyString implementation.

[1] https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56408

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
new file mode 100644
index 0000000000..b8c43636cc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
@@ -0,0 +1,36 @@
+From b0cf9e9b0f5dfdd938148931a4605a0fd6b917a7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 23 Apr 2026 10:31:45 +0200
+Subject: [PATCH] lib: Waterproof `copyString` from integer overflow
+
+CVE: CVE-2026-56408
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
+
+Backport Changes:
+- Adapt the fix to Expat 2.7.5, which calculates charsRequired using
+  an existing loop instead of xcslen. The upstream string helper
+  refactoring is not required for the overflow guard.
+
+(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index e441ff7f..4ff5e33b 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -8505,6 +8505,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
+   /* Include the terminator */
+   charsRequired++;
+ 
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   /* Now allocate space for the copy */
+   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index a0c28d162c..267e7db35b 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
+           file://CVE-2026-56408.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


