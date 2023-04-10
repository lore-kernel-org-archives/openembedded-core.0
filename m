Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB01C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:02:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.40685.1681117328971059141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EvKX2eEN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117327; i=@fujitsu.com;
	bh=gxrsfD6MDPT5vGShupRbbcCISW2Y7MmFoEFvO29UIVg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EvKX2eENREJ9MUm+KinaSXj0D3mMlPAVm+F9i09/98/zRf56hiSEWONc+ftvBKiEc
	 mfAKSaXaWIZ4JSQDgNJ7dTRRkeagovlBBtWzHGZFe55bjbFBTNg7s7CMBJMthk/d3Z
	 6pAvL0iAlE/RGATBb61OfbYT+KZUnV3HrqfxFxWmGb42i/PziCyb0urs8W59gKy/sl
	 RNIJemevhi9JMAMz+TRprmqhmDMCrgrEAHDdjdgq2RQyPGOGpBbiWHVbrcHdRf4cjc
	 7UTfDZ0BYWxWQj0But6XSijHyCKJV0sr7o74YnHxAmILEF2JDYlV2aKD7nypDOLZNC
	 mscnc5fMTFxFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORpNt3wTj
  FYNsUNYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPRl22MBdO4K552zGZuYHzI2cXIySEk8IBR
  4uExry5GLiD7MpPE9l33mCASexgldiwUALHZBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAWuLp7V5mEJtFQFXiaddKVhCbV8BJ4k3ffjYQW0JAQWLKw/fMEHFBiZMzn7BAzJGQOP
  jiBTNEjaLE7MvNLBB2hUTj9ENMELaaxNVzm5gnMPLPQtI+C0n7AkamVYymxalFZalFuhZ6SUW
  Z6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIFhmFLM+mYH47a+
  v3qHGCU5mJREebu4jFOE+JLyUyozEosz4otKc1KLDzHKcHAoSfAanAXKCRalpqdWpGXmAGMCJ
  i3BwaMkwpt1HijNW1yQmFucmQ6ROsWoKCXOywGSEABJZJTmwbXB4vASo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHebYeBpvBk5pXATX8FtJgJaDGXiwHI4pJEhJRUA1P9Rnu365dNWr++VvK
  VfJKg/DexdU5t+OojnlIZGs/XnD10X2ry35oQA8Z55zZc4H3yYsOTLZOCVGaeEAw85L9AaucN
  /rXZtTUt8jHeX5+dkD1/bgfLw+99R9+6r26wW7DdYDfLrGkOGZeXXhfw1rTiPlGir2g07Qv3n
  sV/vrvv5HgUn2K2b/uZvLrZzd8eecdsq/nE1jVJ1S372O2XUm9SRPd07v3rKsHUcbncR3bFxL
  9VRn07/n/M1Xm8s3GqffLfuK70O6d0Mi73MrnUf2BPdeW2mX/E7uxVr1KuvZw2R1dIlm/ZuPu
  RJ9+li6tz1qZ4Wnw5LTHl1PODzw9oGZ3cWaITdlwoKTp0c1PuSeX7SizFGYmGWsxFxYkAkP00
  6j4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1681117326!194427!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4115 invoked from network); 10 Apr 2023 09:02:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:02:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3F62B1CD
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:02:06 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 345F41C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:02:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:02:04 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.42 -> 4.0.43
Date: Mon, 10 Apr 2023 17:01:50 +0800
Message-ID: <1681117314-24836-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179858

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix root directory test in mattrib
- -b BiosDisk flag for mformat to allow setting physdrive to
  a user-specified value
- Clearer error message in mformat when trying to mformat a
  disk whose total size is not known
- Make recursive copy more consistent
- Trailing slash now always implies target should be a directory
- Code cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/{mtools_4.0.42.bb => mtools_4.0.43.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.42.bb => mtools_4.0.43.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.42.bb b/meta/recipes-devtools/mtools/mtools_4.0.43.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.42.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.43.bb
index 85d9e451c2..859103979e 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.42.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.43.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "64bfdfde4d82af6b22f3c1c72c3e231cbb618f4c2309cc46f54d16d5502ccf15"
+SRC_URI[sha256sum] = "541e179665dc4e272b9602f2074243591a157da89cc47064da8c5829dbd2b339"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


