Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.6070.1625706903600222453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 18:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I1576Nr7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625706900; i=@fujitsu.com;
	bh=+Y3Zbyu2Fvah5mvK81hHs3tK20cuiVlDYg+MfE292io=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I1576Nr7VW+mdjNQYulp2asdFIP5f8zwTjLwDhvcaJs2eWpQVqV4lV5MiIvvGPjZL
	 Clmk4OXHQajgebXaXJag123mzfWwKy2r4/WF4Z6xCgfRAPUIgRJ21TaigLWLHPJgX2
	 bOGw7IECKAS0U/3j0wqqoCExZG8oWo0aj6X2coOBJOg4s4MYcrKDQ4sXasLIQI2fyr
	 5D1+I+gZnkGUBCIYYJFO7H6C0PdMtHRHHjUOMjJdDrfJvt/NIJ4zu/bBoTRrKmZfkb
	 +7aHuy5h6gBSOIA3dTJvx396EHUM62XAf/XoMAWIku+Lk3nMI0miw0UewPyDRKimg/
	 zPskpE33iQ5kA==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id CB/B5-07224-49156E06; Thu, 08 Jul 2021 01:15:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqjs58Fm
  CwZeZRhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8appnPsBdP5Kjb9nM/YwHiNp4uRi0NIYCaT
  xNWmZhYIZzejxNnu9WxdjJwcbAK6Eucer2XvYuTgEBHQk7j6TxQkLCzgLNH78ykziM0ioCKx/
  sx6VpASXgEPiXcf+UHCEgIKElMevgcr4RUQlDg58wkLiM0sICFx8MULZpByCQFFidnT5SHKKy
  RmzNjGNoGRZxaSjllIOhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11TUyMdRLrNJN0kst1U1
  OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEBlFKIevHHYyHXn/QO8QoycGkJMp70ulZghBfUn5K
  ZUZicUZ8UWlOavEhRhkODiUJ3iX+QDnBotT01Iq0zBxgQMOkJTh4lER420HSvMUFibnFmekQq
  VOMilLivOYgCQGQREZpHlwbLIouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmDQ0AmsKTmV
  cCN/0V0GImoMUMh5+CLC5JREhJNTCtYk4R90lmW/TMT5E14Ey+0sp8aW8xGe1uKxPb33byHd+
  nm0lxRQRdO6b159ranT9LTFktBT5wsBe92zfz5EmtyiZpvri3bQb3WJt84mee+ldiKNN+acvt
  k+9CLq3jW6kwXen5XuHfTU7Hbb4seqW7rFMhMrfnZbe8TudElZzyK8YRbEcU2jwqDyUeE99wh
  iVMsrxfpMs5wHx2mu0c63jm/Dur5kivn9SoFnv/CX/t3glrIzozHDd4v2QP33tj+4muvczPz5
  lVlpkeahZ5+nVZ4fmSR38jHRYVBDndaMhrXvD99PqpohenSz49u/VZbeRti7fqKtav0q2Ptd5
  vdT9pk8Z29s6ZT3u+bFwdH6HEUpyRaKjFXFScCACtODT3HQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-238.messagelabs.com!1625706899!307777!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10182 invoked from network); 8 Jul 2021 01:14:59 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jul 2021 01:14:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1681EsBh005591
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jul 2021 02:14:59 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 8 Jul 2021 02:14:53 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pathlib2: upgrade 2.3.5 -> 2.3.6
Date: Thu, 8 Jul 2021 09:14:30 +0800
Message-ID: <1625706870-83847-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

License-Update: file format changed from "ASCII text" to
"ASCII text, with CRLF line terminators"

Version 2.3.6
^^^^^^^^^^^^^

- Fix minor unicode bugs in with_name and with_suffix. Many thanks to
  ppentchev for reporting and for providing a fix.

- Fix a few minor bugs.

- Allow unicode file paths on systems that support it
  (note: unicode file paths will not work on Windows
  due a broken filesystem encoder on Windows on Python 2).

- Remove travis and add github actions for regression testing.

- Fix mypy warnings.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pathlib2_2.3.5.bb => python3-pathlib2_2.3.6.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pathlib2_2.3.5.bb => python3-pathlib2_2.3.6.bb} (52%)

diff --git a/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta/recipes-devtools/python/python3-pathlib2_2.3.6.bb
similarity index 52%
rename from meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
rename to meta/recipes-devtools/python/python3-pathlib2_2.3.6.bb
index a022701ad0..8516bbe4d4 100644
--- a/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pathlib2_2.3.6.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "Object-oriented filesystem paths"
 HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2dc08586cce3ab91bfa091b655c0e440"
 
-SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
-SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
+SRC_URI[sha256sum] = "7d8bcb5555003cdf4a8d2872c538faa3a0f5d20630cb360e518ca3b981795e5f"
 
 inherit pypi setuptools3
 
-- 
2.25.1

