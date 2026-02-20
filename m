Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91EEC55180
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32608.1771565686056322342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XoX0sfIG;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2569; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6YQkSxJwRwX56wPeLchYyY2ISqIY0413NcYJZRvl+nk=;
  b=XoX0sfIGlw48VeKgYvtHP9fk/ALbOMHgA6ELVMqeifawGOTAGkqNfsor
   a/eLwlny02oAkJhfdeA7I7jCZzGJ2x0RrTAKBwLdsbkR1WDxfp0IhGztF
   6aO3FMdzWX0x1oNuvd1i9166O6lOoZAvwl1xvXKSUpsVY1rjRHLr38oAJ
   yDEJ7JqnsAP/PIrlZ5gq1s3vDFmMpyQhUWutStAQRKJuStKpiMRlWIMA8
   SM+usqSKJuRaCwyMgh6qEUeqqgax0X23poFlMbPwt033HJFlNJRX1pdxV
   Rav0G/ItWLlIytGipKGH6rYgM4QKddyoHe1pW77dop8O0tKzd1zycA6gy
   g==;
X-CSE-ConnectionGUID: KMWBTmceQ1i7dMw7XW00iw==
X-CSE-MsgGUID: C8bOxNoXSsufeOG4BcMYBA==
X-IPAS-Result: =?us-ascii?q?A0BBBADP8Jdp/4v/Ja1aglmCSA+BUEJJlksDi2SSNoF/D?=
 =?us-ascii?q?wEBAQ9RBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBRhAgMSALKxmDAoI7AzYCAadUgiyBAYR82EcNg?=
 =?us-ascii?q?lIBCxQBgTiFPIJ5hSBaGoR6JxsbgXKBFYNogh+CcYV3BIIigQ6CAJFPSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFh1MPiQV4boEggRsDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB44vP4ItBwF6EwF/pSuCIaAdcQoog3SbXIV8GjOEBKZnmQaCW?=
 =?us-ascii?q?I86kkeEaIFoPEaBE3AVgyJSGQ/MeSI1PAIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:zMkqLawmL4SkpLRvimx6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 WdOD2qObvvfNjCnco9+ad639RlXscPUxoNgHAFs/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4qaT/H3Ygf/hWYuaDpMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGITAqck/+16ODhPq
 vA9N289UUjbhv3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOelmmH2bxVTqUmeouw85G27IAlZjue0aIaLIYDVLSlTtm3Ir
 EXW2WPJOQoHOtG45mav+VedrMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:F2oTIKGaH/ZINT4wpLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: 9a23:sPz7OW+UX7W8+uONhGqVv20xJeoZd3bQ9S7RfEOdFjlZd+XNSEDFrQ==
X-Talos-MUID: 9a23:kOAnIARm+Iqu7t4jRXTH1DtFJOFv05+1FU4AtrpakcKhBAZZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671046347"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 822231800022B;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id A1EEBCC8D01; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 16/34] cve-check: allow feed choice
Date: Thu, 19 Feb 2026 21:34:25 -0800
Message-Id: <20260220053443.3006180-16-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231469

From: Marta Rybczynska <rybczynska@gmail.com>

Allow choice of one of three feeds and update task dependencies
accordingly. All feeds contain data from NVD and are stored in
different files.

Set the NVD_DB_VERSION variable to choose feed:
NVD2 (default) - the NVD feed with API version 2
NVD1 - the NVD JSON feed (deprecated)
FKIE - the FKIE-CAD feed reconstruction

In case of malformed database feed name, we default to NVD2 and show
an error.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f265812bfb6797aee10e7be42865736c9ff3478f)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 8aa7293368..234eeae7d4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,12 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
+# Possible database sources: NVD1, NVD2, FKIE
+NVD_DB_VERSION ?= "NVD2"
+
+# Use different file names for each database source, as they synchronize at different moments, so may be slightly different
+CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') == 'NVD1' else 'nvdfkie_1-1.db'}"
+CVE_CHECK_DB_FETCHER ?= "${@'cve-update-nvd2-native' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'cve-update-db-native'}"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
@@ -101,6 +106,11 @@ CVE_VERSION_SUFFIX ??= ""
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+
+    nvd_database_type = d.getVar("NVD_DB_VERSION")
+    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
+        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1, NVD2, FKIE. Defaulting to NVD2")
+        d.setVar("NVD_DB_VERSION", "NVD2")
 }
 
 def generate_json_report(d, out_path, link_path):
@@ -171,7 +181,7 @@ python do_cve_check () {
 
 addtask cve_check before do_build
 do_cve_check[vardeps] += "CVE_STATUS CVE_CHECK_STATUSMAP"
-do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
+do_cve_check[depends] = "${CVE_CHECK_DB_FETCHER}:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {

