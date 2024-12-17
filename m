Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C75E77189
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.77349.1734425920157023823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eR5bXzWH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425921; x=1765961921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8hTq7W1TB/IGNRwiakKetYHGlv5/pr+VBDDbDbDD3Ds=;
  b=eR5bXzWHX4FBvogppR2AVigI5kEAXdAFZ+wqjtpIhslIjILt+vIPxzJo
   l3BXE4FLaRPObGpQQthE7KWiCm2C+WkZy0OGGB+z/lhtAY/fYUtZkLaPO
   3lDjLGmL7WySI72aiQxDl2dTjMtjOyFjWbkkCfFYUCmjZYkCSwFMgwegh
   IDumxSmo8YiUfzrMuj89UbFedv1Wwe5uHbXAXqHyaWs9N7cD6GdZYm2t0
   RO1rugPJOVGtUm6dce8vLrKaZnApXI1PZq4KFnjFVHWLqFNms7bLXd4fe
   pEY6Ug1r8BYYvrlDk4EOsRyXexI+lerK60uLUpyKCdzBzARnTyfoeqde+
   g==;
X-CSE-ConnectionGUID: U+yI/VVTR/2MbG2mqs55YQ==
X-CSE-MsgGUID: bPb0pus/Tp6WaTF9IRUL7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="183206669"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="183206669"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFA13E8521
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6FDBD5098
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 470512007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:35 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D86FD1A000B;
	Tue, 17 Dec 2024 16:58:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 18/21] pango: upgrade 1.55.0 -> 1.55.5
Date: Tue, 17 Dec 2024 16:58:04 +0800
Message-Id: <1734425887-18069-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-0.578300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmI/dksnGuGmFWMAzi+7d0chr06FtoyeujaycrvYxo9Kp/LynNkNEy1bH/w
	COdeVsvll76kpJqmyroAy6p60ZV62To3UJuRLIoStIWznhjjBtfoLR4+zsDTt+gmVy5VdZkk7II
	BqVzfMc2u0pfzwWna3VjWDKXdiSsJZ/Xc0Fsd17phV7Lxdv6raLJl5E9OJNoUiZys1bd2qgUzE8
	xgGKCJx3h9BEZ3NJ1ryDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208822

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.55.0.bb => pango_1.55.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.55.0.bb => pango_1.55.5.bb} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.0.bb b/meta/recipes-graphics/pango/pango_1.55.5.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.55.0.bb
rename to meta/recipes-graphics/pango/pango_1.55.5.bb
index 48f06c73d8..6c7242274f 100644
--- a/meta/recipes-graphics/pango/pango_1.55.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.55.5.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "a2c17a8dc459a7267b8b167bb149d23ff473b6ff9d5972bee047807ee2220ccf"
+SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.43.0


