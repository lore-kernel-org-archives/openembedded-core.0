Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C525C52D71
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46596.1722215431402451463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e/Vai5+p;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215431; x=1753751431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8q37C8jWbn9kJvK4yWW4D1iaWG6tu0lhZaTxx5OLAzY=;
  b=e/Vai5+piZlAllyu121oi2hIKIOmpQNO86BgjTlr85+qQQNkm6oE8DLi
   rBAKC76dTJgLKFC05TsclCvfJBb06MNSopFhoMnVXPpuLZWj9ChcJWWOL
   8nax3JB2NuNgIfH5tQxxrl+ZdqSLW6WWiDMneV41eJw3MTx2LgyACVv56
   ucq2PwTrg1/76ufA45MqewczA5O9FLiCCs0q2Rcla72Duw1oBte8hnANB
   y8zbzOr0dfAUju+0NXpDBXQ73vP2hfEZOQ+ncgjXw4wa1WMSrtiPmc1Ch
   TEz3fPb7sWJsBI7VnSlKcIiYxLJVU3xBAM3afv7880UwnvyCBBLfbKOpl
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="157163424"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="157163424"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CA55E8521
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2D06D3F09
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FFDB401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0058E1A000D;
	Mon, 29 Jul 2024 09:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/33] python3-sphinx: upgrade 7.3.7 -> 7.4.7
Date: Mon, 29 Jul 2024 09:09:55 +0800
Message-Id: <1722215408-27541-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.010600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSC3IpruVSJ50r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uEok
	GD3z/g2eESVL06fzYO9wU8VHXGipCHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4QH5
	GWHNQasQUb0xyzYdtESL6Yxs9xfRk/FxdXcYvaglQUuk/gLBEGZaOPoKMrMnvfwbl218ER0Iom9
	/ku3PJIl97denwyYf+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202596

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.sphinx-doc.org/en/master/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sphinx_7.3.7.bb => python3-sphinx_7.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.3.7.bb => python3-sphinx_7.4.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb b/meta/recipes-devtools/python/python3-sphinx_7.4.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.4.7.bb
index a1cae2abc0..e713852385 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.4.7.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
 
-SRC_URI[sha256sum] = "a4a7db75ed37531c05002d56ed6948d4c42f473a36f46e1382b0bd76ca9627bc"
+SRC_URI[sha256sum] = "242f92a7ea7e6c5b406fdc2615413890ba9f699114a9c09192d7dfead2ee9cfe"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.34.1


