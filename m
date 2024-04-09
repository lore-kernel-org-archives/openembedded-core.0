Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA79CD12A8
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.130855.1712646647511672546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FylJiP5V;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646653; x=1744182653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aiJAN0LTKEkvK4s83cZK/oEw71FPwAN8YUOEzJRALe0=;
  b=FylJiP5VfKlDUm9PSzJUO9HvIXr0f/Nc0EO4Vri+YJUtMz8/ZGiX3dMk
   xPGvNNvDERPOSOyOm9c7Z2fzrQZeMVzcDptMDj9zQhFJ94eZ/NEL7WO1g
   y8GzOLc5SSdyCKN20m/Gj5AxumcF9FCGu4BGl6gcrsL5SpptIwhSlEKZX
   DZhnFxVcWBv1F+5oJF/+bsF1F4I374qnJwDBNGZPcJ4QZfWtmPGJBRNyu
   X/R5SCtgV9cap8kh+UKudoTm5pGryapFD1gjgD/o25wY93zdk/5zi4Mhh
   J/ICKT8LwoTTDpPD4EO+TBTM/RXCFjCDqTRAgq2wgmKx9gKk4XC5MfD05
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="154475942"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="154475942"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:51 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DFAF4DCC00
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 16E37D5D0D
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1B774018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 504641A0002;
	Tue,  9 Apr 2024 15:10:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/33] python3-build: upgrade 1.1.1 -> 1.2.1
Date: Tue,  9 Apr 2024 15:10:12 +0800
Message-Id: <1712646620-16608-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10-2.593700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9c5Pf7z1MLBngjJ
	lierVE/nPrwjldIlnJfFewIOlSL9Pyxsmu2ROb+DA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipctoeQzRcZeVfOGg365YfdBa6dL95GNKfDZwGz
	F4LCYRMVywdZjQrbfSI6vQxCu5qzSlASG2PhRtzC53JMIEIjqgFtRsDOjDvm/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Avoid error when terminal width is undetectable on Python < 3.11
-Add --installer option, supporting pip and uv. Added uv extra.
-Improve console output and provide -v for dependency installation
-Avoid compiling unused bytecode when using pip
-Dropped support for Python 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-build_1.1.1.bb => python3-build_1.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.1.1.bb => python3-build_1.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.1.1.bb b/meta/recipes-devtools/python/python3-build_1.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.1.1.bb
rename to meta/recipes-devtools/python/python3-build_1.2.1.bb
index 7fc3eef91b..0156861201 100644
--- a/meta/recipes-devtools/python/python3-build_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "8eea65bb45b1aac2e734ba2cc8dad3a6d97d97901a395bd0ed3e7b46953d2a31"
+SRC_URI[sha256sum] = "526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


