Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00801CA5531
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:43:04 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7818.1694598182591713184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="119746915"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="119746915"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:43:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 466DCCA1E4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:42:58 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CECBBF4AA
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:42:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B090F881FA;
	Wed, 13 Sep 2023 18:42:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 6.4 -> 6.5
Date: Wed, 13 Sep 2023 17:42:40 +0800
Message-Id: <1694598160-21951-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10--0.654500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkSbH8JSFFXQW2x
	RSB0G1zrCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0cicqvB+icULOOp
	5xxUy7obBJzRaNYBsMrzk08DcGe6UuJXEeLLJ6+yeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDnnhityH2+0QK/8DYvVlt2DKneZLRUw3VVT3ZQlAvV13j6ptJ6+ZHsTwvN+vbvHlhmLOm
	AgXOIrMpy2GcGlSWVc1whquba3hDoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Implemented decoding of cachestat and fchmodat2 syscalls.
* Implemented decoding of SO_PASSPIDFD and SO_PEERPIDFD socket options.
* Implemented decoding of SCM_PIDFD control messages.
* Implemented decoding of BPF_ENABLE_STATS, BPF_ITER_CREATE, BPF_LINK_DETACH,
  and BPF_PROG_BIND_MAP bpf syscall commands.
* Updated decoding of BPF_OBJ_PIN and BPF_OBJ_GET bpf syscall commands.
* Updated lists of AT_*, BPF_*, IORING_*, KVM_*, MOVE_MOUNT_*, NFT_*, NT_*,
  PR_*, and V4L2_* constants.
* Updated lists of ioctl commands from Linux 6.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_6.4.bb => strace_6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.4.bb => strace_6.5.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_6.4.bb b/meta/recipes-devtools/strace/strace_6.5.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.4.bb
rename to meta/recipes-devtools/strace/strace_6.5.bb
index 2174790fbe..8f90c35925 100644
--- a/meta/recipes-devtools/strace/strace_6.4.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "27987dbac57fdfd260c6db4dc8328df35c95c6867c8a3d4371d59cdcf4eb9238"
+SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
 
 inherit autotools ptest
 
-- 
2.34.1


