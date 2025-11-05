Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4656FCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2996.1762386448160184465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hQp1z1aT;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386450; x=1793922450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dOXxkwOvE/qkJNtRaGFadAF3+6iayrnSPtR5dz5uG3Q=;
  b=hQp1z1aTb0xsZeYiGiMsrkhom0vKX6nNhV1bLwJiArWahs4YXNyruohg
   v9rowMUI8xoYmKhTBmL/w0jzVINyrm6vS54WKO5hIB4sCj97cIx7WXhBh
   hkhduJAt6DCnfbSnhgCc94Zp13zPb/bxZ20U3zzc25dxFqhYgaTkv0Bm6
   9w63YNJ87Eme75OKqvdwHSJqL8K+XoWYbWkWO0vewSQqKvoOW370zqpCO
   ulY0PAguqch5CPwKDcLdJ9F2qBmM0f4l5HvykmQRG8MqWiKbVMpGtJUY9
   LnrNkT7zi+beAvMo/OGsSrGt0TJjlWiA5cewfroy+lGGW6jkZJLElgCpl
   g==;
X-CSE-ConnectionGUID: bY4IJ/1uQa2/PkSNxMNDhg==
X-CSE-MsgGUID: mBVemRp+SxaA+SmAuUwtfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197067419"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197067419"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:30 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 31BDCC006F0
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:30 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E754B1400627
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8C09B14005B7;
	Wed,  5 Nov 2025 23:47:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/29] dos2unix: upgrade 7.5.2 -> 7.5.3
Date: Thu,  6 Nov 2025 07:46:50 +0800
Message-ID: <20251105234712.446-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225937

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
index c3803f457b..ae69110c39 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=49ec74e0139712398b9ddb06d824929a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0802ff257bfeb9bb07ae4e4de04e3223"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
+SRCREV = "9df44447947a7b311c62ea0383be94080edcaf85"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.43.0


