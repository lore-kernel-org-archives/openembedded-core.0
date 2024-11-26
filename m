Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B5D59D93
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.35684.1732584619773401044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mmA0JO5c;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584621; x=1764120621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pmJRYX2anVSdWzQYOJKfVvazfgdJPZkikmgjPEh1IgI=;
  b=mmA0JO5ciKkvEuy8uNYCyyhsIqaW1DYyWgLG+MPO0V3Hrwm/c4xvhEH7
   GOLkj6LgMXXXVZYRH6+t7HsDD1V9ep5tGyjsaJhpIkSshmhiwcTjEZTv6
   XmTLUgxNr6jH+evDsPmUF7xwO6KANxnhuQQww6b0aTmlR2mVSfk9MJv0e
   Xf7+lUPgTQ89h0N6jNng6xmTCp5eYUDvlV33x0COjISsUJHJOHkpqwoAi
   cEw9PvKtsObPgduC0kCI9EcA3VYSjc+SFmX/llNraTO3rIIcxVRRaIkqf
   YzA3eioEJe8tkGXU1wOZ2HZrb4xXcwa0PCqVJzqbIUNt33qmizGSlBxMv
   A==;
X-CSE-ConnectionGUID: F3WwfuonTCCzu8nT8gZPRQ==
X-CSE-MsgGUID: aSyFkD40TtKrsIanfgswFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="161094700"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="161094700"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1F8ED4C72
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78E6094B1C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0371EE20CB
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9EB7C1A0071;
	Tue, 26 Nov 2024 09:30:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/16] libsoup: upgrade 3.6.0 -> 3.6.1
Date: Tue, 26 Nov 2024 09:29:51 +0800
Message-Id: <1732584602-4785-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--1.345800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu1YnEfikbQ0agn
	3iJRLHFOW8+/L+kAoawtrW8Ey1DvA3b7237U7CUnMgcjIsJOvt5ztaGkOdQrjZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1wKlYjOzXY1WvwMHydT1FzmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1z314VDF21MaYZvVpPhDoQChDpjFMfq+HU2nezkaH72zjQpQ8NG4YuDhWj
	IZT33lwkZ3uiEqFlFimrY9h/ZGHrQ7mr5r8Cpb+gHIx+/YES1tTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207813

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix `soup_uri_copy()` reading port as a long instead of an int
* Fix possible NULL deref in `soup_uri_decode_data_uri()`
* Fix possible overflow in `SoupContentSniffer`
* Fix assertion in `soup_uri_decode_data_uri()` on URLs with a path starting with `//`
* headers: Be more robust against invalid input when parsing params
* websocket: Fix possibility of being stuck in a read loop

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.6.0.bb => libsoup_3.6.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.0.bb => libsoup_3.6.1.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.0.bb b/meta/recipes-support/libsoup/libsoup_3.6.1.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.6.0.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.1.bb
index 195fc4f741..6ac48fb944 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "62959f791e8e8442f8c13cedac8c4919d78f9120d5bb5301be67a5e53318b4a3"
+SRC_URI[sha256sum] = "ceb1f1aa2bdd73b2cd8159d3998c96c55ef097ef15e4b4f36029209fa18af838"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


