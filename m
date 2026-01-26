Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C768CCF65FF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:39:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18501.1769431138933688421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W1xIgSkG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769431139; x=1800967139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=17NqkBlw5LnuJFJ0dRCJxtuh0aZJ8kLpVrEU0GYMAb0=;
  b=W1xIgSkGivMQSuvkLfsyIiRlXJD+Gy817hybrSvMHfa4YrdP3BZuf5nw
   tXcWwEByLUYMB8LrT1qFawuiBPZ3eciwJ+qun5VMQcFb0fnGwv7ZdfZBQ
   2tHqqgVQcMIZ9Wv+cguoQKoRvo2ytFf76Dw2hForOQUfZC62bRVsKoMRN
   lpCAJ9uXmQGFFcoay8D/l0t+Mj6aetEWfdYQbWorMxmwpcsE7ji0SsoBs
   9OmYv//11pa7GMmvB2Nr9A1k5VqB5aYKOBiNSyQr+7T6CzoTzvLP2wWy9
   8wUVEKEN2OE60gLhuV28lPngN+3MyVnafasPfC3t1AD7HeobPx7SFe7Rg
   A==;
X-CSE-ConnectionGUID: J8LaRD3OTe6Z6yNfiVntlg==
X-CSE-MsgGUID: IBZ4kIoRS9G4uTnb/97ZMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227138847"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227138847"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:38:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 65E87CC7FB1
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:57 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1AA6F18000E4
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7E93E101905D;
	Mon, 26 Jan 2026 12:38:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/17] python3-sphinx-rtd-theme: upgrade 3.0.2 -> 3.1.0
Date: Mon, 26 Jan 2026 20:38:41 +0800
Message-ID: <20260126123844.1052-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123844.1052-1-wangmy@fujitsu.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229998

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_3.0.2.bb => python3-sphinx-rtd-theme_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_3.0.2.bb => python3-sphinx-rtd-theme_3.1.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
index 03e7a50125..05e2c097c5 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += " \
 PYPI_PACKAGE = "sphinx_rtd_theme"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "b7457bc25dda723b20b086a670b9953c859eab60a2a03ee8eb2bb23e176e5f85"
+SRC_URI[sha256sum] = "b44276f2c276e909239a4f6c955aa667aaafeb78597923b1c60babc76db78e4c"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


