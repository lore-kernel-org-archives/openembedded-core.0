Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AEEC00528
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7573.1687850371144085089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="121819158"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="121819158"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B1B8DDAE10
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED6AFD5EB0
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 650DA6C833;
	Tue, 27 Jun 2023 16:19:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-ust: upgrade 2.13.5 -> 2.13.6
Date: Tue, 27 Jun 2023 15:17:08 +0800
Message-Id: <1687850250-20040-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--5.214500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvyMQS9dSPByyO3
	J80qWMSDNPgy0T0qydWDTfRn4OGe22JZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEPXc
	ag8UDUcUi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY6N/cDgNNi4RZk8qaH+Gu9gW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7Jpb9cxGq/bUHWx01/Q/aO8RxuTFLlht8WMAH
	9688QNTjeEpKSguqsQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183453

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix: segmentation fault on filter interpretation in "switch" mode
* Fix: `ip` context is expressed as a base-10 field
* Fix: c99: use __asm__ __volatile__
* Fix: c99: static assert: clang build fails due to multiple typedef
* Fix: Reevaluate LTTNG_UST_TRACEPOINT_DEFINE each time tracepoint.h is included
* Fix: trace events in C++ constructors/destructors
* Fix: trace events in C constructors/destructors
* Fix: use unaligned pointer accesses for lttng_inline_memcpy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
index 916408bff0..424b0fa645 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "f1d7bb4984a3dc5dacd3b7bcb4c10c04b041b0eecd7cba1fef3d8f86aff02bd6"
+SRC_URI[sha256sum] = "e7e04596dd73ac7aa99e27cd000f949dbb0fed51bd29099f9b08a25c1df0ced5"
 
 CVE_PRODUCT = "ust"
 
-- 
2.34.1


