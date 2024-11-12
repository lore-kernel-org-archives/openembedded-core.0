Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23FCD41D7B
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.82409.1731403504840031146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GPG1HpMO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403505; x=1762939505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E5eZTF8nSqnxPRZovECDHPJeke0ak/ldixF4k7kmiKQ=;
  b=GPG1HpMOu+/bm7vuF9xoKTpGs9bYDa9d8zGuZrNzc2Rg+dzeKQP0tyeM
   y7fLBbWx06xHm/m2NsGCucw9BZs976yJ4mZu/CyiwEOAXphd7ofGDwbB6
   MBBNl41f53YImEl8kLHzdBOK3kG1Enr7r51osV3vl3nZ7laSon87TqKze
   iazJ2N8etQXDYty4j0OdHF2gkVet0Mf/n+tsEm7Ph1PlfgvgTTrJiCDhE
   rJRrz4atyj47irAVKUfWZPgurocuT0hdhnqchf7aoGNmAv8Pnam5A4wb5
   SnUJFUycQ++Ctcls617Cx3kws7zuiK8xA0Qx2Cff0r2f9Pvy1Y6yGqFXo
   g==;
X-CSE-ConnectionGUID: sd53turuTAyhBjAkRiOkYg==
X-CSE-MsgGUID: gH+i3vTxSjWj/Vhdll64yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="179257918"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="179257918"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F309279B2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02B70D1AC3
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B0D220071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 39F771A000A;
	Tue, 12 Nov 2024 17:24:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/47] epiphany: upgrade 47.1 -> 47.2
Date: Tue, 12 Nov 2024 17:24:02 +0800
Message-Id: <1731403483-21399-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--10.486800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyveyEk8VTRANb6s
	jVQ3MbzNH4Xct13OD6hUXHJQcvL7b6j7Jw6gjGGCHWRJEfGP5nkyi3XhzUIbyOjMOEZ5AL0SsBG
	1yO21X7XgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZgCOzL6v7C+csc0
	WLCYlGrxcG83TEvOQbumMCMwce1mUfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJPrny
	PRecrOwoxwW/CsnyYQd3Y/tjvMUCNHXJwsh7lzMftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix crash loading Global Protect URL
* Fix Privacy Report dialog when no trackers are blocked
* Fix crash loading taobao.com
* Disallow duplicate tag widgets on bookmark edit dialog
* Add workaround for DuckDuckGo redirect service failure

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../epiphany/{epiphany_47.1.bb => epiphany_47.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_47.1.bb => epiphany_47.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_47.1.bb b/meta/recipes-gnome/epiphany/epiphany_47.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_47.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.2.bb
index a726d01314..3813054d6c 100644
--- a/meta/recipes-gnome/epiphany/epiphany_47.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.2.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "642fd72045f6e9b18f09c3ef16df762d9b7816119abb22edd5d82ef687c6a004"
+SRC_URI[archive.sha256sum] = "34dafd8363a098b44d476e2e9823b4cbea6e66afad33bba10ed7a13ff1a964f1"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


