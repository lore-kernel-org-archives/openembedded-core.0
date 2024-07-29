Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016D6C3DA64
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.46592.1722215428747032203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HGF79j3c;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215431; x=1753751431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bVkdzc492KT4oKLjrBvH95F04e8PxSe4dVKtqUmGfIk=;
  b=HGF79j3cnQGvW4+VqJVgkQGwjXagzg1JTnaBGzvs8QvYKzvsH3SMX9Fp
   g2mAjXfsq7OHXkgp37fw3k++pwknWolJra8hOXRTpbj4sUodJHSxF6wn5
   xfV+0JJw5yFjqCc3ICtqsBLs7pvAGtFqY/dSHgIOAD6C68VjFcBa2VKaq
   Mm1mg0sCiByWDdiqkeceMp26Bg9a1RRcx04osslLPNXP1b74tjc55KG5D
   HjBk+PNu+Nq8pMI1ex3ztthcd+qe1Ppd/eHxDIlv2Enj+rp8Xxb3mh/Rb
   6a0UNovjvPYojPHfhZ9v83dRnbZpX5fzu4xuykxMwHUpqy7Dry9t6+UL2
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168859965"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168859965"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A96CE8D30
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4763AD773A
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C819220071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FCE21A000C;
	Mon, 29 Jul 2024 09:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/33] python3-sphinxcontrib-qthelp: upgrade 1.0.7 -> 1.0.8
Date: Mon, 29 Jul 2024 09:09:57 +0800
Message-Id: <1722215408-27541-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10-2.197900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytQZ//SkC0u0r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMO1Q64GUf5RJ1fAQ
	pvtDDRa70ZMHb2h6dndVIXHkmwQFPf0z9h3MTJDtqh/w8KpCoAYXr6y+b1MI2IrcHyOohk9yPQb
	dYPbWW+gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202592

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix tests for Sphinx 7.4 and later.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-qthelp_1.0.7.bb => python3-sphinxcontrib-qthelp_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.7.bb => python3-sphinxcontrib-qthelp_1.0.8.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.8.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.8.bb
index 2225ec521e..0b4a2eb2e1 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
 
-SRC_URI[sha256sum] = "053dedc38823a80a7209a80860b16b722e9e0209e32fea98c90e4e6624588ed6"
+SRC_URI[sha256sum] = "db3f8fa10789c7a8e76d173c23364bdf0ebcd9449969a9e6a3dd31b8b7469f03"
 
 PYPI_PACKAGE = "sphinxcontrib_qthelp"
 
-- 
2.34.1


