Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A75AC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:13 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.709.1785477426986471433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TcH7s06L;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3275; q=dns/txt;
  s=iport01; t=1785477427; x=1786687027;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d1O5QhmuDGmiK7lQdVRswY+rfPyBk2Pc0vcHRHcEQ+U=;
  b=TcH7s06LJKy2a7YM2oVzOst6qi2P7Sza8rNRCLP6GGuCurPVV7+pIWCm
   CumjuKF3aaUOEsKgaEcIFX/6aWVNQ01zECx2BeY2KsOmdh42v+LJW6aRz
   4mrGvkWy7ObTL8zUOvL33qxn3C6KbRvjjBrwE6yga20JuR07UMhiKbRMs
   fVhAzoLLKlLthpkwu7JLmFnfyvmkyH4tqFEvH40iJRzWA5NO5gm+849Pc
   kcBlQ4HM3okMxN8nr/65E8R45hgsgsnIrUJgzMBDQqEoGL5IR8VfT96Nm
   UyVzERnfCOwUqpCi+er/ZSJ1GzkLbXxle77BPNyOypFVqLskkEXR8ajsU
   g==;
X-CSE-ConnectionGUID: /qjgLK/qRTieWhGFH2F0tQ==
X-CSE-MsgGUID: 4XQJjS1QRwWXPXdnpRVoOA==
X-IPAS-Result: =?us-ascii?q?A0BJAgD1N2xq/5H/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8gCyMIEQiDAgGCO?=
 =?us-ascii?q?gM3AxG6MBo3gXkzgQGDKAE/AkNQ2EkNglgBCxQBgTiFP4J9hSNcGAGEfCcbG?=
 =?us-ascii?q?4FyhH6BBYEaQgEBiCUEgiKBDIFaHoQrjBJIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBwWBHYErL4RTIxk2fIEvdUp1LWoSF4EagzECgl8DCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB41pIII+AT1RASuBQ6ZcoCFxCiiDdYwhjz6FfBozqmwLmH2OC?=
 =?us-ascii?q?oQJkkeEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8xDPDUCCTIBAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:B7475KL2nLksUy5BFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgjFRy
 jcWXW/Qb/6OY2CkKNEibd6x/EsCvZDTn4IwTwAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGUsajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0pFUM5Ga5f49xLAGxx9
 dM2CGojNgy60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeC3a4GMK4TULSlTthqon
 0DExD3AOA4lBOSvxTydyEyrocaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:DMeoQqlfgj6gvBwTsHB8KQnaPF7pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:PFv8QGPTfxLQ/u5DHzBl+2o3XdkfTnzQ83f/DW/iJz51cejA
X-Talos-MUID: =?us-ascii?q?9a23=3ALLxoLg5oxymyb+nXtB2HmZcYxow0052MCntUqK8?=
 =?us-ascii?q?ZhPm8BSB2Iw2jixOeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="502331906"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:57:06 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id B7FD3180001E4
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:05 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D1F00CBEFAA; Fri, 31 Jul 2026 11:27:03 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 09/10] expat: fix CVE-2026-56407
Date: Fri, 31 Jul 2026 11:26:24 +0530
Message-Id: <20260731055625.4187716-10-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242406

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56407

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patch.

 .../expat/expat/CVE-2026-56407.patch          | 41 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
new file mode 100644
index 0000000000..498f93d5b9
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
index fb36108eaf..2851c75297 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -72,6 +72,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
+           file://CVE-2026-56407.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


