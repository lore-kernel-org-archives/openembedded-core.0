Return-Path: <vdabhi@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E544CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 09:18:53 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.16590.1756372731365652602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 02:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RytjFwwr;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: vdabhi@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1430; q=dns/txt;
  s=iport01; t=1756372731; x=1757582331;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iguDAxvQCHIBLpYpox8T/iAH/RZRNm/cHdGruHijtEA=;
  b=RytjFwwr34X1pPmDc12fUeu86XMBjTy4zd0vAM8KkvEAkORY4+R6gXZg
   XESZkgisQfRMm+4TJO+Up+RLGO9h0Zss39cZQZgb9ageclQIzUJgIeUbk
   03grblE43LeE3D014aGReJSm0p/8BM8Plrq7mk1qBolWut4L9fKVV7NUm
   6FzcF1Ur10ajQR8SmweWTr+sw2mb+2m+4kJJkFlCHSjzh87/hNtUv2Aue
   SJtiERJLN34Hhz2awtB2oPA1zbrD0dm8sA+dTB0d/qIWKTHjCI3EsHXTU
   LMhnwWNDcsz7godWgR5DBFRF/PzpBwaC5eeT7LZ7H352JkaAHImFxA6t8
   g==;
X-CSE-ConnectionGUID: yDuTQlCERFObZ0+6ZpOwUQ==
X-CSE-MsgGUID: PvXlotYKSsKJv9K7IiWpwA==
X-IPAS-Result: =?us-ascii?q?A0AFAACoHbBo/5H/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkZ6WkJJjHCJVZ4dgX8PAQEBDz0UBAEBhQeMJ?=
 =?us-ascii?q?wImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GX?=
 =?us-ascii?q?TYBGAEtMFxEgwIBgnICARG6C4IsgQGDKAGBU9spgUkBjUxnCAGCRIIzJxsbg?=
 =?us-ascii?q?XKEfYEFgVwCgSeBBoV3BIIigRaIGIgbgwCHVkiBHgNZLAFVEw0KCwcFgWMDN?=
 =?us-ascii?q?QwLLhVuMh2BJ4NjgSqEHitPhQKEaiRrDwaBFYNfBoM4QAMLGA1IESw3FBsGP?=
 =?us-ascii?q?m4HlCODLhBKNCsBghYhBpMUkk+hDgoog3SMHpU5GjOEBKZnLphYgliLMJZQh?=
 =?us-ascii?q?GmBaDw5gSBwFYMiCUkZD444g2m6UiM1AjoCBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:IphFf61nv8oeZyOdfPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2MOx
 mIbCm+FPP6NYWrxeNhzbdm38k8E65DRyIBgT1c43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmG4E70aNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU6
 bsen+WFYAX4g24ubTpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGHW0rAbQc0ctNL0ZEx
 6RbdgIVSQ++vrfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWguuhjHn+WzZZs1mS46Ew5gA/ySQsi+e1bIqNJ4biqcN9plioo
 mXazkfCGTI4Ko28lhuEzWqzr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:icneg6ktQZfbA3Ogz0J7NDzSs/HpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:pO6YuW+tSLeP6daDx3KVv184B/wcdlbw9ln3KX3gSjhbUJqKdGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ANHEW4A0AyWwBfzt2bI3VgaLI7jUj27qeDEcRoLY?=
 =?us-ascii?q?9oOqmK31TZBacsyyoa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,217,1751241600"; 
   d="scan'208";a="537048052"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Aug 2025 09:18:50 +0000
Received: from sjc-ads-8161.cisco.com (sjc-ads-8161.cisco.com [171.68.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 67600180001E8;
	Thu, 28 Aug 2025 09:18:50 +0000 (GMT)
Received: by sjc-ads-8161.cisco.com (Postfix, from userid 1871031)
	id 1228BCC1292; Thu, 28 Aug 2025 02:18:50 -0700 (PDT)
From: "Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE LIMITED at Cisco)" <vdabhi@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com,
	Vrushti Dabhi <vdabhi@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] curl: update CVE_STATUS for CVE-2025-5025
Date: Thu, 28 Aug 2025 02:18:06 -0700
Message-Id: <20250828091806.43939-1-vdabhi@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.208.199, sjc-ads-8161.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 09:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222550

From: Vrushti Dabhi <vdabhi@cisco.com>

This CVE applies only when curl is built with wolfSSL support.
Revised CVE_STATUS description to align with CVE details.

Reference: https://github.com/openembedded/openembedded-core/commit/93ae0758ef35

Signed-off-by: Vrushti Dabhi <vdabhi@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index a21a086f40..6845a43cd2 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -37,7 +37,7 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
-CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: build with openssl','unpatched',d)}"
+CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.35.6


