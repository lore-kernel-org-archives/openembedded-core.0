Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2AAC54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7945.1711413463690762646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JNBXk4gL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413463; x=1742949463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vgcuad82oxzDU4tY3ojlXfcqzuGRuF3YEU2zGa+i27s=;
  b=JNBXk4gL+ANiLeIwW9vMe8KgstiUjfEeSPQ1Up6hDYjAqK//LUwmQOIA
   UtkUawmwcFsbjQzCwqzkwDDK2bmYzWmi+MciABKl+qaNC5G9mNZHq5fxA
   6Eg6/arLnmxkIANoivYMPe7czdxnJwlERFXOwnZM3uvIHcK1TS+iaF1G2
   1hoNJ3rHNPXKsvM3jouXDOMkYkv8W2jH8jd/n3WA65eM/b1818+1lMwSb
   +qWyVUeBNzgV1vGivVWftYHCw5JXsVBg8pI67Drd016U+9MZBCe/6hsQk
   CMi0YHLaKaGg2qee6ZEpZtEIW1FqAISL3SsEpEkd+7GpohMK7nCWRnhPZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="140944146"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="140944146"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:41 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 90127D4801
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CBAD097A51
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FE5A6B4C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 095AE1A006A;
	Tue, 26 Mar 2024 08:37:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 29/34] python3-zipp: upgrade 3.17.0 -> 3.18.1
Date: Tue, 26 Mar 2024 08:34:47 +0800
Message-Id: <1711413292-3025-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-4.814700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrIcCiCHZJTlcFDK6GZYQJfXMW
	fmr8UEU8HSgMbDX3hhG5mjVkB39kGi8Wgw4X6h3hA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcnlMRFCVnXHcPXfayb1U7A1sP2sgwY7nNzxvd
	NOJ4V35rO73HNRqpqMe/Y0LMNFWEtok6AQ7BQ1rsSGpdkQ4R/AOOr6X1Lf9X/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197517

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Bypass ZipFile.namelist in glob for better performance.
-Refactored glob functionality to support a more generalized solution with
 support for platform-specific path separators.
-Add special accounting for pypy when computing the stack level for text
 encoding warnings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.17.0.bb => python3-zipp_3.18.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.17.0.bb => python3-zipp_3.18.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb b/meta/recipes-devtools/python/python3-zipp_3.18.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.17.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.18.1.bb
index e9e220e315..e43432469d 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.18.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "84e64a1c28cf7e91ed2078bb8cc8c259cb19b76942096c8d7b84947690cabaf0"
+SRC_URI[sha256sum] = "2884ed22e7d8961de1c9a05142eb69a247f120291bc0206a00a7642f09b5b715"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


