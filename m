Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A405C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 08:37:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.6735.1657615047695295035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O4FUaL6K;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657615045; i=@fujitsu.com;
	bh=3IsdTS5+1lwnr5zPy0O0ejE5WrPigLNyu37opgQ4icE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=O4FUaL6KxYNzSkEs2Oh64/xtjM6bc10PLZLJ0x/DHkKpQeUmsTr2TDsb03EfWluBN
	 OIDiltE37GbOgCceEnlycZe/o6e6hnB8reX/RIsf1ENjqUcV9/LhJNOOOb2Wc8Oq/F
	 7pzaUFY0Ob4vQj4YRzfdRSDfSkYkdsE2VHMoz327TpLwE7zrZc5K1CsVWNF8ebGCzq
	 Qhj8A6C2EAkibZUnXuxYZ+rPDl7AWd8RYVRRE1qzLEFXMpf9sZOj8p0WFyqyuWBJfT
	 e6FGDS3A2Gs1qzgRJhYrqt8TMmrEdBb54SyfQBkyoV/l5HBITGkNhd1ZNAyJXarTf1
	 7vVAn4xZx7clQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWfeo0dk
  kg+vPZS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oznfcvYC1azV1zecJ+xgfEOWxcjF4eQwH1G
  idvtXYwQziUmieenT7FAOHsYJTbdWQ2U4eRgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBS4mlvR1g5SwCqhKrl/4Ds3kFnCTOrzoGViMhoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0JixoxtbBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMVklFmekZJbmJmTm6hgY
  GuoaGproGukaGpnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIFBmVLMcH0H
  48S+n3qHGCU5mJREec8YnE0S4kvKT6nMSCzOiC8qzUktPsQow8GhJMF73xAoJ1iUmp5akZaZA
  4wQmLQEB4+SCK87SJq3uCAxtzgzHSJ1ilGX4+qVK3uZhVjy8vNSpcR5T4IUCYAUZZTmwY2ARe
  slRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8EiBTeDLzSuA2vQI6ggnoCLnIMyBHlCQipKQ
  amEr0ihzUdjyV+Kt/ssVQJFYqN/4Iu25+TsXznNfJWofe3DeXU3fPC70jfS+Lb+KhL6YZLEJ7
  I9dI2VTp8ep7lKxf3m90eJdZZzyP/+t7znHvZv1/efqFwoJC/pf33yqcnJNe7cBWvVAp6fZSk
  WebZoelGxmrH2z+J6o1Jfyk2+57t95OPsZec9lQfUHLtcLTTG0Zy4QXeOh3+L7fHmHxb4OACO
  u7n+fO317v+n3JP/sdFXpHJCM05i1h1xW4et0q9s32luJ7c603+Uv+NDu2ac5p9k9+noY9VQ1
  ilx7dm84/y4pZ6vrJf80tTP4Xf23bteb3J8t/PMczX7VFW0wtSZstEfsr9Pr6d3N/vdI/nKnE
  UpyRaKjFXFScCAAjaonnUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1657615045!90943!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32552 invoked from network); 12 Jul 2022 08:37:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 08:37:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1A2CF7B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 09:37:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0D90373
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 09:37:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 09:37:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dpkg: upgrade 1.21.8 -> 1.21.9
Date: Tue, 12 Jul 2022 16:37:03 +0800
Message-ID: <1657615023-31199-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 08:37:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167914

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.8.bb => dpkg_1.21.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.8.bb => dpkg_1.21.9.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.8.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.9.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.8.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.9.bb
index 0d6b43aabb..feb579723f 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.8.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.9.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "a154134fe70c0b823ae14905bdc33b64e7dcd454"
+SRCREV = "c2d6b7de5849c62d3a4f55f61dbc53c1992f74ee"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


