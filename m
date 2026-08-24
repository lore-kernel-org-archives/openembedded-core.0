Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A309C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:25 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14075.1787569335821884674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EtUPNKfx;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=989; q=dns/txt;
  s=iport01; t=1787569336; x=1788778936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y4AWmyBm+sjig6o45Pe5q5qE3bES8rBlTZ6ztcRge9U=;
  b=EtUPNKfxMHIeeTQQPc8RPqO09FzpppWoocVtvRPC4+wue1S+7OmG2dV9
   v6h2o2SoQTSTndVzR+rPUljIOTk5JSXPupp6s6lTdxp7BoDyYAplkKl7t
   BpFSSFn6yF905EGxS4SA0GaK/fuEdvPA7xfLI7T1O5dgrhpR3Ol2rtQxn
   JSI5u9wTbbnQVZKhU+gADmD4smohNa2o+N8EotDxNz95RP5Ru2/fW2enb
   OeJVvnF34AHBZ9J+lyZthfV8BQXkhbT6UfNO1nQxTdmIjqmn43qAAgmW4
   SpKOycrX/FXf/NBFl1HwyV0Q1DrC1M1WhgZuzylrbHfVkxeoXjfHjtbhX
   A==;
X-CSE-ConnectionGUID: cN8YdP7DTjuuagh92xkRdw==
X-CSE-MsgGUID: 1Z4mATBQRBWS3lQSH+AvSA==
X-IPAS-Result: =?us-ascii?q?A0D2AgBsJIxq/5IQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwIBgnQDwkyCLIEBhH3bMAELFAEFgTOFP4gihXInG?=
 =?us-ascii?q?xuBcoEVg2mEF3mFeASCIoEMk1pIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBgWBHYEohBAjGTZ8gQlegSspZAESF4EJggcCglqCBQIBSUMOB0ciC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB45eH4JHPVGBH3oWOqVloQ8KKIN2jCKVOhozqmwumFqkW?=
 =?us-ascii?q?oRpgW4BNYFZcBWDIglKGQ/eXCcyPwcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:tYR3X6uiCbTlw2nbXzCW7cdYPefnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTiBPvfZYDHzfYx/OtvjpxtUu8LUzIVjGgU9/y82FC5DgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ9Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8cAnMG12q
 tAkKi0QZx+D1rimw4i3Vbw57igjBJGD0II3s3Vky3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgl/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoXUGJgNwRvEz
 o7A1z3LXhQzCPam8xC6ySmov9Tv3grlY6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Gra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:w/ATeqj9pqxchxasi0Dd/rC/x3BQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:Lrozp2FhTC0Kj+e5qmJs0h4lFvh6XkHf0WrZLE/pU3ZqcrGKHAo=
X-Talos-MUID: 9a23:Ke5Vngvt/RJ2hYXsxc2n3QM+Me5UyZ2UIn82ypE/gOnHHDJLEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="816550754"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id B48231800016E;
	Mon, 24 Aug 2026 11:01:58 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 5A9BACC12A6; Mon, 24 Aug 2026 04:01:58 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] u-boot-tools: add CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:58 -0700
Message-Id: <20260824110158.26007-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244091

From: Devansh Patel <devanshp@cisco.com>

The current inherited "u-boot-tools" identity has no vulnerability records even
though this recipe builds host utilities from the U-Boot source tree, so
source-aligned CVEs are missed.

Use "u-boot:u-boot" for the CNA affected-data identity and
"denx:u-boot" for the NVD dictionary CPE and configuration identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
index 9e7a178310..441d25bbc9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot-tools.inc
 
+CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
+
 SRC_URI += "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch"
-- 
2.35.6

