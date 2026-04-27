Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADD1FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:48:26 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38924.1777279704640684418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dQRlxdNl;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=906; q=dns/txt;
  s=iport01; t=1777279704; x=1778489304;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pHT81bvcb20iILzRvpxq2NHm8aphM8uuROJynybtY2o=;
  b=dQRlxdNlRCh9SX8FxXKmMY6dAy0cJ4dofbgnZ+C6MVkOSjs9IprmWdNT
   Y2bcOWOeK2Cot4PaZ/32vPSThUDALcYHZ8jAaNX4Ny+Wqiw1UeAjwnzgd
   AVEnh09dtL4Rb9BbW9l0/tWFBlm2am1VmoiXlfhkKEbpXkTpBMl7WCtVG
   RpuSgU+Hb/SAMdMjYfiIbYt9yqLnA1Z8vlvdR0eC/NUe9lt+jfDSnNw6D
   xjtnQtMAOVqY+4amReepIfjec2aM/ZE30PJlTO+rNPiuulG2gQKXI410K
   8+JM5PEpYy4AFrwB/IJcEYSv9UL/E1cOlH+7Kv8542X1FVv2+GXbY3DHO
   A==;
X-CSE-ConnectionGUID: fjfb1NJhQZC9kREGccWvbw==
X-CSE-MsgGUID: ARKjXbU6S+2aAhGyfXP9Pg==
X-IPAS-Result: =?us-ascii?q?A0BFAgACIu9p/5H/Ja1aglmCV3FeQ0mEV48DAaENgX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQaNMQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZdJw8BGAEtMAUCJgItRIMCAYJzA7dJeoEygQGDKAGBVNsnA?=
 =?us-ascii?q?QsUAYEKLoU/gxkBhQKFbicbG4FyhH2FEIMOgmkEgiKBDoF+jQBIgQIcA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgUuDP21qgQiEYHgjGgMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPQFuB4orHg+CLAE8UYJpo0KCIaEOCiiDdIwelToaM6prLphYpFmEa?=
 =?us-ascii?q?IFoPIFZcBVIAYJZCUoZD9o+JjICPQcCBw4Ck3ABAQ?=
IronPort-Data: A9a23:Zae3L68X0n7AleURG88YDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DMeDWHSaP/bYjP1e90ibY61p0MHsJbRz4M3TQVtqilEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjhKs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k4P4MSo8BVAVh83
 q0bEh0iZRu8meiplefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+ohHDzdDtwo1OOrq1x6G/WpOB0+Oe3bYeKJYbbH625mG6xn
 EHEz27EXCpZbtW2yRWU/EKU19fAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:7YA1wa4/GjG5CO1E6QPXwFPXdLJyesId70hD6qkRc20xTiX8ra
 qTdZsguiMc5Ax+ZJhCo6HjBEDjexPhHPdOiOF9UYtKNDOMhILCFvAA0WKN+VzdMhy7zMFx/+
 NJarEWMqyNMbB75/yKnTWQIpIb7/SstIqPvtzz6l9RbSdML4FMhj0JcDpyECdNNXZ77UxSLu
 vj2iJFzQDQCEj+dq6Adx04dtmGnfLnvtbBWjA6NycKgTP+9Q9BcNTBYmOlNhF1aUIp/V9zmV
 K19TAQ/8+YwoiG9iM=
X-Talos-CUID: 9a23:2RCPbG7f1AwiY67A5Nss+kwaEJkDUH3k/lyBIHWVJm1id6OfVgrF
X-Talos-MUID: 9a23:/KVnDwsTpChz6ZYywc2nrQtBNvdi3vqVSxoEuJUpqse0DX1INGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,201,1770595200"; 
   d="scan'208";a="725577292"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Apr 2026 08:48:23 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 87DF918000588;
	Mon, 27 Apr 2026 08:48:23 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 32935CC1288; Mon, 27 Apr 2026 01:48:23 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH] apr-util: Add CVE_PRODUCT to support product name
Date: Mon, 27 Apr 2026 01:48:13 -0700
Message-Id: <20260427084813.1811031-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235994

From: Himanshu Jadon <hjadon@cisco.com>

apr-util is tracked in NVD under apache:apr-util, while a smaller set
of newer CVEs also appears under apache:portable_runtime_utility.
Set CVE_PRODUCT accordingly so cve-check can cover both the historical
and current NVD product identities used for APR-util.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index b5e3d2fc8a..2c9da5b44b 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -93,3 +93,6 @@ do_install_ptest() {
 	  cp -r ${B}/test/$i $t; \
 	done
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"
-- 
2.35.6


