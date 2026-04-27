Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC94FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 05:07:54 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35835.1777266470549241109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 22:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NUv+WPh4;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1104; q=dns/txt;
  s=iport01; t=1777266470; x=1778476070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q4TiX7qZrp/56cmU3dJEHWLXL1yaFXn28tuU+FNjLK0=;
  b=NUv+WPh4eP9EQFXEEiaSM9u8RqkRxmFrKOK2QndH+kJN1mu7AeyVHDOB
   NTSxw0/5bY4JlNSYEOT4JBT/fpkabsRCPP2zjZv/b5D/bWOmRxRNhVZDd
   pPeRV3zVgCUz3I/mnIcELeKL3OrfzS7KMwIsxvGnP540s0e7qTz+xpFzG
   nc4tC1m+jVzkooHTWwo7pzZwsjNFIsybO4svJCC48xQvZWKrRnPYavTEY
   5CEudcLeiYCwvSZOW9N6uXXS5WVmRJOFZ+Z7iqTQCAPYXrVBc++yp5k7J
   uqPR4Ow9ht0MLACsYS+ZkqhdbDQ/+h0KK+auo+co/hGGK36QhcuE8DXb2
   w==;
X-CSE-ConnectionGUID: eVqt84BjS1uacEIRUuie+A==
X-CSE-MsgGUID: MHemEYaWTm2RBi0Hu9VDJw==
X-IPAS-Result: =?us-ascii?q?A0BFAgAv7u5p/5H/Ja1RCYJZgldxXkNJk1oBgnCRTYxQg?=
 =?us-ascii?q?X8PAQEBDzEgBAEBhQaNMQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GXTYBGAEtMFxEgwIBgnMDthqCLIEBgygBgVTbJwELF?=
 =?us-ascii?q?AGBOIU/iByFbicbG4FyhH2EF3mFdwSCIoEOgX6CSopMSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EMGwcFgUuDVW1qgQuEXngiGgMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HijQgD4IkB4EOgUdSUJMAkEKCIaEOCiiDdIwelToaM6prLphYo3ELXYRog?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD5FxyHQmMgI7AgcCBw0DC5NlAQE?=
IronPort-Data: A9a23:5uaI/aCRscp9VxVW/37iw5YqxClBgxIJ4kV8jS/XYbTApD9z0j0Cz
 WsZDT+OOq3bMDT2fNt1YNi09k4Gv5TcytZkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAP/hWYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEzst3EBFqF48jo/t+Ckxvz
 8EFKT1OR0XW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/CJA3kOCurnL+aDZf7lmSoMLb5kCMllEvgOezb4O9ltqiYOVYm2upr
 136+j7DKBBCFMHO9xan7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVmuzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:jjaFQ61UnwnSUorvl03qewqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AC39G82rIJdiErq4+5GiNxzzmUc0ba2GNkF3SGBa?=
 =?us-ascii?q?lAG1EaYeoVF6du4oxxg=3D=3D?=
X-Talos-MUID: 9a23:Mv3V1AnNeOxSJsSt8p0vdnpHFMptzpWnN3wIy68supGkKH1OFxWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,201,1770595200"; 
   d="scan'208";a="725687671"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Apr 2026 05:07:49 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 8EC9B180001D9;
	Mon, 27 Apr 2026 05:07:49 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 394D4CC1288; Sun, 26 Apr 2026 22:07:49 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] apt: Add CVE_PRODUCT to support product name
Date: Sun, 26 Apr 2026 22:07:39 -0700
Message-Id: <20260427050739.1537812-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 05:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235979

From: Himanshu Jadon <hjadon@cisco.com>

- Keep both the older deprecated debian:apt alias and the active
  debian:advanced_package_tool identity in CVE_PRODUCT.
- This preserves completeness and avoids missing CVEs in case older
  aliases are still used in NVD records.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c777220ee5740b800f4128da79c24f7e42c7b88)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index e688d30cae..5709bbe24a 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -140,3 +140,6 @@ do_install:append() {
 	# Avoid non-reproducible -src package
 	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "debian:apt debian:advanced_package_tool"
-- 
2.35.6


