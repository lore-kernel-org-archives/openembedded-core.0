Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E948FC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 12:09:41 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.11103.1636459780960697090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 04:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L5AjtAst;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636459778; i=@fujitsu.com;
	bh=ESwNO7VAFfYtM8clgaVjSWm0X3nHQ/9Mljk7oOo0q6M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=L5AjtAstOPtb4a38Vempd2GVfrQvs1mswJa5CJOcG7bpDIlv06SdjSWM6WeKIBWXN
	 Q2ebRJyJqqiBKZmj/+1PMIfSqFgBKhVjW2xiptcMS9GXjCnSdSPpYltPc5ORwQlxmw
	 z/7BX0C1tTnXwqxZ1lsVOAYUZj4PUCJRsIPkfrnxMGgZETGf3XUKr6IV2+1EJ2rk5m
	 F0CSB8K881EAaRH+qnKwz2c0pQWv9GMlBCfDZZAJ52hpqYnevekZlJRzreCKOtko42
	 5J1t5Eqlkp+NawQF/QfSvt+QjE8lfrAm7bEpXx86bI7dxWSYTvngdzNRTcCDBdvUzQ
	 hYvDBTpBQAn2A==
Received: from [100.113.7.62] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id F6/98-01506-2056A816;
 Tue, 09 Nov 2021 12:09:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSZcptSv
  R4MQ6MYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPz55usBR95Kt5O2M3cwLiFu4uRi0NI4DGj
  RPvKe+xdjJxAznkmiQWdLBCJ44wSGxbcZwVJsAmoSUy/dQPI5uAQEdCTuPpPFCTMLKAi8eJ3D
  1ivsICdRNPvPywgNgtQfN/1T+wg5bwCThLTJluAhCUEFCSmPHzPDGLzCghKnJz5hAVijITEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRMKspMzyjJTczM0TU
  0MNA1NDTWNdU1MjHUS6zSTdJLLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBIZjSiHrxx2M
  h15/0DvEKMnBpCTKe1msK1GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG9fElBOsCg1PbUiLTMHG
  BswaQkOHiURXuNkoDRvcUFibnFmOkTqFKOilDjvT5CEAEgiozQPrg0Wj5cYZaWEeRkZGBiEeA
  pSi3IzS1DlXzGKczAqCfOuTgSawpOZVwI3/RXQYiagxQe/tIMsLklESEk1MNmd84xx5WArmLb
  0vFm5yT3v5qCc9rUNYct9P7pfXi50UNUy+I5noqFXjYvIP++vVvGh6TIpV3/WdcYebb/euYI1
  illEPuDJrJVH1J/MsZLg/7jk3cKg49VuX7U09R8v8ovVyPPeanG1J4CLyzOASWpG+2PlRNawR
  czVsR9/zk5tE5Q+u6n8gbOgA9P97Q/ZJiRkv3eV6X4evzxmmc5lv8lbHPfyv7ulYsyd1GqRor
  On68szn58TteM50izE7e629SppJSvwc4Y4rFApzW3KX7zg+4JpG/o2zJxwjH+OZ3z9x8/OJhe
  P6v1eVzpx56qrJ1ceNq+zUl1fl/ZXxfO3U+0k6X13lzfwp7owHbyuxFKckWioxVxUnAgAec3c
  IUIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-245.messagelabs.com!1636459778!387432!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27779 invoked from network); 9 Nov 2021 12:09:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 12:09:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CC99510046B
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 12:09:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C0375100441
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 12:09:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 12:09:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.14.2 -> 5.15
Date: Tue, 9 Nov 2021 20:09:03 +0800
Message-ID: <1636459745-60491-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 12:09:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158017

Changelog v5.15 (Nov 2021)

mkfs: new defaults!
no-holes
free-space-tree
DUP for metadata unconditionally
libbtrfsutil: add missing profile defines
libbtrfs: minimize its impact on the other code, refactor and separate implementation where needed, cleanup afterwards, reduced header exports
documentation: introduce sphinx build and RST versions of manual pages, will become the new format and replace asciidoc
fixes: fix warning regarding v1 space cache when only v2 (free space tree) is enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_5.14.2.bb => btrfs-tools_5.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.14.2.bb => btrfs-tools_5.15.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
index ba4ad0f438..399ba17e3e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
            "
-SRCREV = "35f17bc49cdf760d8f3710fe2c301b933d991fd6"
+SRCREV = "4d06e4a13d1ce1849a60b68969bc385ab736ddf7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


