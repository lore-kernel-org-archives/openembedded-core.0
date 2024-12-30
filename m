Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52E5E77197
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:29:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.58971.1735543770821173580
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FsY95p6F;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543770; x=1767079770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DDNEGwvCfKoEZLLUa/+UqBjEvY8ULZ5ZBMoNhKUX4l4=;
  b=FsY95p6FanLVBh8dXcS8eMuSC71lCZ33S/6GMcs7iF9QnE1c+pPf5ZAK
   DPN+yJDiJhBV2cbJGm34Lx483Va1xjarI6uYbl6ClCBuvaRu5+yKo0Pfs
   Uzv0mP1EWlK/WVLrgt5O93LN11FsXsIe8WXHspHPYGIFvJhmR96bK4Arf
   o3zWzFOrOqTJv5KBCU5AsZ/QT75iorjmNIRx5ADE+BmR/YOPAmpLywV8u
   OG5dLfZpqHvKVx97gv7x6n6sxsftIvmqvcpfwZozAcsxo783yJuzWkgjf
   PIJlyu/jXfxW9P/wN4rU4nujoYlW8hzXAvgOedQkSzCx17RU0EJ5sLZUO
   Q==;
X-CSE-ConnectionGUID: XjxPMWoIT0KVSelofpITRw==
X-CSE-MsgGUID: 7yZZKgSGSbOmay+WEk6ktQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185508670"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185508670"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:29:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15AA3D6EA9
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D19C6D5007
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E786CB1B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 11BB51A0003;
	Mon, 30 Dec 2024 15:29:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/6] ca-certificates: upgrade 20240203 -> 20241223
Date: Mon, 30 Dec 2024 15:29:16 +0800
Message-Id: <1735543760-2456-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
References: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--1.925800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJX4LEX90HHXNcOEThaK0bGEzEoOqAAVLOfmd9HsjZ0U2FHVj+6F+rIZx2
	5js+HUUPi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFG1ttTWhqF8p7tlhKhqWxJ/oAT
	9SYuOt/lKAoby+ZJh7UIwqyBn4VhFkDABDW00lFqZRHg3Z2zeK65dzWUGhYLm2dXQqy87KIux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209141

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{ca-certificates_20240203.bb => ca-certificates_20241223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20240203.bb => ca-certificates_20241223.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
index eff1d97bc5..bbdc7dd68d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "3286d3fc42c4d11b7086711a85f865b44065ce05cf1fb5376b2abed07622a9c6"
+SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-- 
2.43.0


