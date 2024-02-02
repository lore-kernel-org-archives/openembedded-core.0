Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E1AC4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:20:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.11853.1706833207097222495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CIhUCcrn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706833207; x=1738369207;
  h=from:to:cc:subject:date:message-id;
  bh=ugcmSjYTN9rfjDE2uC3LdrvWckO8tDCOyK9QD1qIPEs=;
  b=CIhUCcrnrG2ZOd/U5Srj2qm2SO+/ScnkaMZJa2QSGdoPIN3Q08PAysWv
   MMFDVd6w9MjdfQrX7ozsUKL09bsLExhe4rtFfNmkmt09fgHfyWgRmxfY4
   E73TiglXHhBpZrZVdt9YB3zfzF/1aqLAcAj4brg/2zc4d/oRpfYenLtm/
   SIDjx68pS2ONsa3Qk3JUtTNRZMm9XIhFeUvy54uCvtwS821ipm10xcGoA
   Ip9mxxAmu/SfUgn3ZGsddl3KdQfTR5GpAYftlrxsTqKvJxbbfg96S1s/3
   5ysX1/KJxzj7X4Kon3G0t9aaA1C2AyTE6TD1B0oysdHiqeo4DJ9XOf0eC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="126862625"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="126862625"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:20:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D490F2D80
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:20:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4E82D4BD1
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:20:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 412F32008FF88
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:20:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C776F1A009A;
	Fri,  2 Feb 2024 08:20:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pluggy: upgrade 1.3.0 -> 1.4.0
Date: Fri,  2 Feb 2024 08:17:42 +0800
Message-Id: <1706833062-19980-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-0.164100-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrYjDXdM/x2VOpTkI0HK8zpaq8
	FzEvsheYvnCllUJsUcspaMAW6plPeJliEMxCZCZX+yCukNfq/Z4XivwflisSrHhh5KUdlgWiaox
	3BtKwI67o07NFPG1gfkw1utS7JfKj7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMonfJp0r2LKg+bBYFA6x7R+l4HMSQIKmdGf/ZkaPcFJPlrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olKE0Je8DR/D6No+PRbWqfRMZW5ai5WKly4iH4IxBnpeHVJgod2D8nnosbGBuyfVpLhmq3
	gP2qCK9TwX1Rf4pKdWxSnIBLyJP18Do9x5mRyngIyBWjWBeDTH/ru1EOiw5d/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194770

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-A warning :class:'~pluggy.PluggyTeardownRaisedWarning' is now issued when an
 old-style hookwrapper raises an exception during teardown. See the warning
 documentation for more details.
-Add :func:'PluginManager.unblock <pluggy.PluginManager.unblock>' method to
 unblock a plugin by plugin name.
-Fix :func:'~pluggy.HookCaller.call_extra()' extra methods getting ordered
 before everything else in some circumstances. Regressed in pluggy 1.1.0.
-Fix plugins registering other plugins in a hook when the other plugins
 implement the same hook itself. Regressed in pluggy 1.1.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pluggy_1.3.0.bb => python3-pluggy_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.3.0.bb => python3-pluggy_1.4.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
index c149cbb0e2..6e4c0cd98c 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12"
+SRC_URI[sha256sum] = "8c85c2876142a764e5b7548e7d9a0e0ddb46f5185161049a79b7e974454223be"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
-- 
2.34.1


