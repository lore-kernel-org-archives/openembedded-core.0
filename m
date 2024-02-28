Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7742C54E5A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8411.1709105598136419556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SoriYz6/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105598; x=1740641598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9H62ykp+qhFFh+bHCcseye9XPQZ07RaA4gXQ0TTHdKE=;
  b=SoriYz6/JiDBCrZy310wGjiyJODVdYFxWaTp6MnJtS7bcMgvIk2LvsjT
   Eb0naXj2dqmXpq7cr/sxTep67Q2F6uNmqA329eyYifqaOwIMJivnSst0v
   feF+YTJC+/DX1oJbK0NFdSjO5K5cDnBrAju6ej/l3DmUtnyvMszoONXnQ
   Ny6DKfgaeCkc4SWpP2Azh8LPKWmB6QwN4eXtwNuiloFzXO1gThpG/lOUw
   UZxvfu1SBMDPHRT+2lfVmaiJHrFz4xFUI5M2ZHW76ZQwuqnKCP6E0ckIB
   3pbhdgLcl88zFuqq9FjNSOagW6ImhpjOXeocjbZM7LfVGzLwPpVcGGlrY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150945710"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150945710"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CE04F0FEE
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E975D6210
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A5282008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DBBDA1A006A;
	Wed, 28 Feb 2024 15:33:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/48] git: upgrade 2.43.0 -> 2.44.0
Date: Wed, 28 Feb 2024 15:32:15 +0800
Message-Id: <1709105575-24259-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.897600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xKysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmRWCjDJRYeAZ2cvczevwoBSIFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLDVBB9g29eBxvQV4xLLkhNDTFpdFyJXgyGSm
	ktAmFCfSi1uIpZIYTjXMSRYIwDdmLT87PzVwUTAYjzEZJRDLB0sz6kHUvIhQf+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196334

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.44.0.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.43.0.bb => git_2.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.43.0.bb => git_2.44.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.43.0.bb b/meta/recipes-devtools/git/git_2.44.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.43.0.bb
rename to meta/recipes-devtools/git/git_2.44.0.bb
index f913290081..e6d1470873 100644
--- a/meta/recipes-devtools/git/git_2.43.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -160,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "ed238f5c72a014f238cc49fe7df4c6883732a3881111b381c105e2c5be77302f"
+SRC_URI[tarball.sha256sum] = "f9e36f085458fe9688fbbe7846b8c4770b13d161fcd8953655f36b2b85f06b76"
-- 
2.34.1


