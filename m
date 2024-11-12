Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C64D41D76
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.82406.1731403501551416094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F8LvnNIF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403502; x=1762939502;
  h=from:to:cc:subject:date:message-id;
  bh=cymeMaJWVmcOzWOSvpn8Cbza6xujvINyavCxcXnuP5o=;
  b=F8LvnNIFd59m1AXq5VLt0ZpLy+u36Yl+HT6XYffym1NAoOPZc5qG/3j4
   iUid/G7NX0OYA43Ysev5IdZoBjcDwWysxypEKoWKWCOkoN1yvAJ/eF1lx
   bFYyoVCveifu2ziuNSRUVwtYgLM6eKFRGDihBPMCAeXFpMBeathVwfhbW
   XEmGQue0aahsiB/nvdlSY0UfBw94pipgGhm09lgq0IOH7DhktGo+287Lx
   BE/6LNo/z8CDfOqc8Qebhk6QPpMOVjh/EKEf5XcaDLrRo0LD7dbITl67d
   +e0BiuGbyW1gM5hemjQwqpdzcHh3018Qi5GLiFfhGdSgl2T8EgGNipA3d
   Q==;
X-CSE-ConnectionGUID: 8z/cIppfTkeZmJWflXMidw==
X-CSE-MsgGUID: SBwf8DsJTlufleg5RjqgyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180109543"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180109543"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:24:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BD06A80E9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C43073719F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4331220071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2D6F1A000A;
	Tue, 12 Nov 2024 17:24:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/47] barebox-tools: upgrade 2024.09.0 -> 2024.10.0
Date: Tue, 12 Nov 2024 17:23:57 +0800
Message-Id: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-0.048100-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v8c0o6rNiKBipsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SojxQw9GNvV7GVeUhexmxyK39oAAqV8f+I+ixX6H7Zm0Lrs
	Oyno82d5eJNpOKyFUASxn7HkVGqUhUPa91UiMPoWQeXRyBxV3/S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206988

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{barebox-tools_2024.09.0.bb => barebox-tools_2024.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/barebox/{barebox-tools_2024.09.0.bb => barebox-tools_2024.10.0.bb} (93%)

diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
similarity index 93%
rename from meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
rename to meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
index 13a308b3da..386656f7ad 100644
--- a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 DEPENDS = "bison-native flex-native libusb1"
 
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
+SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
 
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
-- 
2.34.1


