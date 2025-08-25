Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9254CA0FED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.31262.1756093889098033038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MGrWeQ9J;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093891; x=1787629891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zRhRFCpbhgvM2FcAHE8ifi9/i6FBv5rvdsVyi69NtRQ=;
  b=MGrWeQ9JWSSutPIc0TpuQNESlt/540l/CmuzMFXldnfSrbio3r/Ptjz9
   oD/haB62ITLtWXZO0DzMmC+AG3YPwaPQfoye/EvgF5kQAH3JSawzBCONi
   7JMXl5ly90mmSURN45i4vNaGtr+Tn3NWNuYb+AavDIlFN1KEo5AGRVYDu
   aeLtwF90akI/XiRR9D+ZC73oyoIsTw1tazoybPxWqk2ZlMCF0engghQ1m
   9Ubg3F4p8mZsXoHAvesdf2WJGfZXHEDHiILD1FZNGXsig8W7g1v2vd8Qy
   nLjr3zKz3qinBnsUPXF0cEIiFeD4JDKr80Xi8bZ5sXBYSEsADKu3cHkGw
   g==;
X-CSE-ConnectionGUID: dKznpFZcQeS31BGlwxTETw==
X-CSE-MsgGUID: 3i28oTbURseOYm3QuiRbyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="197870816"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="197870816"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2F7CF1002B83
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:31 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D5EB5C0043F
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id BB15F20000E8
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 305591A0099;
	Mon, 25 Aug 2025 11:51:25 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 09/10] python3-hatch-vcs: upgrade 0.4.0 -> 0.5.0
Date: Mon, 25 Aug 2025 11:51:08 +0800
Message-ID: <20250825035109.797-9-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222400

Changelog:
==========
- Drop support for Python 3.8
- Officially support Python 3.13
- Avoid a deprecation warning emitted by a dependency when using the tag-pattern option

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-hatch-vcs_0.4.0.bb => python3-hatch-vcs_0.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.4.0.bb => python3-hatch-vcs_0.5.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
index ac70295f45..011e28eb81 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
@@ -8,6 +8,6 @@ inherit pypi python_hatchling
 PYPI_PACKAGE = "hatch_vcs"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7"
+SRC_URI[sha256sum] = "0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


