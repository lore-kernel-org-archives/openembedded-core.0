Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1913C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:09:49 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6001.1788329387835105835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BrSewGuw;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1224; q=dns/txt;
  s=iport01; t=1788329387; x=1789538987;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HOLL1W8FEu1ckKS3Va+H73KiIJD9PskKY+8xTqoPrME=;
  b=BrSewGuwiH2YrBZOmz+qqKcPzOw1Al6PzGe0OjK9EpC1knQjX90snL36
   ZzbI3LlN1ZcisB8G5/OH7oKdCCItNAqUiEQDSxyDKztFAiM6vt/oBQ8AI
   cjxA3nAH55VFwxxmfuL3RdKNwBT8VNYR6dd4U7Rp5W7LvjPaZ1xrQRHQx
   7ZSOvrkNm+pDQ3jGiBxz0ik3s8/Uqd1uVkEOwkOZgnEBDA4FFNgWlal0D
   qrqKNQVfJpvFQWY+ZKcXXDKCqplKPFA6oiTI1oft9GfA3/QG/LwWo/cAc
   sL3GBhCU1qIADli+IAn6GKm+cXUmidkmMRcTugdeaP7AkHlaRkkm7vzpM
   w==;
X-CSE-ConnectionGUID: fhHRNXHLSW64BaCHUGNXwA==
X-CSE-MsgGUID: EtCvywWhRw6q/40+d4Nl2w==
X-IPAS-Result: =?us-ascii?q?A0CwAgBSvJdq/5AQJK1aglmCV3RgQ0mTWQGCBIxTkjeBf?=
 =?us-ascii?q?g8BAQEPNxoEAQGBcQGDE415AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZckBw2ARgBLTBRC0SDAgGCOgM3A74KgiyBAYMoAdofDYJYA?=
 =?us-ascii?q?QsUAYE4hT+Cf4UjdoR8JxsbgXKEfoIfgnGFeASCIoEMk2BIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEog0EjGTZ4gQlegSspYAESF4EJg?=
 =?us-ascii?q?ggCglSCBQIBSUMOB0dTCScKCxgNSBEsNxUZBD5uB45ZH4JPgQ6WQYJ5jxSgH?=
 =?us-ascii?q?nEKKIN2jCKPPoV8GjOqbC6YWpITkkeEaYFoPIFZcBWDIglKGQ+OLhXQGScyA?=
 =?us-ascii?q?jsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:XUPHwKymjOz3XcVoNTt6t+dMxyrEfRIJ4+MujC+fZmUNrF6WrkVRn
 2UYDDjXbPzZZjb8e95zPIm1904P65HWm9VqQAc5pVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYlajhMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJE82Hbc+ysZTOl4Qq
 dYRAxAwQTazmMvjldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oixa4uJJ4HTGq25mG61u
 knY7nvGAisFasXYlWLG/i6KgrXQyHaTtIU6UefQGuRRqEeaxCoQCBATfVS+qPi9zEW5Xrp3M
 E8d/CYvorI76UqDQdz0Xhn+q3mB1jYbQ9dWHugw5Q2Bx6aR6AGDC0AATyVdc5ohrMIwSDkg2
 1OFkt+vAiZg2IB5UlqU8rOS6Df3Mi8PICpaOmkPTBAO5J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjQxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:Of4f9atzN+H3LJbILjiC7n8R7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3Aw+qSGGklUI6hOcrC46L3xr8ceTXXOXPd7E32E2+?=
 =?us-ascii?q?cMlk3FJecYn+t14VUjOM7zg=3D=3D?=
X-Talos-MUID: 9a23:UDY94QoQlhOBYKYBQLkezxx+H9l5/JuuMl9TiNJa44qIaQp0YSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,257,1779148800"; 
   d="scan'208";a="843945517"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Sep 2026 06:09:47 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id D0BFD180004E9;
	Wed,  2 Sep 2026 06:09:46 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 6A055CCA79B; Tue,  1 Sep 2026 23:09:46 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2 1/3] python3-py: set CVE_PRODUCT
Date: Tue,  1 Sep 2026 23:09:41 -0700
Message-Id: <20260902060943.2931635-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244890

From: Gyorgy Sarvari <skandigraun@gmail.com>

The related CVEs are tracked using pytest:py CPE, so set the CVE_PRODUCT
accordingly instead of the default python:py.

See CVE db query:
sqlite> select * from products where product like 'py';
CVE-2020-29651|pytest|py|||1.9.0|<=
CVE-2022-42969|pytest|py|||1.11.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1fac509459c4e2d970121b66ae33cd53ef1eb8a6)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index 31d5a377a7..a75b9c2b14 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
+CVE_PRODUCT = "py"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6


