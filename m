Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FEAC4708B
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.7550.1649245872815058149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KIM49c4L;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245871; i=@fujitsu.com;
	bh=kwZcbiiroILl9X7x0KDyT9ZPX/dgIACrymTfa34O9IE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KIM49c4L0wLN78jKRbnvzC6dEORs7s333KSd/DYfDMKtFjEk7UbBsF36Y8et6Q/DH
	 MZqdsr03PZZoktqsfUALZz7lw4+C1D+lsO1thJD2b3d/nFqbJrZJogCafQDkCl/XMO
	 /9xOhSNtZ2cUhcIoogVuKD13umUTHNtx3dEv3Zsi6v0Vgo3l1lpcbm2IAK46dxCewC
	 pM9iluG+aDk7Z8XmNoCOHvBGryg/GWH6quL2h7U5ZiKs2pWpf4hM3uREZuMFYa7Hlx
	 B7VXOJfShH1MnlXnAYn9gYfe+eybQsTTPXEqwl7Jbz1CLK7W1ypbRXlS7P8bpNKnZ5
	 jsGApZdhhcDGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSXddnW+
  Swe5XGhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a77UtYCno4KtbMOcTUwDiLvYuRi0NI4DGj
  xJO3y1ghnPNMEn/X/mOEcHYzShy+vhOojJODTUBNYvqtG0BVHBwiAnoSV/+JgoSZBVQkXvzuY
  QcJCwuYS/ya6ggSZgEKr97UzgJi8wo4SbQsaAWbIiGgIDHl4XtmEJtTwFlixvJbjCC2EFDNun
  ePGSHqBSVOznzCAjFeQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iYVZaZnlOQmZuboGhoY6BoamuqaWeqam+glVukm6qWW6ian5pUUJQJl9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAgM5pdjVawfjkb6feocYJTmYlER595f7JgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4N1SBZQTLEpNT61Iy8wBRhVMWoKDR0mEV6sGKM1bXJCYW5yZDpE6xagoJc77EiQhAJ
  LIKM2Da4NF8iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxeIFN4MvNK4Ka/AlrMBLT43Rl
  PkMUliQgpqQYmk9kOz6KeVSmpFVg1tcWJnj6/axPzXcF7l/pUIpdI7Lp74bth5517Eza+mF4j
  8vi0lVkwp+UU6TNyDqxT70eqFm2KPyRaW6j9o5L5Z4jL1Hl6C+45SepZd0qWZB3MtN7lxHz+f
  tYcc7lXa86XZouaXn4c3in+4kFmw5wlgiEpHZ/E/Wefm3OES3r524BN+SyPNtXq7ONuDLX9+/
  D0tO2PK08m9faYaJe1PsvQefz/0tvNDaEGCx6sfKR8RL6w+FXk6uU/tfNX2m3XT1R2TmXonNh
  4K8ng6PZYm46VawI+RK0W23TwcFDCZd1FfQ8LLq9w/Dk3YeHCPRLzP7Kef98dUbT14lv+jYZ7
  GK/Ou6B3XImlOCPRUIu5qDgRAGTPxhRfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1649245870!101697!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1918 invoked from network); 6 Apr 2022 11:51:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:51:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 25A72100468
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:51:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 16B2B100461
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:51:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:50:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 5.16 -> 5.17
Date: Mon, 4 Apr 2022 02:47:29 +0800
Message-ID: <1649011649-28952-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011649-28952-1-git-send-email-wangmy@fujitsu.com>
References: <1649011649-28952-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164075

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_5.16.bb => strace_5.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.16.bb => strace_5.17.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.17.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_5.16.bb
rename to meta/recipes-devtools/strace/strace_5.17.bb
index 4bde14f939..129db87af8 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.17.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
            "
-SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285"
+SRC_URI[sha256sum] = "5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f"
 
 inherit autotools ptest
 
-- 
2.25.1


