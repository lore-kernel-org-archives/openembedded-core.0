Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21D7C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:13:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5133.1678878830764617797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=n+6uELb5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878828; i=@fujitsu.com;
	bh=J4ucpcTY0LvwqSILPl74E5QvsLUyPO1uy1650fol7FA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=n+6uELb5j+VfIpt42JyY+g5zXrsqF3wslKIxk1nksc1OnuQA9s/UgVMYHVgV/2M0x
	 kABVvPRDAX9EqKVXQTg80QDK6AbWKkMHXeztophR5lPVUsdV6cNWIptng18BzGATHh
	 xCHH+GkD12oaIAN0vFQfPU+9h9lqEJcp780XKjLVa+1S1T8MZln+BuaCkOSDAZBD7w
	 O/6y6dmwiePp+YFk5QGuVsSdh6gigofObIMsZx4b7+BdxMG03as5wBS9eNWz5t09xY
	 iPpg/AzbinCThLUeOo0SCezRZs5DPGJlsCFbQztS/vVSeJ9nFbdP69w8ZojULtNaF8
	 6hqBRUbjIgktQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8OxWTdnhWC
  KwYMGTos7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmzFi3l7XgN3/FwRvrmBoY
  l/B1MXJxCAlsZJTYe/8fE4SzmEli7pOv7BDOHkaJj0f/sXYxcnKwCUhJ3Lj/n62LkYNDREBP4
  uo/UZAws4CjRPP8+2BhYQEXiXfXs0DCLAKqEpv+zWQDsXkFnCQ2LV3NAmJLCChITHn4nhkiLi
  hxcuYTFogxEhIHX7xghqhRlJh9uRmqvkKicfohJghbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+L
  UorLUIl1DA72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2M
  wPBMKWZM3sF4te+v3iFGSQ4mJVHeP2sEUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8PItEUwRE
  ixKTU+tSMvMAcYKTFqCg0dJhDeiHijNW1yQmFucmQ6ROsWoKCXOa7ocKCEAksgozYNrg8XnJU
  ZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJeWAU3hycwrgZv+CmgxE9Bi3nkCIItLEhFSUg1
  MmRfVFjyY59afUJosXbl/eXr8FwXuC34Rn8weXuYy56lW2prxtfzNQtnNdVvWvtbh/dDX+mCK
  swtb6KSQ2CLpw9svzvnmvMj427xJdlmcsfUtnwJ42P7/Wn6/63jdpaTQp6bfjnsq7dO9cal9j
  +v3K2uZNZ7X9phfXsYgquPw4eXM45vLT7RM+LzCKtRrVn5fmFJ9VDGHks1W0aoTZcd39fTz6d
  xuEflfk/MsTLP0fuq5OUxp03IshUI+r332KSDzoVe/eIBc2Sxp87UTGrMqD35eUzejxSYsMC7
  9XO+C2d/frU+7oGx883GjMctrhbBAjwXWSycVZl2xVli8yHTC9LwDHzIdQ/5MjFad/tpFiaU4
  I9FQi7moOBEAThd3ZEoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1678878827!125667!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28912 invoked from network); 15 Mar 2023 11:13:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:13:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B832B155;
	Wed, 15 Mar 2023 11:13:47 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id ABEBC73;
	Wed, 15 Mar 2023 11:13:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:13:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-testtools: upgrade 2.5.0 -> 2.6.0
Date: Wed, 15 Mar 2023 19:13:33 +0800
Message-ID: <1678878814-19528-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178545

From: Upgrade Helper <uh@not.set>

Improvements
------------
* Add support for Python 3.10 and 3.11.
* Drop support for Python 3.5 (EOL).
* Distutils integration is deprecated and will be removed in the next major
  version.
* Use "CompoundFixture" from "fixtures>=2.0" rather than rolling our
  own.
* Provide a "testtools[twisted]" extra documenting dependencies needed for
  "testtools.twistedsupport".
* Make "TestCase" hashable.
* Prevent "AttributeError" in "TestCase.__eq__" for objects lacking a
  "__dict__" attribute.
* Replace deprecated "cgi" module usage with "email".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-testtools.inc               | 2 +-
 .../{python3-testtools_2.5.0.bb => python3-testtools_2.6.0.bb}  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.5.0.bb => python3-testtools_2.6.0.bb} (98%)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index ef5e15cc3a..e004d0eb0b 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 inherit pypi
 
-SRC_URI[sha256sum] = "57c13433d94f9ffde3be6534177d10fb0c1507cc499319128958ca91a65cb23f"
+SRC_URI[sha256sum] = "28b65e14c0f2d3ecbbfb5f55c9dcde5e4faa80ac16a37a823909a1fe3cbcb30a"
 
 DEPENDS += " \
     ${PYTHON_PN}-pbr \
diff --git a/meta/recipes-devtools/python/python3-testtools_2.5.0.bb b/meta/recipes-devtools/python/python3-testtools_2.6.0.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3-testtools_2.5.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.6.0.bb
index 896ecee65c..79e46a02de 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.6.0.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-testtools.inc
+
-- 
2.34.1


