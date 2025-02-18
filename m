Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659BBC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.14678.1739864482814925242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fT8Zekdd;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864483; x=1771400483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vukZeiM0nx7LTBMyY3pja94RroPXJ7517BO/Eh9Lues=;
  b=fT8ZekddSwD5jkGy7fT/1KpLEUMiFoYr+/VIUuKWVVMoDU8eLGtZxlIk
   Dr7PjkB3c/dLgCCwZZRAFE8yxJObn64V/UG7tzhJPHfXwgZ0+ElaX7RsT
   jwgYlOmYv7RZ6+tecY0vDkrymjmuiJsvepzWeAfSGKGGp+27RMzK3gGkK
   +PowkgUEho7pMiux0J98/aCFZ3872SSpHsIg4i0L7A2E7CBN9NIUxInH3
   Css+MyQRs2vxPF7rk1xMc/uxNDN1Y3ev+h0VDduPZbRWNn+iDvj4ajW4I
   jTAzZdA2r44yUo5MfjpjiiMhJGGOUqP86XvNr6IlrsaWUmBXF94VoHrGJ
   Q==;
X-CSE-ConnectionGUID: HvKWUvt5Qfyuvtx4kj/6ZA==
X-CSE-MsgGUID: y4VM/Nw+RMWxsQGQEu3pcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169273896"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169273896"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 53C78E8528
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1773DD3F2F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD7871A000B;
	Tue, 18 Feb 2025 15:41:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/32] ell: upgrade 0.71 -> 0.73
Date: Tue, 18 Feb 2025 15:39:05 +0800
Message-Id: <1739864375-21394-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211565

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for the Test Anything Protocol.
- Fix issue with parsing hwdb.bin child structures.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.71.bb => ell_0.73.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.71.bb => ell_0.73.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.71.bb b/meta/recipes-core/ell/ell_0.73.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.71.bb
rename to meta/recipes-core/ell/ell_0.73.bb
index b9a0b595d4..c6691c7e54 100644
--- a/meta/recipes-core/ell/ell_0.71.bb
+++ b/meta/recipes-core/ell/ell_0.73.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "850f79cc993791f00232fd31cbaf3e8212edcef25ca0515f98c6d48dfb5952d7"
+SRC_URI[sha256sum] = "ae97f848b45a59be7741369880badfa8c08a55a24b21eae3468342cc012df11b"
-- 
2.43.0


