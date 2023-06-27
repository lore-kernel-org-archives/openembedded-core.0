Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2955C04FDF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7540.1687850376721960804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="123548527"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="123548527"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B0F2D3EA9
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A94CBD5EAB
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 314C340B47;
	Tue, 27 Jun 2023 16:19:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-ruamel-yaml: upgrade 0.17.31 -> 0.17.32
Date: Tue, 27 Jun 2023 15:17:26 +0800
Message-Id: <1687850250-20040-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--1.810800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL4pe
	HIlW6LMo4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJ3N5Rj6CiodnKyP1EN3Qx8B7UX7NFhAG7yZn
	SwTB1ghwh05/7rGFGa8BzTkszztom0/+XZwXgr7OrbVe18zoKb9hZ586rlT8X+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183470

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- fix issue with scanner getting stuck in infinite loop

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.17.31.bb => python3-ruamel-yaml_0.17.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.31.bb => python3-ruamel-yaml_0.17.32.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.31.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.31.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
index 5604ff01e4..b745f349e7 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.31.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "098ed1eb6d338a684891a72380277c1e6fc4d4ae0e120de9a447275056dda335"
+SRC_URI[sha256sum] = "ec939063761914e14542972a5cba6d33c23b0859ab6342f61cf070cfc600efc2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.34.1


