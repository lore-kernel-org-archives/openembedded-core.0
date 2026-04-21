Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFCDF89231
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20408.1776765421870945355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HeC92iWf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765424; x=1808301424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQx1e75tjM7U6UJziQ2NtkAPofsUWNLjrg7CxdWAPDE=;
  b=HeC92iWfLdDpE6L2VtXMXjHmf18Fk+dUr0Wta2UZpGPtdEg//hY9KjfK
   bhOgm33U4OCxbj0QyDdpPoQ9iUiEicFgQgI4ImilBMYgHa3Xk+tCdlT2Y
   GkY0Eh/4cREZTdh3449dn8ZxvyXitr1Ok33d90bVwg3H8K8a7HG8ue/H5
   fhCtGhuG0yX1soItsy11f52Il/1a9gSeFND/WTaILRBAkbyZUUuj+xO4n
   YQ71c977ndHZvkL9eoiBiPNbZ207CktNYuzsU7GUqrUKyn3YerZJvkc4Q
   Qd/FSqNPovmoZ7oZrSFdPtQX5HkGu8Oilb5qQ3qi+qfS94yf+LlsGOxSc
   Q==;
X-CSE-ConnectionGUID: 08esq8LmQuW/6Rgjwpn5EQ==
X-CSE-MsgGUID: gAWKAH9hTvKBCtMHnk/eqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="238404887"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="238404887"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:03 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 11CB2820C05
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C05B81800080
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5F567140025F;
	Tue, 21 Apr 2026 09:57:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/49] python3-pygments: upgrade 2.19.2 -> 2.20.0
Date: Tue, 21 Apr 2026 17:55:43 +0800
Message-ID: <20260421095559.1856-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235641

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- New lexers:
  * Rell
- Updated lexers:
  * archetype: Fix catastrophic backtracking in GUID and ID patterns
  * ASN.1: Recognize minus sign and fix range operator
  * C++: Add C++26 keywords
  * ComponentPascal: Fix "analyse_text"
  * Coq renamed to Rocq
  * Cython: Various improvements
  * Debian control: Improve architecture parsing
  * Devicetree: Add support for overlay/fragments, add bytestring support, fix catastrophic backtracking
  * Fennel: Various improvements
  * Haskell: Handle escape sequences in character literals
  * Java: Add module keywords
  * Lean4: Add operators "]'", "]?", "]!"
  * LESS: Support single-line comments
  * LilyPond: Update to 2.25.29
  * LLVM: Support C-style comments
  * Lua(u): Fix catastrophic backtracking
  * Macaulay2: Update to 1.25.05, 1.25.11
  * Mathematica: Various improvements
  * meson: Add additional operators
  * MySQL: Update keywords
  * org-Mode: Support both schedule and deadline
  * PHP: Add "__PROPERTY__" magic constant, add reserved keywords
  * PostgreSQL: Add more keywords
  * protobuf: Fix namespace tokenization
  * Python: Add "t"-string support
  * Tablegen: Fix infinite loop
  * Tera Term macro: Add commands introduced in v5.3 through v5.6
  * TOML: Support TOML 1.1.0
  * Turtle: Allow empty comment lines
  * XML: Added ".xbrl" as file ending
- Drop Python 3.8, and add Python 3.14 as a supported version
- Various improvements to "autopygmentize"
- Update "onedark" style to support more token types
- Update "rtt" style to support more token types
- Cache entry points to improve performance
- Fix "xterm-256" color table
- Fix "kwargs" dictionary getting mutated on each call

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.19.2.bb => python3-pygments_2.20.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.19.2.bb => python3-pygments_2.20.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb b/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.19.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.20.0.bb
index a1f73b441d..abe6205292 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
+SRC_URI[sha256sum] = "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
 
 inherit pypi
 
-- 
2.43.0


