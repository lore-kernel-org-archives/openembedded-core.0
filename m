Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F743C531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:40:59 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19066.1784796056062296565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kosPXfm6;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1140; q=dns/txt;
  s=iport01; t=1784796056; x=1786005656;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7OYYiZsKxhsyx/wWQION7wY3w7YGVulNu2lB8KDNYpk=;
  b=kosPXfm6ehVEuXUuyv4ZdlyBoHVjN1n2SNLAcD0cCy+E+YXkohU5aiuZ
   Q9vYNSscAoxoGPlKwIjKhct74/9uYI97Yd4sVGiEF5xnL89vtKc2Z1HlX
   7/8Dl+bOQQqrjxbmgcz7P9gNh872LqKW2vIvWKKLuaIgZOq1szjngOFGV
   iPSkbQpyKfHUVvmlUHX04ezj94Eb+Gymewtu2FCzJlspnWKLvDiYt/Pt5
   R+K8FBaAthDc+6R9GEZuO9DDActkofzUAG8yl37Ta4HTcCJblSDHFVJs/
   HSK7MtmICrNgg3A8j/7lHF+LbOnoF3DeYMnNbc6ARKjLTcbAT4b53w6AS
   w==;
X-CSE-ConnectionGUID: WKnHiTQeQMWOaHQH/S42CA==
X-CSE-MsgGUID: dds/84ZOQcy/Eixj/svu7A==
X-IPAS-Result: =?us-ascii?q?A0BAAgCb0mFq/5X/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgFGMFxEgwIBgnQDwVKCLIEBhH3bLgELFAGBOIU/iCB1hHwnGxuBc?=
 =?us-ascii?q?oQIdoUQhXgEgiKBDIF4gVGOZUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYEdgS6BAoRcIx8DOX+BMHVKdy1pARIXgSaCFIE6AoEdAwsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeNcCOCO4EOllSReqEPCiiDdYwhlToaM6psLphapFqEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ/gOycyPQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:zrR81qMFg8HJvw3vrR3ylsFynXyQoLVcMsEvi/4bfWQNrUomhGcDz
 mEdDD/XPqyOMWf8KtEiPd7k8kkGuJ+BmIMxHXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWUsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68pNCmE3AbQVw8NIJmhuz
 NxfE2xXRTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJI8leuvgFH0ciZTrxSeoq9fD237kVUtiee2aoeIEjCMbclZhQHI+
 lDhxm/oRTwbJN7Y0iSYrVv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7NV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:AMJZf6vNQeU2DFGkw+TlPoax7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A8lFNZGpUkKemmQnRK/cd6bDmUf8GdF3c8E7dGmq?=
 =?us-ascii?q?HLm9JcZ3ScgPK04oxxg=3D=3D?=
X-Talos-MUID: 9a23:uDTetAUHvm91SMDq/DPgn3YyaPVP2q+/T20MgZdBoNeZagUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514173255"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:40:54 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id D8251180001C1;
	Thu, 23 Jul 2026 08:40:53 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 84DF2CC1611; Thu, 23 Jul 2026 01:40:53 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH 2/3] python3-ply: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 01:40:47 -0700
Message-Id: <20260723084047.1870072-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241792

From: "mark.yang" <mark.yang@lge.com>

NVD registers ply as dabeaz:ply, so the default python:ply vendor
prefix never matches and no CVEs are reported. Use the exact
vendor:product pair.

CVE-2025-56005 will then show as unpatched; no fixed release exists.

Suggested-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb80fef9a76649fb1144408fbc7e2903439cd556)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index a05bd6702d..0855c871cf 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -15,4 +15,6 @@ RDEPENDS:${PN}:class-target += "\
     python3-shell \
 "
 
+CVE_PRODUCT = "dabeaz:ply"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


