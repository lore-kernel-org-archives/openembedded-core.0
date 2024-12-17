Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBE5E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.77347.1734425914528569039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dPp3ixtz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425916; x=1765961916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TF3OItGj++oXIxvpoG4gTVlGsv9g8h/iVwe+8PQ69ow=;
  b=dPp3ixtzgkscE5413Te7Dz0wFC5ns7ydbnGYUWgScGIAGA1ElUpKOaQU
   qvv5Yc+qAPoRuoh06VXXYhnsvIcfY7TjctQLMs2FGRpA4D+GJA4siuwyd
   cSOd2ZjhFezSQGndjg3wCyIDE6DMNbbk8kXvAwjZGgeiNkr+pO/TqRjcP
   KPBa+fhRA7AhGuzIXCpNwAsaLHrTpL8djjniDDfmNFhlTTViaFVnSeXZt
   ZI8It8RJAF3uFfP2tAkI0Cx8iObt8QUxk1zAvhmGPm7HJkOa9XMb7Tieo
   57DxkDa4DapyYCKQVZpCUABsvKG4oJCEEDeTT2QNQK9GXZV0xvR82WWn8
   Q==;
X-CSE-ConnectionGUID: q6Gh2KpzRYmsaHZXR9onLA==
X-CSE-MsgGUID: OPgKaMmtSNudhlcmtDLOAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="171353584"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="171353584"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73F19D4807
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C1A1D4BD4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E13182007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:32 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7ED071A000B;
	Tue, 17 Dec 2024 16:58:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 14/21] libxxf86vm: upgrade 1.1.5 -> 1.1.6
Date: Tue, 17 Dec 2024 16:58:00 +0800
Message-Id: <1734425887-18069-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--3.305900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzfghYDxv+lXXw6
	H06bMgiv62g4sCZkIxT2Jzq6yZuBqbUN8Yzp1vtfsjFnB5RHQ19UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrOiGsb76KK1BlzlotQBpl0tL2ysLARNXpxCKVEBba5YXB3VTVrQzULr7iclAIzz7XzQrP
	roASe4gS1i5srJCD+J7X16xlGeT4PIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208818

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add -no-undefined flag to LDFLAGS to fix Windows builds
- Add X.Org's standard C warning flags to AM_CFLAGS
- configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
- Remove "All rights reserved" from Oracle copyright notices

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libxxf86vm_1.1.5.bb => libxxf86vm_1.1.6.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.5.bb => libxxf86vm_1.1.6.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
index 16fd29ebcd..bde3ad3ad3 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
@@ -15,6 +15,6 @@ DEPENDS += "libxext xorgproto"
 PE = "1"
 
 XORG_PN = "libXxf86vm"
-SRC_URI[sha256sum] = "247fef48b3e0e7e67129e41f1e789e8d006ba47dba1c0cdce684b9b703f888e7"
+SRC_URI[sha256sum] = "96af414c73ce1d5449ad04be7f9f27fa8330f844b6dda843ef22e3e1befb3ee3"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


