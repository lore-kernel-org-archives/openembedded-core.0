Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D41CCCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3003.1762386459354797779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fk65zyfp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386459; x=1793922459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIaedG+6lHoHX2GOPR8bjppURQRr7llssC9cnNOq3d4=;
  b=Fk65zyfpuxHl9OPN57qxCGcZQxzOX9lCjgQ80JdRbbVbv23JGgRNOxwp
   d/0WXY188RtxcXVAf/0oFBRSc4fcxXcXMZfwwf8J+Suq36fTIMBs5L8dy
   F/qKe/+ppJvyMZpULwQkkaV0+ch8S0q4h8RL8NbvYiZpfK/efHxNIgnUC
   ILBLmXq6esT5/df6Fc9I+Q1QdnxE35En9K/ld4/F9cDd0gP/iyyhYSkLS
   fC60HtEtBnxl0wZG6i4cJLKWRODI7/h08CVpTg2SZWhUWwQRSi6penNUT
   b5vZ4LHmKxm7RWbQtxdK0gP19BiIUsRmA9c563zAVQtuuYSnDQcXGjVH+
   A==;
X-CSE-ConnectionGUID: INTbptw1Tsa6BmzFpOgEkQ==
X-CSE-MsgGUID: 9wQ6GwfiSimSBafYq7C+oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="206185322"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="206185322"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B48051002BBE
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:37 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 68F69C00213
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id F144C14005BB;
	Wed,  5 Nov 2025 23:47:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/29] git: upgrade 2.51.0 -> 2.51.2
Date: Thu,  6 Nov 2025 07:46:54 +0800
Message-ID: <20251105234712.446-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225941

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.51.0.bb b/meta/recipes-devtools/git/git_2.51.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.51.0.bb
rename to meta/recipes-devtools/git/git_2.51.2.bb
index aeb8c54aa0..14d5a3d60e 100644
--- a/meta/recipes-devtools/git/git_2.51.0.bb
+++ b/meta/recipes-devtools/git/git_2.51.2.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "3d531799d2cf2cac8e294ec6e3229e07bfca60dc6c783fe69e7712738bef7283"
+SRC_URI[tarball.sha256sum] = "9b44c2b337ec838e10aad42439d390963904449710d30c9e7e4ba449f45da98f"
-- 
2.43.0


