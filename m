Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBBDD32D6E
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.82754.1731403568926006098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eYuJPMkc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403570; x=1762939570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m6rUcYtb73hpsQiCAIvnu2rr7J/a6oCZZqLgiu1NdMc=;
  b=eYuJPMkcM2e1eLobHpSpubLRPL1qP8wBckmhrqnAmRRzB1hMX1MEqGIf
   YoXXc6LC4Z5DSlgGKtlDqZIQPEikprqEGLwezhe45dbSiwB6rcwLL5TAv
   +YvOdgZsRGuwTno632/+MXVHQTKSKMPbAEmNlFEM2o7rgh6fdEbiHUDfH
   BKJxrpsytTezMBIvH8OWorfNpvt2Xo3giB5i5hHxx5HAZtahkrfOLHzZx
   b+Khz4PqPDXKY2v/xyqUBPrkYoKlQu4+PJkE/P5V1E9zRVA+5GHo1IMqL
   JKhwYAcoquf3jdzZXfEbgVqGb4j+W61Ct3Vqj+sE+P7dJoZSXBxqvIJvO
   w==;
X-CSE-ConnectionGUID: yqijKFbPTgO8/bwTftWF8w==
X-CSE-MsgGUID: 9bULF6lyQIuJtVUZDZsvnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180062696"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180062696"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AAF0D4F62
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC75E3719F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E2696BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CD621A000A;
	Tue, 12 Nov 2024 17:25:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 46/47] xrandr: upgrade 1.5.2 -> 1.5.3
Date: Tue, 12 Nov 2024 17:24:42 +0800
Message-Id: <1731403483-21399-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-2.428400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrwRdjnTeqAAFUjspoiX02F3l3
	wfMZTKaWwna3lgFCAxaX9moRF8wW92pSPf7GObmnP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW583JyW70EfyoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz55HOxiGR7YI/T6
	LeMxhLwnx0iqS8BBM9zzlABU3mZc+ke9yReZDiddthbNxyBxajcptItuRbrBGio+nxU1ShyFP1i
	iWk9lTyiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- set_gamma_info: remove unnecessary round-trip to server
- xrandr: Print/consume the CTM prop in human readable form
- Reworked transform fix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xrandr_1.5.2.bb => xrandr_1.5.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.5.2.bb => xrandr_1.5.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
index 1e29031849..75656af9ea 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
@@ -12,6 +12,6 @@ DEPENDS += "libxrandr libxrender"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240"
+SRC_URI[sha256sum] = "f8dd7566adb74147fab9964680b6bbadee87cf406a7fcff51718a5e6949b841c"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


