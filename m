Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1223CD1281
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.7877.1711413455301181085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sFml60rJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413455; x=1742949455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VpWou6Kux3ZBCdY3hOUUrI703V2nEO+J6gbc21QJKbg=;
  b=sFml60rJvkaeZHPzUSedNY0/P4AJTgEAUUYlt4KdUGas7wCeMNSkwmIi
   k09kj7kfNWyhOKVZE/+x9JhFeEcWImF7yfAdDoaLGgOjE7QF8wBxkHW6m
   X/DeC2kj4mD8MWyPTquP6LYlUvOX7eyPCTfSCTV4PTXbY04PX8MbUVMEl
   zCTBcQgu/o/1Ii0rupiTE9kaIs9xwj2ofEd5I/F/smw/KbeQZP4mEpXZN
   2yI1k8Yzi35sFttfhQZWehvQuTqX/IW/291z76JEcoGHDwsn9DvCrhU30
   fbyYasOoTbnea4FGgyRzvEQdGSqr1tZEvbylzQFD2fw9lJw5jV0ZQPLrk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132640444"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132640444"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6944DC21A3
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90E26D52B1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F6FE20097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C0EAA1A006A;
	Tue, 26 Mar 2024 08:37:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 16/34] lighttpd: upgrade 1.4.74 -> 1.4.75
Date: Tue, 26 Mar 2024 08:34:34 +0800
Message-Id: <1711413292-3025-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--11.225700-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrSExHL6o3BeBYC5LPd7Bvbe5D
	smXnx8X3HtJLR8OMAdrXcf4B0rHCcxN4GR9cyghNGG99bHRMT9veGeDcpMd5Nnhh5KUdlgWiQ0k
	XbwtzsS4LAE2CMZFB3RoVXDux0y5/PXdZx1sZHpA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bq8FBzdsKASwdhwWy0ECdopxV5gKrHXBXOpx23gbuS55VeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7fCZxiDQ9OQwLbigRnpKlKSPzRlrdFGDwisyjlF608wZ8AeX5La9CWSfkzyqwuC2KN/o2
	uLBurOHCwEGBrbCAzg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197507

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [mod_redirect] url.redirect-code = 308 new default
* [ls-hpack] more portability fixes for sys/queue.h
* [ls-hpack] update version to 2.3.3
* [TLS] default to stronger ciphers w/ PFS and AEAD
* [ci] apt-get install build-essential on Ubuntu
* [ci] /usr/local/opt keg-only pkgs on Darwin(macOS)
* [mod_authn_sasl] translate SASL_LOG_* to syslog
* [build] include src/compat/sys/queue.h in tarball
* [core] fdlog_openlog(), fdlog_closelog()
* [mod_accesslog] fdlog_openlog() if using syslog
* [cmake] fix LEMON_PATH with empty CMAKE_BUILD_TYPE
* [ci] limit github ci to specific branches
* [ci] prefer non-login shell for Cygwin CI build
* [ci] prefer dash for Cygwin and MSYS2 builds
* [mod_wstunnel] fix server.ping-interval w/ HTTP/2
* [mod_dirlisting] fix suffix display of '/' on file (fixes #3242)
* [mod_openssl] use internal asn1_time fn on 32-bit (fixes #3244)
* [mod_openssl] faster ASN1_TIME parse
* [mod_wolfssl] faster ASN1_TIME parse
* [doc] update TLS comment in sample lighttpd.conf

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.74.bb => lighttpd_1.4.75.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.74.bb => lighttpd_1.4.75.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
index 7460d3d716..fc3b7e005d 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "5c08736e83088f7e019797159f306e88ec729abe976dc98fb3bed71b9d3e53b5"
+SRC_URI[sha256sum] = "8b721ca939d312afaa6ef31dcbd6afb5161ed385ac828e6fccd4c5b76be189d6"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


