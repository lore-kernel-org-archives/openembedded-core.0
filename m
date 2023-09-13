Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62DACA5521
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:31:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7623.1694597458799241254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="132060664"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="132060664"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:30:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CD656D29EE
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:30:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 017E6B1BE0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:30:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 84A5F40A49;
	Wed, 13 Sep 2023 18:30:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.16.1 -> 4.17.0
Date: Wed, 13 Sep 2023 17:30:32 +0800
Message-Id: <1694597432-21339-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--10.827900-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yancG1vVsfbQ3hng3KTHeTYyKRnX9xPs4IGu
	uB5GbmmMgzq26GBLL/jdh/V3Nluv1anL54M5CzEQqNtC2YatSInmk4kdu96h5G8ksUxxlDnvcEo
	cGwB4+oAUiiXAp03ZtX/qQx3XlsYMuz5caCZL4kjum6Nvy6t3NthQO8CvZj/X7Y358uT9xuWKW8
	BvXyLiEwgvGgJhnjuptODJ1S9VJLN/SV2AWgX87k7nLUqYrlslFIuBIWrdOeO1eX0jEQ9c6i1k7
	y19oijYZN4EOFsgyBjgzFDs3bSK5Qi2IDBQBAKvs0T0PE+KHuWzHazEvHv28U/cRvj5stP6VHMG
	tBwkUNOYHKCWKlLQZ7c/ZCLk5AauG3Jt29YAwfDdCok3ibXlQXvg89JEW1Q4myiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1DBbGvtcMofwcqxRI/MxCcEJxPdOon+o2/5LjzqnSxZgTSAo0MY7TFVmN9h
	xYeFcE
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187562

From: Wang Mingyu <wangmy@fujitsu.com>

0001-dnf-write-the-log-lock-to-root.patch
refreshed for 4.17.0

Changelog:
===========
-crypto: Use libdnf crypto API instead of using GnuPG/GpgME
-Reprotect dnf, unprotect python3-dnf
-Block signals during RPM transaction processing
-Fix bash completion due to sqlite changes
-automatic: allow use of STARTTLS/TLS
-automatic: use email_port specified in config
-Document symbols in dnf history list output
-dnf-data: depend on /etc/dnf/dnf.conf, not libdnf5
-Update repo metadata cache pattern to include zstd
-typo in doc/command_ref.rst
-Add provide exception handling
-Support lists of KVP in kwargs when calling add_new_repo
-python3-dnf: Provide /usr/bin/dnf4 symlink to /usr/bin/dnf-3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch      | 7 ++++---
 meta/recipes-devtools/dnf/{dnf_4.16.1.bb => dnf_4.17.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.16.1.bb => dnf_4.17.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 21b50dee01..eb0309d81a 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 5e07c16a506b19cbb107d5e99fca41d679b23b9a Mon Sep 17 00:00:00 2001
+From 3bd0faf58cc9ad531e6b63d5660c4b8316e8daed Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
@@ -10,15 +10,16 @@ already existing, and base-files creating it as a symlink).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  dnf/logging.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/logging.py b/dnf/logging.py
-index bd660470..a9d808b1 100644
+index ef0b25f3..94610af6 100644
 --- a/dnf/logging.py
 +++ b/dnf/logging.py
-@@ -94,7 +94,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
+@@ -118,7 +118,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
      def __init__(self, filename, mode='a', maxBytes=0, backupCount=0, encoding=None, delay=False):
          super(MultiprocessRotatingFileHandler, self).__init__(
              filename, mode, maxBytes, backupCount, encoding, delay)
diff --git a/meta/recipes-devtools/dnf/dnf_4.16.1.bb b/meta/recipes-devtools/dnf/dnf_4.17.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.16.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.17.0.bb
index 9134411fa9..ec4e48d68b 100644
--- a/meta/recipes-devtools/dnf/dnf_4.16.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.17.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "94b7cc7956580405b219329541d6b40db6499cf1"
+SRCREV = "a31687c169095de1acb5c0a3762bf78993661776"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


