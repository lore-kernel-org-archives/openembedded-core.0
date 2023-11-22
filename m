Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD57C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:01:16 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.15249.1700643673649817524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140375407"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140375407"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:01:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60DC4D9D96
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:01:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 890B0D8ADC
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:01:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86FC320076847;
	Wed, 22 Nov 2023 18:01:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libksba: upgrade 1.6.4 -> 1.6.5
Date: Wed, 22 Nov 2023 17:00:29 +0800
Message-Id: <1700643629-9490-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10--1.855600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwlsQ9ktMX8f7Ib
	Zw1fiQsEg5ortHq/YwyvJYCsbEmyewSEZltFdz1cA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYj92Syca4aYVXSJ4c3nT+QcDfgpjSDkFN9UEOicf335WyUwdHR0zJ3aem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUrIz0fN9utDbtezFnP8nFe1Pn4
	Jc4K+iuAxGLzPMsSeP3kyqvKqco7xbEPqdKc24FoCOldfn0WUTQdZOZ0haXQ/IXUHzgotq67H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add Brainpool curve detection using parameters with compressed base point.
* New configure option --with-libtool-modification.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libksba/{libksba_1.6.4.bb => libksba_1.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.6.4.bb => libksba_1.6.5.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba_1.6.4.bb b/meta/recipes-support/libksba/libksba_1.6.5.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.4.bb
rename to meta/recipes-support/libksba/libksba_1.6.5.bb
index f9636f9433..62ba73d2d5 100644
--- a/meta/recipes-support/libksba/libksba_1.6.4.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.5.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "bbb43f032b9164d86c781ffe42213a83bf4f2fee91455edfa4654521b8b03b6b"
+SRC_URI[sha256sum] = "a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.34.1


