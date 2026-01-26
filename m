Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EE7CF65F4
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18471.1769430950055996512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W3vStZQ0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430956; x=1800966956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5LU/k15xw1yB83timTge+s7iWr3BEkzb9reRkyolFE=;
  b=W3vStZQ0bw3vQnZ7wrubJYYml0kG8Qm/3tAhbaEuVz5P/S9kami9/AA4
   J72qlIEYc2oY0tQSlDYE129Y171xBbPNnlM6QN7QBSHcRY9AEPU0eQf4a
   uVKPtsZD48hX3Zz+z08nMRrt5uP/VO0zNsNHPFOcAvxqahVO4a4S8fUT8
   w1SBiHH+dirUbYIt2KZRv2+dZLzgO+EyBQIPSTHixtY1MOH5ILYTRPMdn
   6KbdaLNNGfW8nEsAtu3wXkJiO0RNe6tAnaWTNtpDrQKufmXvMty5YH/Xn
   xXkHNjO83SZS3LZlv7E+2jWwXGC3jmST3eYfa6jJiDE+NsgPL5OYRg+fG
   Q==;
X-CSE-ConnectionGUID: PKLJ/A3pT1+dOfBMhM7ROA==
X-CSE-MsgGUID: Vorzi3A2TpaaVIZyrOKG1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227076654"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227076654"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:55 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 7B3231000348
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:54 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 306371C00140
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 857CE405ABD;
	Mon, 26 Jan 2026 12:35:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/17] python3-pdm: upgrade 2.26.4 -> 2.26.6
Date: Mon, 26 Jan 2026 20:35:08 +0800
Message-ID: <20260126123517.1020-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229992

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.26.4.bb => python3-pdm_2.26.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.4.bb => python3-pdm_2.26.6.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.4.bb b/meta/recipes-devtools/python/python3-pdm_2.26.6.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.6.bb
index de4a7618d4..72f6415dbc 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "d1030f6bd8e9449b5791e7768f1a856cc54617ee7b00f56fa1a843a84ad77f6e"
+SRC_URI[sha256sum] = "771f95b9a484f9eb34dcf8d851be6ff95333e4f3c46189f9004cfd5cc2e925f9"
 
 inherit pypi python_pdm
 
-- 
2.43.0


