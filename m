Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D044BC55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 07:05:27 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37823.1785740718364689069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 00:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T9MSELwr;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1228; q=dns/txt;
  s=iport01; t=1785740718; x=1786950318;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E26uYd4AdW/xRMBBJO0zgI4R/BmfvExfq7hiJrqJUak=;
  b=T9MSELwrXrh6KFz6p4yFkPBj2eGlzCO6uipVLK3WZgkb2E6ZsSgzdiXp
   KRFbKBpyB7u1zZPGm0LvxPMFX8Ugf33CYQFRGjLs52Oy6820AB8aCHv74
   3Y8zuj9Q5Abi7nC84SoaRdDCUSk/gNTh6iC3ABanJe87ymYgQoBAYe6Q7
   5QmY61cmYjlxxWV3OqjRB+F3HY+yrfEi9RhsSX4zfBtDJD49LNtI4fUrv
   IWpNgSPcPBeh1jHe1Bj5HaLqwMudz9v9OYbpawn0JuJoJXypl51JbB5hX
   BsF6hzzWhzujrpwZHW6cTN18gGIxRCnFx/qh/O7uvKOhwb411OhxVvB/p
   A==;
X-CSE-ConnectionGUID: qIpcdCMFR6iqK0uL7LByUw==
X-CSE-MsgGUID: RztGPmXmRAyBM7FCwix8qA==
X-IPAS-Result: =?us-ascii?q?A0BAAgCVPHBq/5MQJK1aHgEBCxIMggULgld0XkNJk1kBT?=
 =?us-ascii?q?6A/gX4PAQEBDzcaBAEBkm0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIcTARgBXVwdASaDAgGCdAO9a4IsgQGDKAGBVNsuAQsUAYE4h?=
 =?us-ascii?q?T+IIXWEfCcbG4FyhH6FEIV4BIIigQyDA48sSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwcFgR2BKyyEUyMZNnyBL3VKdS1qEheBGoMVAoJ4AwsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeNZiCCRAGBDaYtgiGhDwoog3WMIZU6GjOqbC6YWqNyaIRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD95cJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:fkIPmay1SZDDGss6cFt6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVVy
 GMXDz2DM67ZZmH2LYt/boSypk0H68fXmNA1GQNrrlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkajlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFgXJYYU0cNZOz9P7
 N9ANRRSSjqSuv3jldpXSsE07igiBMDvOIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUifC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQugea3YYCOIIziqcN9pFSEi
 VrDz2HDKwAwEYOx4iWE4iK1r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:CC406KtymRoP92tudFKQgXWI7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:OhJNmG9lOOwbv/I+QjGVv1c1AsspWVjz9inROmzgFEI2bJeEdEDFrQ==
X-Talos-MUID: 9a23:eK/H8wre8d72zzSs14oezwtwKOhQ5pSrMmkcu7BZleKbNDwgIh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,202,1779148800"; 
   d="scan'208";a="796292328"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Aug 2026 07:05:17 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 47AB71800015C
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 07:05:17 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id DB51DCC1611; Mon,  3 Aug 2026 00:05:16 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] python3-pip: set CVE_PRODUCT
Date: Mon,  3 Aug 2026 00:05:00 -0700
Message-Id: <20260803070500.1397434-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 07:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242610

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT is not set for python3-pip, so cve-check can miss or
misreport pip CVEs. CVE-2026-8643 is reported in NVD with pypa:pip.

Add CVE_PRODUCT to match the NVD product name and report this CVE
correctly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a486abd4889ad03e1a8ddd5311595f3ece7d61b6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pip_26.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 28af8f7ec7..9640bc926a 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -28,6 +28,8 @@ SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
+CVE_PRODUCT = "pypa:pip"
+
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
 	# Keep them only when building for a Windows (mingw) host.
-- 
2.35.6


