Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.3746.1615970940040661760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 01:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 59/FD-07430-972C1506; Wed, 17 Mar 2021 08:48:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0a08FJh
  gcHSxhsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnG8i73gDEfFiQPLmRoY37F3MXJyCAnMYJJ4
  tDqsi5ELyN7NKNG++CILSIJNwEBi/9kLQEUcHCICehJX/4mChIUFbCSazjxgBLFZBFQlOk/vY
  QKxeQW8JVZ3dYDZEgIKElMevmeGiAtKnJz5BGwks4CExMEXL5hBRkoIKErMni4PUV4pMffNQq
  YJjDyzkHTMQtKxgJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxrrGukamhXmKVbqJeaqlucmpeSVE
  iUFYvsbxYr7gyNzknRS8vtWQTIzCEUgqZf+9gfPz6g94hRkkOJiVRXtOWwAQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKErxRB4FygkWp6akVaZk5wHCGSUtw8CiJ8CbsB0rzFhck5hZnpkOkTjEqS
  onzsoH0CYAkMkrz4NpgMXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDv0QNAU3gy80rgpr
  8CWswEtNhQ2g9kcUkiQkqqgYm9O9CAf4J0vs+Te8sbhRKMXUKK3kd+OeNvljh1hZ0Ib3Gf513
  HiJu9Pap2jyKfZdQzz7+hHt7BstXkjLfjVWmW3Oa/MmESITEPOCI3zpfyXc+wwV41zeDGrGTX
  RzJ8x7TPhbQ8j77utWxTnnmnoOo6BQHny1uWb56uVyc2p53RmFPQ/7z0vCx3GXHdsIsFf/0/R
  5TOf34gepIL27YG2Y6Npvc8slTfMn9VOst60vTI5PLl125d8TvDvD+/ynP2ivy7FgYrNqlM97
  1Q8KDTcmaYocCZTOe/uYpbCmRVt07Qsdyly5/PUtPTb998xktO8Nq+B+sP8poe055+/jnrNtZ
  A5YesYi6HNkU6JXxWYinOSDTUYi4qTgQAOReQmhwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-28.tower-226.messagelabs.com!1615970937!107423!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8349 invoked from network); 17 Mar 2021 08:48:57 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-28.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2021 08:48:57 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12H8muZh015241
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 08:48:56 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Mar 2021 08:48:55 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] liburi-perl: upgrade 1.74 -> 5.08
Date: Thu, 18 Mar 2021 01:48:34 +0800
Message-ID: <1616003314-27682-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../perl/{liburi-perl_1.74.bb => liburi-perl_5.08.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.74.bb => liburi-perl_5.08.bb} (90%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.74.bb b/meta/recipes-devtools/perl/liburi-perl_5.08.bb
similarity index 90%
rename from meta/recipes-devtools/perl/liburi-perl_1.74.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.08.bb
index c27765bcbc..4d22b17e00 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.74.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.08.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "892f7183b178af40f205ba37128225db"
-SRC_URI[sha256sum] = "a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d"
+SRC_URI[md5sum] = "cdbbf8f8ccdec5c162c8505077a35c2c"
+SRC_URI[sha256sum] = "7e2c6fe3b1d5947da334fa558a96e748aaa619213b85bcdce5b5347d4d26c46e"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.25.1

