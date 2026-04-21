Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E273CF89242
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20465.1776765441106174988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bOBUi9F/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765441; x=1808301441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7L84de5DAVZr3k5hBPcUGQFtX7MydKOPCi5z1zL9qTA=;
  b=bOBUi9F/oJ9JJfnK4foFf/29VeeePcbbl1aaCC35hQG+TGzP0zXYIwDy
   yJxp7R5BDX+CbKPPlYrc/qrcu1xrxB4O6APtH6EBQGDIEgg+PD28Z7irZ
   sFi/8kBzwG9hl7bSy3ukkFMHdole1NAxaA1H7snSta4H2Tn9atKh2sFYd
   A7xvBKV+M280/RUsh4XiRAHLu4wyDtmRH3jK/gf+gBIs5r7gH4HOt3HJD
   2vi14RK8I2vjSbwkQZSJr1lkks2/u9lRAt5vSApd4G/IhK31Za5DeKGh+
   0Vkgvi5dkYijgQ1qOCvr8VifOqivLpVsMs8OzsKXL8WGb+mLW9TXBOjys
   Q==;
X-CSE-ConnectionGUID: Ns30qnUDTCSuCJRYHeySmw==
X-CSE-MsgGUID: d0CZ7x/3RKqUbcDh43vHlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="242133483"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="242133483"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:19 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ABCE41000348
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 59EEF1800D65
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CF62614000E6;
	Tue, 21 Apr 2026 09:57:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/49] repo: upgrade 2.61.1 -> 2.62
Date: Tue, 21 Apr 2026 17:55:52 +0800
Message-ID: <20260421095559.1856-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.61.1.bb => repo_2.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.61.1.bb => repo_2.62.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.61.1.bb b/meta/recipes-devtools/repo/repo_2.62.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.61.1.bb
rename to meta/recipes-devtools/repo/repo_2.62.bb
index 456f3ad556..769c7e16ef 100644
--- a/meta/recipes-devtools/repo/repo_2.61.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.62.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "5d88972390295e229ee940992cb33ce8cfd39cd5"
+SRCREV = "ade45de7707e25d8a11b3beedf754caa44aba34d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


