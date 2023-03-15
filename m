Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FFBC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:11:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.5088.1678878703707426844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jeHwwX48;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878702; i=@fujitsu.com;
	bh=I+agVcQV7d+CW/u00p1cRRbrYii2I8Ck1oqbw9f64AE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jeHwwX48B0p6pngfbZEQA9vWl6gasSpDzdw9+0DsBLgwsM6vbmDwiwa+6f6oOWwXy
	 YnjXv0MOA3+T+kpN1NM+zfCjgGtnXwzX1BHs588ae/WZM/+9Ivy3t61PokK+tzoEYh
	 0fWDRhHvGWY8dFPJyXZDxoWJOr7XVv4LdHomdqilJOgTrpvjdEhwxhHLNOkC01WaXc
	 MXHkPgObyzejBk4UXolV2t+k7JHjyJNFAxPpKRDrtV+5s9zoDZZNbHy5dmhFzCnefS
	 O9iW+pfHNhXMNtV1uGB6ChrPt9PbeTnCXvFHPICQbHN+ZGtCXcG8dvC/lRaQv6LVJW
	 8mre2nQEquOqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSfftcsE
  Ug8vvNC3u/HzHbnFv/gI2ByaPcxtXMHp0/L7OGMAUxZqZl5RfkcCa8Wf/DtaCpVwV046tZWxg
  3MbZxcjFISSwhVHi5re57BDOciaJp0ensEA4exglWlcuYO5i5ORgE5CSuHH/P1sXIweHiICex
  NV/oiBhZgFHieb599lAbGEBN4lXH1aygtgsAqoSZ9uXMoKU8wo4SSz55w0SlhBQkJjy8D0zSJ
  hTwFni44JMkLAQUMXLJ/vBOnkFBCVOznzCAjFdQuLgixfMEK2KErMvN7NA2BUSjdMPMUHYahJ
  Xz21insAoOAtJ+ywk7QsYmVYxmhWnFpWlFukaGeglFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga
  6iWWF+ulFhfrFVfmJuek6OWllmxiBAZzSjHj3h2Mk/v+6h1ilORgUhLl/bNGIEWILyk/pTIjs
  Tgjvqg0J7X4EKMMB4eSBC/fEsEUIcGi1PTUirTMHGBkwaQlOHiURHgj6oHSvMUFibnFmekQqV
  OMilLivILLgBICIImM0jy4Nlg0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsJZApPZl4
  J3PRXQIuZgBbzzhMAWVySiJCSamCKV45NF867pBNYtpH3lOnyZ35reHmFi/MY9oR3BH+85MLM
  aXE2tM382dy8rw9b1rC7VL7b3P9p7U/NT9PC4q00rFbqzeO101paVmh27clx72llRou9OyyXh
  l0NNcwOLpQ9vlK4TH/e2wKLN+e9vW2up+4I2FHv4Gcsx+DN/+aFc66Ar8T2D7l6u377X3s6/U
  uT6NstC+2tb3/3bFey3pO/0rbe6QDjryP8HBUBv5yE1jDGeH2Ys+xf+rSXOS/q8n/L3dQU1ty
  z24ORt+jzoRPRG3i+xG5Yob9xv9EG9tfH3zRG7rU7/kZwZsXjVU5H7DYr61mIyVoKHmT+b7cg
  Y+/HZ/9bs/ZUiDccXxEoVq3EUpyRaKjFXFScCABWEdDmYQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1678878701!125477!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21917 invoked from network); 15 Mar 2023 11:11:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:11:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4AC781000DC;
	Wed, 15 Mar 2023 11:11:41 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3E2081000DB;
	Wed, 15 Mar 2023 11:11:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:11:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-poetry-core: upgrade 1.5.1 -> 1.5.2
Date: Wed, 15 Mar 2023 19:11:21 +0800
Message-ID: <1678878683-19486-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
References: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178542

From: Upgrade Helper <uh@not.set>

Fixed
=======
 Fix an issue where wheels built on Windows could contain duplicate entries in the RECORD file (#555).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
index 952ffef99d..738b978690 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "41887261358863f25831fa0ad1fe7e451fc32d1c81fcf7710ba5174cc0047c6d"
+SRC_URI[sha256sum] = "c6556c3b1ec5b8668e6ef5a4494726bc41d31907339425e194e78a6178436c14"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.34.1


