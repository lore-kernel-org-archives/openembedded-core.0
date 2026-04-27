Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6006FF8850
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 05:14:54 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35933.1777266884861305994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 22:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kHcP5iFG;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=840; q=dns/txt;
  s=iport01; t=1777266884; x=1778476484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IllrFcbCBDK+5SlnXJfqHUIy7uaS2naTSep2ZvebvDY=;
  b=kHcP5iFGT/koLWu3Exnp7/0YqwKGisHGL2YsEvmRetMDq5gRoflSw7Ey
   odmUWu2FXgFXZR+TbcSgbcZP+W2byjz1+1pF70s6xEjoE0/ptzDyfGlGo
   HsUvyDuWznLlQbqPCx2jBO3608MDos3Thlmsc7K03pbRH4hs5IWa54qWK
   9VjkUGFaey1LwmHGQInBAjjJd8qWq+5P/yGbCtCliQNbGQFu9at4pbdYy
   VeeWgD/gts9Xa3R/xy0oDcD6g5HP/iMkYdq5tEqDoI84OSnyvSU2KSP2P
   Q5IrUZseET80ywGoOAS0zq/knhMfUfqY7aR09KO296zPDCNseoe5mOJxt
   Q==;
X-CSE-ConnectionGUID: D5nuYKb2TdCqJEGdlr9Gdg==
X-CSE-MsgGUID: CZDFZPzwRjmCd//ZfEKlNQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgAz8O5p/5P/Ja1RCYJZgldxXkNJhFePAwGhDYF/D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUGjTECJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGXScPARgBLTAFAiYCLUSDAgGCcwO2I3qBMoEBgygBgVTbJ?=
 =?us-ascii?q?wELFAGBCi6FP4MZAYUChW4nGxuBcoR9hBd5gw6CaQSCIoEOjxRIgQIcA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgUuDVW1qgQuEXngiGgMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPQFuB4o0IA+BOHMBgQ2CaaNCgiGhDgoog3SMHpU6GjOqay6YWKRZh?=
 =?us-ascii?q?GiBaDyBWXAVgyIJShkP2mEmMgI9BwIHDgKTcAEB?=
IronPort-Data: A9a23:HN+qLqICsJqI97BTFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS12YEn
 TFND2nVP/2KNGL2e9kjPt6w8hlVvZXRm9VrSwYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9h2Qqajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1CUUcrDK4SoNp7Knhs2
 NMULCpcQRyM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo+nu6kgX/XeDxDo1XTrq0yi4TW5FMqieWyaIWEJrRmQ+1+rGq2l
 FrU4F77BzoWc5utxxem9lSV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOzIEhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:eyYz+K066rz/PvZM5dvLmwqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZAmPH7P+VMssR4b+OxoVJPsfZq+z+8W3WBuB9eftWDd0QPCRr2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3ACK0VtWj9gkZfjh1F7oG2+OviVTJuXiDb0UbzKRW?=
 =?us-ascii?q?EBU1wapC6RVuKqYxonJ87?=
X-Talos-MUID: 9a23:Qu6t0QmHHfV1nGSEbdkNdnpJButG0Zy8F3oPlL4K/I62OwFTPxGk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,201,1770595200"; 
   d="scan'208";a="731570794"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Apr 2026 05:14:06 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id F382E180093BB;
	Mon, 27 Apr 2026 05:12:15 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 9E2FFCC1288; Sun, 26 Apr 2026 22:12:15 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH] apr: Add CVE_PRODUCT to support product name
Date: Sun, 26 Apr 2026 22:12:09 -0700
Message-Id: <20260427051209.1541980-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 05:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235980

From: Himanshu Jadon <hjadon@cisco.com>

apr is tracked in NVD under apache:portable_runtime rather than the
recipe name apr. Set CVE_PRODUCT accordingly so cve-check uses the
correct NVD product identity for APR.

No additional alias was found to be necessary for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-support/apr/apr_1.7.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
index 13fa5daa3c..0057704989 100644
--- a/meta/recipes-support/apr/apr_1.7.6.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -135,3 +135,6 @@ do_install_ptest() {
 }
 
 export CONFIG_SHELL = "/bin/bash"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:portable_runtime"
-- 
2.35.6


