Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99E9C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:55:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.9134.1648461355817709252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L7yMRHnN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461353; i=@fujitsu.com;
	bh=SYHIAOXQhlF7F2xdKk4LkYzAJQvQqhwBzQ6kM1e6t3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L7yMRHnNfoIlb2++6tq5cgWyo5Frf4CoxXsdGxu7ZCky0ccg0gDFzZIBMga+P/ZCj
	 Nx+n9aL6pzF5lqHbFb9Rd1mbvl9q43jr+Lnc0dZXXBzvBEbYiCsGOw+gxsdcAtFk1Y
	 S7Ed6sdtCBeln+oGjo5si6MBtCT/wQEWs+BDHGfZzNeWpFu2CbZTLXvr3X2UEkfC+m
	 NRlQrmQV0NShutZJUsC49yy19QUzHDoKtHvL3QL5bDsFwryhAzhy9wySbFdlw2WGqe
	 VOx/ZOS0YF8zYX2zR+NjzKKqRDiZnXmwBc3jOCxtXeCYlgi1CL5YHF323OcaIXty+0
	 9oUoS2yUrAS/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSVezzTH
  JYPpKAYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePovevsBS85Kj7PPs7SwNjI0cXIySEk8JhR
  4uyb9C5GLiD7PJPE0mNP2SGcPYwS7+evYAepYhNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFbCSedf5nAbFZBFQl1m1YwApi8wo4SbRMWAkWlxBQkJjy8D0zyBhOAWeJBWftQUwhoJ
  InC/QgqgUlTs58wgIxXULi4IsXzBCdihKzLzdDTamQmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0S6pKDM9oyQ3MTNH19DAQNfQ0FTXzFTX0MJIL7FKN1EvtVQ3OTWvpCgRKK2XWF6sl1pc
  rFdcmZuck6KXl1qyiREYxinFjtt2MJ7q+6l3iFGSg0lJlNco0zFJiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgTvrWagnGBRanpqRVpmDjCmYNISHDxKIrymTUBp3uKCxNzizHSI1ClGRSlxXqZWoI
  QASCKjNA+uDRbHlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ87q0AE3hycwrgZv+CmgxE9D
  ite9sQRaXJCKkpBqYBG5onlzcZqb9XKZEJyLueOhNlU06RU08Ilzn018YcckVpc0VqHx8+tYj
  rR6NiU8PnWJbWaiRN+WUTLT+3x1OWv8Sjqjxs8q/v7stxmfLxgdPjijaSv+YtUFKuu/d8mn2d
  Sy3o1ZvPJOZ//LiLrfGSr6OBy6bi6MizSKs8wvvuTW6K0X4ahVfDbfkc25+Hsk4V7TE/1Sy0u
  ofV52t5v6cUKB+lyfo8xa+7qyjvHJCE2wvpT84+OvCarsbigu1dy58vl5qRs7B+afuzk0sM0u
  +ttpvZ5Sxyj7Ln/0/7y1bLDzjxlOhXndptf2dM2T9E9Xae7zX7txqqRuWct1UQ+m5cV9Xyg2X
  37e+elzetnunEktxRqKhFnNRcSIAZm/5cV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1648461352!5534!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19304 invoked from network); 28 Mar 2022 09:55:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:55:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 93AAA100331
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:55:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7043C100451
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:55:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:55:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.38.1 -> 3.38.2
Date: Mon, 28 Mar 2022 17:55:28 +0800
Message-ID: <1648461328-15808-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648461328-15808-1-git-send-email-wangmy@fujitsu.com>
References: <1648461328-15808-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:55:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163702

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.38.1.bb => sqlite3_3.38.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.1.bb => sqlite3_3.38.2.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.1.bb b/meta/recipes-support/sqlite/sqlite3_3.38.2.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.2.bb
index 54b04d620e..a37aff6fe7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "8e3a8ceb9794d968399590d2ddf9d5c044a97dd83d38b9613364a245ec8a2fc4"
+SRC_URI[sha256sum] = "e7974aa1430bad690a5e9f79a6ee5c8492ada8269dc675875ad0fb747d7cada4"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


