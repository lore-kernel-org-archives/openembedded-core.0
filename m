Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BF5C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:06:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.190.1668308783828804299
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BVj3zxMW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308781; i=@fujitsu.com;
	bh=ikNkQCo1k8mmV6YVf5beaaaBVqvu09GpOeUDkLSs4+A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BVj3zxMWAIwMSHlsfEqZY0/voXOfkiltlOTyJNgtA/MoxABFfnGG0ei+4YYxYp9Pe
	 9AMuUcs6q9J26Ry0CTOJQ6LoWklctuO2c9DPHlyvFwdbas9Y7N68ZAtihjk4tSrhHN
	 WIjGefnryOI4tLlxcHcW412O9qBw1sAw2dVvUal6tv9M2gChzKFB8WXnjcOP0rl06E
	 LHFYIuhVskoZj2/Y1TGCC22+/r9+kUo9tiOmpNIj2hsQEy/5rSXBwu/zGqgIpezZD9
	 X/RARsrytNB0/8MgABFbxCQnmGNs3b4vavhkWpqwEoBggFLAuk8uMcy7WWQoSszYxD
	 NXWBqlXClEjyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpKsTX5B
  scHSWocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHp5SyWgnfcFUveuzcwnuXqYuTiEBJ4wCix
  ZHkLM4RziUni1foVLF2MnEDOHkaJFV9KQGw2ASmJG/f/s3UxcnCICOhJXP0nChJmFlCRePG7h
  x3EFhZwknjXPpkNxGYRUJVY93YiI4jNCxTfsX4DWI2EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3TN9ZKKMtM
  zSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMxpTjh5w7Gjcv+
  6B1ilORgUhLlTbuenyzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvd3ZEGykGBRanpqRVpmDjAqY
  NISHDxKIrwVdkBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpUqJ80rEABUJgBRllObBjYBF6C
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxro4Gm8GTmlcBtegV0BBPQEd8j80COKElESEk
  1MLU8WHnqluOyGMmYJQHPT+Ye8IzsVcuY+iHSbmqCibr9x6m7tc3fSmRJPt/RdvPa1OkaC2RV
  PrIzHfqvqfOO9XPbytMX8tKbD2jeeCGz6+tNcQ8vXcPZR/3vsUysvWD4W4bz7B+X+qMLC6+u3
  M75+Dt7uPAGyzjWTLEFSc8cTNMPFS5N0+c5XyTMa/679oqGm4KUoYBBq5/+MeF4t6lzGctvea
  w+eaQ3aoWm9072kiDV3Y/Eni+7zPIq/+PdNW4uIValE8rWPVBxumByQ2b+hiRpps2Ze/erH7z
  C/WzCX72I5Ftn6o+/mlW93ua6cBDf/XcSv/S+bk58I7d6IuePsskrHtsvjX+16PKdOwoxWjVK
  LMUZiYZazEXFiQADUsvJSwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1668308780!776779!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10780 invoked from network); 13 Nov 2022 03:06:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:06:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4A43D1B2
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:06:20 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3F3FE7B
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:06:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:06:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-subunit: upgrade 1.4.0 -> 1.4.1
Date: Sun, 13 Nov 2022 11:06:02 +0800
Message-ID: <1668308762-15073-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173178

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
IMPROVEMENTS
-------------
* Add support for Python 3.9
* Add support for Python 3.10
* Drop support for Python 2.7, 3.4, and 3.5
* Convert python scripts to entry_points.
* Migrate CI from travis to GitHub actions.
* Add options to output filter to set timestamps.
* Remove dependency on unittest2.

BUGFIXES
----------
* Fix tests with testtools >= 2.5.0.
* Mark rawstrings as such, fixing warnings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-subunit_1.4.0.bb => python3-subunit_1.4.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.0.bb => python3-subunit_1.4.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.0.bb b/meta/recipes-devtools/python/python3-subunit_1.4.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-subunit_1.4.0.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.1.bb
index e4e3bf191d..c5faeaa513 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[sha256sum] = "042039928120fbf392e8c983d60f3d8ae1b88f90a9f8fd7188ddd9c26cad1e48"
+SRC_URI[sha256sum] = "5fe5686904428501376e7b11593226d37638fbd981c1fc9ed6aac180525d78c1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


