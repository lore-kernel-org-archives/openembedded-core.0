Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web09.265.1622072830255671383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p9z2Obu1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622072828; i=@fujitsu.com;
	bh=xUt0kpSBDdZmVzuWbeEouTYE4ZmO1xBR4m1nxEFMvH8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p9z2Obu1zq+qf4uBaPcSZAlCsIAMtd1MNV+7WUt/UcG2jPRZcTgeyrheEJE0AOE0A
	 wxcSJjSU3wD+o+OvsxuQ4Xp2LlvRaN2qcNJ85PVCQBnwBpGHkfnsZ9jdMudPaRjGZN
	 gDmWVegM/6nHROiyjw0XulZ7SakjkcMwBy7SPHDTB3wWlLNdCclJ1pTQJ1fBdZy/EU
	 gpoYE5KhbBcFBLRCVQlJXy/4V534cPezIdi+31zqttVLuqAlI34k9XWTt2HB6DQREh
	 G2DLNpYduA2FNbf2tvgKG5kb5jyUBgFpvOxE031y7pSwUCAbsL8npvJdV7/0gRWmfM
	 gQNX4S9lRdp2w==
Received: from [100.112.195.52] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 96/98-34775-CFDDEA06; Wed, 26 May 2021 23:47:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxRff33XU
  JBjMOWlrc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBkX339jLPjJUdF29zZrA+NSji5GTg4hgVlM
  ErdnCnYxcgHZJxglHrRNYwdJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z1gJcICrhLP2
  86zgNgsAqoSdw+9AovzCjhK7JrylhHElhBQkJjy8D0ziM0p4CQxq3cVG8ReR4nJd36yQtQLSp
  yc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyReH77EPIGRfxaSlllIWhYwMq1itEgqykzPKMlNzMz
  RNTQw0DU0NNI1tARiIzO9xCrdRL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMBgTCk4ULeD
  8cHrD3qHGCU5mJREea+dWJcgxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ38m2gnGBRanpqRVpmD
  jAyYNISHDxKIry9t4DSvMUFibnFmekQqVOMilLivFdB+gRAEhmleXBtsGi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmY9wPIFJ7MvBK46a+AFjMBLRZKBFtckoiQkmpgSu9duqRwUZmGRK+
  EfdCfpmIX7+/xiYah0axX9OfwRdw2Om5169T0fdxBRc+zH84Te6pud//6HyH3hybSPNw5DIb/
  1L/ybrX+qJ+Zb7Mn7Vxh36uS3CehE9tnWTfKSdjftuLX3r8r38wmJGx9fpeT+8rd7b+3aIvNX
  XdFV9shXLf+Ugwn4yqWaTbPL/+10zrzYsP5D5eWX2F29I/6ujYu7St3/MUZdz65KVhpzKlkXn
  PG89xXzcjryxtsdGIjZW89it5vkthouu6f1cIDVud5bryN7dXO5e90mR34WmOP2FX1rZNWGS/
  QCQw32Xl7+U7Hnoq733a0tqxLFTuw4MPd5XPm+UlOK1+08d7vJcorlFiKMxINtZiLihMBXaP7
  eUEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-267.messagelabs.com!1622072827!11107!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19151 invoked from network); 26 May 2021 23:47:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 23:47:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14QNl5JI011563
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:47:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 00:47:03 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markupsafe: upgrade 2.0.0 -> 2.0.1
Date: Thu, 27 May 2021 07:46:44 +0800
Message-ID: <1622072806-6524-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
References: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-markupsafe_2.0.0.bb => python3-markupsafe_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.0.0.bb => python3-markupsafe_2.0.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb b/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb
index 5e4be22ee3..5be43b6c56 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "4fae0677f712ee090721d8b17f412f1cbceefbf0dc180fe91bab3232f38b4527"
+SRC_URI[sha256sum] = "594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-- 
2.25.1

