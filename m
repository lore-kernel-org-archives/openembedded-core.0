Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3C7C3DA40
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4234.1689585044349536043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="104198172"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="104198172"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDD84CA1EB
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:39 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CC21BF4A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2522C2FC8579;
	Mon, 17 Jul 2023 18:10:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] debianutils: upgrade 5.7 -> 5.8
Date: Mon, 17 Jul 2023 17:10:11 +0800
Message-Id: <1689585025-23731-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-0.552300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yZTp3iXK6AMUVxDt4UkDQ+waHE9HUMbAkP44
	pYPD16CL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedvO0
	j+WZ6WbQWm/gAtjCd7OtG0IdqQbIYe4OGWN8bTes7Cl8sx4HBGw1Uei1O+6/rAhn751acftuem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etknWEx0BXcgjwZBQhVhEpeen63ojyN7muvWE+C
	n3HO5D5F6aIXTrWSrF1iAyCqHaoIBEdD3rGWnr4w2jlACbCMnijkmvtFwHudEu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184441

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Convert to machine-readable format

Changelog:
=============
  * Remove constraints unnecessary since buster (oldstable)
  * Salvage package (Closes: #1038553)
  * Apply quilt patches from NMUs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.7.bb => debianutils_5.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_5.7.bb => debianutils_5.8.bb} (93%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.7.bb b/meta/recipes-support/debianutils/debianutils_5.8.bb
similarity index 93%
rename from meta/recipes-support/debianutils/debianutils_5.7.bb
rename to meta/recipes-support/debianutils/debianutils_5.8.bb
index 7d705c6ff4..fb17d2d24f 100644
--- a/meta/recipes-support/debianutils/debianutils_5.7.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.8.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "https://packages.debian.org/sid/debianutils"
 BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
 LICENSE = "GPL-2.0-only & SMAIL_GPL"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753"
 
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "de14223e5bffe15e374a441302c528ffc1cbed57"
+SRCREV = "69116b856177ceb270908103b5776f897d2863c3"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


