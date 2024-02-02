Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D45C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:08:54 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.11572.1706832529586332423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E7HX9kUi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706832530; x=1738368530;
  h=from:to:cc:subject:date:message-id;
  bh=jowDDkp1bXcnR9a+OqHFMhRpYvwlpduldhlJYYDg3vc=;
  b=E7HX9kUicHCoTEL+8TFO06AVzkPvMr3x76LgSVPFTyslvgHrwT5RkpUJ
   cQxkZI+ww45ART2LI7+hDFi8sXJxjzdq5Jtj088DQ2ubNbkLxDW/kBf4D
   ZhIeqSrSePDJ1kVC2W3fFODzMsgKum50DlfOUoOJOyfl+q+iLG0SlqsfE
   IAi+lK25xbSEScWt1SA39Z+S4mFyPk8ToIYJwd6LR1qzJlRsXMMwU9gQg
   SDIH8e2qGRn3PlknkKO+O9RbNH9oIJ48w3x5u9hrYhHc6XQG7N9yps/Tl
   OjaZp5/rdIFsooLl1Cy4G05EcOQBwd1wDYZ+PMdsGgPWLhQXxwPDYMEIn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="127476082"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="127476082"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:08:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7580DB831
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:08:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D993D560D
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:08:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B98666B4DB
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:08:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6442B1A009A;
	Fri,  2 Feb 2024 08:08:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-mako: upgrade 1.3.0 -> 1.3.2
Date: Fri,  2 Feb 2024 08:08:33 +0800
Message-Id: <1706832513-19748-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-0.090700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yXtNecKMjy32WuFm7TqL4eEli8Y5a0svL2SI
	gEo+1SiXn8tJL2Ez+8OQNVQPFdrRquxuEpSKm2TEA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY54o2Y013b1fcgUVP3Cp+vRCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXra/ZOFeDeXHgN0H8LFZNFG76sBnwpOylLOfnTjhjqwTO7RWi
	DIT6omLAJHUbm85mfKxzfM1V4WIkz640E9LAJYi5r/AVoX8zAkrCB9Ug7RMsfCve2FV0sHquJeP
	1D1VTHKIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194765

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
---------
Fixed parsing issue where attempting to render a single percent sign %
using an escaped percent %% would not function correctly if the escaped
percent were not the first character on a line. 

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.3.0.bb => python3-mako_1.3.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.0.bb => python3-mako_1.3.2.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.0.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-mako_1.3.0.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.2.bb
index d180e05cea..c3391a6030 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fcc01df649aee6c59dcb254c894ea0d4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b"
+SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.34.1


