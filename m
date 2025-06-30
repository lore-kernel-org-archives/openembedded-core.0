Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83084C8303E
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.35289.1751274805923456043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dm7kZxts;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274810; x=1782810810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kb1N46X1fKRoUxhsNGUsTRQk8/axapMQzOsu6K04guw=;
  b=Dm7kZxtsQEq6Mdi79250MvEML55ATRVAQgn8G/07t1Z2It+U82qwzbT8
   Ci2kle3ImcbIdMWBkW7jtjQ/2nmGjqIpe3nNAnsExBsYjoViJ3/TQXsXM
   2iGHT2dlmmZaHzg4hpmTFWrwZnTrgatkj75QiIGmi4c2b5+6d+no9e+Eu
   l4PMrNdG6UwymlNG7sPzSdBHWHifc1nW0WkN/ZyrF1WmCQWWn0YkMWsEd
   qpOUbAo3ELBzfNmWRo6qkpd55ubSMYKVbk3sWs5PcbSENkt3NK804h6Ki
   1V2U8U95fAKdhv+cF4berWo8JhhU+Ct+c9L5gozbSeWDy4ZCHtcd78DkQ
   w==;
X-CSE-ConnectionGUID: uU4coVx9SP6KLxWNpyB3+A==
X-CSE-MsgGUID: yEALyO1wShGQ310yMrbqZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="191956044"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="191956044"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:30 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0AE4DC020F4
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:30 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 80C768D65F6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6715D5069
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:27 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F6F11A000B;
	Mon, 30 Jun 2025 17:13:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/37] libproxy: upgrade 0.5.9 -> 0.5.10
Date: Mon, 30 Jun 2025 17:12:58 +0800
Message-ID: <20250630091315.1897-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219479

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
 .../libproxy/{libproxy_0.5.9.bb => libproxy_0.5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.9.bb => libproxy_0.5.10.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.9.bb b/meta/recipes-support/libproxy/libproxy_0.5.10.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.9.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.10.bb
index ed8a4df2a8..bb16f2f073 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.9.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.10.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "77e2a2b88a319974cf099c8eaaaa03030bc4c0d4"
+SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.43.0


