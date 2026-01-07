Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87CECD5852
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3128.1767781910606488188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eofLsf+r;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781911; x=1799317911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vr7IiEn4ojrBLJVPv+UtWhuJpEPWYXju4TbDRrkUf/A=;
  b=eofLsf+rEyJ+gg9HMSw0kaEtVO9vvTENd4QzVCFohf5SRDy9viy0tgyF
   AuncaHrPhWUaN5L51j2EDPid7xedTtOdgiq/wqa5i1+2K0zAzbF92ePVt
   xfp+XMWHd+cPcB+Px4VItUDpk35gIDpY/CKDxRh5ZmbqENeSNnIzPUG9Q
   3bM6zZzVw4I5ft75LETPFD73f9/njO1nOa26PuuXUdUINl0djIrXBOp7x
   GJghPptINR+ErwGBHVlfnWV8syO95rXsdVIMtB34wTTgZ2wv30j/KadN1
   KuAYRzK30vNQabh6C2IWh9O6E/zLkqQylkJxWt37MvlquhUc0J4M9Grkj
   g==;
X-CSE-ConnectionGUID: SHTRC+8xT9qEtwfOUkTirw==
X-CSE-MsgGUID: ngvcnxnUSzCiRM3ud+muIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="224467893"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="224467893"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1DD9B1000359
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C46351C0CAEC
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 181A3101BB60;
	Wed,  7 Jan 2026 10:31:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/15] python3-testtools: upgrade 2.8.1 -> 2.8.2
Date: Wed,  7 Jan 2026 18:31:01 +0800
Message-ID: <20260107103102.458-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228984

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-testtools_2.8.1.bb => python3-testtools_2.8.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.1.bb => python3-testtools_2.8.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.1.bb b/meta/recipes-devtools/python/python3-testtools_2.8.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.1.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.2.bb
index 29a28d80da..c51fac2242 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.2.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "da5102b02b6d9924607d31dda6deb26a085a78afa78826bf44e3b8717fc77208"
+SRC_URI[sha256sum] = "b5c73332456ff54152062d47a58bc4f15f8e23514afec4e84775af124fb7db43"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.43.0


