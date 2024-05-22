Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1327C27C79
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5669.1716369336014468913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p0O8rKc0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369335; x=1747905335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4sIh9E7zVw0MGft1YH+FRvNe4HGHqktqCupdLklfO6Q=;
  b=p0O8rKc0OY0cHBIWof+Ls/jsAdwBzYMqh5CVjIBqY0KZcpWjvSfjT6PT
   tGRM/00jeYM7yXQSI3nnuaTfNGaDhEgCjaMOLmmwfoPsLyoJGe8LD25aQ
   FP5dwAGBQ4rlxwJazs95eb4T21gIuFK02+QDpl/iGRfaqPU1NxGHhkxbS
   5Q4q6KeETGY6MNgByGAgWAmE8pMab/bYZF8JJZa6WHg/KZFikdGLtxPKQ
   ZJ2DBPVvtqTzRei4oyRVH90EQxyY8bRHU0tiWF0jt/L97tRhNHnE0geac
   YGIXS0JGZjg0dpOGRyLOLF8/xuXaAvTHaZ2zOPEqsG9vt7LIyaWlPpXUZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159133786"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159133786"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B405CA27F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D715D6FF0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D6BB82022B83F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8287B1A000B;
	Wed, 22 May 2024 17:15:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/42] libxmlb: upgrade 0.3.18 -> 0.3.19
Date: Wed, 22 May 2024 17:14:30 +0800
Message-Id: <1716369289-22526-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--5.782800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyAI7Mvq/sL593j
	jLnWeB3h4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2Uz5vzLEGq8DRbN
	5XR1zwhzrjPebt7kkbC5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO38o7
	Ys1NK4YxABQjnY8xR6TbBd8TUTCob4HqwOdqlWYJEB2p6mYdIM
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add xb_version_string() to get the runtime ABI version
- Add the runtime version as the default XMLb invalidation GUID

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.18.bb => libxmlb_0.3.19.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.18.bb => libxmlb_0.3.19.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
index 10ceab0721..de8d860d00 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "59cf2e0bf3c4d0905a32e32828d6100784993621"
+SRCREV = "4393955fb7c8bbcb6a2c65ff54f16c39dc165e59"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.34.1


