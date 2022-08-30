Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65BAECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:28:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.7864.1661833711394710407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wA4SjBj+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833709; i=@fujitsu.com;
	bh=5trfEcNuuE4txfLkpb86m5N6PQjJ/c7kGr3xZY2Epzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wA4SjBj+QYhVoTtemMPwijqPuqMnGfnOswJYTCASwHgejcm0+VCFncwHwNJdkhq3Y
	 vJ9/TLt4mJ7DfkR0ZOLw0w/vrsmfWTfqVKpJ99Y6prbf2NAMZQ2Y9sZCp6MJjyfhjQ
	 ZHO3wU1J39ZDe787FLp2BKuEZm6CJFEMvurcVUKvpuH5yPp61FOcZZSGnMPqrGCPYZ
	 F28wFahVnnepgUSM2B+VtPeaqRqPZhh9eL4NSO/xMkvFb5XVbxG7eBqd0IXk3yCPje
	 tx1HDo51zRmo6ODnizwNZBMHky4gX+xkT468p+WLodSXrsLQWRmidX8N4iqaBpiKZF
	 iDTo3vHFJ/0Pw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqPtmIm+
  ywa0rVhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0br69vsBQs5Ki5cOMjUwLiDvYuRi0NI4DGj
  xL4Tr5khnOtMEusu/mOCcPYyShya9pWli5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBcwldi/vYwaxWQRUJaZc+wIW5xVwknj5ehUriC0hoCAx5eF7sBpOAWeJmRcOMIHYQk
  A16+8uZIGoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdK7JnVzwRhq0lcPbeJeQKj4Cwk7bO
  QtC9gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprAmQZ6iVW6SbqpZbqlqcWl+gCueXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSzJK6g7Gv76feIUZJDiYlUV63ft5kIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8ZiA5waLU9NSKtMwcYETBpCU4eJREeL27gNK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy8
  9LlRLnnQUyQwCkKKM0D24ELLovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm/QEyhSczrwR
  u0yugI5iAjni4hBvkiJJEhJRUA9Oaj71Sv+ct5eGdlHPy5KKcTp2t857w6evv/7zlo/eCaK1H
  h9QCH73yWPp26dbZ2/k/x/zqtDh+9IHf2tvPHyXy3Pp0WuK8kcqNDg3Oo14mX6dN3HWkdl728
  aC/B5sVLeOy1zexfr7I5jY70mj7h7Nf3sifP5GsnjSprluonMF0bbPoNamb7XNnTljxK8f3ce
  hkn/mPFkYKLgxZ5dnzVq7JNUh2lwjTidSHJR03YxXYOQ7b3eiWeqN4dv716MjezPV6mi/5Zz3
  mqZaoeXuoI4enwW5B2KwQV6Yv4UZ8D3yiHjlOSmN5nbpNZumFrKKQL1U7JzcK7F8fHzJ5hRWX
  x283sWvhe+wWR0cu8TVrWqehxFKckWioxVxUnAgAvvee+2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1661833708!26131!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26921 invoked from network); 30 Aug 2022 04:28:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:28:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9250710018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:28:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 85AD1100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:28:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:28:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.28 -> 2.29.1
Date: Tue, 30 Aug 2022 12:28:10 +0800
Message-ID: <1661833690-12718-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661833690-12718-1-git-send-email-wangmy@fujitsu.com>
References: <1661833690-12718-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:28:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170063

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.28.bb => repo_2.29.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.28.bb => repo_2.29.1.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.28.bb b/meta/recipes-devtools/repo/repo_2.29.1.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.28.bb
rename to meta/recipes-devtools/repo/repo_2.29.1.bb
index 052108e9e5..740132c2f6 100644
--- a/meta/recipes-devtools/repo/repo_2.28.bb
+++ b/meta/recipes-devtools/repo/repo_2.29.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "a8cf575d68e7e211292d967f4a12cf609a028b20"
+SRCREV = "4112c07688d0e0e568478e9f42be349bdd511d45"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.25.1


