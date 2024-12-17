Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0742AE7718D
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77564.1734425912124024557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W6IeD/iQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425916; x=1765961916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SVYLsvXJ6uJdq7FHQPB22i0JeLCyGLx8GD3dQXzWbBg=;
  b=W6IeD/iQrx5ZauQ60Nblctos2HMwXIxsaAKcZV0nbY7ncseWGIrbHpCY
   g4CtKTxEwdQL/HVnf79zLTo2GsT3UZKr3smgzn0YFEysCq0c1lLA3XtS3
   BlhAqbPBZD74x21V3VQWfGkO5teBX4IUrV88Ov9t4AqT0c040fIyavU5/
   VVrO5Tw40tb0EJfsiiPEWDOFH+AV5ky3XGMW3xNDrgLkB1WRgzL/xAeAW
   bKj4Li7iweKqfQYWx08izGG1QcTiMsHHrwl6uRk+sqRG90jSae1N/s0OV
   SDqxmbhil6wPOK6SRs1m77Rp1kwyQfn6ng3JaigJYzNWLi4OFAavY/WYJ
   w==;
X-CSE-ConnectionGUID: xgpnKb6+QHKexEBou/a/gA==
X-CSE-MsgGUID: DBFuPgUBR2685jGY+IsJnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953390"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953390"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:34 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 85739D6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C038D5098
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE1DE3479C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C1841A000B;
	Tue, 17 Dec 2024 16:58:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 13/21] libxv: upgrade 1.0.12 -> 1.0.13
Date: Tue, 17 Dec 2024 16:57:59 +0800
Message-Id: <1734425887-18069-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--3.337600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrGB9/bxS68hP2g0UfsHxDzZ7V
	Ny7+UW/9xiqnR+5LS88Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl4UHaA6YOQoro8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKf+uo0xI1TKhfq8mSLh5oIYCZfkaE5d4yyIG
	G9Gtte+1Yi7D6e8KYauppjoGPzt0UM/nUyyJ4s0TzLOj044dvPH8nVUzy8RSn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208817

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- XvQueryAdaptors: avoid NULL deref if length is 0, but num_adaptors is not
- XvQueryEncodings: avoid NULL deref if length is 0, but num_encodings is not
- Use calloc instead of malloc and manual loops to zero array contents
- configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
- Remove "All rights reserved" from Oracle copyright notices

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libxv_1.0.12.bb => libxv_1.0.13.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.12.bb => libxv_1.0.13.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb
index 7f9c5e5cbc..659bae979d 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxext xorgproto"
 
 XORG_PN = "libXv"
 
-SRC_URI[sha256sum] = "aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848"
+SRC_URI[sha256sum] = "7d34910958e1c1f8d193d828fea1b7da192297280a35437af0692f003ba03755"
 
-- 
2.43.0


