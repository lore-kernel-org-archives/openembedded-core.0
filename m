Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17274C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:37:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.40230.1681119455512077045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wnzKUWXG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119453; i=@fujitsu.com;
	bh=fU5U3MVXxUtB7kJQPaYCtviNl3BupURRLvAgKQmwslU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wnzKUWXGe0GEiFfB+tyU+S9nE9dgAWNq3yKz/xKw0air8dZyIe3RH/Huyuq2OuwGi
	 m16sM5bZESuKWyy7NC7P09NsGGwgbWSVmo+Ir+A3zhNuSct0R5ThVrXLXL8CgSqd9z
	 AKxtRaxId9UoJQnNKmI/JaWhTkSzEbyTjmB+VX+We8zf/t55t6+tkwJzKTgZWIbmaZ
	 /5qYZ2QWAOrWrFRepPkdJIjJ6E/PdpI4lJ8f3djHjn/NzI8zh6y0ztpeMF2vV+d7el
	 SNxnbFT3BIp1EE26LolenOs3ufdVC7L3+JR9PQ2XCbPCUAcSfjlUwN1aEnBz1gYk4i
	 rumtn+ldt4cDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORpHv3hnG
  KwQF/izs/37E7MHqc27iCMYAxijUzLym/IoE148ja/+wFT7gq9sxfz9zA+Jmzi5GLQ0jgAaPE
  y5UdzBDOZSaJz0dmsUA4exglHi46wNTFyMnBJiAlceP+f7YuRg4OEQE9iav/REHCzAIqEi9+9
  7CDhIUFAiXmd9iAhFkEVCVm3drMDmLzCjhJvP36nhnElhBQkJjyEMLmFRCUODnzCQvEGAmJgy
  9eQNUoSsy+3MwCYVdINE4/xARhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFqcWlSWWqRrqJdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcApRJLC/WSy0u1iuuzE3OSdHLSy3ZxAgMw5RiFuYdjId7/uod
  YpTkYFIS5e3iMk4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMHLcBkoJ1iUmp5akZaZA4wJmLQEB
  4+SCK/ENaA0b3FBYm5xZjpE6hSjopQ4L8d5oIQASCKjNA+uDRaHlxhlpYR5GRkYGIR4ClKLcj
  NLUOVfMYpzMCoJ8565CDSFJzOvBG76K6DFTECLuVwMQBaXJCKkpBqYuiS8rjJ0uR3nN3PXMlm
  6akcZ98M0NomdJxxcen4uu/LnlKn/StVn25qbBdUP3Wwt9TRxujVb3Tpgw7feG6GKhuqqbL8m
  zXI8/13sbF38BOFvDOwTolgkvb3lzx1nPdeqIWL88RHP+43mTa0PKqxWFAvaBvLlBF+1eOj6j
  WXO8bqaTqZsnXeMbCwrD8+oTT5jvtRcP+N5s5bF1ITQUDHeioydC2umdnQlyptKfD/E+3WDgv
  nXHVv/XA+K3yOxQ1IigXHV3iXsbLze/oZq+TxLNvveP5K5Y9GCV4HHr5up/NMLcX07/+uz3TO
  TlZlLnz2+yJW05dOSrq0z5Te4eZzMZb8T3O0Uny9v2vnx+jMlluKMREMt5qLiRADxiGfmPgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1681119452!196432!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30060 invoked from network); 10 Apr 2023 09:37:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:37:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9E09C1C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9266F1B8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:37:30 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 39.0.2 -> 40.0.1
Date: Mon, 10 Apr 2023 17:37:16 +0800
Message-ID: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_39.0.2.bb => python3-cryptography-vectors_40.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.2.bb => python3-cryptography-vectors_40.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
index 795e27f75b..aa305dd736 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed918ec879e8afe0c2a5220"
+SRC_URI[sha256sum] = "8460706b5b5d0ce4a85571ca3389cf88f700bb6a0c6133dc9fe0f5a2f5bda041"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.34.1


