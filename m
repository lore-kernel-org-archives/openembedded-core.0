Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2110CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.31265.1756093892321100716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WxueuNmL;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093892; x=1787629892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWRFhqD1ShG0cUdpfuhA8UkMC2FSzGN3FfV4RvfaYzA=;
  b=WxueuNmL5W5h0l3QIcqNXQYo2wU+S8NiU3gtvx4A1H5yGyEJ/vEhuvvQ
   hR8hKV0We6hTQ9P0PRkcXy/C4MAsBtZK+6HkXzD7JzPhZzLRjGoy/Twwt
   YGalZEifZXKRD3B3dk4HjHhF+0sBTiQKLGHt/9u7FOopyoqxSpEbBLvMe
   SyDD4/f5rl5NknrrekywKRC4v+0nQ/tjBsSDibQxXl4GkvzWlfvT3D2hn
   tHSgeJDiY+0ul+V+XbtTSf4yjEOLrwg3erTbxd42SfMQ5yoq1I7YRYHAV
   8sgABvPt3NPAU37WAOlgtSIvURJ110HALzxdyZNWG9cxP8FKwjCkFoj+X
   w==;
X-CSE-ConnectionGUID: S4uMWJ00Ryec+lqeSz1H5w==
X-CSE-MsgGUID: wunLxkBlQP+T8FZKaZZxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="189399715"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="189399715"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A64861000340
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:30 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5F3C61800E9C
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 3462818001D7
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1140F1A008B;
	Mon, 25 Aug 2025 11:51:24 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 06/10] python3-click: upgrade 8.2.1 -> 8.2.2
Date: Mon, 25 Aug 2025 11:51:05 +0800
Message-ID: <20250825035109.797-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222402

Changelog:
==========
- Fix reconciliation of default, flag_value and type parameters for
  flag options, as well as parsing and normalization of environment variables.
- Fix typing issue in BadParameter and MissingParameter exceptions for the
  parameter param_hint that did not allow for a sequence of string where the
  underlying functino _join_param_hints allows for it.
- Use the value of Enum choices to render their default value in help
  screen.
- Fix completion for the Z shell (zsh) for completion items containing
  colons.
- Don't include envvar in error hint when not configured.
- Fix a rare race in click.testing.StreamMixer's finalization that manifested
  as a ValueError on close in a multi-threaded test session.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/{python3-click_8.2.1.bb => python3-click_8.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.2.1.bb => python3-click_8.2.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.2.1.bb b/meta/recipes-devtools/python/python3-click_8.2.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.2.1.bb
rename to meta/recipes-devtools/python/python3-click_8.2.2.bb
index 0bbc7e8488..9710e8a71c 100644
--- a/meta/recipes-devtools/python/python3-click_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
+SRC_URI[sha256sum] = "068616e6ef9705a07b6db727cb9c248f4eb9dae437a30239f56fa94b18b852ef"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.43.0


