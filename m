Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FC6C7115F
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.26251.1750065416796232873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NMBp9FkB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065420; x=1781601420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=STpVveX7ZAEZ6oktU4i7NIvO+VBJwuIO7nnH+IiUlGw=;
  b=NMBp9FkBux4/xcEIFZKII5k3izACoqCdsno1pJqWhVJTaML9LlBOmIqq
   +VKpMVDrAi4sLTLCvrJuiycRhW6pB5eS52zEuCPi0xidZOnMkSpWwZpxQ
   9PcRBKtXqtjzgOOnH7WRq0dd7OVZYU1g9kPbNP8Ba3rUt2NTR6NNuN9fc
   dJDYVJYOAdyDlQ5KErUhKPhHNH4NdVABtSLgDOPMxxx/1pdyvUmv2iQ6s
   TGk26hKds7PnL4RYXnOLIRoLHR4HmoFp7pEF3mvGLlkHcEQjwQqnR7Nhn
   SFybPfGKj1lSIpT5aU+JISIQcl6zvePcP7JgM3oiwA4raOoufF7vHbtzF
   w==;
X-CSE-ConnectionGUID: 7LLG/NaTSpazns5/0eALXA==
X-CSE-MsgGUID: eukNCHoORQW6JwFA1Wtmmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="205964499"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="205964499"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CEEEE8FDA
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1C8DD4C03
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:55 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 43A251A000B;
	Mon, 16 Jun 2025 17:16:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/24] python3-ruamel-yaml: upgrade 0.18.12 -> 0.18.14
Date: Mon, 16 Jun 2025 17:16:39 +0800
Message-ID: <20250616091643.918-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218791

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.18.12.bb => python3-ruamel-yaml_0.18.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.12.bb => python3-ruamel-yaml_0.18.14.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
index 3b136b3b58..e7ac24abb8 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5a38fd5ce39d223bebb9e3a6779e86b9427a03fb0bf9f270060f8b149cffe5e2"
+SRC_URI[sha256sum] = "7227b76aaec364df15936730efbf7d72b30c0b79b1d578bbb8e3dcb2d81f52b7"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.43.0


