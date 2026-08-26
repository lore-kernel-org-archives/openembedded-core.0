Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44684C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:10 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7458.1787730845210793848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Vb9dKnxg;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1332; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lsrDlccJTqH3l+3PLR4sI2D/J5+Ibh99SqURHfTOeXY=;
  b=Vb9dKnxgRrcaAtMiTN3kZFO3+UySgC3wSIrh/kdaiQPKMTzfq6PTtJ7S
   1AlOuS4awr5vQmfhP8dmYgbku5s4o6Ig3BuquSyTebZgy2/O8+Jjid1Bs
   YVE7SOS7dZiVlxpoUpzW9EyW8eosSP0vR014E2WWuId0NlUtJk4WWIPu1
   WlR/EJk4o6RhLAdJg4+g3SFi0ys2dnyZ63lbqYU3577TUOGKMG/kn1Jue
   uNmpvzRGvnfBtvVpRBK8sMw2+dyDgzzp69i71KyyPkGK9zkVY9K86pb8B
   S1cnEwxtnexpqYbcIg7N8S8NayvZukJIXIOi/eFRQ3MDsSIzakTm7PMjY
   Q==;
X-CSE-ConnectionGUID: uOIc5F9ZSKWqjiTT/CddSQ==
X-CSE-MsgGUID: 7Sm7H3zzRlioxYV4llrQAw==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/40QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO/A4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CKFcicbG4FyhAh2hBd5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0c+CxgNSBEsNxQZBD5uB45rH4JJATxRGYF/lDyReqEPCiiDdowilToaM?=
 =?us-ascii?q?4QEpmgumFqCWaIBhGmBaDxGgRNwFYMiCUoZD95cJzICPQcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:0XauRKoie7m6rSNJS/cZyZRGP1xeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmFbqmDNDf1fYojPYi28kIH7cSHndJiTAFtpChhEykR+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vtQIGoT2
 60qExMydxKCu97x6763cdA506zPLOGzVG8eknhkyTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtOYH49tL/Aan3XfzBGoVSOpbIf6GnIxws327/oWDbQUozQHJ4KxBnC9
 goq+UymORRFFIeN2wCB83W8t9GTmSfhYasNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YdLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWjuYkD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:x5CTi6ywZ4QalkoVDhvqKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AQ4EEy2oId3hXFUeegaTtHDTmUd0CU3aA4ibiGGy?=
 =?us-ascii?q?HEGRodIHSYlOcw5oxxg=3D=3D?=
X-Talos-MUID: 9a23:e4pYhAtGwvQjCEMt482n2wpna+cz8baUDEEKgaQ4582ALxVZJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821372728"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 7D7AC18000B75;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 23598CC12A6; Wed, 26 Aug 2026 00:53:48 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] perl: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:48 -0700
Message-Id: <20260826075348.64033-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244322

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
perl:perl is the active NVD dictionary CPE and configuration identity and
also covers CNA affected data using vendor perl. larry_wall:perl preserves
historical NVD configurations.

leont:perl covers authoritative CNA affected data for the same Perl/perl5
source, including CVE-2026-15534. It has no dictionary record.

This changes the generated identities to three exact CPEs, but the frozen
sbom-cve-check database leaves the 61-entry CVE report unchanged, with no
current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/perl/perl_5.44.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.44.0.bb b/meta/recipes-devtools/perl/perl_5.44.0.bb
index ef76df7e0f..6cf88e7175 100644
--- a/meta/recipes-devtools/perl/perl_5.44.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -25,6 +25,8 @@ SRC_URI:append:class-target = " \
 
 SRC_URI[perl.sha256sum] = "3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3"
 
+CVE_PRODUCT = "perl:perl larry_wall:perl leont:perl"
+
 B = "${WORKDIR}/perl-${PV}-build"
 
 inherit upstream-version-is-even update-alternatives upstream-stable-release-point
-- 
2.35.6

