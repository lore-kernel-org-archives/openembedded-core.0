Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F3EC54F5D
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32608.1771565686056322342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CxhnnyJD;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1252; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0sp4lL/ykYh2De6xzOC/1eVtCE0pySieXOsQTgtFooA=;
  b=CxhnnyJDVYYiOXrT+taex+X7+hSXfQoLgaWQNvEHZia5MRTDZ2QunCHV
   9/F+rNLuDHEtBmmAPAvkFLzuwb/jKWZD6zKqlPJjxu4GbOs2m7i4rqKip
   wgr58TrcSdiqd8iTrQ0jnrCAiLNCtRAbuEO3qq0ALVrOK/QGssuHjiXff
   h7YxrbGgspsiAOyf9gFL75+E68lx+aE8J7Z/W1/lDmBK0rc/0kx0PGu2t
   wodx3OWtyF2vkbJSn28tIzNfo+rXsL+wf23i7Rf4crurpjZYvgsKmVAAU
   MV44gHAXYABopWg1zKHZMvlBevLfaZs+NXYgJVCp7uJND9auQn0mqHx/J
   g==;
X-CSE-ConnectionGUID: QqKLvcOhSpemtRdz+NtfPA==
X-CSE-MsgGUID: 0KaShTaaQjysJEYvQOcUbg==
X-IPAS-Result: =?us-ascii?q?A0A/BADP8Jdp/5L/Ja1aglmCSA+BUEJJlk6LZJI2gX8PA?=
 =?us-ascii?q?QEBD1EEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZbAgEDMgFGECAxIAsrGYMCgjsDNgIBp1SCLIEBhHzYRw2CU?=
 =?us-ascii?q?gELFAGBOIU8gnmFIFoahHonGxuBcoEVg2iCH4FrgQaFdwSCIoEOggCRT0iBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYdTD4kFeG6BIIEbAwsYD?=
 =?us-ascii?q?UgRLDcUGwQ+bgeOLz+CMwEBgQ2oTKAdcQoog3SbXIV8GjOqa5kGkhKSR4Rog?=
 =?us-ascii?q?Wg8RoETcBWDIlIZD45fvhoiNTwCBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:+gDY+qLZjuLDqT89FE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENSgTFTm
 GRMCGCPO/eKazf8Ko1+bIvg8U4O65HVy4M2HAAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gWQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1XFWISI4Y/+t1vDGRSz
 /AKaxYRYCiq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FIuieCxboGJK7RmQ+0NvU+jp
 l7P9l37Ewo4Ge2B8B2Oz3ij07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:v5ydt6zSZ+6skbgVoNDrKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: 9a23:+NkfYm4Q0wi0CsaqTdsszVc3Pt4uVX3m1HrVP3W0GyVPVLOtYArF
X-Talos-MUID: 9a23:tHEUSwuakotx25EBK82n3BJrD8dU6q2XClEWs7g3pfCjPhF6NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671046349"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 86BD018000202;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id B49D8CC8D05; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 20/34] cve-check: change the default feed
Date: Thu, 19 Feb 2026 21:34:29 -0800
Message-Id: <20260220053443.3006180-20-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231474

From: Marta Rybczynska <rybczynska@gmail.com>

Move to the FKIE feed by default, as it is showing better stability
than NVD2. Content of the feed should be the same.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10580a6d36aa1366732f9c030345bd4590eb9f74)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 234eeae7d4..3555a74c42 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 # Possible database sources: NVD1, NVD2, FKIE
-NVD_DB_VERSION ?= "NVD2"
+NVD_DB_VERSION ?= "FKIE"
 
 # Use different file names for each database source, as they synchronize at different moments, so may be slightly different
 CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') == 'NVD1' else 'nvdfkie_1-1.db'}"

