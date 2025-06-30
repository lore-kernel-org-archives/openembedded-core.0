Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384A9C83038
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35180.1751274813445394848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Evuim/7F;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s6CD8e+WgUSEcyLUM+UsLusVLEKPAw7ucRY6RiCRRBU=;
  b=Evuim/7Ff32PzpVApY7lf3svcOsDFpkSOA1DsksWapkrYM/zfhrsYek6
   gmoOuB0xmM9XvpF9HEDjP9An07o7H5pR/6UrnmwGGLor44PSaxWkzeaCI
   f3dHZ8ji6yDuQUZQho9hEGl9pRgyw1w6gyc8j6AIVjL2eSH7r7sDU74/q
   pSzYyJNraTXa1pw1rtOMMcHyP3+E2FBiL0YosPs8G8qDMJrCISUSBeV6X
   hBpn9F7XDCCscKE8mxJK93lJ+T7n6I8I7/BzY2nROdqAksfO4gUPbzKzt
   yiJ0A6LIk9ZfyP4743tJA9ZkAMMhOU3WXua+z8YRdGCHqhORpp4lTk5NM
   A==;
X-CSE-ConnectionGUID: 1FdcmKEWQvSsOX9tAsCuyA==
X-CSE-MsgGUID: 9TU4W6P0RjqX0CbYI3VYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204573508"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204573508"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id EA67C42A30C
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 69BA918009C3
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE846BF3C9
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:29 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D0091A0073;
	Mon, 30 Jun 2025 17:13:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/37] pkgconf: upgrade 2.4.3 -> 2.5.1
Date: Mon, 30 Jun 2025 17:13:04 +0800
Message-ID: <20250630091315.1897-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219487

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_2.4.3.bb => pkgconf_2.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.4.3.bb => pkgconf_2.5.1.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
index 9695e37bbd..12ca075b5d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "51203d99ed573fa7344bf07ca626f10c7cc094e0846ac4aa0023bd0c83c25a41"
+SRC_URI[sha256sum] = "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582cfffd658b0a50c243"
 
 inherit autotools
 
-- 
2.43.0


