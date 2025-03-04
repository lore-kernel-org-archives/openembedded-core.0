Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9770CC28B2F
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.18202.1741079370269960341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XwLH2EX+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kKRbcbtt0yvvTerBfSLESyOUewDyssT5XiOAm9Ea7pw=;
  b=XwLH2EX+6J/YCo/8RP/j0AOGpMlngr3y1Pg5g/mB2Zb2k1FGKZW32Okc
   xmPxBRbHL/EgaSIMPSkB1ufDCbQZ0k8KhXKM566QWnF+cfM5f1pNppN7z
   JbJ4injbxExLm2kIzdvDMbyttWDYLB8fDAUfGighsKZo0g7uJejYMWZYz
   sOMCvbnv4vVFUQHk+PJc9YKxcllmWaepGdcpgeU5vuR4571dGunfvw3RL
   rxynxvIjwdMf2iDC6S2W20jwnnAE+0COjSsSzvLxJlMidvbNJiCnI7MHI
   1B+QaIAul9WsFwUxgJ4DPB7aJVGavb1kb6qDDfgSjdaoNh18+MvnYXcMk
   A==;
X-CSE-ConnectionGUID: aWmBa1zfQemXhVJoZFOUlA==
X-CSE-MsgGUID: B4O3f6ROQ3q3Ahqml60cIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191916888"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191916888"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA64EDBB80
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CD6BD8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C0781A009A;
	Tue,  4 Mar 2025 17:09:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/31] libnotify: upgrade 0.8.3 -> 0.8.4
Date: Tue,  4 Mar 2025 17:08:53 +0800
Message-Id: <1741079356-13445-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212235

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnotify/{libnotify_0.8.3.bb => libnotify_0.8.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.3.bb => libnotify_0.8.4.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
index 1e606b84b2..040df2ad5e 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "ee8f3ef946156ad3406fdf45feedbdcd932dbd211ab4f16f75eba4f36fb2f6c0"
+SRC_URI[archive.sha256sum] = "8fa04d4ebdc155b0a239df88bd9f09e8f2739d5707a1390b427ab4985f83d25a"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.43.0


