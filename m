Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A77C27C75
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.5642.1716369333024599359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jkoVygek;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369333; x=1747905333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vhPN6UyiKM2TQeCXpGTQP88UUiw4LXUcXfLAge5Ym5k=;
  b=jkoVygekVrglUbflEU01JqFupOsVZL7QZLyki0N/72bs2MtwqwLa0LA5
   nva85T5VdKWgN0NN3QYelbimHVcS1RLytsvoLnTdlw/3EuETBcYvReyMo
   jaE+++UTWqUv8OoBppQZeVQtynSUwtyyjhw6O4VhQhB+9U3kRqC/r9eEA
   6xAxUzzKvcb7fGkayi3/4bQi/jzqSxi4bCwQcA4mZykLxQTxd2wRdWppH
   2ryZKs4pcnuocn23/FsR3eUsqnrgpBiV0SegDWL+iDXfNxCq+aJWSKaTP
   7LKuynIuX6FDzuNEpEh4R/STzsmfaaGzychCpXrsKg/OoS2ZcoAkVDJY2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119243"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119243"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C9930C68E9
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D469D7B7B
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF1F321CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B6071A000B;
	Wed, 22 May 2024 17:15:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/42] libgpg-error: upgrade 1.48 -> 1.49
Date: Wed, 22 May 2024 17:14:26 +0800
Message-Id: <1716369289-22526-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--8.035800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrKQNhMboqZlqrNVSgF5+L4QjJ
	lierVE/nM6+3Wy/iX61iSVnIdboij+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3rrjPebt7kkbHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiTA8B
	B7LdUgGftnk1ekQjkUysq2vrchbFTNV7Cc15Oxkn7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Two new functions to improve the logging interface.
* Add a "trunc" keyword to gpgrt_log_printhex.
* Avoid an endless loop in the argparser due to a conf file read error.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgpg-error/{libgpg-error_1.48.bb => libgpg-error_1.49.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.48.bb => libgpg-error_1.49.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
index 9f2b49209d..b7d41ab489 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f"
+SRC_URI[sha256sum] = "8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.34.1


