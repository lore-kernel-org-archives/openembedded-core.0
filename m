Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63864C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:31:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.37546.1670830264458313733
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ocXCHPWO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830262; i=@fujitsu.com;
	bh=N9lIEcVaE+K/oA6l7NmR44XuaX/U3c+4UGC3Q1iNEtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ocXCHPWOq3i9tFVCc/Rp0wuZnEbEFTpW7c6/b1Hk77ecct9HOXTOdlkOkf9gt7SKb
	 XkQR4ELP8Di898Yw9GCEVLOPZR3WnkuTsaU3thXIZ9pCvMCnbHJ4LZDThu1sax5xeW
	 LVsHoAyzE7N/l47ZZDbuvz6vQ64zI6Mo17wdleWW4Kcxh5Jp6FuEE8IUit1aa3yASs
	 Um+NtQAv+fdXsWeS1JnUFxVbdNPqvU0m52NMvM3vpD0AnQ+w0VTiUycwz6UHjAK1Su
	 9F1N+h8sircJ4Iyo6XewBfG126kDCfgbZrK+vdArTUAteH8dpl35rebJjE6SOxLoLk
	 mTq2POcMtzgzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSXfbjWn
  JBlf+CFjc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBmrvnxkLJjLUXGiYwVzA+M+9i5GLg4hgceM
  Ei+e/mDqYuQEcq4xSdx/pg6R2MMocevQZXaQBJuAlMSN+//Zuhg5OEQE9CSu/hMFCTMLqEi8+
  N0DViIsYCsx4dUyZhCbRUBV4ufZHjCbV8BRYsadTywgtoSAgsSUh++ZQcZwCjhJPDuaBbHWUa
  LtwUxGiHJBiZMzn7BAjJeQOPjiBTNEq6LE7MvNUGMqJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNdZLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3JTi9PU7GN8t/aN3iFGSg0lJlLfyyrRkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8G64B5QSLUtNTK9Iyc4BRBJOW4OBREuF1A2nlLS5IzC3OTIdInWI05ljbcGAvM8fMr20HmI
  VY8vLzUqXEeaWvA5UKgJRmlObBDYJF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrw2IFN
  4MvNK4Pa9AjqFCeiUqJdTQU4pSURISTUw7W1tffl4EYMa026+hieztvArvYnQyn28R/FjAruw
  8FTOCrvIgh7bC/s37uZZ0Ozy3N7/3kKT/5t37lvPcXgPk94uQ9unUvXlN7klpjW94H/fs65Yy
  0ZdtD1gadAKQeVbuyW/+0wvmc82aWX9AhnzN98fhBwqmiVl9jznkF6JSV7Z4+d+H+YdXJyT8k
  rsqsPEoCrDzk+Ld2YZzeP+ajffl3Np7NTE79WfwwRWdmnnXF405/aG9peHfmRwePlMrdubdEx
  GT/tDlO+6hZmKd7lUlbM54pJ3rDgTmzb3/tEP0lOvs6c/37f6+HnvJ0/ktonZzTi4Pn3JsgVr
  92/hfHmvU0Oz32hToO16Y9ErbkJJzUosxRmJhlrMRcWJAOfdBJRpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1670830261!222990!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17121 invoked from network); 12 Dec 2022 07:31:02 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:31:02 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B14211000E7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:31:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A4C641000D2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:31:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:31:00 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxkbfile: upgrade 1.1.1 -> 1.1.2
Date: Mon, 12 Dec 2022 15:29:56 +0800
Message-ID: <1670830196-2900-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
References: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174485

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
configure: Use AC_SYS_LARGEFILE to enable large file support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbfile_1.1.1.bb => libxkbfile_1.1.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.1.1.bb => libxkbfile_1.1.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
index 17ff588fdb..6494d5e0f1 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
@@ -14,4 +14,4 @@ PE = "1"
 
 BBCLASSEXTEND = "native"
 XORG_EXT = "tar.xz"
-SRC_URI[sha256sum] = "8623dc26e7aac3c5ad8a25e57b566f4324f5619e5db38457f0804ee4ed953443"
+SRC_URI[sha256sum] = "b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1"
-- 
2.25.1


