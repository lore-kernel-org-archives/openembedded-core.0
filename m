Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F02C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:36:53 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.24692.1641191798816247278
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tzgmq0Jd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641191790; i=@fujitsu.com;
	bh=tltIcCKL0rgH+q0CfnjJlzUYxZrzdgmsscxMXwTs5mE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tzgmq0Jd8+o2LUc4w4KXXHX3rz/L13XAks9V38cwvXHig06A+XfQUPUzWE1GKvhL5
	 ufOt74JrX9ZHNVd4WreoyTWRyllh4Tum7hIBgRkxvhcB9IzRe2Q0+aO5gAtOKA9Cgg
	 z05UWuyChHur6M5NBOHxZf6IQEW1YnZ0NbEu60x2HLlTHQ0H75yS03KW26aYa6Aorw
	 8PuqCa5PO0fHybR8J0VxNiIsONSo9UEn6WVG6MYnYEqigSZ0p5lLbo6f2/Qu36DmFc
	 1+hsFYZKc+U4rbBWlxruF46uOLGOGxz84XgH+9VzU0CzHNiM/1A94IJ+TZ/NLCMNTM
	 NmpVjrQAEBdvw==
Received: from [100.115.64.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 AB/11-24146-E6992D16; Mon, 03 Jan 2022 06:36:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqJs381K
  iwZuDohZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b8yeeYChZyVaz59o+pgXE1ZxcjF4eQwGNG
  iZ0/G5i6GDmBnPNMEm9m1EIkjjNKvF09lRkkwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAk4Sp++vA5vDAhTfcqqbFcTmBYqfOHceLC4hoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0Ji1qw2qF41iavnNjFPYOSfhaR9FpL2BYxMqxjtkooy0zNKchMzc3QNDQx
  0DQ1Ndc1MdQ0tjPQSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6xZW5yTkpenmpJZsYgaGZUuy4
  bQfjqb6feocYJTmYlER5K5UuJgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I2edilRSLAoNT21I
  i0zBxgnMGkJDh4lEd6dU4DSvMUFibnFmekQqVOMuhyvW37uYBZiycvPS5US5/WZAVQkAFKUUZ
  oHNwIWs5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOuA7mEJzOvBG7TK6AjmICO4NU6D3J
  ESSJCSqqBidfm5alz5QrdYtZn2n7yzPM3dkm6KPFnV2x8At+e3f/4v/21uxRrbLPS+NKzy88O
  bvOavLlR1laMg6FB+VtKUmD/ApXpem4ey+cUL+bfu9n1x2TV5ekJ269edv7lZuP9qGFNglGo6
  e2SbzYBfL/fRIb5pvxt2dhwPWH366DJRU5d/Sozv6ucOiq7eYqxZ43KshuVetydTwRW2n0NuH
  Arc9cW4Yk+3/gd/z6KDlm76TqryfepF8TlPp6OspZObnZ6Gm1rstmu8dublkva7PdPL7z2wuo
  pd9j5lHm7GrZrnqx9FnRl2ga2e2pCPNKlV1kiV9qeePFtwpYji1mTs360rBdYVJ2uL3+2cVnK
  UzNGGyWW4oxEQy3mouJEAEzTxLFUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1641191790!472075!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23903 invoked from network); 3 Jan 2022 06:36:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:36:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DBE0810018F
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:36:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CEEDE100185
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:36:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:36:13 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-attrs: upgrade 21.2.0 -> 21.4.0
Date: Mon, 3 Jan 2022 14:36:01 +0800
Message-ID: <1641191763-41666-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 06:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160110

Changelog:
=========
Bugs fixed for this release (https://github.com/python-attrs/attrs/pull/####)
Fixed the test suite on PyPy3.8 where cloudpickle does not work. #892
Fixed coverage report for projects that use attrs and don't set a --source. #895, #896

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-attrs_21.2.0.bb => python3-attrs_21.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_21.2.0.bb => python3-attrs_21.4.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-attrs_21.2.0.bb b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-attrs_21.2.0.bb
rename to meta/recipes-devtools/python/python3-attrs_21.4.0.bb
index d52237f267..d1dde29d37 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb"
+SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


