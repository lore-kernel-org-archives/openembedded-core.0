Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14020.1795509646694556519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XjZEpkTN;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2767; q=dns/txt;
  s=iport01; t=1795509647; x=1796719247;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=m3jPYh1VAARFtS61qCJyHouv3jZimj3VoOsUwg2OkRM=;
  b=XjZEpkTNTekxIZzX2BM5vKthUGD+QUHkfXJHArVKp1bMAqrui09QyC0c
   2Os+TfJQcbC2RLVY61HMNfFEgCqVjc52yCyX95V8ZYJGPF5m+uaC0Td7X
   HyBuGUGCLeUJtB2NTX4TfNHr/M3YYb/pO0xbvWbNlzj8+hxXfP0+HhDej
   ZszQ7o59i67gRFx9iKri40GVWa1xBFADSxZ2JSnHg0jcJWeIkSRF1ksHW
   siW1hFCuWHti+lBnbi1QL/VWSrt7J+IbeH+pT1F73AtUrH6tc/RdN4gu1
   jV60JOhhcJl98LfiqOaaTig4czVdkKGjWjGvOgm+tW0N3rTdoEOCSfk0O
   w==;
X-CSE-ConnectionGUID: AEcUP6XbTK2YtLccL837cQ==
X-CSE-MsgGUID: uxM/xuYcSYinqiO9YoaV0A==
X-IPAS-Result: =?us-ascii?q?A0BHAgABTQVr/8tK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAVYcAwECLysjCBmDAgGCdAIBEbocGzeBeTOBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVg2qBBYFcAoE4dYV5BIIigQyBV?=
 =?us-ascii?q?BgGjHkCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcg?=
 =?us-ascii?q?R6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsbG?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBSDGnsTARMXASCCDJM3AZI9oREKKIN5jCSVOhozhVulF?=
 =?us-ascii?q?wuYfY4KlWhphGqBaDyBWXAVgyIJShkPji4LC4NghAfKVCM1CwMvAQEHAgcOA?=
 =?us-ascii?q?wuBaIRhiyCBfQEB?=
IronPort-Data: A9a23:mUdL5q+zD0g/YSeyqizQDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WMcW26APPyDM2P9eYp3O9ji9hgAv5eBn4BjS1Rkq31EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kfEIYlwrhHC11tr
 80EDDsGSkDY2OmPlefTpulE3qzPLeHiMZlavjRryivUSK58B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YOHWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCzaoWMK4PbHa25mG6Ft
 keB73nICSorNdqGyB3Uw3WluLfmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:rneiiaOAhYOTzcBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:ryek3WCAB2Tayqr6EwBK/3MsRPAvTl6H/Wv0KEScWT02Q4TAHA==
X-Talos-MUID: 9a23:P0iHmgkcFg+5w3uhtyakdnp/JOIv87mfA3s8kJMfuu7VBCt5BW+02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62719790"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:44 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 472111800015B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:44 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7D5D6CBF22F; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 7/8] cups: Fix CVE-2026-107886
Date: Tue, 24 Nov 2026 00:40:32 -0800
Message-Id: <20261124084033.72286-8-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250973
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-107886 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/13bc9d4f8d695403d54469cc3c8b675e34a7037f
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-pwg4-pv39-8c22

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2b8f96b189..fdf2f5db3b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -38,6 +38,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-61702.patch \
            file://CVE-2026-107888.patch \
            file://CVE-2026-107890.patch \
+           file://CVE-2026-107886.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107886.patch b/meta/recipes-extended/cups/cups/CVE-2026-107886.patch
new file mode 100644
index 0000000000..9ad53fd827
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107886.patch
@@ -0,0 +1,41 @@
+From 4572e242b33bc0ebc837fa262407ca1e508190a9 Mon Sep 17 00:00:00 2001
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
+index 580b557b44..a89f0b62c0 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -13,6 +13,8 @@ Changes in CUPS v2.4.11 (2024-09-30)
+   (GHSA-qqm8-4q5h-jg55)
+ - SECURITY-3.3: The scheduler did not filter out group separators from job
+   submissions (GHSA-wjc4-qhjr-5m5x)
++- SECURITY-2.3: The scheduler could crash when modifying a class
++  (GHSA-pwg4-pv39-8c22)
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 239454f069..b3acd1660c 100644
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
-- 
2.35.6

