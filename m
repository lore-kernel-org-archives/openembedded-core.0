Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B4AC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:40:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.40267.1681119609996150701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SexUmPM0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119608; i=@fujitsu.com;
	bh=uahPvn8n2WRRxa5hYxwZrEnyUUI5+YSGQxa4eok2FbM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SexUmPM0sROOEYyZAZUIKpxYJ/gkqz86AUqg3RSH6Xqto3Ko+xHpPuaZx4Hb8iljL
	 hV5GxG1UjYv0K4I7Ye+EXkgMVLfFwYfNCD8gxRqeTlmDMOUz5I/buITKHdImBGWjQ6
	 Y9TjePIlkmQ98A10E8SHw7SDALMO5dZ1pgU+nIuttBG0IwxtdOj/NvyvT0kjJFyY5o
	 XBJYwUbFZ0YELuoU7EUE6N47u3mVb/DhzeElYCM597eOnBgVugab1MxXlBJBV/68cE
	 KRz3EqeGG/OZ9Dk46hqpx6mFfDLkIJ2FWGt9xsNPGpQ0FKWgUjavVc++BHz8OjsyJQ
	 SmaZqkP/o+gRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWbf8pnG
  KwdUdZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bvtc9ZC25yVNw7+p2tgbGZo4uRk0NI4AGj
  RP9nuy5GLiD7MpPE0v0H2CGcPYwSc06eYwepYhOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFXCQ2zD3CDGKzCKhKTLjRwQpi8wo4Sdy+/ZcRxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eMEMUaMoMftyMwuEXSHROP0QE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6hmV5
  SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYCimFKu772A8
  0vdX7xCjJAeTkihvF5dxihBfUn5KZUZicUZ8UWlOavEhRhkODiUJXobLQDnBotT01Iq0zBxgX
  MCkJTh4lER4Ja4BpXmLCxJzizPTIVKnGBWlxHk5zgMlBEASGaV5cG2wWLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZj3zEWgKTyZeSVw018BLWYCWszlYgCyuCQRISXVwGTcvOvRScldx2b
  saJ3Mahny46BK6nohJfeQUytjlbcc091mEFC9lHub3eRLGgteX5lR5G1u/qaS/ycLw0frWa6f
  k3unPXR/2azU0xyZfoRR/5XZ1e7K0gO6yX5hc1k6trx70j+ZfZqIwO81PXv1vidN/s4duGVf0
  LQjoQbaJ6W6v4btURTb/1Ur4u/SR7fbfjFynbN5y//TXlo2dyGHYPUi7a8euxY2+1uYCe55sE
  +hK/GT90zxQ0KJh64pX13As6KZKSxz0WOh718cy4U/+O06+dh7w5bWuO37+9SCunWf8N8qXn9
  z1beO0yy/29ZN3yDlU1S1WGaSwh3PuPCs9KC/Bxqjc9tf6ktIrjp2wlSJpTgj0VCLuag4EQAF
  mR7GQAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1681119607!356368!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11548 invoked from network); 10 Apr 2023 09:40:07 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:40:07 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 958E515F
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:07 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8920315D
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:40:05 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-installer: upgrade 0.6.0 -> 0.7.0
Date: Mon, 10 Apr 2023 17:39:51 +0800
Message-ID: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179878

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-installer_0.6.0.bb => python3-installer_0.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-installer_0.6.0.bb => python3-installer_0.7.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-installer_0.6.0.bb b/meta/recipes-devtools/python/python3-installer_0.7.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-installer_0.6.0.bb
rename to meta/recipes-devtools/python/python3-installer_0.7.0.bb
index a2130a4507..d7f1e79a5c 100644
--- a/meta/recipes-devtools/python/python3-installer_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.7.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5038641aec7a77451e31da828ebfae00"
 
 SRC_URI += "file://interpreter.patch"
 
-SRC_URI[sha256sum] = "f3bd36cd261b440a88a1190b1becca0578fee90b4b62decc796932fdd5ae8839"
+SRC_URI[sha256sum] = "a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


