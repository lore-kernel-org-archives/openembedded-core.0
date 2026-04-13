Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B886DEBFD3B
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:16:18 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.269324.1776078969743040869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OiBvp5nI;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1015; q=dns/txt;
  s=iport01; t=1776078969; x=1777288569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=obuoHqFadGpVt0ub4mDS1TfFVmLuhbFv7Zk9MbOUm9U=;
  b=OiBvp5nIK+HkI9juzIFsLC8jBf3IQTzCVrKjfwjYD1rNu7DL/oMHQemi
   2SSlW8Kb63IGTh+Uq7cqGMCOJeVna6nql2zaxOAjL0gvlUKFK4NnvjS2K
   bQja2fWYS+hdc2AWKvOluHQjvMcP+Uw6xFrgRU6mAycxHCBZ3KPDJ5k2A
   IQBQHftAjpaEIrtN3AyHjjZgCtVqqVnVUb//s2Ohzka14NWrn0woiv0O2
   wz0Ir1vRyQ1MBlRFptiirGtsh0RP+UnMqVedSKjpM2Osh1dMGhUAQfemj
   Q21YikaecLJpf+3bLkJGN9cSsHjsAl1DcZd+rUQQ0L4Xw/Il5fWErVv73
   Q==;
X-CSE-ConnectionGUID: QuX3De/7T6uMb1ADHqFzJg==
X-CSE-MsgGUID: 6tMnIuUmTp+UNj9ug4fuCA==
X-IPAS-Result: =?us-ascii?q?A0BBAgDRz9xp/4z/Ja1aglmCV4FPQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQeNLAImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwKCdAOyC4IsgQGEfNsmAQsUAYE4hT6IHHSEeicbG?=
 =?us-ascii?q?4FyhH2ECoEGhXcEgiJ6FIF+hWeHckiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYFLhUd0bYETg2yBAgMLGA1IESw3FBsEPm4HimojgjghbZZUk?=
 =?us-ascii?q?XihDgoog3ShWBozhASmZy6YWIJYogGEaIFoPEaBE3AVgyJSGQ/TTiYyPwcCB?=
 =?us-ascii?q?w4CkXOBfQEB?=
IronPort-Data: A9a23:12i9eKkrrkD/oe/9kwdgh+ro5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMDGiBbqqMMWHweYt2Pdu+8RlUsZHSz4IwQFBoqX0wHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpIsvnb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbQFyr1bDCYRy
 aIFDTpURzyjnsyk4r3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3Fb4OJJY3VGJsF9qqej
 jza2mLYHywfCMTc9ByHo2+j2uHStgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1qt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:ZiEmn6rtz+XFz3lyPoIEzWwaV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:Y0mFZGwsUvSet9jJ9JKBBgUtB/B+XnCak0uOPmqyUE9FaKS7W32frfY=
X-Talos-MUID: 9a23:VD1sZAnYTL6nKtKh5EcDdno8KOJuwrmTDXwV0qgguZiZOnB+Jhy02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,177,1770595200"; 
   d="scan'208";a="714797568"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Apr 2026 11:15:56 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8BEB0180001D0;
	Mon, 13 Apr 2026 11:15:56 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 32FE7CC1288; Mon, 13 Apr 2026 04:15:56 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH] acpid2: Add vendor to CVE_PRODUCT
Date: Mon, 13 Apr 2026 04:15:52 -0700
Message-Id: <20260413111552.1809426-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235098

From: Himanshu Jadon <hjadon@cisco.com>

Added `tedfelix` as a vendor to `CVE_PRODUCT` to align with the
product naming defined in the NVD CPE database for `acpid2`.

Only a single CPE entry exists in the NVD for this product:
 `cpe:2.3:a:tedfelix:acpid2`

So far, only two CVEs have been reported against this CPE, confirming it
as the correct mapping for CVE reporting.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-bsp/acpid/acpid.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index ba954563b6..0d32249a61 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -17,7 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/acpid-${PV}.tar.xz \
            file://0001-Replace-stat64-with-stat.patch \
            "
 
-CVE_PRODUCT = "acpid2"
+CVE_PRODUCT = "tedfelix:acpid2"
 
 inherit autotools update-rc.d systemd sourceforge-releases
 
-- 
2.35.6


