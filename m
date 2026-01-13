Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402FDD0C838
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56091.1768299939153960522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VDbP6tkL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299939; x=1799835939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lJhmV4pt4DvzKpXB+njwZA92XNFIRfAk14Z3IaDUfd0=;
  b=VDbP6tkLIOvkrkzZI8/N04pBsVBjvicLZwi82+w4L/Y1l30AtKjHa0Gl
   YCXt1+ZhaF/iue8X0aKJFx3wqqoRD/u3Psbod6JYhUNrXbgutY3hrEZDo
   By2PcfaiOLpxLJj8X1hy8YWISUTtUX5VOhtP4RStuJO//npCkulhcyAF8
   7aO+dORrxAFEleI/8Qyy8RbB3Bqkuu1W6Eb1pAURb9vvmLF6fxfRFuUvJ
   amY/mSGVlRnhBfKtsXKlfNqhotc9GaN5ZbzhoSASX5A/RvGUJYvFKEMvw
   c6oVjMtN/U0ZaHI9s3xJDglc3sIa/O7Wtk0mFq/lP7Fr9Om5vhOYpfjuG
   g==;
X-CSE-ConnectionGUID: iapakOBgSIy0p8+mEAqavQ==
X-CSE-MsgGUID: S9wJpTIgTSewt54qWys+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225595069"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225595069"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:37 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9B6471C00094
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4F2D4100137A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 91B1E826FF8;
	Tue, 13 Jan 2026 10:25:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/18] python3-build: upgrade 1.3.0 -> 1.4.0
Date: Tue, 13 Jan 2026 18:25:00 +0800
Message-ID: <20260113102509.728-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229249

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add --quiet flag
- Add option to dump PEP 517 metadata with --metadata
- Support UV environment variable
- Remove a workaround for 3.14b1
- In 3.14 final release, color defaults to True already
- Pass sp-repo-review
- In pytest configuration, log_level is better than log_cli_level
- Split up typing and mypy
- Use types-colorama
- In docs, first argument for _has_dependency is a name
- Fix test failure when flit-core is installed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-build_1.3.0.bb => python3-build_1.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.3.0.bb => python3-build_1.4.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.3.0.bb b/meta/recipes-devtools/python/python3-build_1.4.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.3.0.bb
rename to meta/recipes-devtools/python/python3-build_1.4.0.bb
index 2bf08ca08b..910f08374b 100644
--- a/meta/recipes-devtools/python/python3-build_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397"
+SRC_URI[sha256sum] = "f1b91b925aa322be454f8330c6fb48b465da993d1e7e7e6fa35027ec49f3c936"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


