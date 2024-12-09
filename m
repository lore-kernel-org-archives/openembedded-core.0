Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6BFE77186
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.116563.1733788629201018702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IlkQhTDi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788631; x=1765324631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0XzCUeFUMJ6PB6MoK1Ge8xNnI8lu0DHPrdvpsv+U+v8=;
  b=IlkQhTDijE5s8FUA5bH+PJhc+HssUXfZJJ30X6LdQs6rDW57IdrJx7KZ
   /LqoNuBFenVrd3gUFdFEsl4YXIR4jUkl2UrZvBMmsLjwdweHEM05bndl3
   ZsfCS8btnIBwdshFaZKqQo3iszdcrnvVy7vb9FFWb4Y2hTxCxLka+W/Fj
   GvtAFrXM5dToFFRo4/oHfKM2nSRtqKX8wKklQDC5qUhsTGqfdyF+h7pjk
   B0XsV9HO2MejyChPyAXhcXCQ1k9ZJbl6YWE/mX+5r74nGFzwBOBB3UvT4
   83ecIg//q2SOmPGwjB9ZF/SxOz3znZNtdUjSLZsB+zvHacRTx8CqO/MTU
   w==;
X-CSE-ConnectionGUID: jah5eO7jQiWRyw7D7pXp3Q==
X-CSE-MsgGUID: G5TyYJ3jTU6jgX6b/4cFAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183178020"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183178020"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BEA8AD4C2B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95547D8ADF
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E46922883C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BED351A000B;
	Tue, 10 Dec 2024 07:57:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 14/20] re2c: upgrade 4.0 -> 4.0.1
Date: Tue, 10 Dec 2024 07:56:46 +0800
Message-Id: <1733788612-20933-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--2.963900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0Z46cXaPycFZsc0o6rNiKBihHfiujuTbedKxm
	yEhBMOEzi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFMu8fDAL0DRP3fe5ARwMYTmXD8
	zxphZGkuXOZYCj63T61Lgutut8tn24z5PUbv+0A8ud44yAAR/5RYzZwCjZws80MtZpYj+ieex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208508

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_4.0.bb => re2c_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.0.bb => re2c_4.0.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.0.bb b/meta/recipes-support/re2c/re2c_4.0.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.0.bb
rename to meta/recipes-support/re2c/re2c_4.0.1.bb
index fd7d36b632..b876d2b844 100644
--- a/meta/recipes-support/re2c/re2c_4.0.bb
+++ b/meta/recipes-support/re2c/re2c_4.0.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6281c6bf52e684d5727ac293667c8031a4aa9010636512da5aee45f19987c1ee"
+SRC_URI[sha256sum] = "7c35d54fdf2c4b5981b80362d1c742aec4d011589673e02f2e9566f7e66c44af"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


