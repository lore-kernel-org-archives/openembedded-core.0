Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAABC54E6A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8399.1709105621721767501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UDdkmzNN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105621; x=1740641621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vJ1ftOTa6OqsKJ9888dhGTXS6f8j1KKmGwcHlpLTDzw=;
  b=UDdkmzNNR+2D4gXZQNb8FbjQJMoqq0Lpmr1TYMicREDTWfITFdYY6XHp
   PgEXst+7wrdMKFOxEFYHDVlCaa/5VQaPuXgeSls85qprQvB1W7fYNYj3Y
   HhVNr8uMTj7jf+bYiLYX290Fu7i7Hgjt60ZZEbCZlBR6Mv9Qtl2Vtb77t
   MYrObXSHwK/xKyZ7pydM7e8Eieq4P3TCBMJ1huhaIsB44a1gdGxrJ3hbg
   wM4NDvKmlJ9hKDAmyMs/iUNakXIRY08ciMiWRV3NGkp1kRbQSo7z4y9m/
   QAvhJwP1+5V0kQMpTjiri5x28hsYwKmBqB7IGIekrsxAkRGB9Ivo5bt4j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129444280"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129444280"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F1C129F741
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8952BD5469
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 205F62008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B8C591A006A;
	Wed, 28 Feb 2024 15:33:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/48] python3-setuptools-rust: upgrade 1.8.1 -> 1.9.0
Date: Wed, 28 Feb 2024 15:32:45 +0800
Message-Id: <1709105575-24259-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-0.922700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrj0Iuqb6gHRuU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KVxHfiujuTbedo9J
	luW3bSh9bJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w66r8
	SVoeh2fgk6v26pQ+WwqEuE+ILotXgF/h707g1p+yMMehhJAljzDFMiq3TzeMoq74cECmiWU9c9y
	piCBFhBhnex/IrzyfyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196365

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-Deprecate py_limited_api option to RustExtension in favour of always using
 "auto" to configure this from bdist_wheel.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...etuptools-rust_1.8.1.bb => python3-setuptools-rust_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.8.1.bb => python3-setuptools-rust_1.9.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
index 13817cb315..8eb2513d69 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "94b1dd5d5308b3138d5b933c3a2b55e6d6927d1a22632e509fcea9ddd0f7e486"
+SRC_URI[sha256sum] = "704df0948f2e4cc60c2596ad6e840ea679f4f43e58ed4ad0c1857807240eab96"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.34.1


