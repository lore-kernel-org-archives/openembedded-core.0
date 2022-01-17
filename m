Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60004C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:31:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.11949.1642429904973196089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NPFfLDbK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429903; i=@fujitsu.com;
	bh=gDqP3VSLEteIVWiDaJgFVx8pWHyEr1GaL2V8eo7nZ6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NPFfLDbKJ+Fr8LObqZtNl0p9dYCepHuaLoRjLaU2m8dyXTBP3F7oI8ykFxQVrT2xG
	 R0A6aPPcZPblOX4jTIdo0UVyhKGG+3XP9dFCGuycJclLK6qn57y4o+5JApHqJGjzuY
	 ZVbuSAv4XguI6KadnpqLQg1Unkew7uYKcWb29egO4kYqKx2poBWy8gFsJVY1ilx7S9
	 zk+i6POSi697hnAGEj+w31KaQ+kdAOeiIhMKRHldDibmCC7KxUTpfQKmZU/tT+IYHQ
	 kRIfUp35PirM/refDVs2JqLJrjAE1k1oC26Rdq6KUgW3N02bVjMQqForXsFJkZ3DcM
	 NyyCC9KI5r6eQ==
Received: from [100.115.6.141] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 1A/9A-30341-FCD75E16;
 Mon, 17 Jan 2022 14:31:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSfd87dN
  Eg4PTGS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozTGzoYC+bxV8yZM4ulgfEwbxcjF4eQwGNG
  iccnv7BDOOeZJNYd28YM4ZxglFh/6ANTFyMnB5uAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+
  N3DDmILCzhJ3Ly1mQmkhEVAVWJRjzhImBcoPPP6XVYQW0JAQWLKw/fMIDangLPEhHOPGEFsIa
  CaPbPeMkHUC0qcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9ll
  I2hcwMq1itEoqykzPKMlNzMzRNTQw0DU0NNU10TUyttRLrNJN1Est1S1PLS7RNdRLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM4ZRilvc7GJv6fuodYpTkYFIS5eUMe5ooxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYL3dg1QTrAoNT21Ii0zBxhPMGkJDh4lEV5tYEwJ8RYXJOYWZ6ZDpE4xKkqJ8zaA9A
  mAJDJK8+DaYDF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7xeQKTyZeSVw018BLWYCWrz
  q4yOQxSWJCCmpBqby/lcRJZr+TaefPfGwerfsj2jL5ZC9+YamgZ8MxNQ9jCxmlbNNteH8ktNc
  J190dGIF77/cZa/9Gc431XzTin3450rn2dcCU1xLbcsTe248urqqtDA8aLLiVjWrl80qmRdWy
  Lg97N3OvjLYSifpUkd2/sJfs2YKshiZBsve+HHihPUDfvv+ptRfEc7Z00XXHtpo3XbWs7fSzE
  NMdfmNdXNTzho3tk7S0YuoOn7PpSmxv2Xb8o3lvzhXO4XdfMAz/3XG8y15O1d9jbu3PDmx7H9
  fdcE+TwtNKaNOiblNMctVy56W/r5cwss232PjnUu/U641Ckn29lo4sl7TcDsYd5MvsNzq5MkN
  F7Iirgu4K7EUZyQaajEXFScCACYB9HZcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1642429902!14544!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17875 invoked from network); 17 Jan 2022 14:31:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:31:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 87F35100466
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:31:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7A78810044D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:31:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:31:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.22.0 -> 1.22.1
Date: Mon, 17 Jan 2022 22:31:14 +0800
Message-ID: <1642429874-13890-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642429874-13890-1-git-send-email-wangmy@fujitsu.com>
References: <1642429874-13890-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:31:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160649

License-Update: year updated to 2022.

Changelog:
=========
The NumPy 1.22.1 is maintenance release that fixes bugs discovered after
the 1.22.0 release. Notable fixes are:

Fix f2PY docstring problems
Fix reduction type problems
Fix various typing bugs.
The Python versions supported for this release are 3.8-3.10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-numpy_1.22.0.bb => python3-numpy_1.22.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.22.0.bb => python3-numpy_1.22.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.0.bb b/meta/recipes-devtools/python/python3-numpy_1.22.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-numpy_1.22.0.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.1.bb
index 556e2dd5c9..b79ce61fbf 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b076ad374a7d311ba3126a22b2d52596"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8026691468924fb6ec155dadfe2a1a7f"
 
 SRCNAME = "numpy"
 
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://run-ptest \
            file://0001-numpy-core-setup.py-disable-svml-for-now.patch \
            "
-SRC_URI[sha256sum] = "f2be14ba396780a6f662b8ba1a24466c9cf18a6a386174f614668e58387a13d7"
+SRC_URI[sha256sum] = "dd1968402ae20dfd59b34acd799b494be340c774f6295e9bf1c2b9842a5e416d"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


