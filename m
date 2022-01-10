Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D098C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:07:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.31797.1641823645502332177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XrMq6/Ig;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823643; i=@fujitsu.com;
	bh=GDSplXuxmhLiH9DZWBPCbnArcBXD3eg/SoGf6EwaC3A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XrMq6/IgO2IDGxgVwsBtrQIeLJOQiOJxTVpfpg5O2mRFFlNA9DKk02pJkL5TGilYw
	 pv382vh2so3ZCWvYyFg/JWji+b5LrtGb6EtTTqAVOkjcRrDVqYgxGFwaKmXiX4xv9P
	 MwnU+OZH8fWHDPBt5kMr38e+qsjx91Mr22gBkyViBVQF9EHGsXmUqjnE/rW77zhH2V
	 RZxemg77G6syOnYkXEZElFDZYpQYrw46Q+yzweXLyy/fUjgQ7CCVXYZMoOxBTEvOBX
	 Xx+uoenWXwDy7Ov7pulHG4nwG1bQy1C4c4u4njPKJDUQDW2LN/K7pXSZ1gwfdmJ9+6
	 tTVYzhZkgwWuA==
Received: from [100.115.64.12] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 EF/D2-06990-B9D3CD16; Mon, 10 Jan 2022 14:07:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqDvT9k6
  iwbNVFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bt/T8YCy5zVny/+YK5gfEGRxcjF4eQwGNG
  iU3bprF0MXICOeeZJC7+1YBInGCUuPl1GxtIgk1ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBSwlTnzoALNZBFQllp2/wApi8wo4SSye2wsWlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr
  54wQxRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNdUlFmekZJbmJmjq6
  hgYGuoaGprpmZrpGRhV5ilW6iXmqpbnJqXklRIlBaL7G8WC+1uFivuDI3OSdFLy+1ZBMjMDRT
  ip2e7GB83fdT7xCjJAeTkijvE+M7iUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeBMsgXKCRanpq
  RVpmTnAOIFJS3DwKInwaoCkeYsLEnOLM9MhUqcYFaXEeXdbAyUEQBIZpXlwbbDYvMQoKyXMy8
  jAwCDEU5BalJtZgir/ilGcg1FJmLcAZDxPZl4J3PRXQIuZgBYnc9wGWVySiJCSamA6PuPLhHe
  +G7Zq2WzUrGXX1Xc89Lo1SDIhIyGxONBZ9fzsdTpzfWP4O3ZLtEpvC0yOUXhwQZjPffkZf906
  7m35/Urvll1/UDtBs04leM36zqs+5w46vFlWnuqyiPcZV5bcnfw9n6Tul3ZV3Lf0ORM2QfzOo
  zMdeiezmlf7Nqi6lUbnPX+34OWhG6efimy0L2a/zSvEKhTFt3zN3a+3QzU89p2ZycvP/cT6i+
  WFG+nnP7Iu2fIlY3+YHZdwxpTKsjarl0cu8R+MTlMxrObfcDvN2ErFkLl21d1NvrrvrrLN4pd
  N1WW4cf9AO2d/LneHFN+xFx8uGFm9l1nQxfszf6+AxY0Dlw/E50/OMnte26TEUpyRaKjFXFSc
  CABAL/NoSAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1641823641!43285!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7306 invoked from network); 10 Jan 2022 14:07:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:07:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5E19B1001A3
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:07:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 51279100193
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:07:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:07:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 196 -> 199
Date: Mon, 10 Jan 2022 22:07:00 +0800
Message-ID: <1641823620-62823-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:07:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160363

Changelog:
=========
* Support both variants of "odt2txt", including the one provided by unoconv.
  (Closes: reproducible-builds/diffoscope#298)

* Add external tool reference on Arch Linux for xb-tool.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_196.bb => diffoscope_199.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_196.bb => diffoscope_199.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_196.bb b/meta/recipes-support/diffoscope/diffoscope_199.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_196.bb
rename to meta/recipes-support/diffoscope/diffoscope_199.bb
index 62a1561a0d..3645ff1e6e 100644
--- a/meta/recipes-support/diffoscope/diffoscope_196.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_199.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d31fd0d8ac58d41cc111ef6a3bb0007f5f52543b932bf93584bdd0dfe029e626"
+SRC_URI[sha256sum] = "7b07b8ff34e5fe0e57acc8b02bcb9303ae254c40f357fb7ed805e9f9f7c7686f"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1


