Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3634.1795172267528297188
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eI3AZtlK;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2406; q=dns/txt;
  s=iport01; t=1795172267; x=1796381867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iAEU56JAeoG4JMHA1uFpal6CiTowBmepjlE6s18pj5Y=;
  b=eI3AZtlKzdamkbIAbyrD+TIl7u9JA7KsJvfpYWS2Q9n6MtIFDpi6Aev0
   ifz3QClx2aPMQXM/J7xKNKtKPT7HyXGUeGUJxeW0HQb20IU5kjHtRyvs6
   iXEiZTUnw0ovtRJh4sxqvJWe6n+yFhQvoJJrVOUSUKpCeV7Pcb3hHOMzG
   ZFvIbCrzxiA5nCMoWAISfbPE1uIuyiN7//L0P471gKdwPwSyWxi/8Vry0
   7OKgcMRgsiIIOSLhOATOP2wdiTFhIUs08692+bKhiAuVXHohgYWO60+9F
   1X/DZMDyr9sWhMgygB7bLb/ajt/1pRBhFAlzITtUdxbNyzGKo9sni+COM
   Q==;
X-CSE-ConnectionGUID: U7H1IIWtTLyxWFMrG760Nw==
X-CSE-MsgGUID: vm4XcTfrTruRpZKFDz5a8g==
X-IPAS-Result: =?us-ascii?q?A0BHAgBrJgBr/8xK/pBaglmCV3VhQkkDlkgDnimBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMyAUYQHAMBAi8rIwgZgwIBgnQCARG4Jhs3giyBAYR+2?=
 =?us-ascii?q?zMBCxQBBYEzhUKIJF0YAYR9JxsbgXKBFYNqgQWBXAKBJ4EGhXkEgiKBDIFUG?=
 =?us-ascii?q?AaMeQKBT4gmSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYNGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hk2yDGYEOLIFNX6V1oREKKIN5jCSVOhozhVulFwuYfY4KllGEa?=
 =?us-ascii?q?oFoPIFZcBWDIglKGQ+OOYNrhAfKVCM1CwMvAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:VYqMGqIe/OdxOctqFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENShDUEz
 GEcDWuAbvzfYmLzco0lYYu2oEwB75WGmIJmSwUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQsazt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1TU2FvHKwn5tpTEHFx2
 9kCB29TNjac0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MHwsYDUXUrsTIJslhO6yg3DlWzZZs1mS46Ew5gA/ySQviuiyYYqEILRmQ+1Lmxqor
 V7I5VjjHysCBv+x5SjY+yKj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:ACwbs6OEv7Vnh8BcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:CGqC6mOr0UOTm+5DZXZHrW81JdwZVmzN81n1OWDnVz5PV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AVEp+cw3Emg0TxUeT7o/gIndjvTUj/aHyOEsxn48?=
 =?us-ascii?q?6odS+LR5TFRuP0T3nTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62879892"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:45 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 1B6AB180006CB;
	Fri, 20 Nov 2026 10:57:45 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id BF3D4CC2EF1; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 1/8] cups: Fix CVE-2026-55453
Date: Fri, 20 Nov 2026 02:57:13 -0800
Message-Id: <20261120105720.2197092-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120105720.2197092-1-asparmar@cisco.com>
References: <20261120105720.2197092-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250763
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/d41cf0616688721e9d435d54118c4c8a36ed596a
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-7hqf-mfhx-7r3v

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 9f5d5fe726..c635e95015 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -25,6 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-41079.patch \
+           file://CVE-2026-55453.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-55453.patch b/meta/recipes-extended/cups/cups/CVE-2026-55453.patch
new file mode 100644
index 0000000000..f1cd486134
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-55453.patch
@@ -0,0 +1,45 @@
+From 38ca699a2c7e1884ba02f28968b5d47852beaeb1 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 12 Jun 2026 14:45:48 -0400
+Subject: [PATCH] Sanitize IPP attribute strings.
+
+CVE: CVE-2026-55453
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/d41cf0616688721e9d435d54118c4c8a36ed596a]
+
+Backport Changes:
+- Omit the CHANGES.md release-note hunk for the newer upstream release.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ backend/ipp.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/backend/ipp.c b/backend/ipp.c
+index 08a41efe..f1c1fa12 100644
+--- a/backend/ipp.c
++++ b/backend/ipp.c
+@@ -66,6 +66,7 @@ typedef struct _cups_monitor_s		/**** Monitoring data ****/
+ /*
+  * Globals...
+  */
++
+ #if defined(HAVE_GSSAPI) && defined(HAVE_XPC)
+ static pid_t		child_pid = 0;	/* Child process ID */
+ #endif /* HAVE_GSSAPI && HAVE_XPC */
+@@ -3125,7 +3126,12 @@ quote_string(const char *s,		/* I - String */
+         break;
+     }
+ 
+-    *qptr++ = *s++;
++    if ((*s & 255) < ' ' || *s == 127)
++      *qptr++ = ' ';
++    else
++      *qptr++ = *s;
++
++    s ++;
+   }
+ 
+   *qptr++ = '\"';
+-- 
+2.35.6
+
-- 
2.35.6

