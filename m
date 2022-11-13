Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181E3C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:08:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.207.1668308912882055803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SE2oGzfS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308911; i=@fujitsu.com;
	bh=HquRm3lfeR35jf8FoNr2IDlqcz09O9mdOw5XT8GxtbE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SE2oGzfSQTwDY+6IzgkDrDdnBH1AIbW/k13QoBE+BuE8QskCnX55QCYqVP+x5lKn/
	 hva1SPGsgIhxisYZwVfkByh96UTRbYciuIfWJgXWHT7yf7UWkUTgkzjLEZQ6lyUpt6
	 CmEx5sOfDVmi3H86fiZ7xiuvwnmIKRUc/002cBB8PfzD45n/3usP5O0F2gLDb/HE4/
	 D0OcOGAOvzF0s1Hzj21mRjy/DxfSC++oi1+5AvSDlHtqhZ5zNaLXt0G3lcPWN6HzFB
	 gBEbPNS9RL0WD256pgf5RVnMzV+yTmEmFOwFoZTZSS2IfhlQf61qYx3BtkMQWTas/D
	 h6VHAixqR062w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpLs2viD
  Z4E+jisWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrF9/lvGgo88Fc8nzGZvYDzB3cXIxSEk8IBR
  ouvQaeYuRk4g5xKTxIOfhhCJPYwSbTs3MoEk2ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwEni3bztYOUsAqoSJ26/ZwWxeYHiSzo+gtkSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI1NNVLKsp
  MzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzFlGL24h2MD5b9
  0TvEKMnBpCTKm3Y9P1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/vyIJkIcGi1PTUirTMHGBcw
  KQlOHiURHgr7IDSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5US55WIASoSACnKKM2DGwGL0U
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnXRgNN4cnMK4Hb9AroCCagI75H5oEcUZKIkJJ
  qYJrFky6mrBu3bdWFVP6N5+7FnV+f1ix42P1M3NKEiPpJik21b24u+yL2OYIr5qzItB2Hl599
  pbnv9twHm76nO331MPvam6k7sdV+WT73pVTO8Cvz391Pnpo174hfuXVz9d1fy5M5a5Ze2fkh9
  ER6267Ehy8ltl6Ti9n/nCNM4dr19CO21hdCvdV+sGeWVMs1L4xSnM2RXHhz1tFkYwZ/I9sPx3
  rfsASKs+owrjnXzXonOOBq4fvkU+GpchFd57ZnJRrFGhcr/rcuzU784fIoeU058+vncZf6Bas
  n9QTuWDxV6K6s9O435lc2ij/4eevIz1mPf+dG1O1dtTKuTWdP3faLf3MCVZTXX21xVmjuCVVi
  Kc5INNRiLipOBABr/LiMTAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1668308909!781089!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5846 invoked from network); 13 Nov 2022 03:08:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:08:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3B4E61B2
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:08:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2E9567B
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:08:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:08:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wheel: upgrade 0.38.0 -> 0.38.4
Date: Sun, 13 Nov 2022 11:08:10 +0800
Message-ID: <1668308890-15118-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173179

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed PKG-INFO conversion in bdist_wheel mangling UTF-8 header values in METADATA
-Fixed install failure when used with --no-binary, reported on Ubuntu 20.04,
 by removing setup_requires from setup.cfg
-Fixed regression introduced in v0.38.1 which broke parsing of wheel file names
 with multiple platform tags
-Removed install dependency on setuptools
-The future-proof fix in 0.36.0 for converting PyPy's SOABI into a abi tag was
 faulty. Fixed so that future changes in the SOABI will not change the tag.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.38.0.bb => python3-wheel_0.38.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.38.0.bb => python3-wheel_0.38.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.38.0.bb b/meta/recipes-devtools/python/python3-wheel_0.38.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wheel_0.38.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.38.4.bb
index 2a2abd1f25..6263cbc45c 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.38.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.38.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "d52844afee64cdd4bb28061ba6b5c06818b237fb490263e0dbea227080f7d2d7"
+SRC_URI[sha256sum] = "965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac"
 
 inherit python_flit_core pypi
 
-- 
2.25.1


