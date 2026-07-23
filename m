Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AE8C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:18:38 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18327.1784791111656632355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 00:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lNEiMMJJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1166; q=dns/txt;
  s=iport01; t=1784791111; x=1786000711;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hec6tMp1skTXyJ7PwRsNaO7B1hH9szTvwiHTcoWEIPY=;
  b=lNEiMMJJmM+PDF7qVxtX7mGjFh439shvxcLGJymneaWugNFWCj5fGYES
   9ysOHWCt3cL1do+PnXSBVKcRLE9JxRK6dM9mXsoIfOsnVMcQ0jm2FPMId
   jj0MXbWSBT8k2bFu9fSEPCazdvujhd8LGI8rGx3ZczbjjT8Ft4lkLcoHy
   z0NMbPNqrhtwlAjgk3LINe9ntOxU5ERrppa8fpZxXok37tocMvFcv7GAH
   ECMhY41twfy2cqbb/AUd4txKkdCje+KAPOZweM6FyGQiZaYgUpXXvT47q
   VUaXULO5ClsX90UGZ3YHY7pkUeQFFfkKNBJjkm3AxYvVH9hSjBy3Ri/pO
   A==;
X-CSE-ConnectionGUID: zHcLEHJkS++SRrusV56JNg==
X-CSE-MsgGUID: zkq98D9KQYaZIi08lMDcWg==
X-IPAS-Result: =?us-ascii?q?A0BAAgC6v2Fq/5L/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GXTYBRjBcRIMCAYJ0A8FNgiyBAYR92y4BCxQBgTiFP4ggdYR8Jxsbg?=
 =?us-ascii?q?XKEfoUQhXgEgiKBDIF4gVEljkBIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYEugQKEXCMfAzl/gTB1SnctaQESF4EmghSBOgKBHQMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjXAjgjuBDgGWU5F6oQ8KKIN1jCGVOhozqmwumFqkWoRpgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD5B+zxInMj0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:pv3UR6C4N25aNBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDMg3mcFm
 mFKW2GGPveCNjP9f9p/a4vg8BkA7cTQytZjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/gGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE0dVlKGwWH44juaVMO3tT7
 sJFdhIrYUXW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/CJA3kOCurnL+aDZf7lmSoMLb5kCOlVAogeW0bIa9ltqiV8ZMzxa09
 0H/zm3LIxBCZNi65TG6/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVm+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:ZxQirK3Vg7krC59l+reGQgqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: 9a23:0BPr8m2bom/stUV1zBFK+bxfCOAuVlD97nTrYAyDM3x0U4PIF3229/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AXqsSdw9s1ENet9G/JZY4IcuQf9Vr+vX+JBEuqKQ?=
 =?us-ascii?q?PieiFbXx0HhuWszviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514195144"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 07:18:30 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 79B7B18000480;
	Thu, 23 Jul 2026 07:18:30 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 1CC28CC1611; Thu, 23 Jul 2026 00:18:30 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH 1/3] python3-cryptography: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 00:18:24 -0700
Message-Id: <20260723071824.1804061-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241778

From: "mark.yang" <mark.yang@lge.com>

NVD lists it as cryptography.io:cryptography and CNA lists it as
pyca:cryptography, so set both vendor:product pairs to match correctly
and precisely.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b721019e0b2ccbaa8de267e14b282c48a5a3de8b)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index fc5cb50b02..42e8c5ff19 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -73,4 +73,6 @@ FILES:${PN}-dbg += " \
     ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
 "
 
+CVE_PRODUCT = "cryptography.io:cryptography pyca:cryptography"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


