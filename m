Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20D7C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:49:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.38426.1698997749243861482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126164620"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126164620"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:49:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 059FBD9D8F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:49:05 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2790FD94D1
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:49:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E24242FC82BD;
	Fri,  3 Nov 2023 16:49:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools-rust: upgrade 1.7.0 -> 1.8.1
Date: Fri,  3 Nov 2023 15:47:58 +0800
Message-Id: <1698997678-31273-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-2.164900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRUjspoiX02F3eV
	EHPP0bkW/4scBkl4LgCD3k7XvC832+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4rhX/lUQGcewW2EXohiB6drdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07aqzOOiUJy/IcUUrIdpbpz4pZI075xwghHgFVI1Ixd+nNI54m9jmGjFZfRHYV1c6VJS1c
	Lx/yo/Ys5gjR3izT3sqMEk+KyL1sO+g3YgXo4JO8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190134

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix regression in install_extension crashing since 1.8.0. #380
-Drop support for Python 3.7. #357
-Remove direct imports from pkg_resources. #359
-Add support for setting a custom cargo profile with the
 SETUPTOOLS_RUST_CARGO_PROFILE environment variable. #364

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...etuptools-rust_1.7.0.bb => python3-setuptools-rust_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.7.0.bb => python3-setuptools-rust_1.8.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
index 6392a4dead..db5c6c449c 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "c7100999948235a38ae7e555fe199aa66c253dc384b125f5d85473bf81eae3a3"
+SRC_URI[sha256sum] = "94b1dd5d5308b3138d5b933c3a2b55e6d6927d1a22632e509fcea9ddd0f7e486"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.34.1


