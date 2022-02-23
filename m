Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDDFC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:42:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.7729.1645623737612624290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aDdAUvEr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645623735; i=@fujitsu.com;
	bh=fAQZfno0QPfKmw64N5DjCuXqntAG85hctioCdlHWpw8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aDdAUvEraK1kNj2nOQHmSgFh80EUWC2Z24UlwAIGCcBbnJk7v5WFY+ixxNmzATTwi
	 qKaf8HwnAbVZZZ2mUXxSN5oO1Pn2/Y8h9wBrqmvbmzYQ4dkrCDSTIaauyPvE+JRGoI
	 TdhFj43/jVP3UGkIqcXQxNxr7BMLygt210n8IZZuNZRPQOE2MiPMe1Z5nCEeC2o65S
	 BU2mhPFWjqv/wLS6KBFLrUV0Y9HpxV74Utg2fab4PikKFxHsFkc6Hq1+i68wJ3Z4Jo
	 V2MpKEvSx9YoRpgT/DpGC0crK0+pfxomRkvF8AB3o8XIfdnycZnaswFdxN5R5PfDqV
	 thT/c49KS6h3Q==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 44/E2-21232-7B936126;
 Wed, 23 Feb 2022 13:42:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSXe7pVi
  SQesacYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePM5KfsBfM4K/Y+7GVrYDzD0cXIxSEk8JhR
  ou3pF2YI5zyTxIKFTxghnBOMEtcndLN0MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgLfEt/8TmUFsFgFViR39+8BaeQWcJG5t2QNWIyGgIDHl4XuwGk4BZ4kzT+cwgthCQD
  V3216zQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01TXWNbS01Eus0k3USy3VLU8tLtE11EssL9ZLLS7W
  K67MTc5J0ctLLdnECAzilGLm4zsYp/T91DvEKMnBpCTKe41HLEmILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBK+YBVBOsCg1PbUiLTMHGFEwaQkOHiUR3uuqQGne4oLE3OLMdIjUKUZFKXHe6wZACQ
  GQREZpHlwbLIovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm1TYDmsKTmVcCN/0V0GImoMV
  TsoRAFpckIqSkGpgcKiNEeO7uPr257n/Zoz9ctwJDT5fH9C9N3vtIkDPzbU3cc6mYj4597z8s
  Uk0s6r6zoftG/J/ql3Mnz18Xc+7XM/WobRM6TrxdwJK1U6I+LbJxH+vB90+evbj7TKZKz0Fuy
  qmYUAbHWfr3GN47l7Iy6OUu36RxXD89wGRnTGLeQuO7XC32F1hK+4Lec0/+bCJwrN20OSVa7K
  5s+2+1L0YHF2298qv3p3uC48FXHU72jiZpdgGLhNdtecPree6i4rqTzRvjWEzfTghN8uC5GKD
  7xoZ3TaHgnogLph7vnq+4ftmu59mvm9W/pXYyXqhnv/vk5reEFZ3TfVvnCzVum67y3aWkxfbu
  maSghKMcWWxKLMUZiYZazEXFiQBT3yQlXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1645623735!21086!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24682 invoked from network); 23 Feb 2022 13:42:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 13:42:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D7661100458
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:42:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C658C100446
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:42:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 13:42:06 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wireless-regdb: upgrade 2021.08.28 -> 2022.02.18
Date: Wed, 23 Feb 2022 21:41:54 +0800
Message-ID: <1645623714-29329-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645623714-29329-1-git-send-email-wangmy@fujitsu.com>
References: <1645623714-29329-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162266

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
index c673f8044c..801a6f0584 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446"
+SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
 
 inherit bin_package allarch
 
-- 
2.25.1


