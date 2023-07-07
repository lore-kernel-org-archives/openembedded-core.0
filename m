Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9FAEB64DC
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:12:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.4866.1688699561993186554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123692416"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123692416"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:12:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B768DDC60
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B395AE49BA
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 329B941050;
	Fri,  7 Jul 2023 12:12:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.23 -> 1.8.24
Date: Fri,  7 Jul 2023 11:12:29 +0800
Message-Id: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27736.002
X-TMASE-Result: 10--5.006700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrKQNhMboqZlrG5dXdQTj2OLYX
	dmPuTQvH9KniBz+0mahQVmxLxqLMcD13WcdbGR6Q8t4fUUGeErTVy4hHC3/gyLKw8Hx0EGitvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFyGOiXr1rOL6dVNZaI2n6/3LhUU/qa4OGvGsAbY6bunYRei
	5DA7ytSVslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJCNOd
	hxidJGqr/OlxbPqkl0HYsZLarQ+wkUYJziokTfMftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183991

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added a new configuration command 'from_full_name' to set a full name for the
  From header (like -F on the command line)
- Fixed the allow_from_override command

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.23.bb => msmtp_1.8.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.23.bb => msmtp_1.8.24.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.23.bb b/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.23.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.24.bb
index 5e68a7ea92..b8c867161b 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.23.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cf04c16b099b3d414db4b5b93fc5ed9d46aad564c81a352aa107a33964c356b8"
+SRC_URI[sha256sum] = "bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.34.1


