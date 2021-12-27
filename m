Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E7DC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 13:21:03 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.26153.1640611261474751411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 05:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Yk5KM/O0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640611253; i=@fujitsu.com;
	bh=v42oTcTfwI7D8xmlCr0YE/2Eb1LO9S+vD9Nh1v/RoNM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Yk5KM/O07T9XsOCGXBGCdkC/1o68pHCOypL63WOSyeivqjATn+g+KJ/26UnkRUoAn
	 wnZXvUa6F5UW8Mus2PCLUNJeUwaSN4KxWNf5T47PgFUuJx6IhdUkTcJRhf9/5mhkrP
	 ibf78LU5nW5f0VY5bfkkpk1eg21txpz9vG9mTvaktb2UG0ImjlpS6P+86IX2Mq/Kff
	 NZNUNs/6QuOKGK5pGFN4La3g9p0jfAAhXWdxpVgpe5wNP943oWeI2zxwnq+84EQETj
	 KsqEY6CsYa5M9gH1bA5ZIhj4gQmtnGRm7Z3mToc4yBjYb/+LFU/4jlxMg4TnfVdB72
	 j+yU+lTjXR5oA==
Received: from [100.115.68.34] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 D8/36-24146-5BDB9C16; Mon, 27 Dec 2021 13:20:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSXfr3pO
  JBmf38Fjc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnz13oUXOCr+LlwA0sD40SeLkYuDiGBx4wS
  /c/us0I455kkDt5vZodwTjBKzO18zdTFyMnBJqAmMf3WDaAqDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgIWEj8fr2IEsVkEVCU6zrWBtfIKOEn8WTKdBcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjNUfYXErFkQcySATrh6bhPzBEb+WUjaZyFpX8DItIrRLqkoMz2jJDcxM0fX0MB
  A19DQVNfMTNfQ0lAvsUo3US+1VDc5Na+kKBEorZdYXqyXWlysV1yZm5yTopeXWrKJERiaKcVO
  +3cwPu37qXeIUZKDSUmU9/uEk4lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgv7wLKCRalpqdWp
  GXmAOMEJi3BwaMkwsuyByjNW1yQmFucmQ6ROsWoKCXO2wOSEABJZJTmwbXBYvMSo6yUMC8jAw
  ODEE9BalFuZgmq/CtGcQ5GJWFeFZApPJl5JXDTXwEtZgJaPNPhOMjikkSElFQDU4qnkZfWklD
  FhN0XJ4TocR38lPnX8HIIS8uEhZJLUxly12YtFlPvVJpxOOHU40/dQo+5jI70L1z8YVrbtvCp
  R32ro35K6gelOP6unSXW+P39xzOLBctUHnOa7qzfOUUoIfq0auaCM4mP7XTZ/U+f/nBpW0pyu
  JVbgnbvVcuZtS81Z05ZEbIgoOfPrhv8E8W+/b/WvPeD8ybrhy+Oh+w602eq9YS/49Lt32lfC8
  TV7XY/+buF7U7rNb7bL+q9r3c8Stdp054vs+27yonr75ifO97sCunsmrbm1X2O0xb+b63X276
  zZOleKsjAt+xo0dfL9cmqJZPutC192lFvu8npedaqM/vatrbXCjHozYusc1diKc5INNRiLipO
  BABOetowSAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1640611252!211087!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22930 invoked from network); 27 Dec 2021 13:20:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 13:20:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B8CE910032A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 13:20:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AC6201000F9
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 13:20:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 13:20:30 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] expat: upgrade 2.4.1 -> 2.4.2
Date: Mon, 27 Dec 2021 21:20:18 +0800
Message-ID: <1640611219-22746-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 13:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160022

Changelog:
=========
  #509 #510  Link againgst libm for function "isnan"
  #513 #514  Include expat_config.h as early as possible
       #498  Autotools: Include files with release archives:
               - buildconf.sh
               - fuzz/*.c
  #507 #519  Autotools: Sync CMake templates
  #495 #524  CMake: MinGW: Fix pkg-config section "Libs" for
               - non-release build types (e.g. -DCMAKE_BUILD_TYPE=Debug)
               - multi-config CMake generators (e.g. Ninja Multi-Config)
  #502 #503  docs: Document that function XML_GetBuffer may return NULL
               when asking for a buffer of 0 (zero) bytes size
  #522 #523  docs: Fix return value docs for both
               XML_SetBillionLaughsAttackProtection* functions
  #525 #526  Version info bumped from 9:1:8 to 9:2:8;
               see https://verbump.de/ for what these numbers do

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.2.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.1.bb b/meta/recipes-core/expat/expat_2.4.2.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.1.bb
rename to meta/recipes-core/expat/expat_2.4.2.bb
index 14e5aca9e6..771f14eb3e 100644
--- a/meta/recipes-core/expat/expat_2.4.1.bb
+++ b/meta/recipes-core/expat/expat_2.4.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40"
+SRC_URI[sha256sum] = "e40737134bdc08b8ea7d23a2c0a5cd11c04d5be152fe562d3253c1e4a0be6686"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


