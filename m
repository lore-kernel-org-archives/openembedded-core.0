Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18022CF58E5
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.9321.1727246989241421908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rbtuDm72;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246991; x=1758782991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D8Z1kk+vlEnCxmBx5Lr8J8hwEsAwVp/Rno8+ogsqrmE=;
  b=rbtuDm72QYWedm8qTjA98qiAf9wVJxHsuonzpTtLA3zCJ8uLHUmDdcKL
   UuSg64et0/tR+1/lCmDGC0t0KkgmHKsNzjFWAYyXTI/WrALUgsmH5Klhz
   jyrY05pJUFwpVEMww4UgKJpz2sGSeJLbOJjF1WZlzIH2miSdoUVJc//d6
   NRytJd2AO3kJj8/QA551JL+n+ZCFwLvz6Nh4Hyl35R32LmIPm39OlQrkI
   u9fdSBANmqvVYFd5MyU6GFIBXon2AUe4y6mC5E/vw6RK99USemVs1MPjC
   tXGUIK53nml0LAdGRRzJSNqJWQsxHRRVHFzaQ2eTOhnTKnsuSj47ZeGtg
   A==;
X-CSE-ConnectionGUID: hFeSVznCRmm4Z0E6SDTk7Q==
X-CSE-MsgGUID: Eyf7qUspR66pGjFSanpf0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="176849306"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="176849306"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:50 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68081D4F58
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9749ECFBBD
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DAC6401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D29E01A01E9;
	Wed, 25 Sep 2024 14:49:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/47] python3-scons: upgrade 4.8.0 -> 4.8.1
Date: Wed, 25 Sep 2024 14:49:08 +0800
Message-Id: <1727246960-20665-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--4.364000-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrYIOxzvM9rTacYt2OJKqTgA8k
	W7yqmdugDH+wnviyBXaOYTH9s0ioWD9ETA4D04a1HWRJEfGP5nlcKeig6Dj9uR0zI+Wuf+4mV/r
	2z5XIf8YWm/gAtjCd7GetXQVroYqaBZzfOdtebLRi71i5on34KlQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEb4SkIdSwphgabKItl61J/yZ+in
	TK0bC9eKrauXd3MZDVbPkJPLKY8y4qXk6LikmbZR5m73EUwKjb9fC52mXeLjXnIYUfHNCvfLRtf
	CVLF+2+GNaDBjZDtCZu/pBhjnyPvJTuulvlETg6CV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204923

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- env.Dump() previously accepted a single optional "key" argument.
- SCons 4.8.0 added an __all__ specifier at the top of the Variables
  module (Variables/__init__.py) to control what is made available in
  a star import.
- Fix a problem with AppendUnique and PrependUnique where a value could
  be erroneously removed due to a substring match.
- Fix handling of ListVariable when supplying a quoted choice containing
  a space character
- On win32 platform, SCons 4.7.0 modified the determination
  of the output encoding of piped processes.
- Improve wording of manpage "Functions and Environment Methods" section.
- Make doc function signature style more consistent - tweaks to AddOption,
  DefaultEnvironment and Tool,.
- sctypes is_* functions given explicit return types.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-scons_4.8.0.bb => python3-scons_4.8.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.8.0.bb => python3-scons_4.8.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.8.0.bb b/meta/recipes-devtools/python/python3-scons_4.8.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-scons_4.8.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.8.1.bb
index b1348665e0..4564aa368f 100644
--- a/meta/recipes-devtools/python/python3-scons_4.8.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.8.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "2c7377ff6a22ca136c795ae3dc3d0824696e5478d1e4940f2af75659b0d45454"
+SRC_URI[sha256sum] = "5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa"
 UPSTREAM_CHECK_PYPI_PACKAGE = "SCons"
 
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


