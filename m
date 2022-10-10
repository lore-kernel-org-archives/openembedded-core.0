Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42452C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:38:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.3993.1665391128856370038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QJHa43o9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391129; i=@fujitsu.com;
	bh=uF6nw+xQfoqP9j5pVHqXpPvWDd3H/bI/CwK8PceVfEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QJHa43o9hlPJTHtfPMr548C2/RsJa1NzwRHIOzujmFp8actutdkzkWOLEOl9kr4l4
	 rmF+HuE7gdn5yc4OX30NZ2jwhxjjPsLSbn+H1gDelsVGcM7xun+4/l8H8ydTePLOEB
	 Ez1zwbtjmeXH1hzlZ3CpALhJxjjqF8B7Y/3HP/8dGLTRWIDUF9Z+w69GqmisvfKE3I
	 1DbfMCQioGukG4TZqrVYqObCMIzxiBuDHTQMtdiyKqy1o9NKEcjUsvq/akOzjMEHUN
	 f1CNO5Lv43f8iM4JF2T94gGFbeTvbqY9pLAs/nvObmwXyNjaJ4ofoP8curEOQYGY8I
	 E6SiL1eFyOcWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8OxWVfilnO
  ywawXlhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8brXRIFU9krJnavZmtg3M3WxcjFISTwgFHi
  345uKOcSk0TD3BvsEM4eRomHW5pYuhg5OdgE1CSm37rB2sXIwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBCYsrfz8wgNouAqsT508uZQMp5BRwllp/hBQlLCChITHn4HqyEU8BJ4ufTVWC2EFDJzp
  1XGEFsXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusYWuoYmBnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIEhnFKs1rOD8cSqn3qHGCU5mJREeQ0OOScL8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuB9cgMoJ1iUmp5akZaZA4wnmLQEB4+SCO+Di0Bp3uKCxNzizHSI1ClGXY6ZX9sOMA
  ux5OXnpUqJ87bfBCoSACnKKM2DGwGL7UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkvXQG
  awpOZVwK36RXQEUxAR5y86gRyREkiQkqqgSkydv4xkWOaocYJaZP5o+3vp9aFz83gsZoQFNY6
  O/+g7OnrUy7GPvy5YvLxvlU9S8KVFRO0UzasyHAXk1xr5sTnFZ7GsfFpxgwOd9Frq2f8OiLtX
  zf9HuMDvbvLg5kcvrK+vCq7Ve7evQ2T9lvaCO/+e2fLlSMdMeqJ9/a0BP/YvTIn7eyXgOk2T3
  Mjp2zkNFE55PXwokCMQdYFg2uX34lvFHp1asMnle/X5l5R/qYfobUrx2D7phtn1NiTy48Jc+7
  86z2rV/LRlqfnlnCcuX/1NO8x8yNSmRJuU16Yr14yNflJzcLgrknNDresElMU3zWpme59tjV+
  2TaJlUtd7Ks3CVtL9ibpfZvF15C0xeO7EktxRqKhFnNRcSIAy4eKeGgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1665391128!3134!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12358 invoked from network); 10 Oct 2022 08:38:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:38:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A990B156
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9C92D7B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:38:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.37.3 -> 2.38.0
Date: Mon, 10 Oct 2022 16:38:30 +0800
Message-ID: <1665391113-8040-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
References: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:38:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171559

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.37.3.bb => git_2.38.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.3.bb => git_2.38.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.3.bb b/meta/recipes-devtools/git/git_2.38.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.3.bb
rename to meta/recipes-devtools/git/git_2.38.0.bb
index 2eed85e807..a726382ba0 100644
--- a/meta/recipes-devtools/git/git_2.37.3.bb
+++ b/meta/recipes-devtools/git/git_2.38.0.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "181f65587155ea48c682f63135678ec53055adf1532428752912d356e46b64a8"
+SRC_URI[tarball.sha256sum] = "12f2630a1b3318d67452a512fece0d44bf6ca1b9c51a6447456b4eab5b0198a5"
-- 
2.25.1


