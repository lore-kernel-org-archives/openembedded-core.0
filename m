Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2C4C61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:25 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6066.1787722219985098699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b4wJ+l7q;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1446; q=dns/txt;
  s=iport01; t=1787722220; x=1788931820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aV0NYputtjJFObyV/+2LwbSLqu/lqh6EqUZQAhZ7Z9E=;
  b=b4wJ+l7q46PoyKes3DW1aQMC/ErrJrFZk45X7UYHtW/zOpETPERFXivZ
   AGe9LueTySy7zr3CV5J134x5ck8DLZJMjHVMrjOycJ8fvJ4tXQMsO0fER
   MYKUjU/VA6XvGuVTi6yn0EvU5Px9oPEXZpzOt98YGicnNBRzCwP035jg2
   24dzKUPWZXyknoH7d5DyVibWr/AMX1XqJ73VNsdiab69OoPxAVW3m4zmv
   Q9ozIGJJOdhu9ko01SL6E3GIoWwwAfpGRUSkaJYO5Y/CpanKXCVAUcXjO
   ozf+Vd6YEDfr7Cxl+L9Ik5piXW/Qlj5l+WjJxFC8kDloRXTgTiK5g1xBX
   w==;
X-CSE-ConnectionGUID: ckjUGMd2SVGf/o2Bpl95WQ==
X-CSE-MsgGUID: dnahTbbvQZaN650KkuYakA==
X-IPAS-Result: =?us-ascii?q?A0DDAgB8eY5q/5QQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO+VoIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0c+CxgNSBEsNxQZBD5uB45rH4JJPVEqdXqmNaEPCiiDdowilToaM6psL?=
 =?us-ascii?q?phapFqEaYFpATqBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:EPC+WKzmb3tC9IwSrDt6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUPm
 2cXDWCOP6qPN2T9KNklPorkoB9X7JaDztRkSQpkpFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEo1P7A33+otOl9h+
 7sfchoVakHeuNvjldpXSsE07igiBMDvOIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiQC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi3aYCPIYLSG625mG6Uo
 GvGw27zHCgoPfrBlGKm8W+dj+zmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:WXuRWq1n+30TVdT6XNhZIgqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:sFnooW8+Km80xhckIqeVv0UXGP0KV3GH90n/LQi/U0xxTOzIdmbFrQ==
X-Talos-MUID: 9a23:XeDZkwlVHx8lQlziBW2odnpuMs5o366kFnk/mLNY5pGnNjFBMjS02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821223606"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:19 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 0D98B180001F6;
	Wed, 26 Aug 2026 05:30:19 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id A73CFCC12A8; Tue, 25 Aug 2026 22:30:18 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-mako: correct CVE_PRODUCT mapping
Date: Tue, 25 Aug 2026 22:30:18 -0700
Message-Id: <20260826053018.51633-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244290

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:mako" mapping is not used for the packaged Mako
source and causes its vulnerability records to be missed.

Use "makotemplates:mako" for its historical NVD configuration identity
and "sqlalchemy:mako" for the current NVD dictionary CPE, NVD
configuration, and CNA affected-data identity.

Backport note: this applies the metadata to Wrynose Mako 1.3.10 rather
than master 1.4.1; the older release exposes applicable unpatched records.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76fc2046d3f251af34dd04f8fdcfc0c1d6016380)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-mako_1.3.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
index 2d937dc184..76e8cb8f77 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
@@ -10,6 +10,8 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
 
+CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
+
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
                   python3-misc \
-- 
2.35.6

