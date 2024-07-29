Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8733CC52D70
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.46591.1722215426780874404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qgMdLVVb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215427; x=1753751427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WIZwTLVrB/I62AVTT5h24nqcGm1rM73o4L58HmhpggY=;
  b=qgMdLVVbtg+LLu/nroQgYcniSsdN4F2oDQqackQIoAhiBw+ndKDcax16
   rlro6O5fvndp/LVzEtL/+eY4b5Njt7UpjE8hmhAf1j01u/lZf3AlqZ83F
   cRG5DU1bwlfWEgAdhNYs6Q3fZMZuoOtrVIJlXQiOIaIXvWEFtG3m36J+2
   klr/UPgYf5R2VWuLbVOv8HlNq5qSRkCQoaf2YPKCv1MsyywdHpusCDOlb
   KLkVyyYy+83l2ahqdb3sWdZLHjxoj2q4gZN2zPhS5I27Kqpyszx4l8KGL
   CoI248hdYcjedbliYE2USgADBQSVfJskyLnYFeByzIDB15iEYaTkCmBGl
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168832554"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168832554"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:24 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 682E4DB3B5
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EF58D209F
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A6A782D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4E7D1A0002;
	Mon, 29 Jul 2024 09:10:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/33] librsvg: upgrade 2.58.1 -> 2.58.2
Date: Mon, 29 Jul 2024 09:09:43 +0800
Message-Id: <1722215408-27541-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.275700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrw4SuXsUCGYj+Aw16GgqpO/Ut
	SCGaNXOrp0I2cxCIAzlt1av1ivNTb+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ//S
	AQv/+tsoP84WlxIC/Cw+Ic2U8xeYHDrWW+YTCqzFIcJTn2HkqsZ3ZbPRfc5otmyiLZetSf8nyb6
	HMFK1qe7zpudJIfq+xC24oEZ6SpSmcfuxsiY4QFOfFdGneuIFWb1US5bueokUYDQR5UcsOLpDIQ
	8vduaJKhZFs+bIGeA8rMNJYkpDqv6F08E/fk+71Kxr141O42x9yJXvj9UGUHux9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202581

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- #1087 - Don't leak XML entities when the XML document fails to parse.
- #1092 - Fix stack overflow in <use> reference cycle.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librsvg/{librsvg_2.58.1.bb => librsvg_2.58.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.58.1.bb => librsvg_2.58.2.bb} (97%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb
similarity index 97%
rename from meta/recipes-gnome/librsvg/librsvg_2.58.1.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.58.2.bb
index 206225414c..19e269960e 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb
@@ -24,7 +24,7 @@ SRC_URI += " \
            file://disable-rsvg-loader-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "3728596290a8576d305d06ec8afdf473516feee9dff22e03235eac433d56824e"
+SRC_URI[archive.sha256sum] = "18e9d70c08cf25f50d610d6d5af571561d67cf4179f962e04266475df6e2e224"
 
 UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.34.1


