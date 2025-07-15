Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CE8C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2987.1752566908464855995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sshtc/3N;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566908; x=1784102908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7PFYr4SObi8PD2X1L2drJVwU2eG02/pTIW9m/NBNVt4=;
  b=sshtc/3NxfWGAPCIIGZS68KEIROfB/rY5uQHEhFwNwsx3xhBDtwDsFRe
   yW163+IIzxL8tnmRwiRT/PmSYGVKzZzzVRM/SqhYIYMetfuppD2lBDRve
   W3TaxkF9S9wgNGdiYMDt7uUAlspYjUDdvtYpKAuzKMoZQA5CaLBsxVjba
   SuWdYoOS2ISJOBo5doY7B4xaygaIpl3BnDG4+vNaxhu1eLI8ios3FVUaq
   gmuy5WTkb3/xVtd1/hNTaF4Y1DG45DfDDTOytC4SvFOBvK2P9EFHU5DFB
   wbCLoBFCMstN8ufPjiD/BAxv4MruNB3J+r0Pt3q8A8wAQ18eiOs+YNkcE
   g==;
X-CSE-ConnectionGUID: QdfZXSQRSj+K+JsIpVmJbw==
X-CSE-MsgGUID: Hi7nuwBKTXOvCYAlPfASUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="194841282"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="194841282"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C357C1000366
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1714818009DC
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8DB191A0073;
	Tue, 15 Jul 2025 16:08:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/19] gi-docgen: upgrade 2025.3 -> 2025.4
Date: Tue, 15 Jul 2025 16:08:02 +0800
Message-ID: <20250715080819.622-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220271

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added:
- Add online attribute for devhelp index
- Include type data in the field template

Fixed:
- Use normal font size for enumeration values description

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gi-docgen/{gi-docgen_2025.3.bb => gi-docgen_2025.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2025.3.bb => gi-docgen_2025.4.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.4.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2025.4.bb
index 8651ab8167..19aacb765e 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
+SRCREV = "0517026e0bf51b3776efa4689da44ea0c99e343e"
 
 inherit python_setuptools_build_meta
 
-- 
2.43.0


