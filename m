Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E174C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:03:01 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.31747.1641823380400795106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tw3hl5cy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823378; i=@fujitsu.com;
	bh=9CM9WUw9smd5fM+n42Dt+EydMgJjATB4jEbO3uatjVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tw3hl5cyjOiLwbmI8MGZAqZRgP1yCEcZlDi3bkmPJYG3K6kYoaU+DaC4YaRHETkFj
	 +DY4xrF/3ToyXa3scG9GESm7aWPNv1Og28KPuITONjQsfZnz7F+cvyEVpET1eyBo3d
	 maIgdJ623lfmQfzOyHjgCP4vCHd9mvbiUK4cjlO8I+Iv0lPwqQ2gJJnrvc2OIiIVYG
	 LaWBY7otV0SCsIUOEI2xHaUMa/ibhUiL0Kimo/7iW3ihaklXTyus5YE6ak6N5SRxxa
	 MmoKCnvn2PWKZRzskQ+5/y1uBmoBAjjFzAB3sW56NOz63mHNSr40i8nuq4rTfCOONk
	 JAPSNCKHduDbw==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id DD/4C-10124-19C3CD16;
 Mon, 10 Jan 2022 14:02:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqNtjcyf
  R4Ml0Pos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPO2afsBde4Krasimpg3MjZxcjFISTwmFGi
  vecgK4Rznkni3OarzBDOCUaJ7893s3UxcnKwCahJTL91A6iKg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC5xIPlO5lBSlgEVCVOb8wBCfMKOEn0XVzKCGJLCChITHn4nhnE5hRwlnjQP5MFpFwIqO
  bb+3yIckGJkzOfsEBMl5A4+OIFM0SrosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjJZJRZnpGSW5iZk5uoYGBrqGhqa6JrqWxnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIHBm1LMEruDcWvfT71DjJIcTEqivE+M7yQK8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuBNsATKCRalpqdWpGXmACMJJi3BwaMkwqsBkuYtLkjMLc5Mh0idYlSUEufltQZKCIAkMk
  rz4Npg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvAch4nsy8Erjpr4AWMwEtTua4DbK
  4JBEhJdXAtE3lgtnnKQH5j+b5z55eGvtxdVOJsPXn/TeZr0jcMpe9Utjb6GSg8TMwl6lYwtph
  HXufcfFLIeaWSpHDBnbrZnTzxl4rdgprM1meeby0u8W1J6dsjV3kyxniwdmMi4JWsxQKyTO/m
  ed+Y0+ywotwZb6LuyZm2PHNuvHJLjrk3ZFp4r2Gr5wijfPm/g4K9/vd7Plx3fGly2NfcbJNPL
  Cf3/D9X8WmWS8tpVMSnqvuZ664rWym6VXkWH9365e5Dv/PtK1b/KD+c93BJY0q36+67NkzVXB
  VX+/3HFOtE77bmAOeiP8piVPeYLJu6afs0Ev5F+dL/ziWdLxf8MFVReUPSuXH1vstZWLexFTZ
  /P6jEktxRqKhFnNRcSIAPtbpplkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1641823371!41842!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 919 invoked from network); 10 Jan 2022 14:02:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:02:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A4B8F1001AA
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:02:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6E1121001A2
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:02:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:02:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bluez5: upgrade 5.62 -> 5.63
Date: Mon, 10 Jan 2022 22:02:29 +0800
Message-ID: <1641823351-62709-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
References: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160356

Changelog:
=========
This release is mostly a bug fix release, with fixes to features such as GATT,
SDP, Daemon, and emulator. It also adds a new MGMT Event for Device Found and
Device Lost of Advertisement Monitor.

New build options for sanitizers (lsan, asan, ubsan) are added and it may
require installing additional libraries depending on the distros.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bluez5/{bluez5_5.62.bb => bluez5_5.63.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.62.bb => bluez5_5.63.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.62.bb b/meta/recipes-connectivity/bluez5/bluez5_5.63.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.62.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.63.bb
index 411ac8b5a3..34c4767d2b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.62.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.63.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "38090a5b750e17fc08d3e52178ed8d3254c5f4bd2c48830d5c1955b88e3bc0c2"
+SRC_URI[sha256sum] = "9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.25.1


