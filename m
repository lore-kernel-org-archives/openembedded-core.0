Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB95C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:21:05 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7371.1784265662077768792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FLkefz+C;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=718; q=dns/txt;
  s=iport01; t=1784265662; x=1785475262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8OO6ZYwbpsDycA3XXSHKxiVYBxFyNuXSnNkg6k7d2mY=;
  b=FLkefz+CRMyzssVR8xvCHuvPIm3hGxD4LzGfW93F//4GdWGSG4wrGId/
   Noq7E06tVJ8uVxd+6BSOHEeYipbMerDyYNbkzloiNHPD6DwxmZP6KdUoT
   n8Iqnvs+IHxriHtLqJTGsLQQVbtbIkVkTeZL4sW5lTtAyEj0MARFyERTR
   Cgkzagj9LTSiOiG3oT7TAn2caYVp+hbld1EwfCMikLJrcpalfh0/URxgZ
   q0oqQCZgmBO2wxLHbJnUvdAzSW1FguuxiLzvEhGjCS3OY/5o6rD1TZN+X
   hdeSS9MjYq4UlFID6oqXiQd5RJqHN2aXCtha0E/lphMyofIlmFxuShJiY
   w==;
X-CSE-ConnectionGUID: rpCXqbriRSGw9AiPCB9BSQ==
X-CSE-MsgGUID: npafoMEKQ6iEQEdpORMP0g==
X-IPAS-Result: =?us-ascii?q?A0BZAwByt1lq/4//Ja1aHgE8DA4LgVmEKkJJk1kBoQ6Bf?=
 =?us-ascii?q?g8BAQEPUQQBAYUFjVQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwKCdQIBvVyCLIEBhH3bOhWBOIU/iCB1hHwnGxuBc?=
 =?us-ascii?q?oR+hRCFeASCIjw+EpF5SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMG?=
 =?us-ascii?q?wcFgR2BOoEAhHYjHwM5f4EvdUp3LWkBEheBToIUgT4DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?41II4R0gRAhpXahDwoog3WhWxozqmyZCKRahGmBaDyBWXAVgyJTGQ/geyQ1P?=
 =?us-ascii?q?QEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:hTMIDKpFddheHMDWZz7XAbylf41eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmBbPvcMWH1Ltt1a43ipBlQ7ZPdmIRkHQVt+CkyHnlD9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8U035pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vxvKlFX/
 +YZEgsicUGqhtqd6uORcdA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Uo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LU/rSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHJ0FxRvA+
 DKuE2LRBAkTOtu65Bm8rHOBv8LDhQTBfbpKG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:UcjlCajuct87xVhLLjUIgrqzxXBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:MNATbWwfoFsM66MB2F9bBgUOAusVa3fHzU3rDFDpIGdRY5fEY2SprfY=
X-Talos-MUID: 9a23:jutnSgYIkHxiGOBTsSflijZHGeRRvaWDMW0BibI8nvHcOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="510835068"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:21:01 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 0E3A718000093;
	Fri, 17 Jul 2026 05:21:01 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id A8FBECC124B; Thu, 16 Jul 2026 22:21:00 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashishkumar Parmar <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 0/6] rsync: Fix multiple CVEs
Date: Thu, 16 Jul 2026 22:20:53 -0700
Message-Id: <20260717052059.773645-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241116

From: Ashishkumar Parmar <asparmar@cisco.com>

Backport the upstream rsync security fixes for CVE-2026-29518,
CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
CVE-2026-43620, and CVE-2026-45232 to Wrynose.

Changes in v2:
- Updated the CVE-2026-43619 backport to restore the upstream commit
  description and explanatory comments for the openat2/Android fallback
  handling.
- Clarified the Wrynose-specific Backport Changes metadata.
- No functional changes were made to the other five CVE patches.

Ashishkumar Parmar (6):
  rsync: Fix CVE-2026-29518
  rsync: Fix CVE-2026-43619
  rsync: Fix CVE-2026-43618
  rsync: Fix CVE-2026-43620
  rsync: Fix CVE-2026-43617
  rsync: Fix CVE-2026-45232

-- 
2.35.6


