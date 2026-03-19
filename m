Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918C1108E1C5
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7750.1773915327162605632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cSHPv/oa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915327; x=1805451327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7dPTS3gk3AEtpNjsK7tDqJoJnHt/gXEkV+0crsHxd6E=;
  b=cSHPv/oa7FNF3lTWYGcCY+i72E7em0s/OGDI8m2Uhj+7q0jHOUCMUINU
   lONpej8mw8whsqQIviUAgzp3Lfuprtb3/DY5MPJwORmzc53UFxiRmEeFP
   Vmz66SJ7xCCJIdbJdhoe3v1pDMK5eoBccFJtGdKr50exW8rs1ry6y0ltl
   7UH0AzNwaWA0cls8RWrC+c1WCkoPkqWUs5Ey0qxiUj28hnW6Iipyhsnv2
   bmoC1uYaMS5qG08HC1VtAPOpAvFwK5qkdipo3RllEHQ6njWvxGsFW0MlJ
   wubYAzwf3E+X85WqDR2QMkU6s2KNK9aUZHhK1GZa50MDwT0rfOaGC8FF2
   A==;
X-CSE-ConnectionGUID: Z50h5VzeT/aRIyXHmh6xBw==
X-CSE-MsgGUID: AhhdDLEKQseWkYg5s1RLVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="222540013"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="222540013"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:25 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B61381002815
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6803F1407352
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7FDC7101E52F;
	Thu, 19 Mar 2026 10:15:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/40] python3-testtools: upgrade 2.8.3 -> 2.8.7
Date: Thu, 19 Mar 2026 18:13:24 +0800
Message-ID: <20260319101332.2067-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233496

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements
------------
* Fix an issue with "iterate_tests", which was recently changes to insist
  on accepting an instance of "unittest.TestSuite", breaking some users.
* Improve the type annotations for "testtools.testcase.TestCase.skipTest"
* Correct a URL in the README
* Improve the type annotations for "testtools.testcase.TestCase.assertRaises".
  This method will now be typed correctly when called as a method or as a
  context manager.
* Fix the type annotations for "testtools.testcase.TestCase.useFixture"
* Clear "force_failure" in "_reset()" so that re-running a test
  after an "expectThat" failure can succeed if successful conditions are met again.
* Make "extract_result()" and "DeferredNotFired" public APIs in
  "testtools.twistedsupport". These utilities are useful for extracting
  results from synchronous Deferreds in tests.
* Add support for "unittest.TestCase.subTest". Failures are reported
  individually while the entire test method is still treated as a single test.
* Add "testtools.matchers.test" module providing a test harness for
  users who write their own custom matchers.

Changes
-------
* Re-add compat helpers and helper modules that were accidentally removed
  in a patch release, breaking API compatibility. These are now deprecated
  and will be removed in a future major release.
* "typing-extensions" is no longer required at runtime; it is only needed
  for type checking.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-testtools_2.8.3.bb => python3-testtools_2.8.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.3.bb => python3-testtools_2.8.7.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.3.bb b/meta/recipes-devtools/python/python3-testtools_2.8.7.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.3.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.7.bb
index 2ac8759784..db3ec2373d 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.3.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.7.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "3b54b543a7583a35f65538b1d36a327fc34943a26bb839bcbe4b2c5e085aa939"
+SRC_URI[sha256sum] = "1aa19aaabf9736385fc111a95f94f6b0661c0b41e65ca5129223eb518c63e8b9"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.43.0


