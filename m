Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE97C55174
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32607.1771565685880906200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G/EvC2xC;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1261; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kxUtoc7rKV71kukRq/duNsdrbeJj/q1YAnaODxTcaQI=;
  b=G/EvC2xCP9YWrj/JxA9jR6qfzgrlcTlPSuy0cwDZsFI4DNXNo8fDFKOS
   f88cx0kogr4bTQCoiCxuUH2K/Qq+rz/nZS9EHJtSv5k2SjH5eciRqaa47
   Wh+daSBBsbe2JNR1tVP5C0pYeRhxeQFsRiZZ4r8M/9SZ8PKSmIJD5QBki
   bVdjOFigl8+YNMMZXMO/E7Q3KSKOPeOPWquIOibFDGJ+iIf7k8AgF5uWY
   puXaNkX6fwjfeJS0BioCU2l/a2GYeLQ3I2+Uv5CIRepLpVLp2JzG/MwUZ
   oU/ybxBUy9Y4DPJawalWrX/0fCxdC1Ui48F0yM0fyAE5/CYb0/efq5uz0
   A==;
X-CSE-ConnectionGUID: os1sdXUpQFSYQdgKyJBLxA==
X-CSE-MsgGUID: 6IF99k8vSVSl0211IL6MvA==
X-IPAS-Result: =?us-ascii?q?A0A/BABB8Zdp/5T/Ja1aglmCSA+BUEJJlk6CfohmkjaBf?=
 =?us-ascii?q?w8BAQEPUQQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAUYQIDErKxmDAoI7AzYCAadWgiyBAeAiAQsUA?=
 =?us-ascii?q?YE4hTyIGVoahHonGxuBcoR9aYE2gnGFdwSDMJNPSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ELGwcFh1MPiQV4boEggRsDCxgNSBEsNxQbBD5uB44vP?=
 =?us-ascii?q?4I0AYENqEygHXEKKIN0m12FexozqmuZBpISkkeEaIFoPIFZcBWDIlIZD45fv?=
 =?us-ascii?q?hoiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:vv7iR6o23G1dlbqca6MQ5k/BzvheBmJPZBIvgKrLsJaIsI4StFCzt
 garIBnTaKqCMWv9KtpzOYjg8R4OuZ7cn9RjS1Y//C9jQXkWo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgbNNwJcaDpOtfrZ8ks355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uFsWHpCx
 cEAER42XymPiMGn4pifWsA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7Wz1VtEqcuYI84nPYy0p6172F3N/9JIPUGZwEwhbEz
 o7A1zrYLEBLN4yB8gS+9ir237buuX3eRqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:KCjIcKxODgu7eQ3oIBAiKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3Ao/s3oWugDlqZCsZmvrIsZ1vu6IsiaSTGwEftO3a?=
 =?us-ascii?q?WMldQRLK2WH263LNNxp8=3D?=
X-Talos-MUID: 9a23:mRQxVQY01j/N3uBT6R7C1WBhZNlT3Z+qUBpUyLQi5eyaHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="676419484"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 214321800025B;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 7B471CC8CF8; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 08/34] cve-check: add field "modified" to JSON report
Date: Thu, 19 Feb 2026 21:34:17 -0800
Message-Id: <20260220053443.3006180-8-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231464

From: Katawann <quent_55@hotmail.com>

Added the "modified" field to the JSON export in the
cve-check.class. This field captures the last modification date of each
CVE, providing more detailed information on changes and updates within
the exported data.

Signed-off-by: Katawann <quent_55@hotmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 740b8a0b23c4021d07c3714420e3ea8b46e61454)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 65d90dd420..22161e8539 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -527,6 +527,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
             cve_item["scorev4"] = cve_data[cve]["NVD-scorev4"]
+            cve_item["modified"] = cve_data[cve]["NVD-modified"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:

