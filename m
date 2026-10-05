Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F85ECA5FFD
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:56 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16135.1791192229326238163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IezUgGR4;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2630; q=dns/txt;
  s=iport01; t=1791192229; x=1792401829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIZjcM8/TiDFNY6aP0bkmvfhSevvH34tS1CkMRrI3AM=;
  b=IezUgGR4G8A9Q08e1yE+ddqhcrpaUSytU06KfY9IEldYq7TeyEDi32/L
   FDFDPlzkbzkYUKHi9mxcJihKmDpZ6WCH2oF+OAyTUOoCS03OfyN7hC2/F
   Hq2GNnj+5nNFlIlaMfrn0fQl9EAL77Hbmh88F8CtuoYkm/g6Eh1GOOGgU
   Q6qc4vGIMr+/L5c+2SiCPgj7Cfpbz6tNYEdkTTwfaWaXh5VDEk73hpD5L
   SLJghFGswqLGPsoj3nmr4UIcMwGLKXQ0CXmgSn5sd7vURM/NzX+Z13sw2
   jZySGIWs9GQDrPiBOdCsLATTpcDUrt+Ubz+oMJ8LMJfNQGVvVaOgXywjs
   g==;
X-CSE-ConnectionGUID: q6H0p13RRB+tRlRY1dxajg==
X-CSE-MsgGUID: Ja8BJJxNSHy7SGg26bghTA==
X-IPAS-Result: =?us-ascii?q?A0BNAgA+bMNq/4r/Ja1aglmCV3VhQkmWTZoWhASBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AgERtTGBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQECgiuFe?=
 =?us-ascii?q?ASCIoEMgVoek05IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVFEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoRBcMEBgNSBEsNxUZBD5uB5BQHoITTYEOASoBpgGCIaEPC?=
 =?us-ascii?q?iiDdowilToaM6pvC5h9igspg1aWUIRpgWg8gUcLB3AVgyIJShkPjjmDa4F/g?=
 =?us-ascii?q?xTHJiQ1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:DjFnraAA5cGTPhVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApD4g02dUz
 WpNWWyPOP3fZjDzc9gjOoi+8UsOvp6Az4VgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2qtOVFlvZrci0KVrO2V0x
 KUUODkPYUXW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVcoiuO1aIaPEjCMbedczmy6h
 HLgxEToXSo1O4bBwzWFzlv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:qdsJN6F8tSKTqRg5pLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AQ9uzZGgKVIotlp74HIBxWqYSvDJuayP9lG+JeHW?=
 =?us-ascii?q?CIyV1crmveAac6KpmnJ87?=
X-Talos-MUID: 9a23:QDffoQZYVbpuXeBTlTa8rhNAJOFTw7XxM28Cy8sMtMm4HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="531230042"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:48 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 5B600180002B6;
	Mon,  5 Oct 2026 09:23:48 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id E1188CC1292; Mon,  5 Oct 2026 02:23:47 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 5/8] libxml2: Fix CVE-2026-86141
Date: Mon,  5 Oct 2026 02:23:43 -0700
Message-Id: <20261005092346.1670265-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247231

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86141

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86141.patch       | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
new file mode 100644
index 0000000000..416a50eda5
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
@@ -0,0 +1,35 @@
+From adb9287ae35770d9b281ed8f2160774198fbaf25 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 07:56:18 +0200
+Subject: [PATCH] xmlregexp: Calc string length after null checking
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1107
+
+CVE: CVE-2026-86141
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55]
+
+(cherry picked from commit e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlregexp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index 320a35ce..72e8e459 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -702,12 +702,12 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+     if (string != NULL) {
+-	ret->string = xmlStrdup(string);
+-	ret->len = strlen((const char *) ret->string);
++        ret->string = xmlStrdup(string);
+         if (ret->string == NULL) {
+             xmlFree(ret);
+             return(NULL);
+         }
++        ret->len = strlen((const char *) ret->string);
+     }
+     ret->cur = ret->string;
+     ret->neg = 0;
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 98a3e3ce36..240e8fe670 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
+           file://CVE-2026-86141.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


