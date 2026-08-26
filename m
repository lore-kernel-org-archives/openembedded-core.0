Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B381C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:32:36 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6080.1787722347732515618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UT6L56zg;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1538; q=dns/txt;
  s=iport01; t=1787722347; x=1788931947;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cRvIekmGwwgabHzXEck5tjG9OsSc5RQRvWi5KG4SPQc=;
  b=UT6L56zgGwV8hyu0MszWVay1/Sf9PTsliF3Dp0zUgxStoW6AA1a1qUr3
   nuENbz6XJLee5khskM0Rnp0gQOGEeiV9tiCbw+Pt8H80ivCBk5gEVZD7b
   Iv6McKN8dp1pljeeLQAXXGSj8HtzqZrzEo0vqiZunn2HHXofPs/Bq0LKE
   EiZXOfgY7uryQQEjxlvGz0zRUNb/VLHiLSjAJrgjA7OJLJaueXIjs27T8
   8n6+5Ho5VKc0ELFtQXb69/cpaYR07ALHs0ZycJacXrOKr5EgklEC+FGda
   Z70LKFJzc2uZjREYIxYF8A/C2ydof5FJsg8yQE50QjcMFLGQxvSXdrTDA
   A==;
X-CSE-ConnectionGUID: OtMmNnPxSwusJp4E75KrwA==
X-CSE-MsgGUID: gGLeKYBfTMWEcIL36jnJIw==
X-IPAS-Result: =?us-ascii?q?A0BBAgDweY5q/5AQJK1aglmCV3ReQ0mVXp8KgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZdNgEYAS0wXESDAgGCdAMRvkWCLIEBgygBPwJDUNswAQsUAYE4hT+II?=
 =?us-ascii?q?nUBhHwXEBsbgXKBFYNpgQWBXAEBAhiCE4V4BIIigQyTYkiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCB?=
 =?us-ascii?q?wKCWoIFAgFJQw4HRz4LGA1IESw3FBkEPm4HjmsfgkmBDiwEd4FTpVShDwoog?=
 =?us-ascii?q?3aMIpU6GjOqbAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD44uCguDYIF/gxTHJ?=
 =?us-ascii?q?icyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:qZBlX6larNM90EV//tCpCjjo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDDqBPv2IZmb8fYxzYI3k80IDvp/UxodrG1Bl/yBjHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsfzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaoE3+NRB1lez
 uMFMxIVMj3c2sGs35vuH4GAhux7RCXqFIobvnclyXTSCuwrBMicBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkETUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIqMK4XUHJkIzy50o
 ErJ0ED0ISAwOuC69heO01b32O3JvwLkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uf8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:eV3fAaNEEKmHEcBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:7OBBpWBDZzPVrmr6Ew570UsyHPg1SWLA11XIf2LnVEVzV5TAHA==
X-Talos-MUID: 9a23:6pBdggt2ZkqjXd3ACs2nix5GOeRZyaqSLX8gmrQi4JeGMw5RJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819161459"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:32:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id B402D180001DC;
	Wed, 26 Aug 2026 05:32:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 532F4CCA79B; Tue, 25 Aug 2026 22:32:22 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-py: ignore CVE-2022-42969
Date: Tue, 25 Aug 2026 22:32:17 -0700
Message-Id: <20260826053217.729875-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244294

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- NVD marks CVE-2022-42969 as disputed because multiple parties could
  not reproduce it and argue that it is not a valid vulnerability [1].
- GitHub withdrew the advisory because the available evidence does not
  show a valid, reproducible vulnerability [2].
- Wrynose and master use the same python3-py version and carry the same
  disputed CVE status, so that disposition applies to Scarthgap [3].
- Hence ignoring the CVE for now.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2022-42969
[2] https://github.com/advisories/GHSA-w596-4wvx-j9j6
[3] https://git.openembedded.org/meta-openembedded/commit/?id=91f6b85b36316d5940ee194b1d195caf3ac040b1

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index 31d5a377a7..2a16c6406b 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
+CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it and GitHub withdrew the advisory"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6


