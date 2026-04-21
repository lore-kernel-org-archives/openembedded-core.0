Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380B6F89234
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20404.1776765413934295610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SwfTRLIe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765415; x=1808301415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EZF81g9Umu5w2FI8KPhrQfTAZ/64+dP+dMwrARPdrxQ=;
  b=SwfTRLIezjshtn5OkEdS8dSsOungMx7axULoAnIDlZWmCW//cc150EK/
   FGhJ95EXG4GBkhCUK1IQmYjEaOwZQPNSJW+/afX5A7pTn/SP+v4r1DkrO
   uD/YRYB6ywX1ci5goXWflouhlbXNIdFl/uIXjrYBxAKAfOQRGgiiT/jMQ
   LwqYHCb9c8UAmS6aYoitnclRI7AgW3t+vXn8b4OvcHzt4ox24roWs3/av
   1hMiLR6SjhAEQl9NH7MZ92IKpMhSzqJKIOiEWvFPury/Kcl58wToux1aY
   9yX/ZWaBSNqYc0isYC6avlXRR7cJQX+ERWkwkBYv/XjjPjZF7rc0wM+dX
   Q==;
X-CSE-ConnectionGUID: PxfkcqE2S4agVNXrAbIa3Q==
X-CSE-MsgGUID: VfKzJHLCROW3Chif7lvn6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630076"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630076"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:53 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 645FD42A335
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0D10110003B9
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 88DA9140025F;
	Tue, 21 Apr 2026 09:56:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/49] python3-dtschema: upgrade 2025.12 -> 2026.4
Date: Tue, 21 Apr 2026 17:55:35 +0800
Message-ID: <20260421095559.1856-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235633

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- New PCI bridge properties
- New linux,dmcryptkeys chosen property
- Relax simple-bus schema to have unit-addresses with chip-select number
  and offset
- Avoid backtrace on missing $ref. Instead the missing ref will cause a
  validation warning.
- Print the property name on decode failures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2025.12.bb => python3-dtschema_2026.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.12.bb => python3-dtschema_2026.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.12.bb b/meta/recipes-devtools/python/python3-dtschema_2026.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.12.bb
rename to meta/recipes-devtools/python/python3-dtschema_2026.4.bb
index 5ae67805b9..cbd459c151 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.12.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.4.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "327fdf5d5ec60934cc3eddab09e68be2310173a33e15eee24dffa89787706db7"
+SRC_URI[sha256sum] = "10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.43.0


