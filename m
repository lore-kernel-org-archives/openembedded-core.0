Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6933CD0C83F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56092.1768299945552892038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WfjG8NLX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299945; x=1799835945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GTYNMm3qtz7FlF3ezJm7xs9VBqfkxFC9AUpYHdWpI+Y=;
  b=WfjG8NLXLItrIyCe41kqUhqlEBOOIWIBIq8GlYkSIMGtgyV7TdRcdUqB
   4LE2h5rwkjv6p5Zk7Eo4/BJ4mbi+JiNTgAW3keJS/NzBo8BBrgoI2JgkP
   oJ6T+2oVo/H9/50uFdAMdVDd9WTAWxbePplsUkpa5CGNfhHahr7HM+th9
   9/RAqbzZGqbJZhTqthF/9zMOQ33l60NZY/SrbIZmHStH2cJp2l7YkNEGk
   hpG6o897IXbv8YLs2XuKQ+LV7WLQNbF2yKcMGY92JIarU68ZktAseT6H6
   K7ETpcqrX/YQLFK58Mfde8rS6ZYhpmL3qLPfEOZc1LC3eFVHYb1xWJdT6
   A==;
X-CSE-ConnectionGUID: /PbtwyesSnSHOFYEDSad/A==
X-CSE-MsgGUID: 62TumdS+QeyEu6z+Ykjomw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213060238"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213060238"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:44 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 172FCC0040E
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:44 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C23988D65C6
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E9912826FF9;
	Tue, 13 Jan 2026 10:25:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/18] python3-pdm: upgrade 2.26.2 -> 2.26.4
Date: Tue, 13 Jan 2026 18:25:03 +0800
Message-ID: <20260113102509.728-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229252

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make sure cursor closing for fixing PyPy different gc mode also add PyPy in CI.
- Fix a bug that old HTTP cache directories cause PDM to crash when trying to clear them.
- Port to hishel 1.0.0.
- Update .gitignore file in the default template.
- Correct the sysconfig variables for Python standalone build installations.
- Ignore packages.vcs.requested-revision if it's None when formatting pylock.toml.
- Fix test failures with uv test cases using non-venv Python interpreters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb b/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.4.bb
index 13dd1ec0db..de4a7618d4 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "98207f8aabd6913a25ee0b4985e79e1652e2db274915f3ccf9408e33191ede4e"
+SRC_URI[sha256sum] = "d1030f6bd8e9449b5791e7768f1a856cc54617ee7b00f56fa1a843a84ad77f6e"
 
 inherit pypi python_pdm
 
-- 
2.43.0


