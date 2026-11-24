Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24224.1795540594810078717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HOOBR2DY;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5319; q=dns/txt;
  s=iport01; t=1795540594; x=1796750194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VIwSFW/TzSJk7JSiADeDDCuzO0GSy1/4Jj9ukEnwUPs=;
  b=HOOBR2DYPi3A0XZe8spcQLlv/o0oAV66DFoQ2on05UNigfEQEwqD2F8E
   cuI91pJbE9XYjvmb/GS1zj3RhZ4a2MBP7Pz8izeMbxT5xrCXP7+H2k9J6
   256RFemG3O04RC9kcDXzkwZETLBLcTcwio1Iy2htL95g+ECGhEL4RdobU
   xdXreXBII18to3S9b2KH0SuOREcj0AZjCoFsuL28Bx+gxgc23UJXRRxfU
   77Ub1FkEZ6Mh2tbwKrE9hSCNiTtF+ZS0Mw6SpCSzfzkRj3So5AABMA919
   hOceyG/UBXP2Pk8Il2F+9vSOfYSg2Bnm3rxeqrBVD01KvGgIdufQakEnj
   g==;
X-CSE-ConnectionGUID: Sg/SkB4fT9enpNH+B+vkyQ==
X-CSE-MsgGUID: OkxYNiE6RMO9tZ8VUsXfeQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgD+xAVr/9RK/pBaglmCV3VgQ0kDlkieLBSBYAoPA?=
 =?us-ascii?q?QEBDy4WDQQBAYQ/Ro4kAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBBCYLARgBLSwDAQIWQAQjIYMCAYJ0AxG6Ghs3gXkzg?=
 =?us-ascii?q?QGDKQGBVNszAQsUAYE4hUKIJV0YAYR+JxsbgXKEf4EFgVwBAYEZDniGBwSCI?=
 =?us-ascii?q?oEMgVQeZIwVAoFPiE5IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QB?=
 =?us-ascii?q?hYhCyIYDUgRLDcVGQQ+bgeUGIMaAX4PAStwZFijVIIhoREKKIN5jCSNPod8G?=
 =?us-ascii?q?jOqcguYfY4KFpY7hGqBaDyBWXAVgm4BMwlKGQ+OLQwLg2DOWyYyAgkDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:AoKhb6gbu2+CqAcMGbRn3tWqX161NBEKZh0ujC45NGQN5FlHY01je
 htvWm7SMqqDamL3fdpzao7kpEhSvZbSzNY2SFZoqSBmEChjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUj9aFMAksS+
 8BJJTYVSDDAraGow6OCH7wEasQLdKEHPasWt2slyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYD/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKLIIzXG5QLzi50o
 Erh/HTIJBA3aua67muZwCKSu/T/ky7CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:bJIqK65Tb0dzZ3dLuAPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:qlgBSW/l0mv72jiqmtWVv3UbXfsmWCHT8CbdJVeeKSVDC6OWWGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ALEZn1Q8x8ekoI3+NJVsmI0OQf+Br85WICW1Tq7A?=
 =?us-ascii?q?h6tW2ZRJNIAeTgQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,231,1787011200"; 
   d="scan'208";a="62856968"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 17:16:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 274ED180001DE;
	Tue, 24 Nov 2026 17:16:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CF8E0CC1611; Tue, 24 Nov 2026 09:16:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 3/3] expat: fix CVE-2026-118370
Date: Tue, 24 Nov 2026 09:16:28 -0800
Message-Id: <20261124171628.1617804-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251050
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream prefix and attribute-index fixes [1,2]
identified by the release announcement [3]. Use size_t for storeAtts
bookkeeping and reject values that cannot be represented by the
existing public int attribute-count interfaces.

[1] https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86bc91d6ddb048481c04c
[2] https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860f39501c7979f6750ae
[3] https://www.openwall.com/lists/oss-security/2026/11/02/6

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Drop the tokenizer-count patch (_p3) and its SRC_URI entry.
---
 .../expat/expat/CVE-2026-118370_p1.patch      | 29 ++++++++++
 .../expat/expat/CVE-2026-118370_p2.patch      | 58 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  2 +
 3 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370_p2.patch

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
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index b6911e79de..410aa7fb5e 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -27,6 +27,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2 \
            file://CVE-2026-113351_p5.patch \
            file://CVE-2026-117610_p1.patch \
            file://CVE-2026-117610_p2.patch \
+           file://CVE-2026-118370_p1.patch \
+           file://CVE-2026-118370_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6
