Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.7523.1615376830938051853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 4D/F7-53635-CB1B8406; Wed, 10 Mar 2021 11:47:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRqrtno0e
  CwbfdqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bGw8dZCq5xVDy9eoS9gfEdexcjF4eQwAwm
  iUMPJ7JCOMcZJVpeLmXpYuTkYBPQlOjdsoWxi5GDQ0RAT+LqP1GQMLOAusSldS1gJcICNhJ31
  y1hArFZBFQlNs64BmbzCrhIXG57xg5iSwgoSEx5+J4ZxOYUcJXou38FzBYCqnm7ZQUjRL2gxM
  mZT1gg5ktIHHzxghmiV1Fi9uVmFgi7UmLP5oesExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBx
  dQwMDXUNDI11DSyA2MtNLrNJN1Est1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzHlIIDdTsY
  H7z+oHeIUZKDSUmUt6/AI0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/gEqCcYFFqempFWmYOM
  DZg0hIcPEoivH0bgNK8xQWJucWZ6RCpU4yKUuK869YDJQRAEhmleXBtsHi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmYVwQY3UI8mXklcNNfAS1mAlqsYOAGsrgkESEl1cAkkaddIz1ndlj
  67JopHx1EWjQOLty03j3V9fCRw/Pe2r9ZI33gg72CfVXhn5ZvleVbWbevjWLZf0uKXTY+Pev0
  ruzOavtfFY826G65Jnc2yZTjTE/pZwOdYwra/kJCDiZfslT578RVRmmJuG4wvHtxpvrDtNgFk
  /qNb/6KFd49YyHfkTP/FjWt5cyLzHGufxon/PhB4Vd1peL+F7qfHr661Bn1/eqnTYHVgo5sE8
  7LJc5e90WKp29mP3tQrabY9HM58R/umW1nbi3uCbN6rOu5yIErc8q8VZHGvC8U/k36orApfV3
  kg7TdD3KWb/p7M1zM50VN1oOciy6lP9ymJFzPZH418dnV/DNdyrWzLixRYinOSDTUYi4qTgQA
  s0L5mUIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-267.messagelabs.com!1615376828!181425!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12444 invoked from network); 10 Mar 2021 11:47:08 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:47:08 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABl7cJ025942
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:47:07 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:47:06 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.5.0 -> 4.6.0
Date: Wed, 10 Mar 2021 19:46:05 +0800
Message-ID: <1615376771-3093-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iso-codes/{iso-codes_4.5.0.bb => iso-codes_4.6.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.5.0.bb => iso-codes_4.6.0.bb} (93%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
similarity index 93%
rename from meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
index 9e02a0fa12..960989281d 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
-SRCREV = "a36019e5014bff251f83d522ddcfebaecf52afd3"
+SRCREV = "3c012d266acaeda93d3e61ec11b8c18c1964fce1" 
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1

