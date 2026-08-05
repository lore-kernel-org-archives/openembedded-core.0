Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA57C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:09:58 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37139.1785924594865876424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SeMwo8dT;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1323; q=dns/txt;
  s=iport01; t=1785924595; x=1787134195;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z/pBk4nn3+UJvlT/TIhfdWtGJxZm8IJ1CyWno7vNV5c=;
  b=SeMwo8dTgh1h52fbnYMPPzt86ewlXzPhWtINPja7U8uawQ6Cr3oXz6n2
   YdxJ3E4iBUBePL7zlGC4TWLxJz5/eAlnb1Rg82VHFlLiK/5QxlUVUu5Yv
   wJ0YF+VywvSTptt7231F87xE5BB24iOMZJ1hPQ5x224Kh6tmnQFcUMG0q
   x+xlSNzhuwSYa+U14mtz5O7Y1gZREorCnkMEzc/nSOiwKLUR+Jlc5lKH+
   /G5DXlqpztfEmnDGkRGPbDmEa8PhVqwQmWfq0nxxCBehGH4c9gnHap0Ug
   bTAHWtybTUdMgtSzisqYV+P+nbuSGmZVQA+WaywDrSeclEvZXYeoYN3FX
   w==;
X-CSE-ConnectionGUID: uoIWqi5XRGGIwRFZCbVYoQ==
X-CSE-MsgGUID: VgtWmWQRSfSwG99ndTEMrw==
X-IPAS-Result: =?us-ascii?q?A0BBAgBzCnNq/5MQJK1aglmCV3ReQ0kDk1YBoQ6Bfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBY1oAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02AUYwXESDAgGCdAMRvWKCLIEBhH3bLgEFBhQBBYEzhT+IIYVyJ?=
 =?us-ascii?q?xsbgXKEfoUQhXgEgiKBDIFykF9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBwWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCgnpvCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB41oIIJAgQ4sgRFsLzKlRKEPCiiDdYwhlToaM6psLphajgqWUCuEPoFoP?=
 =?us-ascii?q?IFZcBWDIlMZD5c2xyYnMg4vAgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:gXCO/K2oKP/gNnUd3vbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2EBz
 2RJD2GOPK2Oa2ejfN50O97k8kwHusKGz9VhGlFk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24sbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGEUYXApQZp9ZNLk5v6
 sY2GhsHUCGEvrfjqF67YrEEasULJc3vOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEuojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZj+myaIaEIITXLSlTtniXu
 l3DwF3DOR8hK/POmDyJzl+JnPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:IhjqMaFUKnSHPYAapLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:znpA5mxc04JnO4IC2RrYBgUJHeEaa3yA/E3/DG6nM0hbY7ereFiprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Avr7s+g5d6YD+LUukgXSTgfwLxoxW7LiRDX80q64?=
 =?us-ascii?q?IgNarZH12NwuwqS6oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="797049205"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 10:09:54 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 65BD618000151;
	Wed,  5 Aug 2026 10:09:54 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 07F5ACC12A6; Wed,  5 Aug 2026 03:09:54 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] shadow: set CVE_PRODUCT
Date: Wed,  5 Aug 2026 03:09:53 -0700
Message-Id: <20260805100954.2617500-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242853

From: Peter Marko <peter.marko@siemens.com>

This will remove CVE-2016-15024 from open cve reports.
This CVE for is for "doomsider:shadow" [1].

It will also remove
* CVE-2018-16588 (suse:shadow, [2])
* CVE-2019-16110 (blade-group:shadow [3])
which can be verified that they don't affect Yocto shadow.

[1] https://security-tracker.debian.org/tracker/CVE-2016-15024
[2] https://security-tracker.debian.org/tracker/CVE-2018-16588
[3] https://security-tracker.debian.org/tracker/CVE-2019-16110

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2946e238d2a3947c1a51c4ac1c86c8284f68e4cf)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 40e6ab0b30..a308ea00d2 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -36,6 +36,8 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
+CVE_PRODUCT = "debian:shadow shadow_project:shadow"
+
 inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL="/bin/sh"
-- 
2.35.6


