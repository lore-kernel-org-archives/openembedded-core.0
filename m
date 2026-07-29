Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD3BC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:56:27 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7249.1785315381871236585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gK3u716e;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1276; q=dns/txt;
  s=iport01; t=1785315381; x=1786524981;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WrE19vuHkGasRrj3WLngCPkyn1A/XcAC03pkV7snOBc=;
  b=gK3u716es2/3AC1zjWU9q2N+PHwVs2ZCVSCmBxmEGOUgA/EHp9Ssxa+0
   NKuS8UFEH7dB0d6fKDt5PaVgIaczeUaSkvKztb8NyueCjVlT9uPV202Yh
   QxAdKvaMP+nsmTOQWZ8ssyJ5mDLZwOGY0GGPq7CvnWMxaQipaiqB7uBly
   /mYFDY+3aFUSWG59PtEU+VJmFRM2/9XQy0ApwrRG0ItPSFnS8nna/5U0G
   Xd+4l17hcG7yj4IuRCScZrrgzL3p/gnjoaVNBDRV8tD4tnyht/hWqppdd
   xCjbtfpagPQZiyqXhngShvoHzLg/b4vIxYpMJdeLTRers/yHlAQUSYTba
   g==;
X-CSE-ConnectionGUID: Y5jJAjRoRlC+ioqKN0Z1/g==
X-CSE-MsgGUID: UguVEWNMSherMsBoLo8o1A==
X-IPAS-Result: =?us-ascii?q?A0BBAgDev2lq/5UQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAMRvhiCLIEBgygBgVTbLgELFAGBOIU/iCB1h?=
 =?us-ascii?q?HwnGxuBcoR+hRCFeASCIoEMgw+PIEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsHBYEdgSw/hFcjGTZ/gS91SnctaQESF4EagzkCgkEDCxgNSBEsN?=
 =?us-ascii?q?xQZBD5uB41vIYJFgQ6BRJUQkXqhDwoog3WMIZU6GjOqbC6YWqRahGmBaDyBW?=
 =?us-ascii?q?XAVgyIJShkP4H0nMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:k/fjoKxorqqjbSMf2OB6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUCx
 2ceUGyGM/rfN2KgeoogOoy1/RtQu5aHn9dkQFFur1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHBrP68x+NxwO2Vlt
 v0fMRMrNiLawO3jldpXSsE07igiBMDvOIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiRC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQugeC8boCIJYfiqcN9o0mFm
 E/52UHCAhwAEce1zh6ConX1r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:HzcvEaAcqkv8P9rlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3A1fkg6mi/4WIdsiMbxB5B/V1lXzJuQyDf7l7SGUi?=
 =?us-ascii?q?CDU0qSbqMannIyvojnJ87?=
X-Talos-MUID: 9a23:RvByiAhAZxYIUYNNgooCtsMpCch13YmRLmU2kZgcntKuMgh3azDEpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="790962573"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 08:56:21 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id DBBEE18000238;
	Wed, 29 Jul 2026 08:56:20 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 7918BCC1611; Wed, 29 Jul 2026 01:56:20 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-xmltodict: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 01:56:17 -0700
Message-Id: <20260729085617.2319214-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242263

From: "mark.yang" <mark.yang@lge.com>

The CVE databases track xmltodict as xmltodict:xmltodict, so the
default python:xmltodict vendor prefix never matches and its CVEs
are not evaluated at all. Use the exact vendor:product pair.

Note: Original commit was for python3-xmltodict_1.0.4.bb. This is
adjusted for scarthgap where recipe version is python3-xmltodict_0.13.0.bb.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2229426b729adf85780c23d38c85fc3cf090f6ba)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
index 9a308a29d2..33bf49b1fc 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d
 
 PYPI_PACKAGE = "xmltodict"
 
+CVE_PRODUCT = "xmltodict:xmltodict"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit pypi setuptools3 ptest
-- 
2.35.6


