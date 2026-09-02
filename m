Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158CEC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:09:50 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6163.1788329387884020496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PD5E7TGw;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1517; q=dns/txt;
  s=iport01; t=1788329387; x=1789538987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LOevGNsd9ICT2lAnzN4eybZnvC5k+wLniFTuPf24ifc=;
  b=PD5E7TGwRoVx66aOrXc/6Hl0UyGQLI5oTGADeHAYnpaaiS3l7y7YREve
   DU25JPVZOXcxnSPNVt19lx8LSnrGnIN0xOdALSv82Se+hliyX1xP58Vht
   bOTF8jZoHOG32r2FXLVceaOjXMjPuHACnWkLT4781N2c9irXLzFJIf4ET
   Y5LZWWQbl+OktGwJNfJPwWLCjhnpbwInyshIE/w223EJmVjNJ6vkwi2Ic
   I9+cdgsvKYye1prSKIOdKe8C2do3R3jYxS2QX7uhW9GtyVKI08kByOs+Y
   j5vg20ja88XWh7skEEl1z+dmWWlUDIlf8k4in5OgQC+8Lo2H8h5DBJupe
   Q==;
X-CSE-ConnectionGUID: qOJQDeqhSimHu7heWvpkyQ==
X-CSE-MsgGUID: bCVA1Yw9Q1uBHrDBGY99Mw==
X-IPAS-Result: =?us-ascii?q?A0BFAgDHvJdq/5EQJK1aglmCV3RgQ0mVXm+eG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo13AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBoCAQMyARgBLRAgMSsrGYMCAYJ0AxG9dIIsgQGDKAE/AkNQ2zABC?=
 =?us-ascii?q?xQBgTiFP4gidQGEfBcQGxuBcoEVg2mBBYFcAQECGIIThXgEgiJ6EpNgSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKINBIxk2eIEJXoErK?=
 =?us-ascii?q?WABEheBCYIIAoJUggUCAUlDDgdHUwknCgsYDUgRLDcVGQQ+bgeOWR+CT4EOL?=
 =?us-ascii?q?AR3gVOlVKEPCiiDdowilToaM6psC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?i4KC4NggX+DFMcmJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:dyJy2aoArAIkRQSzk8YcrR6QnpBeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmHPKuKYTakLoxzOty/pE9XuseDydBkTAFl+3o3HnlG9+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrS8Ek35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v9QI1hi+
 OUYEzEITg3ch++J3qq4W9A506zPLOGzVG8eknhkyTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtKYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUozQFZ8FwBbJ/
 goq+UzzKS8zbe2AmAPc71iMnMPlshKqCacNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:YHR5T63eDDctSVgLnoBN4gqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3APdG2YWr4/wKborfRwthobf/mUdkCUETxwW7QGE6?=
 =?us-ascii?q?9KXs2SLCqV0eT6Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:kLdLdQra1tccsqoutFcezztJCu4x0rv/MRkQu7Ucl+OrBH0hHijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,257,1779148800"; 
   d="scan'208";a="828286890"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Sep 2026 06:09:47 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id E2FC418000479;
	Wed,  2 Sep 2026 06:09:46 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 784C7CD02B9; Tue,  1 Sep 2026 23:09:46 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2 3/3] python3-py: ignore CVE-2022-42969
Date: Tue,  1 Sep 2026 23:09:43 -0700
Message-Id: <20260902060943.2931635-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260902060943.2931635-1-dkelaiya@cisco.com>
References: <20260902060943.2931635-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244889

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
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index 906410e9bb..f850be1163 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
 CVE_PRODUCT = "pytest:py"
+CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it and GitHub withdrew the advisory"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.35.6


