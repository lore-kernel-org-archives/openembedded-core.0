Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D891CCAC591
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.13158.1757495855255985999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P1NUY3Ed;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495856; x=1789031856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6D6chgpk4SSy2b5Rqtq0/2YaGNP2zXWFfjSwuyi4TWA=;
  b=P1NUY3EdSLN0zo1x8JN9MdcZFb72cvtEO6sF23T1ss0BzKWTllfdicE9
   0hucTGroRY1gUIsrM0CAmdzszFTk5enav4oyqKebcP/Ha5Di0cgdZ0L9M
   E2Rkj0SsC8o+FrkQDfGkE+NjRQDbVFG0EqrtizoJLJwf0hMC2THLFrgu5
   O7+sjjLXsgaY9Rru/gBNQ6zGP3I0ayY+xZZygfUZFDCo+ZspUunqFOlSc
   W4bSXKiJGJ/mrCs/4LGZIp5cf86suI+insdJF8M79hWxYRgMfVWb5vnBv
   jN8MORLD69oIfhrnPJ+8jSb6CitPkegO8ixSGkdmwyTD2/ORKLCrAr6Iw
   A==;
X-CSE-ConnectionGUID: Fuuk+p2WRtyFyS464a3aMQ==
X-CSE-MsgGUID: rz7+sv9FT720VuuT1mH5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="215907020"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="215907020"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6628D1C1C718
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:33 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 205928D65D0
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 73A4E20034AA
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F5BC1A0073;
	Wed, 10 Sep 2025 17:17:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/40] libunwind: upgrade 1.8.2 -> 1.8.3
Date: Wed, 10 Sep 2025 17:16:22 +0800
Message-ID: <20250910091646.998-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223167

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libunwind/{libunwind_1.8.2.bb => libunwind_1.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libunwind/{libunwind_1.8.2.bb => libunwind_1.8.3.bb} (96%)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.2.bb b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
similarity index 96%
rename from meta/recipes-support/libunwind/libunwind_1.8.2.bb
rename to meta/recipes-support/libunwind/libunwind_1.8.3.bb
index 6f7168b5df..bc1a108e42 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://malloc.patch \
            "
 
-SRC_URI[sha256sum] = "7f262f1a1224f437ede0f96a6932b582c8f5421ff207c04e3d9504dfa04c8b82"
+SRC_URI[sha256sum] = "be30d910e67f58d82e753231f1357f326a1a088acf126b21ff77e60aab19b90b"
 
 inherit autotools multilib_header github-releases
 
-- 
2.43.0


