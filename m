Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708DAC433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:30:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.11127.1639402206518401041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Gav1ARYA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639402204; i=@fujitsu.com;
	bh=0NiVLFuauicG+cuikydacreP02zsDi6h+Jw+R7STwbE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Gav1ARYAwGVJrT7pmO3UW7AZn/f5MKOiiRBcgfSnPOpgw55u9P8x10R+giua3vmIs
	 lzQt4bDQ2Ge9juLa8WPi7Q+LEC4ercvqgsZr/kkqbU9uGKuXenIEOgkbi1uTZUra1T
	 1bm6fGCcre7uldOtzo3+QUMepmyr6VbKGOiGIEhCEkHhQWne7mEmqe2LQoJGaAzY+V
	 juubBPq8xqMY5kiBFDQY5PttK4Dcw2ytpdCbdL7shgsRAHZX1gu+OuydA0PHZNt0Uq
	 0UpeQGPAu1utKV+YGnPO6WuNFyk/xPi5tFc266z2VoEOL45i5soI6gLQbYs8r+uTod
	 LrNYDTYoeFGaA==
Received: from [100.115.34.181] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id FE/F6-16537-CDA47B16;
 Mon, 13 Dec 2021 13:30:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSfeO1/Z
  Eg9XLhSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owP2zazFOzlrjhynq2BcStXFyMXh5DAY0aJ
  nkXP2CCc80wSJ99tYIVw9jBKnHn6gamLkZODTUBX4tzjtexdjBwcIgJ6Elf/iYKEhQVcJCZde
  MkOYrMIqEr0bjsFZvMKuEsc673OAmJLCChITHn4nhkiLihxcuYTsDizgITEwRcvmEFGSggoSs
  yeLg9RXiHx+vAlZghbTeLquU3MExj5ZiHpnoWkewEj0ypG66SizPSMktzEzBxdQwMDXUNDU11
  jU11DE0u9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzA0EspVp66g/H0qp96
  hxglOZiURHmDWbcnCvEl5adUZiQWZ8QXleakFh9ilOHgUJLg/W0OlBMsSk1PrUjLzAHGAUxag
  oNHSYTX3RMozVtckJhbnJkOkTrFqCglzvsCJCEAksgozYNrg8XeJUZZKWFeRgYGBiGegtSi3M
  wSVPlXjOIcjErCvMmOQFN4MvNK4Ka/AlrMBLSYsXIzyOKSRISUVANT+MbD/+q/e/7qvf1whZa
  gyOHLJ5y/lzHFGUhVbd+SVVSyYPH/w47czF/f/ricUvpw17ubR3Mkc6W6zqyunCZ487/Cs60f
  DxyuyubW8av7z3aRfRv/Mp1bxReq0/70cMRJyGz6MpNDYJ5kgv/a2RuVV62dF9LEsjFFTGHFx
  3tuD3/s/3Tu9P3l2i4vp7LYNAfHbU28tOK7vkOagZas8s8Y07XsL2e6m2VP53px5V6RwW6hp5
  OWiuxVZz49fc1uboWsD+cZgwtuRieHreGRVp1j9jFdodzIeIH1z2UG7a9cY2sD82+cmuTybO7
  1/YdEH13v1f+20Db+21G9xujCEwbc3It/Hzr29d27Y/cLE1bbHFNiKc5INNRiLipOBAD1n7A1
  OAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1639402204!20112!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20981 invoked from network); 13 Dec 2021 13:30:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:30:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D7ABB1000F6
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:30:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C78E7100352
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:30:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:29:54 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] glib-networking: upgrade 2.70.0 -> 2.70.1
Date: Tue, 14 Dec 2021 06:29:42 +0800
Message-ID: <1639434582-2586-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:30:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159631

Changelog:
====================
 - Fix crashes when handshake is cancelled (#97, #176)
 - OpenSSL: fix spurious certificate expired verification errors (#179)
 - GnuTLS: Fix tests on 32-bit systems (!188, Simon McVittie)
 - GnuTLS: Fix crash when invalid priority string is forced (!189)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{glib-networking_2.70.0.bb => glib-networking_2.70.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.70.0.bb => glib-networking_2.70.1.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.70.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.70.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
index fc700e03b7..f020e16068 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.70.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "66b408e7afa86c582fe38963db56133869ab4b57d34e48ec56aba621940d6f35"
+SRC_URI[archive.sha256sum] = "2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.25.1


