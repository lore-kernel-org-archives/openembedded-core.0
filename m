Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B7AC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:17:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.73740.1705310218554449080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146153711"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146153711"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:16:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E5BFD64AD
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:16:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3B4FD9473
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:16:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 536EA200A7846
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:16:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5A951A0070;
	Mon, 15 Jan 2024 17:16:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xserver-xorg: upgrade 21.1.9 -> 21.1.10
Date: Mon, 15 Jan 2024 17:15:39 +0800
Message-Id: <1705310139-24356-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-0.031900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yTo39wOA02LhTJDl9FKHbrlgDeovr2tertMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNlVHM/F6YkvQMRzM2WgxHLOCbuVI7hVbLJmV
	7j1WQqodAYdLFXr37Prp8RhLNCfeRrWL/xQJnm46eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDr3ewhjzE3vh9JCoe95nvJz8FbQ3zHwrJ3ZvVonUAgPsca5GVnXqXfDCFNvJvQdvYpbl0
	cGA5nJszjoYCKZYTjFlGEZ4W71CFoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193652

From: Wang Mingyu <wangmy@fujitsu.com>

0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
refreshed for 21.1.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Bus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 10 ++++------
 ...{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.10.bb} |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.10.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index d05eec5bb9..059e792b55 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d77cdc5e1eee26821ab98c947abea53fb7b18fe5 Mon Sep 17 00:00:00 2001
+From 619fdd8e7fb95ee532a045f9aae0b0b8042292ca Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
@@ -15,15 +15,16 @@ Upstream-Status: Pending [Debian/Fedora patch
 https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d]
 
 Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
+
 ---
  hw/xfree86/common/xf86pciBus.c | 18 +++++++++++++++++-
  1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/hw/xfree86/common/xf86pciBus.c b/hw/xfree86/common/xf86pciBus.c
-index e61ae0cd4..d70c99197 100644
+index aeeed8b..db705bf 100644
 --- a/hw/xfree86/common/xf86pciBus.c
 +++ b/hw/xfree86/common/xf86pciBus.c
-@@ -1173,7 +1173,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev,
+@@ -1174,7 +1174,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev, XF86MatchedDrivers *md)
  		case 0x0bef:
  			/* Use fbdev/vesa driver on Oaktrail, Medfield, CDV */
  			break;
@@ -48,6 +49,3 @@ index e61ae0cd4..d70c99197 100644
  			driverList[0] = "intel";
  			break;
          }
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.10.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.10.bb
index 43c06181e3..0a180950f5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.10.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
+SRC_URI[sha256sum] = "ceb0b3a2efc57ac3ccf388d3dc88b97615068639fb284d469689ae3d105611d0"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


