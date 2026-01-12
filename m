Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A258DC9EC69
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:36:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30202.1768214153136072160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P0+tGtFT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768214154; x=1799750154;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JSTZgOPlZ0G4lVooeZ9ibcdBpyZuGMKbsoT0MrkGEsg=;
  b=P0+tGtFTI3akimw/fOqCha/qSrDqepOic5wXTQ8f7fHf3MjrTWVfaICh
   zSSvmpe62KuvPdoKvrsiIFeF5FOedDv34GW3PqM7xs5UgfPrMK/PQzTE6
   EIYipVRn2JFody8MWFx+tiOl+UT5AZZk7H1iQN+8O7y6QvA5apR0+ZTaN
   wyM60712gKPT2d6dItW7bqn7hXAi9DP8qArY1JzJ/Rrn/HrjeniplVUvC
   sIER2LbvZmpeVvRwPZoCjEDX1Sm8IrclXDiQzjYDptvk6LcL9w64Y4dtz
   zgaotxUaC1wNMQo8QSw66bXygFv+KohCWb1CsMdjfh6wJijvxTd18wFPW
   A==;
X-CSE-ConnectionGUID: WCdshkBLRxWMHQs+Udpd2A==
X-CSE-MsgGUID: WeFgEncjQWatROZlmBrVTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="225465819"
X-IronPort-AV: E=Sophos;i="6.21,219,1763391600"; 
   d="scan'208";a="225465819"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:35:52 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 670C41C1C700
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:51 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1B52BC00549
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:51 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DC40C4046BC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:48 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2 2/2] python3-sphinx: change RDEPENDS
Date: Mon, 12 Jan 2026 18:35:39 +0800
Message-ID: <20260112103539.7305-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112103539.7305-1-liuyd.fnst@fujitsu.com>
References: <20260112103539.7305-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229204

Change RDEPENDS from python3-roman-numerals-py to python3-roman-numerals as upstream name has changed.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
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


