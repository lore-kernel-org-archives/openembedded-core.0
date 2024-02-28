Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EFFC54E4A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8399.1709105621721767501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ak9NZLKe;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105623; x=1740641623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JG3CYp4bS983YvHOBMj3+ga6TDbwnPT8xpnzKAr8E9g=;
  b=ak9NZLKeRR8kGx2WkJA70VK5EjP/dzwJel4j9WgOkWRwkECXozaXvmIC
   khmDREmywoiiBMNrjbNn+dUMtuDZNkx3g7pQyPU97tz/pAytcUuxiYCzi
   +3uwliWP0yqlJwvUkhCPJ5ykFLe8qJWHkRRxJeP5T5XHBQ/WtSkTEUgbW
   QiRI3T1uwr9Tm6rSlu4XdcCejndfXWp8AKHwIYyDpcAizvDPkmCv7lTAs
   Q2/qbsF5cDzQNOzMDxeFCKUmq+5QCSpi3E4MMkXoGvEcdk4JivvtokazA
   muyqST4g3gmR7gfLDV9nprHSeNf+UBZrvSkV6Z6UKFL90XYwPZpMXiS8j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129444289"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129444289"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:42 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3F5DC9FF4
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F2CB3D2941
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8365041180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 315881A006A;
	Wed, 28 Feb 2024 15:33:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 44/48] python3-yamllint: upgrade 1.33.0 -> 1.35.1
Date: Wed, 28 Feb 2024 15:32:51 +0800
Message-Id: <1709105575-24259-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--3.688900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrCZa9cSpBObnG5dXdQTj2OJZh
	jmb07zEXMZtLpjey/X5fYpEfJQlUSi8oE1Ngob6lCKFDk1kJexJgg7HO8z2tNujMOEZ5AL0SA6S
	5WSQkpbs5zvpUzPwJH2JpsFkS86qSxBNI9kTkfyAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitqAfZ9rgr9rlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs4APY
	jsbwN6iyd/IAOYZiXQ1sVatBFzxNlyJDGAt0m6m5UQ4Dp4OPU8qhD33RSlENUEM75pEIPeZ7CZi
	g92ya9EuA1qBlLBdLogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196368

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Restore ignoration of files passed as command-line arguments
-Fix failure on broken symlinks that should be ignored
-Docs: Restore official Read the Docs theme
-Config: validate ignore-from-file inside rules
-Rule quoted-strings: fix only-when-needed in flow maps and sequences
-Rule key-duplicates: add forbid-duplicated-merge-keys option
-Rule quoted-strings: add check-keys option
-Docs: add GitLab CI example
-Rule truthy: adapt forbidden values based on YAML version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-yamllint_1.33.0.bb => python3-yamllint_1.35.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.33.0.bb => python3-yamllint_1.35.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
index 155b65b008..53188b0262 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
+SRC_URI[sha256sum] = "7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
-- 
2.34.1


