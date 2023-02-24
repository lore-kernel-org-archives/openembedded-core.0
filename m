Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2FEC64ED6
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:45:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.8976.1677206711904145166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TIa30bJW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206710; i=@fujitsu.com;
	bh=4cXACOLbYjPH1GL/FPxhTznWY6aRFzd4sILc6uEyIsM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TIa30bJWq0xgO6RF49dCx0Pwt55AuwYrVCujcVHXPO8+iHFJ+9i8XUG4CC8Rp6JZA
	 ycq+yeFvdHOY/nryP23KJvELoPjX7E2H/TC/KX4mAm+LyPIXVNvOUg6yPdDQY2+4XG
	 w0D4Pnq+jyzJZvguLJFH8iFg26UVyoeoCYHV625BSReo3ba7OUUdbdIGIo4ZnN3GNc
	 kxXPE2PR3WL/NZjguJRSQB1/lrhMsEIfVzWm2HlP7GeWcR8P95y4vjQfAzfRCK8mvE
	 oNixi2m8TqL80baLH5eus80DA7WNc/lXrJPb+YwY60KBBSEfCrpNIfKnShH7iOy+pm
	 0H4jszZtDkQ2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8MxSXeryo9
  kgz8z1Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1owJu/ayFjxkrTj9zqKBcSprFyMXh5DAY0aJ
  jy8uMkM415kkzi16B5ThBHL2MkpM/hgJYrMJSEncuP+frYuRg0NEQE/i6j9RkDCzgIrEi9897
  CBhYQE/idW9NSBhFgFViY/rTrOD2LwCThINN3awgdgSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCslWj/8grLVJK6e28Q8gZF/FpL2WUjaFzAyrWI0LU4tKkst0jXTSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMwpRi9V87GGf2/dU7
  xCjJwaQkyqsr8yNZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvK0WgnGBRanpqRVpmDjAiYNISH
  DxKIrxsIK28xQWJucWZ6RCpU4yKUuK8WspACQGQREZpHlwbLAovMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmfagENIUnM68EbvoroMVMQIu/v/kCsrgkESEl1cBUtdj4R+hpT43XXoHZc6T
  fGF31W2Gl3Fp+ynRtetGV6unxibVT/SU2m9mca22f3RDs8kAiTWhTl3BlRP3jF9fS85okOO/2
  q1xW7rrwkevoXc3LTqtKv7tKlN109k9/+HNvRIvhis05nodvFFRc/Rs4+c/prLme+1ZUZerJK
  U3bmRaX+eLV9DVXtT+6VeemnPf4VeXzKJh57usi4Qm87w9PP6f0nPtEcF1S0JGsOQlTmcTFJ5
  xkrWwt//j3UarNHCO17br5XnfC9hkmXs+PPcLxcmuojtGKoqp886d32z0+K2k61fFzLDH0NFA
  7U+d/fPbrSNGdt2eraFWX7ONg7bGKP9zJnvOuLkZ/faVKgBJLcUaioRZzUXEiADoJzvc9AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1677206709!206521!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9862 invoked from network); 24 Feb 2023 02:45:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:45:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 573121000DB
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:09 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4B5A41000D7
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:45:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/4] lua: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:44:52 +0800
Message-ID: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177649

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/luaconf.h conflicts between attempted installs of lua-dev-5.4.4-r0.aarch64 and lib32-lua-dev-5.4.4-r0.armv7ahf_neon

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/lua/lua_5.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 0b2e754b31..a39d888ec2 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -57,3 +57,6 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${includedir}/luaconf.h"
-- 
2.34.1


