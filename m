Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76986E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.116744.1733788633471714925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BdIYF+Ki;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788634; x=1765324634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4QVLxrlxSSTOTf1FVH2ZmiEz1xZbWxgjc6Nbs8k5r98=;
  b=BdIYF+Ki23duMdUId9pEDiuXqis5Q+h3z74cdO7LXhddiGEUaX6yhVq6
   YmfC1cxvLymF5vhwcx1X5L6w53WueB5rgdwB95ca7Q+42av8Fi1YVQ60a
   nds1RLRgebIOhqgsO5pSxAP/aC5XgKZjjxjiPIuE1/qj89xlI3gZ1jnVs
   Fd2sXcaMtY8xFlO5f/PUL4AM3VePyS9rdE6u2NTMsXmSs8movfoe1ICFw
   PAS+tY6F24bXiy2kXO1H2L/bh4TTBK/dw3q+AAISsNbV/yH4NADPnVyfp
   hGQnZyXqqCgzpuxCulpaJ55ydrPhWVTNyWNYtDcbeYNcsszbQJMaqfXgn
   Q==;
X-CSE-ConnectionGUID: Cts5daCYRUyNhK5UDU1NGw==
X-CSE-MsgGUID: ZIxhXnmCQ9i0ojH7ZaO8Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="185484786"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="185484786"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A8C196742
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C92ECFBC0
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D4D2E8DB
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 46B4D1A000B;
	Tue, 10 Dec 2024 07:57:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 20/20] vte: upgrade 0.78.1 -> 0.78.2
Date: Tue, 10 Dec 2024 07:56:52 +0800
Message-Id: <1733788612-20933-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--2.637900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tvedD3CYSjHep0MbEb2inAVfLHMdWDkKjVBDonH99+Vv/+izUVq/7Gthd
	2Y+5NC8eG9zWd04+U3Z2oLZ8u2T3EHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w5bCL
	Qc+XIaZz6Xyn4orb+SkvYP4ZPR/g9qUECceSOjChBEQ/0ALMN0OMy+h6qd7GGN735UgYp+BPWMY
	DAYSWLmJR82FXeMDz+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208515

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/vte/{vte_0.78.1.bb => vte_0.78.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.78.1.bb => vte_0.78.2.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.78.1.bb b/meta/recipes-support/vte/vte_0.78.2.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.78.1.bb
rename to meta/recipes-support/vte/vte_0.78.2.bb
index 5723f35b83..182a3073c4 100644
--- a/meta/recipes-support/vte/vte_0.78.1.bb
+++ b/meta/recipes-support/vte/vte_0.78.2.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            file://0004-fast_float-Add-single-header-library-for-from_char-i.patch \
            file://0005-color-parser-Use-fast_float-implementation-for-from_.patch \
            "
-SRC_URI[archive.sha256sum] = "6499d25179315255f9bcfce03c66fb84c03ad325dea23d0e372178521eca42b5"
+SRC_URI[archive.sha256sum] = "35d7bcde07356846b4a12881c8e016705b70a9004a9082285eee5834ccc49890"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


