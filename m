Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5867C61DD3
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:11 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7454.1787730844575562933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EjhKNTPQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1128; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZI3YpHsY6eW9j/Nf10JafryOZomVtQ6L3P7jgy47AnY=;
  b=EjhKNTPQJovUyjN1EDQSAENUjXRr/tCVy2cSi3TywVZeSYVFbzT9S9hi
   TWoxFjXpS/HpBhVfYEEABHY1DRAgumBEIbDZTIhSbmdmGHuYtWvaVcGuY
   l51CWWNvK2Q2vzgpBUu/ek3bQtRRYnEhgLk0q19X8b629VeBhLdd3pUC7
   jldtZaI4JAqV6g2MvLUDUxsIA84g1uvDGeGrjSbX3jCZIv5sZt7obyO9H
   B8AlMhcbd6U30giorWShbPKn6zMCNtIWwgPo9Ysfm7txaAjA7bWSmDb5r
   rNGi+rjoczBViM9uY5Sr2nXvWZbadQgQtFMMBbjeGWlcsJ4nysV3CjC4V
   w==;
X-CSE-ConnectionGUID: yrWKwLqlQ725vg3zOlnYhg==
X-CSE-MsgGUID: 6sYII19vSVeEx6hnvNWFVA==
X-IPAS-Result: =?us-ascii?q?A0BCAgDnmo5q/5MQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBGAEtMFxEgwIBgnQDEb4XGjeCLIEBgygBgVTbMAELFAEFg?=
 =?us-ascii?q?TOFP4gidoR8JxsbgXKEfoQXeYV4BIIigQyBeJFqSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBCYIHAoJag?=
 =?us-ascii?q?gUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSQE8URkSgW5Qk2uReqEPCiiDd?=
 =?us-ascii?q?owilToaM6psLphaiRybPoRpgWg8RoETcBWDIglKGQ+XNscmJzICPQcCBw8Ck?=
 =?us-ascii?q?3EBAQ?=
IronPort-Data: A9a23:D8NbKKJQtmAqpGzfFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS0TEEy
 jEbXjjUPK6ONjP2L9EkaImy8RxU65TWnN82GVAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1/Fn4VIqkB/t8oWzxQ+
 qcKDzQLXxCM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzM3wsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhiem3YYuEJY3iqcN9wF2ph
 0OfrnrCPBw3JIKfzySjzVySr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOEin1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Z/Hnf6xvnpbsWGuzJ1/NKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:6enUOGGwT+tbzXfKqmJ27nE3BeQ8dkSClirOLBSqLmJveb2aHAo=
X-Talos-MUID: 9a23:W9KaogXgfLk2e1Lq/GH3tRBDbZZ22JqjJVBTkZMYnfaqCwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819299979"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 06DDB1800017E;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 98565CC12A6; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] libssh2: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63656-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244320

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
libssh2:libssh2 is the active NVD dictionary CPE and configuration
identity, and is also used by CNA affected-data records for the packaged
libssh2 source.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the 25-entry CVE report unchanged,
with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/libssh2/libssh2_1.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 0eb263b017..1178c8ab2f 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
 
+CVE_PRODUCT = "libssh2:libssh2"
+
 inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += "\
-- 
2.35.6

