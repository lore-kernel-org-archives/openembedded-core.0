Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8907FC072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:57:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.15125.1700643466266374948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140573173"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140573173"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:57:43 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89771CA240
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:57:41 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C6BDFBF4D5
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:57:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A53F088489;
	Wed, 22 Nov 2023 17:57:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: upgrade 3.8.1 -> 3.8.2
Date: Wed, 22 Nov 2023 16:57:00 +0800
Message-Id: <1700643420-9378-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--2.613500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyummJKihLVAeGa/
	kWm9D5VKbrJF4aCozWaYQl/Rg797N4KsC92uhkQmOWUWxTQJdI9MkOX0UoduuTBwx50fHFEC0yO
	PBv1B9XaUdUf9QcMH0eaffHI8kAmis1RWeqLGIw4rCLswi3NpjZSlv/9klkDigW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcpe6zidPEEvx99hEunwD0hZTswqcDf/cX6PsO
	muHO71um4arzo0qyUocyG3LwJRtrMyQzrAHjoeu3FIJibXtEw79Jo+CltXfBf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
** libgnutls: Fix timing side-channel inside RSA-PSK key exchange.
** libgnutls: Add API functions to perform ECDH and DH key agreement
** libgnutls: Added support for AES-GCM-SIV ciphers
** libgnutls: transparent KTLS support is extended to FreeBSD kernel
** gnutls-cli: New option --starttls-name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.2.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.1.bb b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.2.bb
index 455031dd47..43fb5c4c4e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c"
+SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.34.1


