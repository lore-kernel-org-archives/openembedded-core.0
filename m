Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC892E77191
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10582.1734945086732382813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pRtMdZX5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945087; x=1766481087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kKB916Bk2EQuGaON0+aIJEafcfIB9bASX/3Ry2T1g5s=;
  b=pRtMdZX5MnQSPRBWib+yTlzb1AFZuD/058XN2qIpd50kHxPbzV4gCcn3
   YZdSeKl5hwhsnxECxp2FDsKySO1LKbIzH+dkAhSZMIBGixJfcHN5UTkKB
   m5jQO79kY0vIpEnFbGPlt2Oz8LlsxQD3RH4zI2PamC95z64biGI6spMpQ
   wY8qa4RNl5bpWswYZKzcEH2xawFXIyIEPY/kSa1jr3qG5viKQK4O1GbPV
   stMrhHLpSgfV8Tw+L6ZVKYnYXdsK0uPAxr0mIjZAFFo66KqyweBG4qQJk
   Su0JcPAKOPvag8V7JLZ21MaLZPPpKSrrn/yiralyVy3hquJDYIyW5Qclp
   g==;
X-CSE-ConnectionGUID: RZtGCoxfR4OiDKZXn9hXJA==
X-CSE-MsgGUID: qdujiJcnRhC+2Ae/XwL9JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="172001973"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="172001973"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6506396741
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 34711D5086
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B572D1021B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C0741A0071;
	Mon, 23 Dec 2024 17:11:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/22] wayland-protocols: upgrade 1.38 -> 1.39
Date: Mon, 23 Dec 2024 17:11:03 +0800
Message-Id: <1734945065-4373-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--0.618300-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwXR19nmRX2X/9S
	vU5mykyAmiCJ0WtA0U3NSFt8pRymsq88naeSWWBZqh+piAXo1X+u+ZyFqtd5Fb54YCapH5tAPsL
	bOLnF04TfjT8jjWZr5ZrLuu/rn2jQ7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3iuFf+VRAZx7D7L2q5dH9XYGFb8qosrs1Qw8Jhc8Z4lieoGMTxZDiyiaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrTzIrZ1iwE8cNA6irltIN1pebYxg0hr7d6G6TKRWr9wC0jfu
	T7NLqkKfShd1oFvXnNC4tnNcxWTXmNkmZFsmUVGxMRKjKt5ZuR0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209033

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add ext-workspace
- build: Raise required wayland-scanner version to 1.23.0 for tests
- governance: update NACK usage/restrictions
- governance: introduce workflow improvements
- add experimental protocols and their requirements
- governance: Deprecate wayland-devel@
- governance: Specify how to change points of contact
- governance: Clarify 'member'
- drm-lease: nominate Simon Zeni as maintainer
- ext-image-copy-capture: fix the error in the protocol description

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.38.bb => wayland-protocols_1.39.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.38.bb => wayland-protocols_1.39.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
index 3e628ab113..b936a13888 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ff17292c05159d2b20ce6cacfe42d7e31a28198fa1429a769b03af7c38581dbe"
+SRC_URI[sha256sum] = "e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.43.0


