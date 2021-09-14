Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.547.1631662685373255096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UXWxMoip;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631662683; i=@fujitsu.com;
	bh=MnW0/P5Rs/1U/GE1j4yiUfu1UDWaVsJl4MwKlKWikdg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UXWxMoipOEgegKs+SIAlbhefccKyvomk26fWSKNoESsyn/u+DQxnrNyTj76CFbW5p
	 eLj3mLksiHnjfdezZt20QR40D8x2tZtO+yIKM2fcrfO74kDYBj7rU76Rt/6s1gATny
	 7nLcypGp8P4ooY2UfF7jg0lgJDuPi74L36+y/BROMxKH/lomDYK8zxMhiu6MtN54oX
	 ey3xv73DLupx5VZPzjZMwf+ryLBIrXm9I7CYfy44uByQrPFakHMchAGQQqvMjBOcsB
	 DnbqtvT7cbybVKIclRtpPBS9QWkOQ3Cfhk8zQsGyg+Id8vMPEJj+t2dw6YwOiJ5Skd
	 qwebSJA8HasRw==
Received: from [100.113.2.146] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 39/8D-23460-B5231416; Tue, 14 Sep 2021 23:38:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqhtl5Jh
  o8PKxssWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH0xj62gt8cFbMe/GNrYFzB0cXIxSEkMItJ
  ouvBGzYI5wSjxMPdsxi7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwFPi/
  oX9zF2M7BwsAqoSz3lBorwCThLHPswEGyIhoCAx5eF7Zoi4oMTJmU9YIKZISBx88YIZokZRYv
  blZhYIu0Ji1qw2pgmMvLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hobGuka6poV5ilW6
  iXmqpbnJqXklRIlBSL7G8WK+4Mjc5J0UvL7VkEyMwtFIKmYx3MF57/UHvEKMkB5OSKO8OHsdE
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8D/SAcoJFqempFWmZOcAwh0lLcPAoifA6GgCleYsLE
  nOLM9MhUqcYFaXEeUUNgRICIImM0jy4NlhsXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzM
  uiDzSFJzOvBG76K6DFTECLj+x3AFlckoiQkmpgurj3xSp2vTkXvu/ztFlUcaJkZ8nB7svSh51
  q8l52fGdT0TrWPi3H7hz3h247/+MebUoHM/5//iRdwejW65hhWHKhhWWipIUni8pTH+ZA1d+1
  jP5c9zYrzlMIk8410jP+oexQsuCD63ujb7/OVvvxdO1z3n3B2+vBgSnzNn75/fiUmF3vHvESt
  sjjN/a437duTut7J9f7ZvHtud33DcSqVqyvSu/eenHGzJlCJht2cmg2rXn+tYMhxv7VtIi263
  3tfod3hTw7bVJ3jEsxef3DiR+Y4sRyFzG8NFxoy/WdrWsHk/2tLCfBKUtywu9zzODkfrmDYY9
  e1FHPBb8OReesmJ02OfTI/vuxMnw6pf9nKrEUZyQaajEXFScCAJYrW1YoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1631662682!46569!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3516 invoked from network); 14 Sep 2021 23:38:02 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Sep 2021 23:38:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18ENbuWu006944
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 00:38:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 00:37:57 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-more-itertools: upgrade 8.8.0 -> 8.9.0
Date: Wed, 15 Sep 2021 07:37:42 +0800
Message-ID: <1631662663-37180-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-more-itertools_8.8.0.bb => python3-more-itertools_8.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.8.0.bb => python3-more-itertools_8.9.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.9.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.9.0.bb
index fe41d47e41..041c865ef6 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "83f0308e05477c68f56ea3a888172c78ed5d5b3c282addb67508e7ba6c8f813a"
+SRC_URI[sha256sum] = "8c746e0d09871661520da4f1241ba6b908dc903839733c8203b552cffaf173bd"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1

