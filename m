Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB910C9EC67
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:26:32 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30346.1768213591438009364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jBNsNctY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768213591; x=1799749591;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5SEpzoiUWTJSRXW2pTjvwJK6xRvpJowrU2dN1Qw8O/0=;
  b=jBNsNctYZYlbbMgc4Nd/fhDsxwpd6hryzaJcw9KeWf2gT+la3eVwV9TO
   KyCdKz1h+PwXt+Oz+4TlDwu4dSRRnC+4tX/ZLUoDXgxdHkuV2BUwkJFXa
   dNU9WDvGNzc9RxcOHdRJNcPfJ1Y+pZfWbNVf57yhVzvCSFlbk9YEKSyl+
   f7fIaigqMXfHVeqDYN0TYENXHKt16sqaqOWSN8vbk+z4lKiB1UCDGGut0
   KsMJORt5TIOHIOyOn+s18kF8j8BiAmdsPqECFmlmARaIe98L82flYR2QA
   WAmmYTJdMpn4//tuV+3MBw5Ge9IghHdu521t7KEY/VvghjbSJ/SQkzJZS
   w==;
X-CSE-ConnectionGUID: yFaULa4qSr6WHGnvzKAI1A==
X-CSE-MsgGUID: /Dxb/23OT7ehQitPINs6Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="225490111"
X-IronPort-AV: E=Sophos;i="6.21,219,1763391600"; 
   d="scan'208";a="225490111"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:26:29 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BBA7A1C1C700
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:29 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 74D71C00887
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:29 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1D06E18005CC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:26 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-sphinx: change RDEPENDS
Date: Mon, 12 Jan 2026 18:24:54 +0800
Message-ID: <20260112102454.7235-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112102454.7235-1-liuyd.fnst@fujitsu.com>
References: <20260112102454.7235-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229202

Change RDEPENDS from python3-roman-numerals-py to python3-roman-numerals as upstream name has changed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-sphinx_9.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb b/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
index 00384b40e9..f2b108694d 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "\
     python3-packaging \
     python3-pygments \
     python3-requests \
-    python3-roman-numerals-py \
+    python3-roman-numerals \
     python3-snowballstemmer \
     python3-sphinxcontrib-applehelp \
     python3-sphinxcontrib-devhelp \
-- 
2.43.0


