Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3160.1795169855020109014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P+wRo+zV;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2825; q=dns/txt;
  s=iport01; t=1795169855; x=1796379455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QSWB22vs1lm/xRKn+QLkGt37GT70SddyheAk1/7fJio=;
  b=P+wRo+zVx9v0hdzZyiIdjqIkTcLyEA0VCaic+PEXQcE58GPr0kR5SwWA
   6NUyteeqlml8Q8ovgXTNxF5jk0ArlzqOl0Ov5UGxy+gqN2UNQFWLIPMPu
   j2ax1oN/kSQn3cgjVCP1oQsK91w7w0uC8a09fROnn4c+cUTadKA1+yxF4
   cxzcxqN11igkWBRSPjxXKeL7qi9ogXcn6ygomixt6rlSnUS/pr0W2f49y
   Ypba4gYw0Gfa5VlgXk8xjDWS6LNyAwwC37PDnbrKC4lLONY9JrB8ry2ST
   oefL/NBIJ4F+bZwz3amwV/Lxyw9PQudyQs/+ZkSPTxB5uWNgjYMdlZ4Pn
   A==;
X-CSE-ConnectionGUID: b+OeWOoaTbq68jfd6kdelA==
X-CSE-MsgGUID: 9Na2g6k8QEC9X47e3YVdmA==
X-IPAS-Result: =?us-ascii?q?A0BFAgBmHQBr/9VK/pBaglmCV3VhQkkDlkieLIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFjiMCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgE1ARgBLSwDAQJaIyGDAgGCdAIBEbkEgiyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?wELFAEFgTOFQogkXRgBhH0nGxuBcoEVg2qBBYFcAQGBJ4EGhXkEgiJ6EoFUH?=
 =?us-ascii?q?ox5AoFPiCZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeTbIMZgQ4BKAECUIFckyWSUKERCiiDeYwklToaM4VbpRcLmH2OC?=
 =?us-ascii?q?pV0XYRqgWg8gUcLB3AVgyIJShkPjjmDa4F/g2XIdyM1AgkDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIF+AQE?=
IronPort-Data: A9a23:RXN+IKLWjaXSSNGQFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS3zJRy
 mFNX2qFP/+LM2v8eNsgPoiw8k8OsJTWyoBhG1cd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQsazt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1kT2Y7Aqof89p9GD8e9
 /IUdjMBYxSq0rfeLLKTEoGAh+wqIdOuOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2N3wsYDUXUrsTIJslhO6yg3DlWzZZs1mS46Ew5gA/ySQsgea1aYuKILRmQ+0EuE/Cq
 TzFr13UKUAqaIOSkgu7/neF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:BGTpK6+bd4OLgxtlD2Buk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:+jqq32D3g3TMXyD6EyMk00MrPccsTnfEkifSLUPmCmpkTJTAHA==
X-Talos-MUID: 9a23:YuziGgaghEM8vuBT5hnl3j48N5dRzo//OBxSnM43hcWBHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59601972"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:17:32 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 7D54618000210;
	Fri, 20 Nov 2026 10:17:32 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 32E1CCC1634; Fri, 20 Nov 2026 02:17:31 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-Core][wrynose][PATCH] python3-lxml: Fix CVE-2026-49825
Date: Fri, 20 Nov 2026 02:17:22 -0800
Message-Id: <20261120101722.2134106-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250758
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/lxml/lxml/commit/5927a6d5e851845140975d99b65461e255caaab0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-49825

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python/python3-lxml/CVE-2026-49825.patch  | 42 +++++++++++++++++++
 .../python/python3-lxml_6.0.2.bb              |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-49825.patch

diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-49825.patch b/meta/recipes-devtools/python/python3-lxml/CVE-2026-49825.patch
new file mode 100644
index 0000000000..90652b0216
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-49825.patch
@@ -0,0 +1,42 @@
+From 7344b7424424b838ff177ba1ae87fb124f9dc140 Mon Sep 17 00:00:00 2001
+From: Stefan Behnel <stefan_ml@behnel.de>
+Date: Sun, 17 May 2026 21:42:51 +0200
+Subject: [PATCH] Add missing "xlink:href" to the known HTML link attributes.
+ Closes
+ https://github.com/fedora-python/lxml_html_clean/security/advisories/GHSA-4jhm-jv67-739f
+
+CVE: CVE-2026-49825
+Upstream-Status: Backport [https://github.com/lxml/lxml/commit/5927a6d5e851845140975d99b65461e255caaab0]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ src/lxml/html/defs.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxml/html/defs.py b/src/lxml/html/defs.py
+index b70b443..b1cefc7 100644
+--- a/src/lxml/html/defs.py
++++ b/src/lxml/html/defs.py
+@@ -24,7 +24,9 @@ link_attrs = frozenset([
+     # Not standard:
+     'dynsrc', 'lowsrc',
+     # HTML5 formaction
+-    'formaction'
++    'formaction',
++    # XLink as used by HTML5 (including embedded SVG/MathML)
++    'xlink:href',
+     ])
+ 
+ # Not in the HTML 4 spec:
+@@ -117,7 +119,7 @@ font_style_tags = frozenset([
+ frame_tags = frozenset([
+     'frameset', 'frame', 'noframes',
+     ])
+-    
++
+ html5_tags = frozenset([
+     'article', 'aside', 'audio', 'canvas', 'command', 'datalist',
+     'details', 'embed', 'figcaption', 'figure', 'footer', 'header',
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
index 75894460ec..863c187e1e 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
@@ -21,7 +21,8 @@ DEPENDS += "libxml2 libxslt"
 SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
 
 SRC_URI += "${PYPI_SRC_URI} \
-            file://CVE-2026-41066.patch"
+            file://CVE-2026-41066.patch \
+            file://CVE-2026-49825.patch"
 
 inherit pkgconfig pypi setuptools3
 
-- 
2.35.6

