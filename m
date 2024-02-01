Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE87C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:23:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.9202.1706765007747650261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SDpv9CEu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706765009; x=1738301009;
  h=from:to:cc:subject:date:message-id;
  bh=SiDf4eL2UOgn/hNd/WDC8MY7tlFHXnxal93LkeMBTF0=;
  b=SDpv9CEuqv0XnJWZ98SrpZijitjNR2sjouHkAITxezL7PcbPYbQWrwxY
   5qQ7cQf0+aBLMGH16lIyn+oH3vW0jJIXpAyvpupAwIeFmAGuRivxnUAKT
   biTWrIFesZQkuaJiiFeWxXgHXB9s63HZa7abppSneksQL/XtMJn0OpMMF
   cW3LyEDf7cBkwWTtHxM5eqcbxD9SdB3vFXwO7Qy0yhwVmhOdhKPEPPs/K
   12syQA1i+Zh3Qf5pp1VN4oSOUaj4bWfrSGbO30Y35nbqBkv2OVR7O6yvG
   dBKm/DVJYwewcyxDTffgXe/T3+i+bG6qHVM43ZVh7ijqIVNsNBISuC3xM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147855301"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147855301"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:23:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EE679184803
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:23:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E67FD2147
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:23:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D35726BEDC
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:23:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77C071A006A;
	Thu,  1 Feb 2024 13:23:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.27 -> 0.7.28
Date: Thu,  1 Feb 2024 13:21:01 +0800
Message-Id: <1706764861-12654-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-7.498100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yYL5ja7E+Ohy8boZEVitthh0z1Vq9LTccL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CC7C2rJeUTof4DDXoaCqk7Hqx
	sBjV0bTaESVL06fzYOxP6uxGv2vDHkfRhdidsajMURSScn+QSXpjDMT0TyDk5+gtHj7OwNO0ksh
	YUTZcZE1LlaP6VPHIq1ve14udKnaVw8YekuRm03auXktSHsjM67lUw9KdyaF79aDwJZ1bL6WaRk
	MzOueULaJvWv9/SYNTUtOLcuMOdzw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194568

From: Wang Mingyu <wangmy@fujitsu.com>

- selected bug fixes:
  * disable choice rules for Conda
  * build for multiple python versions on SUSE

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.27.bb => libsolv_0.7.28.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.27.bb => libsolv_0.7.28.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.27.bb b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.27.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.28.bb
index 2ea80c6ce9..201059323a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.27.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "0caa2edb94ba228003bf18960e4574256e92f8fb"
+SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


