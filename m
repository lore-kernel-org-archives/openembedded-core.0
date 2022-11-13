Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEDFC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:02:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.202.1668308563545940801
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q0efMNS6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308561; i=@fujitsu.com;
	bh=uID0KCCXzeOpR+81tP3eUbqn2hxtoNtGJpbkoAFEA0c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=q0efMNS6hNxFm5NmCtBxMYW6W4YAmbTuLO90y3IzCNbU57+GTRKG9Pr5vIhxGXVqT
	 OOc3/EnNDd2eG3tNwfzDad0Uabhuw361ywHEc/zLA0L2jRqoKDyX3qkjN5Nh7RUylj
	 5B0cfDBkoesp8jv29cWfA56VEOVVm3/x932loOSYd9lPSggCTh2+uYEURwTuiuXPSN
	 hxb1weZxPpMnm/8a+dlqS0/gIxzg8fn7jgOl2vvLdWAHNPILgHj3n72degI+hgvR74
	 NJeft01gPmUaqG1fw3Xk9F9uW4Z+iQoCl28iaaUEfOirmv2omHASj5HZodFR0YXv3V
	 weES/dPzl1Whw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxSTcgriD
  Z4M9bNos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePY4/PsBc85K1rOPWRsYHzJ0cXIxSEk8JhR
  Yv7T7yxdjJxAzjUmibbnQhCJPYwSC74fZQZJsAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgK3E5AOvWEFsFgFViQ9fV4LZvAJOEpM3z2YDsSUEFCSmPHzPDBEXlDg58wkLxBwJiY
  MvXjBD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuil1S
  UmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYiCnFbD47GP8t
  /aN3iFGSg0lJlDften6yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne35EFyUKCRanpqRVpmTnAq
  IBJS3DwKInwVtgBpXmLCxJzizPTIVKnGHU5mv//PsAsxJKXn5cqJc4rEQNUJABSlFGaBzcCFq
  GXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzro0GmsKTmVcCt+kV0BFMQEd8j8wDOaIkESE
  l1cCkM21rmcj6Vz80ftrfe/RssU3YLtOC3NRGryeB+/gu5dd6cR5uY++aeGRqb33s4Zjw5+tv
  XDs9Pw0YePN2pHMdijNKFzggw9y3tV9KOmNn3CMu0ZjpzVeeeezjzIibL+25aHH4U/Mkz0TR5
  18lnqvKymyamxJ9Yr2dy1el5742xVb3ZL77a/j9inLNWvlw4emzsgbxQkuvtcq84j/JZL++Km
  HdW7eotritR1kr4j9PeyFR2+/+y+vqk6jV78PXp0zeMOeftIby12zZD11Fd68FX2V4Usrz1eN
  DRcTx77naLw0XM10qurSVQSfRVPlRiebXv5uEPj1dsPTfLqZcPbGF/h9WiUqdZ/zZHcC76LYS
  S3FGoqEWc1FxIgCd72RoSwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1668308559!781998!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5739 invoked from network); 13 Nov 2022 03:02:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:02:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BD2421000E7
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:02:39 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B0EF41000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:02:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:02:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: update 22.3 -> 22.3.1
Date: Sun, 13 Nov 2022 11:02:06 +0800
Message-ID: <1668308526-14838-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173174

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
-----------
 Fix entry point generation of pip.X, pipX.Y, and easy_install-X.Y to correctly
 account for multi-digit Python version segments (e.g. the "11" part of 3.11). (#11547)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_22.3.bb => python3-pip_22.3.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.3.bb => python3-pip_22.3.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.3.bb b/meta/recipes-devtools/python/python3-pip_22.3.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_22.3.bb
rename to meta/recipes-devtools/python/python3-pip_22.3.1.bb
index 394c428675..cb9f68679f 100644
--- a/meta/recipes-devtools/python/python3-pip_22.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.3.1.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "8182aec21dad6c0a49a2a3d121a87cd524b950e0b6092b181625f07ebdde7530"
+SRC_URI[sha256sum] = "65fd48317359f3af8e593943e6ae1506b66325085ea64b706a998c6e83eeaf38"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.25.1


