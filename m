Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFA6CD12A7
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.130859.1712646652159327498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HEGlgz5n;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646652; x=1744182652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/ITPUXPRVxpHIAw6DpkVgyq//1RE21W71sQlnNRs0m4=;
  b=HEGlgz5nKszfA8z0APs0my/3fdF61qK+h7FeGwtu+dXqVBLsYCrmjc3R
   5bK2NLtPYGm5uQ424X+KwbTvZHmTGZ3KSQ9gWvryE/2E2mr9b24kmHChr
   CveMT6qi5XpTqprhSR+kH4aPZtvSbQ0FBYiaO8UmrFrknGg5OjQ+ZF4Jf
   /3tQHC1WWha3h5RAmQOKOtNmWNpo4eZabZX2wVVPDT68TpKfdnt2rMGZ+
   pdjUf/RvShxKmSTZPZGHDCoEaiPOPeZq1EPvVxW/HYoaudlKZOKdrvrb1
   Rni2DcwSguDN2au7Py7Bj+bZVU/eo6xBAjGSFrDwn4wB4qFd/qHbIS0EB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="134320641"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="134320641"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:49 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 95916D9F03
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D54E1E6164
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65CF24018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 14BFE1A0002;
	Tue,  9 Apr 2024 15:10:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/33] pkgconf: upgrade 2.1.1 -> 2.2.0
Date: Tue,  9 Apr 2024 15:10:10 +0800
Message-Id: <1712646620-16608-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--1.326300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr5gohfuTFmzU1a43ksVK2hZpS
	PQ6Xy9pdOINY3OUapTASqo3ZUfrHh+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzkIP52vHbFJ14SB
	Q1plMcdPqKRJmav3gvwcFB3ty278l+ivgp66RergeRSJhsTeukN23OoTZq+ZbV1dBnQXeSbDXiJ
	EsbTY8ciB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198041

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* libpkgconf SOVERSION is now 5.
* Significant solver rework to flatten both requires and requires.private
  dependencies in a single pass.  Improves performance slightly and ensures
  proper dependency order.
* Improve '--digraph' output to reflect more of the solver's state in the
  rendered dependency graph.
* Do not reference the graph root by name when presenting error messages about
  directly requested dependency nodes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_2.1.1.bb => pkgconf_2.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.1.1.bb => pkgconf_2.2.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
index 33d69451bb..e98458ea55 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3a224f2accf091b77a5781316e27b9ee3ba82c083cc2e539e08940b68a44fec5"
+SRC_URI[sha256sum] = "b06ff63a83536aa8c2f6422fa80ad45e4833f590266feb14eaddfe1d4c853c69"
 
 inherit autotools
 
-- 
2.34.1


