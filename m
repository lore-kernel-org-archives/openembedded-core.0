Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D35C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:19:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.1733.1668395993746655625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nepXkLTi;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668395992; i=@fujitsu.com;
	bh=IKwMpYbxXxxxLpV/EcYTU+CwcQkdBlyQnaglKC1QaoI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nepXkLTiErdz6tSlCQt7PILedTDYZympFxi+3E0bQ/5kVP9DMoE94GhclChtoFnaf
	 NOepegzMhbup72cmml9zzYo2Zt6IdrEqOEeRFdWiGyESv97cw+3iBhwCXgNNQf7I5A
	 OJXxBQMWV1wZZAZt7VdOA7Dy7zy/Hsp5mRaZ3Roj7SNBGzZfsl0MTB/ouVSx7yvnzV
	 KF3GMFaB4cAlWmp/YVIYpLUOSo3MZislCXf0uUOQPzbxCv0fhR0nFfH9pWknxeVTzs
	 oP6wyVKEZG6WpCgUDjqs3w9FBbaIQZqy3X6luS3FDwEyyCStTDeAhIEVCMhbFQbYUF
	 pvfxZC377oxkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSffa5sJ
  kg/sN5hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aEKxtZC/5xV3y89pytgfEaVxcjF4eQwGNG
  ifkdB9ggnGtMEn3vtzFBOHsYJTbOPQuU4eRgE5CSuHH/P5DNwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBO4vf/G2A2i4CqxMEFN1lAbF4BJ4nN8yczgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qg+pVk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNfQQC+pKDM
  9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBhTilX6djC+XfZH
  7xCjJAeTkigv//rCZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvEIbgHKCRanpqRVpmTnAyIBJS
  3DwKInwlm4CSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpx3LUiRAEhRRmke3AhYlF5ilJ
  US5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrthFoCk9mXgncpldARzABHfE9Mg/kiJJEhJRUA5O
  25EmO8+c2H+6bWdd2cTZDbN6rmQXx8x5v29fLc3cX8+s9yqdzYt28P9UHi3tetT4eW9Omefni
  hZlSGRP0GF7yHl1eMudiWUxZxZut+aHWrv9/HBXeUhR489WmtNBrBU/rNibdddgjvczk6xt2E
  dnywj/SFu9f5+96/cA0srjltKqJ1T4T5XCfrinmxzkk3U8vWDN5Schd3iUH3gjJTyvd9HDygX
  +i3IGXWoo8ew0l97zxqpy0QNtNs9TIZ1bBgd3pBnlPkiN+9k37ceFXiXKd1faSL4yT+89+mbr
  B42Pm2v4JTpPNm5evWnjvfZiy4caASatUDG9nLD944eKBHHmba6n7jkxc1Bn3eaN45+kbSizF
  GYmGWsxFxYkAVxJZXU0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1668395990!888926!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11636 invoked from network); 14 Nov 2022 03:19:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:19:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9DC4E1000E7
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:19:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 915D21000D5
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:19:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:19:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.11.0 -> 4.12.0
Date: Mon, 14 Nov 2022 11:19:33 +0800
Message-ID: <1668395973-23990-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173219

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- ISO 3166-1: Update name for TR. Fixes #38
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2. Closes: #1020633
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
index be573981b0..ea7c43cdae 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "2651d7fe65582263c57385a852b0c6d8a49f6985"
+SRCREV = "5e4dddbd1f8902ab0252ccbb19b783cc0359505a"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


