Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3711.1795172268930103159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MUdcmAls;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2622; q=dns/txt;
  s=iport01; t=1795172269; x=1796381869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ay1cVaSWkHIoyoOhtcZJWdw1vLMgTW0TNaZTMJW2jx0=;
  b=MUdcmAlsYtuCLI+Gx3uOYEmPq4PejqdWpG1Jt98E8ofOnSqWDrcwViT0
   iDtX0HHorDLzOhtk41N23YWHhaDMx2oIuC2w9kIXLuR9m760EnfX+gvK/
   4WvINwiiK9ZhTmwMtxE/h784QUmBqxvqHQ/ILiUFBE++3DrHjAoMV9GFr
   qS9jAZ61BLPDp0fLjXt9670kj6tL6ghYTAakaMDhTrOnZylC8I+AQCCJV
   aeTEcaKLEkyKSIIkPJZ9tDu49HVwecceuc8UNt566qhJTzLtLh9ioS4He
   ht8aquod5y8S4YsQccho6VVLll7MaeIsoS1O4NfefmA6IqHdyaSs2RGMD
   Q==;
X-CSE-ConnectionGUID: bP/z/GhSRRSyJnVbuerkZg==
X-CSE-MsgGUID: +kGaPnokTyGykfjl5KqhWA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDrJQBr/9NK/pBaglmCV3VhQkkDlkgDnimBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwFGEBwDAQIvKyMIGYMCAYJ0AgERuCQbN4F5M4EBh?=
 =?us-ascii?q?H7bMwELFAEFgTOFQogkXRgBhH0nGxuBcoEVg2qBBYFcAoIthXkEgiKBDIFUG?=
 =?us-ascii?q?AaMeQKBT4gmSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYNGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hk2yDEgeBDgETGCCCDByTHJI9oREKKIN5jCSVOhozhVulFwuYf?=
 =?us-ascii?q?Y4KllGEaoFoPIFZcBWDIglKGQ+OLgsLg2CEB8pUIzULAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:2fu8U6lvLzG/9umsFm0pyv3o5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMD27XbPeLZ2v8etF1PI+0pBxQv5GEmtZrHQttri08RltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfra8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYcgvfQwLmF1z
 8YjORILUBqeivi18r3uH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIeEJITWHpUE9qqej
 iHF0G3BBBYZCM2w2DmL8HbxpfbPogquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:Qg+hjaj4YrQdQmpp6P1BUtRB6XBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:u+3D0mD0zjaNAen6EyNfs1xTNcAeSEfm3VXWHUWlBHxqerLAHA==
X-Talos-MUID: 9a23:IJSKqQr3zGoE7zLd8zEez3JhG85Q5aOtNFEigJYIuc3ZFjVwBB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59604389"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:46 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id A329818000B5B;
	Fri, 20 Nov 2026 10:57:46 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id D78DBCBF22F; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 7/8] cups: Fix CVE-2026-107886
Date: Fri, 20 Nov 2026 02:57:19 -0800
Message-Id: <20261120105720.2197092-8-asparmar@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250768
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/13bc9d4f8d695403d54469cc3c8b675e34a7037f
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-pwg4-pv39-8c22

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 6605236049..547a129ce4 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-61702.patch \
            file://CVE-2026-107888.patch \
            file://CVE-2026-107890.patch \
+           file://CVE-2026-107886.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107886.patch b/meta/recipes-extended/cups/cups/CVE-2026-107886.patch
new file mode 100644
index 0000000000..87c12de6bf
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107886.patch
@@ -0,0 +1,44 @@
+From e1ceac96617dddf48089ea1c06553d778f1f9eba Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 5 Oct 2026 10:35:38 -0400
+Subject: [PATCH] Initialize printers array to NULL after freeing
+ (GHSA-pwg4-pv39-8c22)
+
+CVE: CVE-2026-107886
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/13bc9d4f8d695403d54469cc3c8b675e34a7037f]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      | 2 ++
+ scheduler/ipp.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index cbeaf841..0142ab12 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -9,6 +9,8 @@ Changes in CUPS v2.4.16 (2025-12-04)
+   (GHSA-qqm8-4q5h-jg55)
+ - SECURITY-3.3: The scheduler did not filter out group separators from job
+   submissions (GHSA-wjc4-qhjr-5m5x)
++- SECURITY-2.3: The scheduler could crash when modifying a class
++  (GHSA-pwg4-pv39-8c22)
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+ - Fixed cupsd crash if user does not exist (Issue #1555)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 8ea32d4b..35d095c4 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -980,6 +980,8 @@ add_class(cupsd_client_t  *con,		/* I - Client connection */
+     if (pclass->num_printers > 0)
+     {
+       free(pclass->printers);
++
++      pclass->printers     = NULL;
+       pclass->num_printers = 0;
+     }
+ 
+-- 
+2.35.6
+
-- 
2.35.6

