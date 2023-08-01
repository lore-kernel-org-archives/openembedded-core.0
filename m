Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2F3C04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7617.1690875711602295069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613480"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613480"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:50 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0FB8DE63A
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:47 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6FBBD8B78
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id F34742FC86F7;
	Tue,  1 Aug 2023 16:41:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pathspec: upgrade 0.11.1 -> 0.11.2
Date: Tue,  1 Aug 2023 15:41:22 +0800
Message-Id: <1690875687-21573-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--2.434600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mryqyllX6UJIs6FHRWx2FGsCC2
	FZ19GZheJ2o10m2bLBIgWr3O5UmTd3jgwTI4unpfk8lIEwxRTqBUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmifnzmcpBzOrs7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcsr6K58b/MuxXU4F/suxYXfbphkCzaFzjBy3C
	sNDhMLAmxBiQ1TRbPTWOzr2mTiqXRKTuOljjMwwuALBErf/tNCbMcbhvDlYaf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185205

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Issue #80: match_files with negated path spec. pathspec.PathSpec.match_*()
  now have a negate parameter to make using .gitignore logic easier and more efficient.
- Pull #76: Add edge case: patterns that end with an escaped space
- Issue #77/Pull #78: Negate with caret symbol as with the exclamation mark.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathspec_0.11.1.bb => python3-pathspec_0.11.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.11.1.bb => python3-pathspec_0.11.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb b/meta/recipes-devtools/python/python3-pathspec_0.11.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.11.2.bb
index 79f03da984..37b9e27d33 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.11.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "2798de800fa92780e33acca925945e9a19a133b715067cf165b8866c15a31687"
+SRC_URI[sha256sum] = "e0d8d0ac2f12da61956eb2306b69f9469b42f4deb0f3cb6ed47b9cce9996ced3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


