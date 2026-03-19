Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BD1108E1CF
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:20:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7943.1773915631548567094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=phZ+132Q;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915634; x=1805451634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gxqqn4M3R2LsvuE/FtDIgveL8XgD0djux6wNIUW+cyc=;
  b=phZ+132QnrVqT7QTj6QPsqHYQyTA2EuDzy7WvCMGm7yESL+DgIcJDRR7
   1qvMgjOmvKZKCgmBnWgqSEa9SqO8rZePiJyZHtQSmiIK4O8EOjUkrqXgx
   bzSipg/8EM3ZLHjIkehONDWDWC6vXF+xmBnRwl3Yq4FwFgzAisRlcI+fG
   yJaAqbiVTpAALdRyhZHSID4akS7nclQ8XBJrNLrhJZ049SoGtRz5WcUt8
   YAo3xovF1pv1aK/zwABgnZwaUY7w6VWUneF198kPH1sdjx1i1Rhmm7xCy
   eQwn/YhVusmBZI2zfgDNED/3PkOmTM6ZtSP6Jl86ko6ChXCSsmNI+j5Lv
   g==;
X-CSE-ConnectionGUID: LaBjfUiXTnWRz/05pL8u4A==
X-CSE-MsgGUID: sbPfD4oJTaOUiUl7sjsx8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233833400"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233833400"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 88CCD1C166C5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:38 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3A21618002DF
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 49681101E530;
	Thu, 19 Mar 2026 10:15:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/40] stress-ng: upgrade 0.20.00 -> 0.20.01
Date: Thu, 19 Mar 2026 18:13:30 +0800
Message-ID: <20260319101332.2067-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233507

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.20.00.bb => stress-ng_0.20.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.20.00.bb => stress-ng_0.20.01.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.20.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.20.01.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.20.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.20.01.bb
index 9302a21db5..2db9796cab 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.20.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.20.01.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "dcd2902c888c1eac1d958785b13cf232f46894a0"
+SRCREV = "00559dcb1bae3ef12295a1420683094a7d1389e0"
 
 DEPENDS = "coreutils-native libbsd"
 
-- 
2.43.0


