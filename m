Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9D3C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.26612.1685610235196119952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119096871"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119096871"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04BBAC68E5
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:50 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 28656CF7EF
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 609D9887D8;
	Thu,  1 Jun 2023 18:03:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] babeltrace2: upgrade 2.0.4 -> 2.0.5
Date: Thu,  1 Jun 2023 17:03:07 +0800
Message-Id: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--13.381700-10.000000
X-TMASE-MatchedRID: mL9wGNQYBVujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvMtotGtpF5VsDA
	lZ8gTg0en930i8LkkenhORBoHiYSCfo4pHUllWbzs0T0PE+KHuUIKj6WwO7KdcSaCGu4pkrwoPi
	UPjlG9PefItpWf/Sx/4h78OFccB3o2xtgxHwvK597TXnCjI8t9tFb0ZIwh4SuVI7KaIl9Nhd+uS
	pY3nuuR4w1TMOkyb7hsp9MlOzCpAxexSxKcqB2AO9kW9mxCQvtLYdywTHl7nsPhqnAnsky1aiz2
	yX3N56RlmHc8kUydpSdq47npSM3mpA4PUjL3AhE3IFFT9wqfr2BytkIbXCbB11d55ms0luC9eF8
	OYq8IDIP84WlxIC/C0ECImil5O/Q7VrXqiqnwHXy3h9RQZ4StPSzAdIVxUnowLkNMQzGl5DfZLr
	Ulw8HxwHVl/mDpbMJLEwFXrz/ShmyZ7m86THBhDo39wOA02Lh4SkIdSwphgZQsd2v6VnD2iMvxY
	NZkZ6i7QHQxPxLQSSAMuqetGVetnyef22ep6XYOwBXM346/+zdUX+loE3XR6ej1bvj0qIoYEMmm
	S09OFp+HbQfrdzT6vRoa5nVdRe6
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182057

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * bt2: honor build system compiler/linker preferences
 * Fix: clear_string_field(): set first character to 0
 * Fix: src.ctf.fs: Not resolving event common ctx
 * debug-info: fix -Wenum-int-mismatch problem in copy_field_class_content_internal
 * fix: pass exec-prefix to python bindings install
 * fix: document proper Bison version requirement
 * cli: use return value of g_string_free
 * babeltrace2-query(1): erroneous parameter used in example
 * Fix: tests: print real values in a fixed format
 * Fix: bt2: autodisc: remove thread error while inserting status in map
 * tests: src.ctf.fs: add test for metadata with invalid syntax
 * tests: shorten names of session-rotation trace
 * bt2: ignore -Wredundant-decls warning
 * ctf: fix -Wformat-overflow error in ctf-meta-resolve.cpp
 * ctf-writer: fix -Wformat-overflow errors in resolve.c
 * Fix: src.text.details: use write_uint_prop_value to handle unsigned values in write_int_range
 * Add `dev-requirements.txt` for pip
 * Fix: src.ctf.lttng-live: consider empty metadata packet as retry
 * Fix: ctf: wrongfully requiring CTF metadata signature for every section
 * Fix: src.ctf.lttng-live: session closed before any metadata is received
 * fix: obsolete warnings with autoconf >= 2.71
 * fix: explicitly disable '-Wsuggest-attribute=format'
 * fix: set stable branch in gitreview config
 * Fix: ctf-writer: list of reserved keywords
 * compiler warning cleanup: is_signed_type: compare -1 to 1
 * Update working version to Babeltrace 2.0.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{babeltrace2_2.0.4.bb => babeltrace2_2.0.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.4.bb => babeltrace2_2.0.5.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 16d8b945a4..6123456c30 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=http
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "23e8cf4e6fdc1d0b230e964dafac08a57e6228e6"
+SRCREV = "66e76d1ea601705928899138f02730a3a2a3153d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


