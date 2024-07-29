Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE3EC52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46937.1722215428956272395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OOGo5tHX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215428; x=1753751428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GbBFqsmCo1D+Bh6mWFV2/9S7Jh24EyZY9z3deNPJNdY=;
  b=OOGo5tHXVqa/m0IhI6DQ1IiTVsa+Fu9jHZiAmgwsE9fnmZTded/RYkyK
   JLBge5F88V7W3Kb8Jggtf71yinZePVoLmSNxRUYzInz1/rxlGb2jfm5Fj
   RIF61K/S97JVfrnEVAtHBkcTYkXGJmBNYA123AqY4iwz6iADsOofmEKV3
   lHHIgATerE0fcU0ZcXhI6v7eInQLaPF+KHFPDZfO2cpTemDxQynwgdBSC
   xT3t2dcTKiHruJ+lSZJj6/9dkTFqsqK4rOwnloFLr3k1Aa4d1x/Bep6RJ
   wqWOrlt/M7Zub+xdZr3dGxe27PNOa7DnXdK/IAOEUqjfQOn/U+R6gMYv0
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168988756"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168988756"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D826ED8016
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 205E4D5C31
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD42B401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 473801A0002;
	Mon, 29 Jul 2024 09:10:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/33] python3-dbusmock: upgrade 0.31.1 -> 0.32.1
Date: Mon, 29 Jul 2024 09:09:48 +0800
Message-Id: <1722215408-27541-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.466600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqweZzJlaRLGxeGh
	cdKQnVFw4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedT3E
	r/Wp7qkQdA8XPYQyAUAYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAsmMmvkDPg9cjzrgtNm904jLcim0j4zi/Rdh4Xe9Zm1k80EfuuVmatHoqI6hWXt4aHVl+
	rXR3M9J6Hl05ddo7+GKRQfhkZXltfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202586

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- ModemManager: Add initial mock
- bluez5: Add advertising API
- Fix loading of libglib on macOS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.31.1.bb => python3-dbusmock_0.32.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.31.1.bb => python3-dbusmock_0.32.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
index fc32c6bbb6..db7011831b 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "b23b8e1b51fe2a9b13e617fff6b60b3ed8e536c080cf3498019d223678d5ea49"
+SRC_URI[sha256sum] = "f02c34493d420b3cf2d8d341b79a60841593b7b7615adc3ece17ff86f8275924"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


