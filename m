Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F07DD116F7
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:42:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.5606.1729834916882648240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KdxNp9lm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834917; x=1761370917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fOMWKFIyR83boj8sx5hhqvKk5pibDrDELCoJIB2jnHc=;
  b=KdxNp9lmyv8OLu7HcV+JTjdsdKKWO0UNz6jVxG177OfrMNwEbAnd8jAe
   dpn2vm8/YlMpYukuBC4l1OJr4bUznXuw1etVMGJx4JPKmnQNE4QAomxE/
   kqYRZJGpdJK3iahNbTtDkKk+Z8XOYK1bXrBO2HlMZEZsANFXmJRuFkXO/
   U79C4MdCg1EHflGDjKdUVHeNC4d6Y/M+A6T08Jb/kSrVYjQwoast6r+FA
   VRrgrqlPvbscpkYXEItRB7RGiv3ztjKSAiQDfwuo8hc0VE7j3rhCIGbtG
   Y9ZId6G47EmBXYrxGu9ouvE1c1+53fQ23SJZzp+ComxD7SUNO2cgoHs1O
   g==;
X-CSE-ConnectionGUID: UrW4c0trTeyalu13RB/p5Q==
X-CSE-MsgGUID: LraxQFx7TluRMBUakRm4RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177945047"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177945047"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:41:38 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CFC62D9224
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:41:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B473DBA09
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 722792007CDE0
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C4DD1A000B;
	Fri, 25 Oct 2024 13:39:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/22] libxmlb: upgrade 0.3.19 -> 0.3.21
Date: Fri, 25 Oct 2024 13:39:17 +0800
Message-Id: <1729834769-4717-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--0.728300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yaqHmm/V4M/PnJdsOLB4zv4aHE9HUMbAkBsk
	AdaEfeQKv/nLHkYI1eP+LJ0LwPqg+326SAf9dTOeHWRJEfGP5nm4/PcnTPlZaZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3J7eCbzD7i9fMvkxDPDXiHF7XImrociEeoKC
	KkeJEujnBRLfMXZsh4gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlylmQh6+sVcaLMI/5NbVcTyjIAP
	DCQiJF8ko5X/8lQyPAfleQI9tp+zwvVDR4q/lclpSsrQ5aP3AeuLi/+HzApcxileyUWPmz2/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206334

From: Wang Mingyu <wangmy@fujitsu.com>

0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
refreshed for 0.3.21

Changelogg:
===========
 - Check for corrupt XbSiloNode values in a smarter way
 - Do not always strip literal text
 - Do not assume .txt files are application/xml
 - Fix a crash when loading a corrupt XMLb store
 - Fix writing files on Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.19.bb => libxmlb_0.3.21.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.19.bb => libxmlb_0.3.21.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 27081d8749..e37c3245e0 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 8a1aa4c318b8dbe4c0c2b1c4968f867ea6641b32 Mon Sep 17 00:00:00 2001
+From b2dc47ed498d69ecac05b68abddefc7ca65983c3 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 1daca18..2e5b251 100644
+index baba19e..7da3b6f 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2876,7 +2876,7 @@ xb_speed_func(void)
+@@ -2882,7 +2882,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
index de8d860d00..c78b5eeaea 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "4393955fb7c8bbcb6a2c65ff54f16c39dc165e59"
+SRCREV = "4cff6ece25f47b8fb740881387e50a00df922c57"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.34.1


