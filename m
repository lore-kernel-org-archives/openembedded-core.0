Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30267.1793870243403185830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D4Oozzf+;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9428; q=dns/txt;
  s=iport01; t=1793870243; x=1795079843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtRzmsnrTPd+E3ZHttimD5e2e8+G0whNFkBTPkrM2hI=;
  b=D4Oozzf+m8j/uxVa0axmabqIpoGDizrAPS98tR+ii3hIuTFznkcoXWqX
   yM4LOMMvGVb+U7U8hqEO6557B4UZasJYkWAOooMYyXlhRmTsneK5Ig5Mk
   6zgTgiJQEelw7H18YGXTEFdZhUmze3twgsRlectTHzMfyjtb6zuim94M/
   hFDpuLKXDvzLZlhIHV8C1vbFm8tAX3nq5aFZ0KED2Fm1GKCbREweF3V8N
   I5GwQ8t426FHe1Bvu0hPwgXabEvFmYDRV963+PWxIm5F5AH/E4fyftgvB
   eAtCPa4ZM01PkjJr280iUU2xSng6wh5VgaopseyTFOLuEit2NC0tbHjA1
   g==;
X-CSE-ConnectionGUID: o/KbutR2RVSu4mhWo//dbA==
X-CSE-MsgGUID: srwzds91Q1SOsqunmHY6Ew==
X-IPAS-Result: =?us-ascii?q?A0BLAgCwSOxq/5T/Ja1aglmCV3VgQ0kDlkgDniEUgWoPA?=
 =?us-ascii?q?QEBDy4WDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMBJgsBGAEtEBwDAQIWGScEIwgZgwIBgnQDEbt2G?=
 =?us-ascii?q?zeBeTOBAYMpAYFU2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoR+gQWBXAEBgRkOe?=
 =?us-ascii?q?IYHBIIigQyBWh5ljBUCgVKGcUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeSL4MRAX4PASsgUCEyEVgkozGCIaERCiiDeIwkjT6HfBozqnELm?=
 =?us-ascii?q?H2OChaVbk2EaYFoPIFZcBWCbgEzCUoZD44tDAuDYM5NJjICCQMvAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:fnBaV6I0uHSf+RgOFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS02QEn
 zFLXmuDbPmNZTChfNkka4mw9RsFu5HRn4IxSwAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1pS2I8IJEioNxJOnwS8
 PwnL3dKYhqq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeS2b4KNK4LSLSlTtl2Cu
 XDK5DWgO0ghE8eG1DyA0kPyq/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:ERs1/KHWtJc++QybpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:fOma5GMB/2BCee5DX25E/lMIIJofTEbAkHLQHEj/TmpjYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AgDpF5Q590W6zLNXVosSto4Otxoxz+bu8BFtcyKx?=
 =?us-ascii?q?fgO6fLDF2Phes0hmoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="543700960"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:17:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 2881818000263;
	Thu,  5 Nov 2026 09:17:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C7971CBF202; Thu,  5 Nov 2026 01:17:21 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/3] expat: fix CVE-2026-118370
Date: Thu,  5 Nov 2026 01:17:19 -0800
Message-Id: <20261105091719.1622520-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105091719.1622520-1-dkelaiya@cisco.com>
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 09:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249522
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream prefix and attribute-index fixes [1,2]
identified by the release announcement [3]. Use size_t for storeAtts
bookkeeping and reject values that cannot be represented by the
existing public int attribute-count interfaces.

Include the related tokenizer-count correction [4] so XmlGetAttributes
and getAtts do not overflow a signed count or narrow the available
attribute capacity before the storeAtts checks. This closes the same
large-attribute data path; it corrects a pre-existing issue rather than
a regression introduced by the first two fixes. Preserve Expat 2.8.3's
PTRCALL annotations on the tokenizer callback and implementation.

Validated with the full native unit suite, inline undefined-behavior
traps and an arithmetic boundary model. A multi-gigabyte attribute
payload and BitBake were not run.

[1] https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86bc91d6ddb048481c04c
[2] https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860f39501c7979f6750ae
[3] https://www.openwall.com/lists/oss-security/2026/11/02/6
[4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f46280d5982f50f2cf

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/expat/CVE-2026-118370_p1.patch      | 29 +++++++
 .../expat/expat/CVE-2026-118370_p2.patch      | 58 ++++++++++++++
 .../expat/expat/CVE-2026-118370_p3.patch      | 77 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  3 +
 4 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p3.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-118370_p1.patch
new file mode 100644
index 0000000000..0b2e5f48d6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-118370_p1.patch
@@ -0,0 +1,29 @@
+From 621cb2c78b253ee023a86bc91d6ddb048481c04c Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 27 Oct 2026 17:57:19 +0100
+Subject: [PATCH] lib: Protect `nPrefixes` in `storeAtts` from signed integer
+ overflow
+
+.. by migrating to `size_t`
+
+CVE: CVE-2026-118370
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86bc91d6ddb048481c04c]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b17f5e0..6fdfbc8 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3871,7 +3871,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+   int attIndex = 0;
+   XML_Char *uri;
+-  int nPrefixes = 0;
++  size_t nPrefixes = 0;
+   BINDING *binding;
+   const XML_Char *localPart;
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-118370_p2.patch
new file mode 100644
index 0000000000..0015f4f1cd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-118370_p2.patch
@@ -0,0 +1,58 @@
+From 1bac53c4fc460a03cd9860f39501c7979f6750ae Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 27 Oct 2026 15:20:33 +0100
+Subject: [PATCH] lib: Protect `attIndex` in `storeAtts` from signed integer
+ overflow
+
+.. by migrating to `size_t`
+
+CVE: CVE-2026-118370
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860f39501c7979f6750ae]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 6fdfbc8..6c97639 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3869,7 +3869,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+           TAG_NAME *tagNamePtr, BINDING **bindingsPtr,
+           enum XML_Account account) {
+   DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+-  int attIndex = 0;
++  size_t attIndex = 0;
+   XML_Char *uri;
+   size_t nPrefixes = 0;
+   BINDING *binding;
+@@ -4048,11 +4048,16 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   }
+ 
+   /* set-up for XML_GetSpecifiedAttributeCount and XML_GetIdAttributeIndex */
+-  parser->m_nSpecifiedAtts = attIndex;
++  // Detect and reject integer overflow
++  if (attIndex > INT_MAX)
++    return XML_ERROR_NO_MEMORY;
++  parser->m_nSpecifiedAtts = (int)attIndex;
+   if (elementType->idAtt && (elementType->idAtt->name)[-1]) {
+-    for (int i = 0; i < attIndex; i += 2)
++    for (size_t i = 0; i < attIndex; i += 2)
+       if (appAtts[i] == elementType->idAtt->name) {
+-        parser->m_idAttIndex = i;
++        if (i > INT_MAX)
++          return XML_ERROR_NO_MEMORY;
++        parser->m_idAttIndex = (int)i;
+         break;
+       }
+   } else
+@@ -4085,7 +4090,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+ 
+   /* expand prefixed attribute names, check for duplicates,
+      and clear flags that say whether attributes were specified */
+-  int i = 0;
++  size_t i = 0;
+   if (nPrefixes) {
+     unsigned int j; /* hash table index */
+     unsigned long version = parser->m_nsAttsVersion;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-118370_p3.patch
new file mode 100644
index 0000000000..2ad72abee6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-118370_p3.patch
@@ -0,0 +1,77 @@
+From c67cbc6185d1b494f521f2f46280d5982f50f2cf Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 30 Oct 2026 18:37:11 +0100
+Subject: [PATCH] lib: Fix integer truncation in `XmlGetAttributes`/`getAtts`
+
+CVE: CVE-2026-118370
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f46280d5982f50f2cf]
+
+Backport Changes:
+- Retain PTRCALL on the getAtts callback and implementation for Expat
+  2.8.3 calling-convention compatibility, and align the callback
+  continuation with the retained annotation.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c    | 5 ++---
+ lib/xmltok.h      | 4 ++--
+ lib/xmltok_impl.c | 6 +++---
+ 3 files changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 6c97639..2a4e47b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3898,8 +3898,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     return XML_ERROR_NO_MEMORY;
+ 
+   /* get the attributes from the tokenizer */
+-  size_t n = (size_t)XmlGetAttributes(enc, attStr, (int)parser->m_attsSize,
+-                                      parser->m_atts);
++  size_t n = XmlGetAttributes(enc, attStr, parser->m_attsSize, parser->m_atts);
+ 
+   /* Detect and prevent integer overflow */
+   if (n > SIZE_MAX - nDefaultAtts) {
+@@ -3949,7 +3948,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+       /* Detect and prevent integer overflow. */
+       if (n > (size_t)INT_MAX)
+         return XML_ERROR_NO_MEMORY;
+-      XmlGetAttributes(enc, attStr, (int)n, parser->m_atts);
++      XmlGetAttributes(enc, attStr, n, parser->m_atts);
+     }
+   }
+ 
+diff --git a/lib/xmltok.h b/lib/xmltok.h
+index bd868b8..4be6fdc 100644
+--- a/lib/xmltok.h
++++ b/lib/xmltok.h
+@@ -180,8 +180,8 @@ struct encoding {
+                                  const char *);
+   int(PTRFASTCALL *nameLength)(const ENCODING *, const char *);
+   const char *(PTRFASTCALL *skipS)(const ENCODING *, const char *);
+-  int(PTRCALL *getAtts)(const ENCODING *enc, const char *ptr, int attsMax,
+-                        ATTRIBUTE *atts);
++  size_t(PTRCALL *getAtts)(const ENCODING *enc, const char *ptr, size_t attsMax,
++                           ATTRIBUTE *atts);
+   int(PTRFASTCALL *charRefNumber)(const ENCODING *enc, const char *ptr);
+   int(PTRCALL *predefinedEntityName)(const ENCODING *, const char *,
+                                      const char *);
+diff --git a/lib/xmltok_impl.c b/lib/xmltok_impl.c
+index 2719e06..3955285 100644
+--- a/lib/xmltok_impl.c
++++ b/lib/xmltok_impl.c
+@@ -1504,11 +1504,11 @@ PREFIX(isPublicId)(const ENCODING *enc, const char *ptr, const char *end,
+    first attsMax attributes are stored in atts.
+ */
+ 
+-static int PTRCALL
+-PREFIX(getAtts)(const ENCODING *enc, const char *ptr, int attsMax,
++static size_t PTRCALL
++PREFIX(getAtts)(const ENCODING *enc, const char *ptr, size_t attsMax,
+                 ATTRIBUTE *atts) {
+   enum { other, inName, inValue } state = inName;
+-  int nAtts = 0;
++  size_t nAtts = 0;
+   int open = 0; /* defined when state == inValue;
+                    initialization just to shut up compilers */
+ 
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index b6911e79de..89ec156e92 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -27,6 +27,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2 \
            file://CVE-2026-113351_p5.patch \
            file://CVE-2026-117610_p1.patch \
            file://CVE-2026-117610_p2.patch \
+           file://CVE-2026-118370_p1.patch \
+           file://CVE-2026-118370_p2.patch \
+           file://CVE-2026-118370_p3.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6

