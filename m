Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514EDC25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.5654.1716369304849586856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ESOLkltL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369305; x=1747905305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wxFBXgXTmaumjExxHznyxBnCvg6LItCvEIs1feBrlNQ=;
  b=ESOLkltLD1q/enM8xZ8fGzE0a0shLn7ubwFZVseZOI7U1JYW7n/BCkPs
   8eSikwbN9nvpvPgPW8SEnIPtq30ZCJmHN1e8lpYspTSl62bdrJAEo1Ci2
   Rxqh9ZZrXvJcWtI0y4CHHVy7yabAF7T1jbyFSs7xq5/Q8RgFvFxJVYZEU
   d1Vi+uUWVnfyIFZQ1GM2r/xaqoHj9FCVeRdlKX+b388n9MGeVBzFHqRuD
   xXciYslJllReDQvETqAIL1pE2dTxsOqFzVwINHRk3PDly4XqeTbgROcJS
   jVQS94CJv4OPt0Tsj9zKA2zDypXc1EDiWlcDywGaY+Dp4Eh/lTRVflNws
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119148"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119148"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:02 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28B9BD8001
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5285ABDCA2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:14:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD51B202DFF67
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:14:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 881191A000B;
	Wed, 22 May 2024 17:14:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/42] bash-completion: upgrade 2.13.0 -> 2.14.0
Date: Wed, 22 May 2024 17:14:09 +0800
Message-Id: <1716369289-22526-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--9.626400-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mri+Y+Qw3Txz8wAYdq1VTXoxj6
	6akynPseQo31LhYNThfyH8kGvV73vwEynsDiR7ZsOIQ9GP2P2u+Siza26cvwNIqUZz0nNeaiS48
	IjXi9YDlTrqbg0vgjbtsdKYFpODTky7wkkAA3Fk0D2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiDmIE4Tvg5l/gy771S93geAN+CmNIOQU3+KgiyLtJrSCthMFibFDjzJ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vcMnqSTASyi3dEG34FZOstc7TImLrBBz89UJd
	tDx+8xokAeRmPAB1PQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199697

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* _comp_{compgen,xfunc}:** use 'declare -F --' for arbitrary funcs
* _comp_{load,realcommand}:** handle option-like command name
* available_interfaces:** strip only trailing colon from entries
* bash_completion,conftest:** use 'complete -p --' for arbitrary cmds
* fio:** engines completion
* ip:** Complete link change as well as set
* ip:** Don't stop at proxy and nomaster in neigh
* scp remote_files:** do not filter generated paths with "$cur"
* scp remote_files:** localize variable 'cur'
* ssh-keygen:** handling of bundled short options
* ssh-keygen:** make work with custom IFS
* ssh-keygen:** suggest -O arg completions depending on mode
* use -- to pass arbitrary cmdnames to '_comp_load'
* use 'pathcmd=$(type -P -- "$1")' for arbitrary cmds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{bash-completion_2.13.0.bb => bash-completion_2.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.13.0.bb => bash-completion_2.14.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.13.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
index f75d61e219..06c81beaa0 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c5f99a39e40f0d154c03ff15438e87ece1f5ac666336a4459899e2ff4bedf3d1"
+SRC_URI[sha256sum] = "5c7494f968280832d6adb5aa19f745a56f1a79df311e59338c5efa6f7285e168"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.34.1


