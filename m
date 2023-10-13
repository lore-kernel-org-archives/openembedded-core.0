Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0499CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:58:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.34316.1697187480799321690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="124340678"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="124340678"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:57:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20CCFCA1E4
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:57:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EBEF6CFB94
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:57:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9394F6BA6E;
	Fri, 13 Oct 2023 17:57:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] hwlatdetect: upgrade 2.5 -> 2.6
Date: Fri, 13 Oct 2023 16:57:28 +0800
Message-Id: <1697187448-4077-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--0.916300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiMJxigKCCiS78F
	Hrw7frluf146W0iUu2v8LO5wKi8YUlWcCzOjQR80aDCzqDR7DPZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBTRF1bJhTOUS7Ty/0lDrje65f1lk8zHjtLq/s
	bkC6+yMldvumRChIuf4kluinNU9xhznxmUSNmu3SY51l4VSqZgvIYbBo7s/8nsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189035

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 527e14ad54..70315c4694 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "4579b9a6d85ae528f76e92421eb5e7b33cd26b17"
-PV = "2.5"
+SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
+PV = "2.6"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.34.1


