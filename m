Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4355ED11715
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5571.1729834798026024063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aqjinnCG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834800; x=1761370800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YL2BiL47205McBhVMCi3zNoKBr4ujZu6rFkMSXRzd6M=;
  b=aqjinnCGRwcj2EpnkFgXm/H24fZ0i5xs9PTZV2DqYn3/IhchDLg3vTGO
   Xb0F7Ipj9Rvf2nRUdvV/iCBVn5GugqD5WxAZ7Cg3fhdBBrnjmwd5Uyu9B
   fgx/jJ+5MwdK5zTvFpfE1vvV6Cl5Jgg8mc5JOiuE4tGzAP0pxyJqUod1/
   rIJODNooh2m3HI77YINvMQins/gd+sbPAAPoY6NQ+M7q0RbAmFu02oPAv
   GoinWyMwHNq24Gs+Zwh4gFV49N0+s/O/j1GlYjps/PwCOEAPua8zQMCLW
   qyjg1narCBHl5m9NkOcfA7wCbQzT6ChCYRJfVMhT6KMN2dLpi/zmqkfMr
   A==;
X-CSE-ConnectionGUID: Y23v3cLlSg6xbV61i4xReQ==
X-CSE-MsgGUID: fZIoAA1tRTilzTAFEZtVvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177172255"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177172255"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B6AA9DB3CB
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E6731D3F26
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84DC920071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C9BD1A01EC;
	Fri, 25 Oct 2024 13:39:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/22] python3-sphinx-rtd-theme: upgrade 3.0.0 -> 3.0.1
Date: Fri, 25 Oct 2024 13:39:26 +0800
Message-Id: <1729834769-4717-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-0.428600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTZbVG/9F4QGwkrs/m+KUOb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DhKQh1LCmGBlxOQqP2lG9go8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKeoE9+80O2F9FKpg9uvVgZJ6n6nl/LgFTogW
	6iyEcsKXO/pwVzQ3IysY4ZZPBpfi4lv81kIkeamMG4Qm9hML2fLkVleeEUpzD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206323

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Use black color for text in selectors.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
index f02f1fe42d..b4d0d2be90 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "905d67de03217fd3d76fbbdd992034ac8e77044ef8063a544dda1af74d409e08"
+SRC_URI[sha256sum] = "a4c5745d1b06dfcb80b7704fe532eb765b44065a8fad9851e4258c8804140703"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.34.1


