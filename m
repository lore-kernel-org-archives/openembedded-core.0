Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C42C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:09:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.36241.1698995355216488619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="117858241"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="117858241"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:09:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CC92D3EAF
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:09:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1BF4C4A00
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:09:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CA6F86346;
	Fri,  3 Nov 2023 16:09:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.22.0 -> 1.23.1
Date: Fri,  3 Nov 2023 15:08:38 +0800
Message-Id: <1698995318-30079-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--2.681600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrcV3n4J/0zUMzXf7KKCv6Ee/Z
	a0wAH/tLc8G/amkXuJNWQIgq6AHx7quYyAsAtdH0Yu9YuaJ9+Co3l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq14bVbyN6yIMl85pjA/x1xfpSlv/9klkDigW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcpWJFRQuifOFkzNI0WNaTAsyu1L0dqGysPRFC
	zUVCPlBBAoGcno9KQuR1YgObwZ3Ag+c7SvTVqjFdN69YXirxXqQFgMjwI9VZ/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190109

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* w32: Change gpgme-w32-spawn to use Unicode arguments.
 * Support GPGME_ENCRYPT_ALWAYS_TRUST also for S/MIME.
 * New keylist mode GPGME_KEYLIST_MODE_WITH_V5FPR.
 * New key capability flags has_*.
 * gpgme-tool: Support use of Windows HANDLE.
 * qt: Support refreshing keys via WKD.
 * qt: Handle cancel in changeexpiryjob.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gpgme/{gpgme_1.22.0.bb => gpgme_1.23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.22.0.bb => gpgme_1.23.1.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.22.0.bb b/meta/recipes-support/gpgme/gpgme_1.23.1.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.22.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.23.1.bb
index 84c8fa9f8a..e029b73a8f 100644
--- a/meta/recipes-support/gpgme/gpgme_1.22.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.1.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71"
+SRC_URI[sha256sum] = "a0c316f7ab7d3bfb01a8753c3370dc906e5b61436021f3b54ff1483b513769bd"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.34.1


