Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01203C25B77
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11725.1713948186958367179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IX6AgPOm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948187; x=1745484187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1KJXFwpCyftKSOBshMT1ZOU8ld3sXNRqLg12efd1V0k=;
  b=IX6AgPOmChc9fHpk2i346JrQNcr6NkF4O3AOsfzTcct8h+fVi+ONNBKF
   kDQvyaRq/OLrkZUYDZn9PfwhPmKv6npPfA39jfXBxou+r0bg0jtLqM9fD
   ACg/jUbDUll8aVyFDjvVXU3Quz7ZDo1MOPWX/hvf09fwYaXZfc6Os+o+v
   idauOhPW7wcDrejegmsQ8NIyg3Ey0H9KES1+pB4StkRDVu2/HZxBHvWQr
   WcCLlXB587QaHgx1aajYfEjbJjam55z7g/T02j6lroejhcVAWuw0IhycY
   sJT7TDwWDF2FrDuwXxOZFsmpzeKocNxsQoO0159e06ZTzzMXyeUf2VeaD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156834838"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156834838"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B704D6861
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75048D219D
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 12ACF202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B26251A000A;
	Wed, 24 Apr 2024 16:43:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/38] python3-hatchling: upgrade 1.22.4 -> 1.24.1
Date: Wed, 24 Apr 2024 16:42:17 +0800
Message-Id: <1713948152-13501-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--0.714000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/ySrLqyE6Ur/jkZIWyTeZW768+eIWB1EvDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AxXH/dlhvLv8nripqaH7Dunpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFCzUkDZVXsvOK2TsaVVxFeIalV
	UiL4xbdA56KnmMeEXn0QRms1e0zcRkyotU7Dq+TS0CTQb8xxhHfPCAYYX8BwKZAJNYXQbs6ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198668

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
 Maintain file permissions for shared-scripts option/shared_scripts build data of the wheel target

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.22.4.bb => python3-hatchling_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.22.4.bb => python3-hatchling_1.24.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.22.4.bb b/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
index d2f32d8b1a..fc8d953281 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e"
+SRC_URI[sha256sum] = "51f861891e98c4044eb455163a737e5d2328d7aa74890b182db2d80fee22a497"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


