Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9826C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:13:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11663.1706832802385935877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VxB1xEw4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706832802; x=1738368802;
  h=from:to:cc:subject:date:message-id;
  bh=hUU2Pm66szWMOA02L+31cwPfwFXTgjhnlj6mU5rDsx0=;
  b=VxB1xEw4/7cdYLuV9lRmyi5kNO9PSr1kfGtJp5icBnps6qInyyQ2n0Cw
   urLzJeizfAx35UL8UwULl/e6lUVzo4VnWSyciG9VWNuER5wreT9+Ss3xK
   xOslUkrF6Fi6SJdijXnSR84h58UB+Bv0rMH4lG4Qccfq4xwoEI9Ol54Ye
   J+XSY5uLo4yBhGCNvTKZbjaFjdEAgdBNRytVXHokpsEigbW+HUWduhypA
   3DJgHUzXl08Vk2TG3Pv3WUK2BwyzwX6t/JuWkTHyzM5MXiY9b3daiJO8m
   Dv9kogpEIVnufbyMrcqKnhiQFac6Ez410E40iQWMQXolX0LSS8HcIPtIs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="149788933"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="149788933"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:13:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 867D5CA240
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:13:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E834BF4DB
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:13:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 17EE36B4DB
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:13:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 960BB1A009A;
	Fri,  2 Feb 2024 08:13:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.21.0 -> 1.21.1
Date: Fri,  2 Feb 2024 08:09:11 +0800
Message-Id: <1706832551-19784-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10--1.037500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSVDBAppAT/pdqJ
	9+yBuxFlb3kKweLMaK8Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxntU
	3Lv5Rb/3psFJUKYZZJ3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6l6p
	rDBU/vGRsHSMsnR06fk+t3RxSqn3f4/a20JXpMe5VWllIiFHHEC5OHaxOk9pjWGRNfQN2dgIYyh
	RvxnvrZJbVJz9ce3FWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194767

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix loading of local plugins to account for newly released versions of a dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.21.0.bb => python3-hatchling_1.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.21.0.bb => python3-hatchling_1.21.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
index 494e609319..09d936aa7d 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "5c086772357a50723b825fd5da5278ac7e3697cdf7797d07541a6c90b6ff754c"
+SRC_URI[sha256sum] = "bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


