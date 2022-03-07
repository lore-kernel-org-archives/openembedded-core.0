Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C48C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 02:48:35 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.22204.1646621313978804266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 18:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rd3Yi8jT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646621312; i=@fujitsu.com;
	bh=1ScVtfsUqsP1wowc2frfrouSPsTgpQW0y7v3G5DRUCQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Rd3Yi8jTE4GA6a8KU5zQY/lyOb2k4d8SQSrDAvGL4xkqtHAdyzG7leW53PWOj85xd
	 JnN678TeDg/WguOCEITpXe3+AtuJk+I2D9l52OZ8yCDuI9AitJfW1XDwvqTA/ue9uO
	 hBUZQgwzvsNG4weW93TA/6VhLidnZOEHHrnGk0N7LdjK0ECL2Plzn7pOiF/yhXf31N
	 1CTgi4Puh5AHDsU1rfLCsfpOcSnNOTbWUQT1cRWLtyZxPNLzQlnDq0l14eWaIt9Jjd
	 WAnbo9aHZSjRjXPU5/86QZfuzAV0jzCWe620DYZ826KWtoJu7p1pfT4g9SJhFPBY4P
	 OXcknn/GfgM0g==
Received: from [100.115.71.2] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 6A/21-24645-F7275226; Mon, 07 Mar 2022 02:48:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MxRbe+SDX
  JYFKHiMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFz1gGWgj1sFZP2z2FqYJzB2sXIxSEkMJ1J
  YuaHbYwQzh5GifsHVwFlODnYBDQkdk+9zNzFyMEhIqAncfWfKEiYWUBN4ujLn8wgtrBAqETLo
  xNgNouAisTLpR/YQWxeAReJ/we+s4DYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqlCTeXt
  rDCGFXSMya1cY0gZF3FpKWWUhaFjAyrWK0SyrKTM8oyU3MzNE1NDDQNTQ01TUz0zW0MNNLrNJ
  N1Est1U1OzSspSgRK6yWWF+ulFhfrFVfmJuek6OWllmxiBIZaSrHTrh2MB/t+6h1ilORgUhLl
  ZWdRTRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwdtSAJQTLEpNT61Iy8wBhj1MWoKDR0mENwgkz
  VtckJhbnJkOkTrFqMsx6c+1vcxCLHn5ealS4ryTCoGKBECKMkrz4EbAYvASo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHenSCreDLzSuA2vQI6ggnoiCpbJZAjShIRUlINTEeDvddHp2nz/rs
  yPct5UfOFPsZnkdyrp76ZO2fG/MRprdduJr+7ECa+QHPSlUdrt2pFl2212sS4Ifdszh5x80O/
  bMS9l5i9UnX9s7NMLz0z7ZvM4bv1/vkmJZndVnxMc1nruA7eU2uZHjjHI6kiIt1e9OXK60v/K
  M1Ybfoo7AyzrLlMz6JdSzjSp++v7zv+eO2WdY0SHkZNZvI3jS+LHZsi9N59eb64lI/fi8tbO3
  zsSlaGWLIurzPWnTvVZJHYOsegVZmNfvsbdd5xLnXenlNyOoht6pTtZwIUj7+P1ZX+P6lpAfO
  9SdweHxIv1t7Kjddeb+rkmrDv0/uNyf+7f2XmnEqI8Jgfd//MrXDRM0osxRmJhlrMRcWJAJyX
  gfc8AwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1646621310!64255!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18834 invoked from network); 7 Mar 2022 02:48:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 02:48:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2272mLeT025805
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Mar 2022 02:48:30 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 02:48:20 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] monitordisk.py: Deleted redundant word in warning
 message.
Date: Mon, 7 Mar 2022 19:48:12 +0800
Message-ID: <1646653692-3675-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 02:48:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162795

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 bitbake/lib/bb/monitordisk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/monitordisk.py b/bitbake/lib/bb/monitordisk.py
index 8d8cfbb937..a1b910007d 100644
--- a/bitbake/lib/bb/monitordisk.py
+++ b/bitbake/lib/bb/monitordisk.py
@@ -78,7 +78,7 @@ def getDiskData(BBDirs):
         action = pathSpaceInodeRe.group(1)
         if action == "ABORT":
             # Emit a deprecation warning
-            logger.warnonce("The BB_DISKMON_DIRS \"ABORT\" action has been been renamed to \"HALT\", update configuration")
+            logger.warnonce("The BB_DISKMON_DIRS \"ABORT\" action has been renamed to \"HALT\", update configuration")
             action = "HALT"
 
         if action not in ("HALT", "STOPTASKS", "WARN"):
-- 
2.25.1


