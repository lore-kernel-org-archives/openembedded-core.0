Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C80CDB482
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:47:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.113213.1697446042289448998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="115692658"
X-IronPort-AV: E=Sophos;i="6.03,229,1694703600"; 
   d="scan'208";a="115692658"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:47:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37791CA1E4
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:47:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 715D5BF3EF
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:47:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B1596BC51;
	Mon, 16 Oct 2023 17:47:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.43.1 -> 3.43.2
Date: Mon, 16 Oct 2023 16:47:07 +0800
Message-Id: <1697446027-29936-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27938.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27938.006
X-TMASE-Result: 10--0.763800-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqykob0Y35+HFKqX
	NKklxta3g5ortHq/Ywzx5J6GqO+BfPDpgNqI2WgtGqSG/c50XgMpA2ExuipmWjMM67DQIVkS4dO
	sNKuqfaw6icQUEaZtiZ9WDiQHsm7IDeZlduezw9Wy7DNFQWhX4DgN1uze3QYJRjHvrQ40NxaO/e
	COYWIm0uArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtlgDeovr2tertKfQ
	2mUc6Dd/ylbX2Ykg6aE8h/e0S8eEvn/om5XE6y/e015woyPLfbDdbWHiuS1nwIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSmcfuxsiY4QFOdI2Ae5q0me82Q5XQc0Eqpk/bB
	+2PvR1IQ2A+n/CVf8m8pYADAFjKbTNiRaT/8KTw+l/84LbF7p2e2GFXN8U2eZ6swgU5QOcex9n1
	XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189278

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add support for Contentless-Delete FTS5 Indexes.
-Enhancements to the date and time functions:
-Added the octet_length(X) SQL function.
-Added the sqlite3_stmt_explain() API.
-Query planner enhancements:
-Enhancements to the decimal extension:
-If X is a floating-point value, then the decimal(X) function now does a full
 expansion of that value into its exact decimal equivalent.
-Performance enhancements to JSON processing results in a 2x performance
 improvement for some kinds of processing on large JSON strings.
-New makefile target "verify-source" checks to ensure that there are no
 unintentional changes in the source tree.
-Added the SQLITE_USE_SEH compile-time option that enables Structured Exception
 Handling on Windows while working with the memory-mapped shm file that is part
 of WAL mode processing. This option is enabled by default when building on
 Windows using Makefile.msc.
-The VFS for unix now assumes that the nanosleep() system call is available
 unless compiled with -DHAVE_NANOSLEEP=0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.1.bb b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.43.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.43.2.bb
index 93146358c7..64c1013625 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9"
+SRC_URI[sha256sum] = "6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.34.1


