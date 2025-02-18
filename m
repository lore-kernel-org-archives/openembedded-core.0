Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00737C021B4
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.14637.1739864493138144434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=om0+TnwJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864494; x=1771400494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9MA3HQgXheYp5rB4Az9P/KZY5zFU6ygssjBTZektKBM=;
  b=om0+TnwJUDRTJo/IQzF+gWbc9SAh0W1yNiosyhSw4Rs6Nn48B3PaqLsk
   ZH2Dbup2d1+pGzwEhiKBSJdgCPXWlZCS/tGORSqACgKtcT//gbT2UW5Kk
   5wsjTuiBwv96OJ9DTHr5/12S5+QKZaBfrvODEbWGEIspQGpQdUvQG8oS4
   AkaDN2hieEM8pVeOBBQNJIDvq6ULrEaW34QqqjS9EK5lG/c2NoQkRl56A
   UUL5x+jdjQr7Vmyh5ueZDyjIKzspB0jUxr/90u7MJQSyB5CYXYRvXed8S
   12CsfMDs9HRto+3A4CBUw59dXnr2yCZcp2QJGxGPKBOb1hB88vlU4//Ih
   g==;
X-CSE-ConnectionGUID: Ll0ctIvdQCOvmncVpNTR2w==
X-CSE-MsgGUID: EjPl+CyTTbaEtPw/158tjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190373914"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190373914"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8366ED4807
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D79ED4BD5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E5A361A000B;
	Tue, 18 Feb 2025 15:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/32] ruby: upgrade 3.4.1 -> 3.4.2
Date: Tue, 18 Feb 2025 15:39:28 +0800
Message-Id: <1739864375-21394-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211591

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Added copyright for vendored turbo_tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_3.4.1.bb => ruby_3.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.1.bb => ruby_3.4.2.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.4.1.bb b/meta/recipes-devtools/ruby/ruby_3.4.2.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.4.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.2.bb
index 09415a3132..aa22ef3992 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.2.bb
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=eff3bb1382b590cc5814f1f3de6eb4e5 \
+                    file://LEGAL;md5=cb14358b7821c054ae14128885170204 \
                     "
 
 DEPENDS = "zlib openssl libyaml libffi"
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3d385e5d22d368b064c817a13ed8e3cc3f71a7705d7ed1bae78013c33aa7c87f"
+SRC_URI[sha256sum] = "41328ac21f2bfdd7de6b3565ef4f0dd7543354d37e96f157a1552a6bd0eb364b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


