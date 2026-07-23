Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AB2C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:54:30 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22791.1784811265094681888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eD47K1on;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1040; q=dns/txt;
  s=iport01; t=1784811265; x=1786020865;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ai2grKS81Td6+80mnDBjWUbSRyMb6FU4wuOGNv3dAkA=;
  b=eD47K1ons7Rg/XCiolSfnl9LfOLcWELeGFlwq3ADTjcIbbWzBy0aAuSM
   8w9RwooleTOxo1IFDVN8f1YOPh1w31hQ9fhtC4nsExJE0Wkb54XLOqu+a
   tie9SwHX+y9sy0Ehi+s3adN0gBztwZ+NBPu015GsdiqtiwpTo1D4CzLub
   orGg6CyujZptT5Dg18BUkGJvYTtAJwnjLdqMwMeyEtX39iuEcEuhJdlXC
   a4MRm8JesYku8JUTlKfgIlTnSb22Y8ijpSpqJ18NQmpFFf9wvvRaUGhIM
   PVo+CsIvAKA5gWeWNWUhDGXV0CivhrYvPdlSFPTTLB0Vgvjp7kXWlopyp
   Q==;
X-CSE-ConnectionGUID: P8aKkY0SReKJbD8AkfOQQg==
X-CSE-MsgGUID: cuuTD2r2QISMgI054h1W/g==
X-IPAS-Result: =?us-ascii?q?A0BCAgA3DmJq/43/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXB0BJoMCAYJ0A8JcgiyBAYMoAYFU2y4BCxQBgTiFP4ggd?=
 =?us-ascii?q?YR8JxsbgXKEfoUQhXgEgiKBDIM/jmRIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQwbBwWBHYEseYRcIx8DOX+BMHVKdy1pARIXgSaCFIE6AoEdAwsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeNaCOCOwGBDaYtgiGhDwoog3WMIZU6GjOqbC6YWqNyaIRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD91UJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:OpmQeq8FiWv8pvQNRBn7DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jEbUD+POa6IMGCjLot0O4m28RsOv5OEz9Y2TwM+/iBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kObYQ7+dcvOltD1
 t4SBGAkbR6kvtu5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+ohHDzdDtwo1OOrq1x6G/WpOB0+OW0bIGOIYPVGq25mG6Tu
 3/60z7jWCg7D/mQ6GLYrnL1uajAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:HYO91auChXom/JBOGrC0tCy97skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3ApzFq32v0SzAkjyeU/2oa120q6IsdInT+z0aIGHW?=
 =?us-ascii?q?1KkRjZO28SlG3wZprxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ActhDCA7TPHmz/Zm1SwleMq7/xoxj/rmSJBoXy6w?=
 =?us-ascii?q?ngOyLFHQtZzfEs3O4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514333777"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 12:54:24 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 18A5C180005CD;
	Thu, 23 Jul 2026 12:54:24 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id B505ACC1611; Thu, 23 Jul 2026 05:54:23 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][master][PATCH] python3-pip: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 05:54:17 -0700
Message-Id: <20260723125417.2198795-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241835

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT is not set for python3-pip, so cve-check can miss or
misreport pip CVEs. CVE-2026-8643 is reported in NVD with pypa:pip.

Add CVE_PRODUCT to match the NVD product name and report this CVE
correctly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pip_26.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_26.1.2.bb b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
index dd1895ed55..393a746456 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
@@ -28,6 +28,8 @@ SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "f49cd134c61cf2fd75e0ce2676db03e4054504a5a4986d00f8299ae632dc4605"
 
+CVE_PRODUCT = "pypa:pip"
+
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
 	# Keep them only when building for a Windows (mingw) host.
-- 
2.35.6


