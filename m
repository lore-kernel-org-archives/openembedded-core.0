Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF0CC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:36:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.24399.1641191792485932086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KmpZfQLT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641191790; i=@fujitsu.com;
	bh=Gj/8HVZooCm7+M+aLmf4Jq2WxtBUmFSqLtg7bJEMcLs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KmpZfQLTBgDf3aBVSE586YVeGoKNP43m0B1Uq1EuoAHATovrgb5SHd1UuUcZwQSas
	 +hi/ePHjjFH8GgvytL5TQWLNGaaaukr5XWiORfgAsip3FwSNmJITD8Rck9Pqdbh5K/
	 STrAJoodb7gJ5uTDc0p1LwC5esRVDlxY+U+yx6p8QguACGD5Noi8HwrN/bWLoYjmeA
	 rYgDAI6C9sdkNjzIl3KSTDM2QGpp3NXnivuZfMpVhIyQBCotzh1hWQjnUbtf0r6+vw
	 aht8HuUT5dKdTg3prHxvmzko07i5fTghVPGd/jOnl/KwHNM5Ds8pKlHWPg1AJK/O16
	 oF5qZa7xYrvrg==
Received: from [100.115.32.243] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id D5/B7-27579-E6992D16;
 Mon, 03 Jan 2022 06:36:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqJs381K
  iwen//BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bPKS3sBRs4KvaceMzSwHiLvYuRk0NI4DGj
  xP47wl2MXED2eSaJ018+sEI4xxklVv88AlbFJqAmMf3WDaAEB4eIgJ7E1X+iIGFmARWJF797w
  EqEBewlbi2fwgZSwgIUv/VFGMTkFXCSaOxXAKmQEFCQmPLwPTOIzSngLDGz/xg7SIkQUMnFs2
  EgYV4BQYmTM5+wQAyXkDj44gUzRKuixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprrGxrrmJnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIHBm1Ks6LWD8dWKn3qHGCU5mJREeSuVLiYK8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuCNnnYpUUiwKDU9tSItMwcYSTBpCQ4eJRHenVOA0rzFBYm5xZnpEKlTjIpS4rw+M4ASAi
  CJjNI8uDZY9F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7DmQ7T2ZeCdz0V0CLmYAW82q
  dB1lckoiQkmpgErJoMMrReD6Dbe+tE3dmzVLxdToZV25wbqHEBg1r1x2RR/l55L9E7pw7TfNM
  ++H7O9l73gl8dO9d9bnk0dYNUuv32zz4lPB9lsINJeeay66Z/bJn0gQiFFjfb164725NZtRMN
  V/H6OPhSqt271uz12JOcgjbklkK768LCgsmp5+RS2JSe9826euMKz3rXx9/8kvvZPF9bt0tpj
  smGv98dCr7k6HyzPwSw9rLnQWcEYtcNL0/a2rnv+pZuDipuVvh2/xJJy/OM/CYsZQz2VLeU0N
  KblKbqUhb1PbVbCIPPgfnSildO/Dvy01rmY9vki6sfRw6X1Xh++V5e2rswv0KOEJjubuWu4Zn
  H8jl2cyhoMRSnJFoqMVcVJwIAMA/qeBZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1641191790!864376!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17457 invoked from network); 3 Jan 2022 06:36:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:36:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E143E100193
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:36:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D3E0B10018D
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:36:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:36:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.6.0 -> 3.7.0
Date: Mon, 3 Jan 2022 14:36:03 +0800
Message-ID: <1641191763-41666-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641191763-41666-1-git-send-email-wangmy@fujitsu.com>
References: <1641191763-41666-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 06:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160108

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.6.0.bb => python3-zipp_3.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.6.0.bb => python3-zipp_3.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.6.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.6.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.7.0.bb
index c98bc7a3a4..9ce987c870 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "71c644c5369f4a6e07636f0aa966270449561fcea2e3d6747b8d23efaa9d7832"
+SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebceafb87d"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.25.1


