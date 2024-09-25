Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265B3C369A3
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9326.1727246990413115226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q/BL2YAG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246991; x=1758782991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xxQsMUBnXJiBR7ogOdET4Aru80Y/eQbO0GPjecO21n4=;
  b=q/BL2YAGx++OyENGDik5QuaLip1vx8ibZAlG9BFZL9zs+zE/frN0sg5J
   lAdff6Ew+fKE4JP19mrnu+X8QDsmnn/sBNNP2u5N74cBmCvmsyinrbpEx
   xPvNH89AWZhj+in1K15QzLX115e3x32QO3JbrkfBCWmwfSHn50JuBG3v7
   HDPT7v9xbMCcgoI7eW6XwYeuZ0m80tVFJC6OILeLAhhvJ8dyLgrIe9Y3O
   G1FkUjD5aYclIClAZ5p/es4bNP7FtfrCOYlr4VLKTyrZeIldo/nVuoGKw
   ZB1wY5TnYolrKelsn2Eet4Ng7XC+WJtd3p66xIBFpYbDmzzmPz+9ifIx/
   w==;
X-CSE-ConnectionGUID: YATqCwWsSOihYPgftiHrJQ==
X-CSE-MsgGUID: 16z+JljTQoyFlrTm0Wh7+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="154170423"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="154170423"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:49 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D1C2C68E1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C46CD5077
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DED7D401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FD9C1A01E9;
	Wed, 25 Sep 2024 14:49:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/47] python3-pycairo: upgrade 1.26.1 -> 1.27.0
Date: Wed, 25 Sep 2024 14:49:04 +0800
Message-Id: <1727246960-20665-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--5.493400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzVbZFdXapsKYYM
	uV3kzHSdmyp3hbRkODcwqztTze3A2aA1RL8Qnb2vRZfQN+FVqbBm8qF4pBsxH5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3jpxdo/JwVmxzSjqs2IoGKEd+K6O5Nt50rGb
	ISEEw4TOLzNWBegCW29sZ0UX0EaOILbigRnpKlKSPzRlrdFGDwCP6n+a+cinJWJ4rNfSq66sngT
	GOgO2pfKQa7CezkCKKMpnRIRln30Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop support for Python 3.8
- Add Windows wheels for Python 3.13
- Updated cairo in Windows wheels from 1.18.0 to 1.18.2
- Port PEP517/wheel build from setuptools to meson-python. This means setup.py is gone.
  System packagers should not switch to wheel builds and continue using meson directly.
- meson: install the package metadata to .dist-info/METADATA instead of .egg-info
- Drop arm64 Windows wheels again. pypa/cibuildwheel does not support cross
  compiling with meson-python. They might be added back in the future if GitHub
  Actions gains a native Windows runner with arm64 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.26.1.bb => python3-pycairo_1.27.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.26.1.bb => python3-pycairo_1.27.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.27.0.bb
index 93f181bf5f..3dab9e823f 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "a11b999ce55b798dbf13516ab038e0ce8b6ec299b208d7c4e767a6f7e68e8430"
+SRC_URI[sha256sum] = "5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.34.1


