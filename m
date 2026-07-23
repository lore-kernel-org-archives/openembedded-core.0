Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58326C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:40:39 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19062.1784796032998071781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bZWI8k6z;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1201; q=dns/txt;
  s=iport01; t=1784796033; x=1786005633;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A8ln0Ci1mrPInrRLM01BbVfuLDiN0yPsnQfMWq1jXGs=;
  b=bZWI8k6zl2bWop6YU1ot21/ItsvHa6FQirrW4GGQZ2jKzmLhFosLBoec
   Sa33QZXadbOJGNJaSl9UAJe07LEExnOtObLypcUrWVfGj6P1S0pva8tRW
   QaM59d7nrJh5dxw8wCGzLU/0EozCyLcVsNnR14FWgO8zRv6wRTrFcH+Rd
   vpHGocmNnhbYGzvX01NGinLD5CgVqmz0XseAelffq0QuMhTTW/mBq4K0V
   lsuP5fXluPPpFnTIIUTRZy/P+XkK+k+416CS67+Vtf8VRJkWwHhqVMhjV
   i+cb+ehTEtzsrneCZyOBkr/VuL5qv24axFK26Ji6jBKj8+q0gFWOigiCy
   g==;
X-CSE-ConnectionGUID: Q7/yQjapTMeGBVIf9Wxd4A==
X-CSE-MsgGUID: JVPowwrWQhWSjfGsSCyYDA==
X-IPAS-Result: =?us-ascii?q?A0BBAgCb0mFq/5H/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAMRwUGCLIEBgygBgVTbLgELFAGBOIU/iCB1h?=
 =?us-ascii?q?HwnGxuBcoR+hRCFeASCIoEMgXiBUSWOQEiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYEdgS6BAoRcIx8DOX+BMHVKdy1pARIXgSaCFIE6AoEdA?=
 =?us-ascii?q?wsYDUgRLDcUGQQ+bgeNcCOCO4EOAZZTkXqhDwoog3WMIZU6GjOqbC6YWqRah?=
 =?us-ascii?q?GmBaDyBWXAVgyIJShkP4DsnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:O520gKgThr4V0cBj+n50PB3rX161NxEKZh0ujC45NGQN5FlHY01je
 htvC2qDOaqIZ2X8e4wjO4y+pE5VsMeGnNZrGwpu/ykxFnxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPjY8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUhpaFmOGNH7
 cA9JR8nUDGN1t2mzO6SH7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglH/cTRUr1S9rqss6G+Vxwt0uFToGIeMJoDQFZoFwC50o
 ErkwVz+HQ4AC+Wf9gGH/F23vcTerA/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:XxK0+awxvB6UhkEwRBD8KrPwGr1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: =?us-ascii?q?9a23=3A0boT+2ohL2kZBfEo2cmyW5jmUfl6NWzkzn7IH2q?=
 =?us-ascii?q?1JkxXabPEdk+cpIoxxg=3D=3D?=
X-Talos-MUID: 9a23:wHOgvgV6gxHKekHq/B3SvDZ9K91X2qSRM0IDvo49kNi1GQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514428786"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:40:32 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id EAC2F180001D4;
	Thu, 23 Jul 2026 08:40:31 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 8C594CC1611; Thu, 23 Jul 2026 01:40:31 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH 1/3] python3-cryptography: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 01:40:25 -0700
Message-Id: <20260723084025.1869414-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241791

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
 meta/recipes-devtools/python/python3-cryptography_42.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index c4573fa689..10ce753eac 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -65,4 +65,6 @@ FILES:${PN}-dbg += " \
     ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
 "
 
+CVE_PRODUCT = "cryptography.io:cryptography pyca:cryptography"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


