Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60414C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 23:24:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11131.1751412288605192121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 16:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oGD23c7R;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751412288; x=1782948288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B2Sm8/cB7mKO4+yUPxlHpCXuGEzNqbknwBbadjrozN0=;
  b=oGD23c7RZSa5m6gCJHkKI+OHlRmlA1E84I4ba+MnQLbZg3/7JGAXCH7c
   2j7VY7NaUq9dzH5d+5ZWCTv/KdqV4Ibfw5ODKQiyBfXKTrRqzUtBvfWy2
   gGuVykXttgF3mmms0UWxJZ8wI9bQS97kzyqL735pTeayTPJFcI8tca4VM
   S0LMQmu30tbqBJWiUnQAx++sZUqGNCyfVpDOjP4kMRvwQA6EqhwGgucBU
   C3xvmzAl5wyiLpNeXLNC7bCJRsW60w5YsgqsJLm5LLT9wGlysF7geH5ky
   5bL31YGuYia06j0Kb4ugYDWyupv1moZlavgoq1cYXCpc+Fo8MOZW+Lj2I
   A==;
X-CSE-ConnectionGUID: x2wOkKndSrunpW170nlccA==
X-CSE-MsgGUID: DnFrTDaqSZ2QfqiJnyCV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="193342234"
X-IronPort-AV: E=Sophos;i="6.16,280,1744038000"; 
   d="scan'208";a="193342234"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id DF2F1C0021F
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:46 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 6639D18001E8
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D511C28E34
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 08:24:44 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 627C11A006C;
	Wed,  2 Jul 2025 07:24:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/7] libproxy: upgrade 0.5.9 -> 0.5.10
Date: Wed,  2 Jul 2025 07:24:35 +0800
Message-ID: <20250701232440.474-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250701232440.474-1-wangmy@fujitsu.com>
References: <20250701232440.474-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219739

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- kde: Support Proxy Config Script value without scheme
- Create codeql.yml
- Add MATE and Cinnamon check to gnome plugin
- Support -M option for Solaris/illumos ld
- Fix symbol versioning with LLD
- Create SECURITY.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libproxy/{libproxy_0.5.9.bb => libproxy_0.5.10.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.9.bb => libproxy_0.5.10.bb} (94%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.9.bb b/meta/recipes-support/libproxy/libproxy_0.5.10.bb
similarity index 94%
rename from meta/recipes-support/libproxy/libproxy_0.5.9.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.10.bb
index ed8a4df2a8..21930ada00 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.9.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.10.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "77e2a2b88a319974cf099c8eaaaa03030bc4c0d4"
+SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
+SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.43.0


