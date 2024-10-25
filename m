Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6626D116FE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5579.1729834801213771812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZLzI6RBB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834801; x=1761370801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ES8h/2lG0+QhsRfhsN12OhpqRZqg4nQ86kcoD3RHoy8=;
  b=ZLzI6RBBNpD+yGuZibee5L//+4mcG9/cnLfVYsTbIlGj0G7xggU8skOK
   QoKt/VXhttzkWmIOOssJ7dM73vDjh9HT29v4H/xshT4MgeVyTIo7epnCI
   WVmEoasKdO8fOv1M0aO7bCREhGF5cIpLzlta0IH0aHeZSgps0u9bbOQkP
   wEuMy+vdKFxvcbrsHOC7njZ/N4rn3nd//rqiaxkl8uR6YToPvxzMuwSwO
   s7xDrwcf3n6oChUtcXGlqRghq8mSY8QX1VNYvC2LvxQVwOdET2e6SUddN
   sihoMhTb3/0QbJklKI2+KCOU10p24CSpSlOk9LJgIYcYdWUReX4o4tioy
   w==;
X-CSE-ConnectionGUID: 2d3eb15gQJmCImO/mKKkOQ==
X-CSE-MsgGUID: HsyoLJduR0yDOsoPFn6ATg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="178163943"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="178163943"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 093E7D800F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48ABCD746A
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D7E61E5A29
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 86B661A000B;
	Fri, 25 Oct 2024 13:39:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/22] python3-xmltodict: upgrade 0.13.0 -> 0.14.2
Date: Fri, 25 Oct 2024 13:39:27 +0800
Message-Id: <1729834769-4717-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-0.218000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmPozDhGeQC9Ej9w
	6ansMmYsXr7NXg/pSgQXB7/m9NWCpol8a7CwZNi0xvp0tuDMx3mUq+GQ/zyJdHhh5KUdlgWi/ZV
	8xTPdRK1WOQrihEMtyEmIrfKYHbBB7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMog1RxwBNHJ3UBhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07Rf2u
	kFm4ENtW+CI/VrW4c3sBhmBW3Lf4mFnFmp5dLe7ejh3E0t2zocLBIthK+8WW2OXdPWZxUInbHBY
	17LG05Lxu/inDsB4I79o0fBAjnRJ8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206329

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Revert "Ensure significant whitespace is not trimmed"
- Drop support for Python older than 3.6
- Additional ruff/Pyflakes/codespell fixes.
- Drop old Python 2 support leftover code and apply several RUFF code health fixes.
- Add Python 3.11, 3.12 and 3.13 support and tests.
- Tests in gh-action.
- Remove defusedexpat import.
- Replace deprecated BadZipfile with BadZipFile.
- Support indent using integer format, enable python -m unittest tests/*.py.
- Ensure significant whitespace is not trimmed
- added conda installation command
- fix attributes not appearing in streaming mode
- Fix Travis CI status badge URL
- Update push_release.sh to use twine.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
rename to meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
index e8e275647c..e99fa3826e 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56"
+SRC_URI[sha256sum] = "201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.34.1


