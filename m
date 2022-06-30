Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9B9C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:26:08 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.20797.1656563164745923015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wjQoAAqr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656563163; i=@fujitsu.com;
	bh=B93FMPto9GIceM+X/g1SvUVyMYyVt2m656Vh2NvXjnM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wjQoAAqrv7IaUkzyC7J04N5XSdKPqDHHDq0i16YVm7HbG0THSYhdAIvbPP8tp7c+b
	 Byyu7WRqszKCPJnjE5xDRJxGegYQbIgEQsQfM7COOn99eMd93F6Eh/nX2xUzOjCcwH
	 VLi7nhf5fUSB6ldQtxkWDqczP9Z/m2HQ/UmTnVymCreYPwq4yNqmDon5nWHg7dZ9L3
	 Su/hWSFim6rdtFm8ToG+K/ONveZJ0satwBc9vNq/FvDNBU3GQI3dGx478XM+ITKmXD
	 C0fa59eXC/C6Qp+BC6v+mSkosrSyef7BwXNgXAzeyD4UI/cXH3NHeG4MhkDlrVSpNH
	 B/qHtST+igrJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8OxWfeW6t4
  kg5VPxCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyZv3ezFlzlrrhz4SVbA+MKri5GLg4hgQeM
  Ep8W/mGGcC4xSWx4cJEVwtnDKPHg6XSmLkZODjYBNYnpt24AJTg4RAT0JK7+EwUJMwuoSLz43
  cMOYgsL2Eoc2rCcEcRmEVCV2Pn7CZjNK+Ak8X9lCwuILSGgIDHl4XtmEJtTwFli7Y5WsBohoJ
  pb8x6wQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uhppTITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NTXWNdCzO9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAEE4pZg7bwfin96feIUZJDiYlUV5D9r1JQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4jysB5QSLUtNTK9Iyc4DxBJOW4OBREuENBUnzFhck5hZnpkOkTjHqcsz82naAWYglLz
  8vVUqc940KUJEASFFGaR7cCFhsX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzKsNsoonM68
  EbtMroCOYgI7YOW0PyBEliQgpqQYm1yty2g9/Nc7Xrrwzh1n9LvOPUw9Vt82NnyJtfsIm98Y3
  xgOBOcHP85Z8WS3ef3K3sWZyu8QmW5u+X+5CkV27OzhPXp3KnqyzawbXc9ulB44/+fJ5uX7G6
  2oX0eyAIOYP12eu/OV+k61nbeN5+x1rat/96lXTl39o/3JP6YGygysXvz5iOLWNbYf9Ssv/X2
  6e6j553ST37eJ+lzVc3/4Uy39aKGNQ2Nkyqfv2222s/DaWxyPrT9Zd1r4WbSAsN1HfUSIshmf
  D+9OTZtdO1L/0f59wpWVp96rpIQtmPip87WthymL54rFiinrqwVv3LmZ/nOTyue4cu63Xopuz
  lX73eIZ1Ly/7v40td/6l20xWx5VYijMSDbWYi4oTAUOyOL5oAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1656563162!83850!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5082 invoked from network); 30 Jun 2022 04:26:02 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:26:02 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E1BDC142
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:26:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D51E675
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:26:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:26:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sudo: upgrade 1.9.11p2 -> 1.9.11p3
Date: Thu, 30 Jun 2022 12:25:37 +0800
Message-ID: <1656563137-11471-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
References: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:26:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167400

Changelog:
==========
- Fixed "connection reset" errors on AIX when running shell scripts with the
  intercept or log_subcmds sudoers options enabled. Bug #1034.
- Fixed very slow execution of shell scripts when the intercept or log_subcmds
  sudoers options are set on systems that enable Nagle's algorithm on the
  loopback device, such as AIX. Bug #1034.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sudo/{sudo_1.9.11p2.bb => sudo_1.9.11p3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.11p2.bb => sudo_1.9.11p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p2.bb b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.11p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.11p3.bb
index b3eae4a0fa..ba610ee2e7 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2"
+SRC_URI[sha256sum] = "4687e7d2f56721708f59cca2e1352c056cb23de526c22725615a42bb094f1f70"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1


