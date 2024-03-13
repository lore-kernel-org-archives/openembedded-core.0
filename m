Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D265C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10793.1710313754204451074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=StRj3pS8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313754; x=1741849754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iF0cMlYEeJU1nSn+U6WXIiy0vTcIkeQKnVsZQRzIdf8=;
  b=StRj3pS8VgomZ8ljp+3TSZ1bo8Uev78SroUWMKDBpidI8TZnO9zjM7EL
   OIlAOD1IE3Ozz8D738bgV9ES3liBoKmN8/taabrqTo6nJoimDmSvO611b
   +63Deco4btd3Ca1Mvhzaa8uoagXmUoUA1u9l7Gz20bUZVBS3p/L4clE1X
   w6EEyFv7Jt1BtTbc4esMniFuRMWhgnKNuoXS8BQWC19ke7Sf8X24HbR0g
   wzP2r+WT3t1wYAUBHxwJERGLoSf799yGImpl8tb3/zfvdYHGt25h01l5m
   wz4vLSKRb1d20MFl64NJ6+D0aYLUuXOTSrljbFAi5nsn9uCuASgWehG4n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152393599"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152393599"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F90A6D02D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DC94FFD837
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7ECE12C666B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B49E1A006B;
	Wed, 13 Mar 2024 15:09:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/36] libfontenc: upgrade 1.1.7 -> 1.1.8
Date: Wed, 13 Mar 2024 15:08:07 +0800
Message-Id: <1710313714-12541-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--3.442100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrlHLUcNM85drEmghruKZK8JgU
	Ly4zAbFBjx5X3FdI4UC6Jp2Z8C6cnI+zxsyRFQbXA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYhPUpUX8s8NP8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNW91HLJL+PVdmqS9DIuRWozEZMkSwHY/nAE8dyXv71xeNd/YyHVck8cz2fQa/O4W4S9rn
	JnZY+F/GGjVzexBLXoYMpCBsupm3Q3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197011

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Set close-on-exec when opening files
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-Remove "All rights reserved" from Oracle copyright notices
-configure: raise minimum autoconf requirement to 2.70

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libfontenc_1.1.7.bb => libfontenc_1.1.8.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.7.bb => libfontenc_1.1.8.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
index 056a29af25..0fc117fc58 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
-SRC_URI[sha256sum] = "c0d36991faee06551ddbaf5d99266e97becdc05edfae87a833c3ff7bf73cfec2"
+SRC_URI[sha256sum] = "7b02c3d405236e0d86806b1de9d6868fe60c313628b38350b032914aa4fd14c6"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


