Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A123FAD41D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 06:11:38 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13616.1776924688566230291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 23:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I4To7TVR;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1066; q=dns/txt;
  s=iport01; t=1776924688; x=1778134288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KrDVKjjPJkm8D2aAEpazVg9koSA2z3xFVyQItrtG6kc=;
  b=I4To7TVRCacm8iwrJQ6Cw8Qdsd/lQg/ga+3PLJ1pHba5LXW1sfly/ue4
   ysXIAfkleZZE8s4Idcg1C3nhKBOYLW7bK+ovqPloKv1dy/KCosC3DGWbL
   Ehc+VOhY+76bsjydWGKOt9ExsS98w9uTudoZlrsCGg+tsux4WQBNlN6vU
   8CyjDOBkh1OtnkiUuJwGGDnw+hGUaAV21mqoa4t6SWTTMhneJYo32iL5r
   ZNpX3DTraIbrhVmtw8+v3zJfFZqjgxS/tyKsDaHh8WZyTyaH/hjs4c3yk
   JSYLBMeXo5rd/x5l2+FdUv1kgdGj4yWBfPDX9otj4Y/N+kzYrsHsf8Tog
   g==;
X-CSE-ConnectionGUID: CQf7XMWHTCi0BkzvCSa2LA==
X-CSE-MsgGUID: lwXBrBAUQi+mxO9TqZhpHQ==
X-IPAS-Result: =?us-ascii?q?A0D+AgAMt+lp/5X/Ja1RCYJZgldxXkNJlksDkUqMUIF/D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUGAo0sAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgEYAS0QIDErKxmDAgGCcwOydIIsgQGDKAGBV?=
 =?us-ascii?q?NsmAQsUAYE4hT+IHHSEeicbG4FyhH2EF3mFdwSCIoEOgX4igkeKMEiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFLhAltaoELgyqBNnQDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4owIA+CIweBDoFHUlCTAJBCgiGhDgoog3SMHpU6GjOEBKZnL?=
 =?us-ascii?q?phYglihGQsQTYRogW8CM4FZcBWDIglKGQ+RcMVlJjICPQcCBw4Ck3ABAQ?=
IronPort-Data: A9a23:mJh7K6lVfFRN0JeWf+WlgyTo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWWiHOaneZ2qheognatvi9RwDvMSEndJiG1Bp/H82FltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpIsfnb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaYh9LlHJF5uy
 dcZcBoOfA6ovOvs5JvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3Fb4CFK4PTFJ8I9qqej
 mbZz07jKDgnDd3czCqio061tO/XvRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:J4XV6amf6IG7GHIn7Lg/lQZjLNHpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:8xqeGmxjdGJOrU+OjbzwBgU/I856Qlji7Ev7IheSCnR3Y4acE3u5rfY=
X-Talos-MUID: 9a23:GeEXEguKxSDHbpiAac2ngC5SHt1CypmXCQMIgbJXh9C2NTRQAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,194,1770595200"; 
   d="scan'208";a="728971925"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 06:11:27 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 964DF180001FD;
	Thu, 23 Apr 2026 06:11:27 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 04BA7CC1288; Wed, 22 Apr 2026 23:11:26 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH v2] apt: Add CVE_PRODUCT to support product name
Date: Wed, 22 Apr 2026 23:11:17 -0700
Message-Id: <20260423061117.134013-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <e225fccde9314e31a8efa5a171afa97780f67332.camel@...>
References: <e225fccde9314e31a8efa5a171afa97780f67332.camel@...>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235739

From: Himanshu Jadon <hjadon@cisco.com>

- Keep both the older deprecated debian:apt alias and the active
  debian:advanced_package_tool identity in CVE_PRODUCT.
- This preserves completeness and avoids missing CVEs in case older
  aliases are still used in NVD records.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
Changes in v2:
- keep deprecated debian:apt alias alongside debian:advanced_package_tool
- update rationale to retain both CPEs for completeness

 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index d2dfe48e9a..871564baea 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -148,3 +148,6 @@ do_install:append() {
 	# Avoid non-reproducible -src package
 	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "debian:apt debian:advanced_package_tool"
-- 
2.35.6

