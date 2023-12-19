Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70349C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:36:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8691.1702978575627181471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123233759"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123233759"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:36:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20944D3EB2
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:36:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A1B5D296D
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:36:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E437F6B80B
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:36:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9EC471A006F;
	Tue, 19 Dec 2023 17:36:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysstat: upgrade 12.7.4 -> 12.7.5
Date: Tue, 19 Dec 2023 17:36:04 +0800
Message-Id: <1702978564-7863-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-1.530200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy4mfZGgSa8snnv
	qbLkjGO6ftxOuKmFYclpvSDkD5sR+qyq0GcIWDapHWRJEfGP5nlpkBMYDn8FeIwnGKAoIKJLptw
	RbAE3isEbewkoHF7w8Y16spAtinHgEuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqkHJEEn3XMk5arhUFL3qGV4HMSQIKmdGeOnF2j8nBWbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrQxpTY5Rn5Zffmh9EqIvNbN+AtqPAfs2XV8h0oVEKEGOrU8V
	tozbYqQTEn+T/S+wIW9M2xXtmwb0c6RgIQhtAVEYJXy5bmECjx0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* [Quan quan Cao]: sar/sadc: Add new metrics pgprom/s and pgdem/s.
* sar: Remove %vmeff metric.
* sadf: Update various output formats to take into account metrics
  that have been added or removed.
* Update DTD and XSD documents.
* Update sar manual page.
* sar: Add a cron entry and a new systemd service and timer to rotate
  daily data file at midnight.
* Option -V with sysstat commands also displays environment contents.
* [Sam Morris]: Use correct encoding to produce hyphen-minus when
  rendering man pages.
* Add UMASK variable definition to sysstat(5) manual page.
* Update non regression tests.
* Add --getenv option to commands that didn't have it.
* Update README file for Debian-based distros.
* Update link to my personal web page in README and manual pages.
* NLS: Translations updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysstat/{sysstat_12.7.4.bb => sysstat_12.7.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.4.bb => sysstat_12.7.5.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.4.bb b/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.4.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.5.bb
index 660bc634a0..150f4932d8 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "1df0d61306ae826c896a5cf6f665d58c671c0498"
+SRCREV = "2d7682f26f42cef9127b123e319349b330c4ab8f"
 S = "${WORKDIR}/git"
 
 DEPENDS += "base-passwd"
-- 
2.34.1


