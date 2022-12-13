Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5763DC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 02:38:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.63885.1670899121712361736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 18:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mvX1Fr6G;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670899111; i=@fujitsu.com;
	bh=OL0fUglQgL0dLM8G3qqHY+0llcWKZjl6UD2GJcfz1Yo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mvX1Fr6GHUhIajBphYWbHep6LqoBl8HiRThhWIh8vmGhE7Fj1kSBG7j3x8P/gdGzj
	 hkUGGb/UgT/NbtV1QK7Q2mtslspyQs6PLqVTvTl+qqc6NY+exk/h2hK2BpwAxDHB61
	 PgCQ2lbSmM2NcZb7OwOMdd2qMYmtBqBTIahdh016+ufH175/bB55TbkwkQf1KtJ/5y
	 obx1H7uzq9sEDZboxGMj1z9qMYxLYbRJmaeSwhHt8UXMVgVSW3fR6XDcmGIg1KYSKu
	 LsXzxL71h0WvL4y704qqGkhBcf/5oyy3RZtiqYnlhjNcjh/VN/TD3fz0U6T2con8FV
	 ChhkjZbX7yNPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqLvs6fR
  kg5ebmS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyDR66xFTzhqpj49jljA+Nuzi5GLg4hgceM
  Ev8WXGKEcK4xSeyZu4MNwtnLKPH652SWLkZODjYBDYndUy8zdzFycIgI6Elc/ScKEmYWUJM4+
  vInM4gtLPCJUaJ1fyqIzSKgKvFx4wR2EJtXwEXiSecaNhBbQkBBYsrD98wQcUGJkzOfsEDMkZ
  A4+OIFM0SNksTbS3sYIewKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGM2LU4vKUot0DS3
  0kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L08lJLNjECwzGlOCVg
  B+OmZX/0DjFKcjApifIW505PFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+/IxUE6wKDU9tSItM
  wcYGzBpCQ4eJRHeXJA0b3FBYm5xZjpE6hSjopQ4b8wToIQASCKjNA+uDRaPlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ824GmcKTmVcCN/0V0GImoMVRL6eCLC5JREhJNTBtOJdeYsy684k
  8k/jkyz84P6n1Ckk+0JSJeloV7Nj1zdJ1z6zvXB/uSdyaInx1hdcWL+H6+Ck/t/n41U0++CIs
  xbrW70PjZD3GTVds/j5d5mfxMiTb0+gWm4PWAx0FpbVVPFsOBL7Z2jzfm9+Qk3lzcdS0hdza/
  IqbFOs2lfHc0Nzi2r0rKn5b5ja/s3vnpD6f6ll4dPPbtZWW3crxPc67Li88ylLdxxzPWem7Xj
  D4yT/z6GM3mJTsMy/MZvUNtNpxvk7Om//9fxe1r9IlLLKfuFvP9D2XbZV5XsC2u56LN67Epvr
  8Wt4jr39Xv2iVDlNLUnzUyLHmaLRdVbbPlYCYrP2zK1cndev/PVnkp8RSnJFoqMVcVJwIAKvm
  jABCAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1670899109!219534!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5580 invoked from network); 13 Dec 2022 02:38:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Dec 2022 02:38:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7EB6D10019A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 02:38:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 72FBA100182
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 02:38:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 13 Dec 2022 02:38:27 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations" instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for armv7, but doesn't work for aarch64. But in fact neon is also enabled for aarch64 by default.
Date: Tue, 13 Dec 2022 10:38:15 +0800
Message-ID: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 02:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174506

Reference to libpng-1.6.38/configure,if enable_hardware_optimizations is
enabled, libpng can judge whether enable enable_arm_neon according
to $host_cpu.
----------------------------------------
$ cat libpng-1.6.38/configure
......
if test ${enable_hardware_optimizations+y}
then :
......
         # allow enabling hardware optimization on any system:
         case "$host_cpu" in
            arm*|aarch64*)
              enable_arm_neon=yes

printf "%s\n" "#define PNG_ARM_NEON_OPT 2" >>confdefs.h
......
----------------------------------------

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
index dc627203ef..7da71d9d3b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
@@ -22,7 +22,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
+EXTRA_OECONF:append:class-target = " --enable-hardware-optimizations=on "
 
 PACKAGES =+ "${PN}-tools"
 
-- 
2.25.1


