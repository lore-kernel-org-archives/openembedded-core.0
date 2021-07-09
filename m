Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web09.4576.1625790015788698106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 17:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y5DOosK7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625790013; i=@fujitsu.com;
	bh=BlfGe1wh+c7bygilD6B97l5AsP/VECGlJudnR6Q0WjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y5DOosK74LfOr+4b+GXLQI1/gc1IchD9ySmS10syJO3yZv1HvBnFBNzHoqhKPix/J
	 /PhkFNiOyRW4TkFeZdL0HW8t0q2E8yN//+7EfwL3cBJBqRard42e0g2mdtWjuFSHIK
	 yK5T37LPdeVdlghOb09i6+OkFfjS8BoCBpDG8O14oGR1MHBCvQZEZ/1BoRGeRILRvB
	 0rLshsndGGyq3yyJL+YEHaKCd7C6msST62uiio274yj/fRGhr09AwHNMYBjXnOUdQ1
	 wENiz6gwMfA4cuRs1PV/HZaueV2oLTEazAPvqYkhIKYLmRRjUkM5/d8XoAdkdH84AM
	 IpAXe72W7/2Yw==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 70/7C-07224-D3697E06; Fri, 09 Jul 2021 00:20:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRomsz7Xm
  CwYJtphZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b2g5NYCy7wV6w9eJy1gfEXbxcjF4eQwEwm
  iXuXn7FCOMcZJaZsXczexcjJwSagJjH91g2gBAeHiICexNV/oiBhZgEViRe/e8BKhAW8JLbem
  8cGUsICFO/94QZi8go4SkycHgxSISGgIDHl4XtmEJtXQFDi5MwnLBBTJCQOvnjBDFGjKDH7cj
  MLhF0h8frwJeYJjLyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxrqmukbGFXmKVbpJ
  eaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzC4UgpZ3+1gfPb6g94hRkkOJiVR3oYJzxOE
  +JLyUyozEosz4otKc1KLDzHKcHAoSfCmTgXKCRalpqdWpGXmAAMdJi3BwaMkwhs3ESjNW1yQm
  FucmQ6ROsWoKCXOexSkTwAkkVGaB9cGi65LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5v0
  wBmsKTmVcCN/0V0GImoMUMh5+CLC5JREhJNTAJP//dI7D9bkrQy6OP/RiKPhz89yjo3bX8qBf
  rE35aHWe5GPjjIXvX3VdHJkyOeXBUhvdf5f6Im/E52RYyh3a2X9Tac4fr2JOLT60Y2LbY3Pn9
  9fFttzcdnodvrCxy+TfFgeHv/46jKgx7XJlfb1sW+kj3L1PZufwjIrKZpvmsMfciaxntWK883
  5Z6KbqkOsJNWm/7thYRnWO/T1YaOt1e3vjyUoj/zxv6n7YruM84ULj2b86tI3r8GfOn/QxY0j
  w3os9c02v6n2s7mc8HhTRK2hRxMDhfjJUxavpzlb9uTXb8Eid518lLJljOatgeKPN0BesK/cm
  fXzVff+K140SiW/glKxvZoDlMwQ2nPkxaqsRSnJFoqMVcVJwIAOsHawUpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-245.messagelabs.com!1625790012!89157!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32023 invoked from network); 9 Jul 2021 00:20:12 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 00:20:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1690K61B031342
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jul 2021 01:20:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 01:20:04 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-setuptools: upgrade 57.0.0 -> 57.1.0
Date: Fri, 9 Jul 2021 08:19:53 +0800
Message-ID: <1625789993-7875-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh reproducibility.patch

v57.1.0
-------

Changes
^^^^^^^
* #2692: Globs are now sorted in 'license_files' restoring reproducibility by eliminating variance from disk order.
* #2714: Update to distutils at pypa/distutils@e2627b7.
* #2715: Removed reliance on deprecated ssl.match_hostname by removing the ssl support. Now any index operations rely on the native SSL implementation.

Documentation changes
^^^^^^^^^^^^^^^^^^^^^
* #2604: Revamped the backward/cross tool compatibility section to remove
  some confusion.
  Add some examples and the version since when ``entry_points`` are
  supported in declarative configuration.
  Tried to make the reading flow a bit leaner, gather some informations
  that were a bit dispersed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
index a15b51e31c..c066d8209f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
@@ -8,10 +8,9 @@ inherit pypi setuptools3
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch \
-            file://reproducibility.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
+SRC_URI[sha256sum] = "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

