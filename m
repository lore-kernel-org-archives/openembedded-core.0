Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2E8C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:05:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.31909.1641823542702162545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YOYZ5ImG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823535; i=@fujitsu.com;
	bh=cZotGK7wY8OVFknvnCijBefkcECzQd5V6rXjH4CHca8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YOYZ5ImGXQ36P6QetfSsan+QzfRhxQ8JVCnNb6vm7ScfJTBiqtk/R10HOB1ISXsg2
	 JiGYUGH1rxunOFGh3C5fE2oykq5oZNw+Z04sRm0P17YWNjxaTAOyQApRCyFK9lfueK
	 G82vpFdzzN9uRmE+H0Tq5/wINDDjXj/vP+v6tmYXEH9aPtz8hrEhJ5uV7xBBLPa1Mx
	 jwe6RZr6yAibzTdPHR/w1IwBdo+/eIUNSPW007BqljPlh6Xr3bZvVE2EDjG4D4q1T1
	 td6ad+isE1n2DbAAL/Bfxcf/LkMXjzlnVDdlJb4jkPBap5MXzHkbgtzKVq9oE/udNm
	 ccbePpQQjNcUQ==
Received: from [100.115.70.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 DC/F4-24146-E2D3CD16; Mon, 10 Jan 2022 14:05:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSVfX9k6
  iwcXLuhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bXHsuCqxwVH35NYGxgbOLoYuTkEBJ4zCjx
  46V1FyMXkH2eSeLHhC9MEIkTjBLd8xRAbDYBNYnpt26wdjFycIgI6Elc/ScKEmYWUJF48buHH
  cQWFrCTuHXvPSuIzSKgKrFk2XMWEJtXwEli94aPYHEJAQWJKQ/fM4PYnALOEt3XFrBCrHKSeP
  rzNVS9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGu6SizPSMktzEzBxdQwMDXUNDU10zU11DCyO9xCrdRL3UUt3k1LySokSgtF5iebFeanGx
  XnFlbnJOil5easkmRmAYpxQ7btvBeKrvp94hRkkOJiVR3ifGdxKF+JLyUyozEosz4otKc1KLD
  zHKcHAoSfAmWALlBItS01Mr0jJzgDEFk5bg4FES4dUASfMWFyTmFmemQ6ROMSpKifPutgZKCI
  AkMkrz4NpgcXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvAch4nsy8Erjpr4AWMwEtTua
  4DbK4JBEhJdXAtLPC8Kr0X073ZuMfN9Ylt2suNpgeOjPjI/ea69IaspwVDToOvBt3xf/+K/Tu
  w/7H+jZ1LWvURBfI7g+52fzQMmvD3Uuae4OlnBZfedlhP4FdLpj7zwxlHYZJH+wYxVTSdq2KU
  FD/uONe+JOCDu3Sn7znwnn2cZfc+ckkNPmMf1fMvIM8XgnvCkxEJiZfvHJTUXlXN/fPAyHX2g
  TOT/r36Zhxes9EnhsldypX3dCOcZdLWrJirz5n8mLN/W11f3M6Jk+rN0qbdovx58otjnM2fQq
  T47ysYn26rFP3c4q/CMermmbZvOzJO8oq99tM/T5Vnj1QZobj1qDiIsOVhSc59hjWnIlS9eRu
  YBIzaExQYinOSDTUYi4qTgQAyhoULV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-528.messagelabs.com!1641823533!214310!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25767 invoked from network); 10 Jan 2022 14:05:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:05:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 29C36100446
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:05:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0962F100453
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:05:33 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:05:28 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpipeline: upgrade 1.5.4 -> 1.5.5
Date: Mon, 10 Jan 2022 22:05:05 +0800
Message-ID: <1641823505-62784-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641823505-62784-1-git-send-email-wangmy@fujitsu.com>
References: <1641823505-62784-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:05:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160361

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpipeline/{libpipeline_1.5.4.bb => libpipeline_1.5.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.4.bb => libpipeline_1.5.5.bb} (85%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.4.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
similarity index 85%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.4.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
index bfbfdc87f1..44d9ed24d6 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.4.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[sha256sum] = "db785bddba0a37ef14b4ef82ae2d18b8824e6983dfb9910319385e28df3f1a9c"
+SRC_URI[sha256sum] = "0c8367f8b82bb721b50647a647115b6e62a37e3b2e954a9685e4d933f30c00cc"
 
 inherit pkgconfig autotools
 
-- 
2.25.1


