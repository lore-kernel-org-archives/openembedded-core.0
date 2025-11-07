Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C73CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:59:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7262.1762505938384033523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T40z7P7K;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762505938; x=1794041938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pU1Bd1gOiyCj7zkdPfTv6TiTDvu2ZfBOHndKgowHWJA=;
  b=T40z7P7KVZA7v20ETA956rOlqdYHDkG9ET2ErZSRkf1hg/+Nz6xDTESc
   K4MZWBQ9FDlJLJJgZaqPMAYWeUVyPLzEK0OPhOrEcR6KEURySo2RK5pKd
   1ApG50eaEY5ZPfnrJMaJCGR6971We97kUAWBzBRN8gZQwbEv1GoHTzXK3
   W9ltZnagdUM4/itdscHuuRvHbmyozJlJzvHSx2E5RsHO9SKsYRJJJYzUP
   +mMOajzElKUDw2SH+G3X5N7gz7puWsWrUhF9M+yZK55VO11BTPT49oqcp
   luDRCbRkRecj4y9stkM9f+BoH2P6FWJ0O6V6bEoyCFrA3w9r8inIGRFER
   g==;
X-CSE-ConnectionGUID: YkpVzz5xRTCm65C9B2mFvQ==
X-CSE-MsgGUID: M/5bwW/qTVmoHEMX5eYDbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="222207543"
X-IronPort-AV: E=Sophos;i="6.19,286,1754924400"; 
   d="scan'208";a="222207543"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 17:58:56 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8FFBB100298B
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 08:58:56 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4CF4CC00219
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 08:58:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id DF0211019049;
	Fri,  7 Nov 2025 08:58:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2] libedit: upgrade 20250104-3.1 -> 20251016-3.1
Date: Fri,  7 Nov 2025 16:58:50 +0800
Message-ID: <20251107085850.1619-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226023

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20250104-3.1.bb => libedit_20251016-3.1.bb}    | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20250104-3.1.bb => libedit_20251016-3.1.bb} (76%)

diff --git a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
similarity index 76%
rename from meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
index cad24d8d65..2ea75bba87 100644
--- a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
@@ -13,13 +13,9 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac"
+SRC_URI[sha256sum] = "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
 
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
 CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


