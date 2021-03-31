Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.8001.1617203218055450184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 08:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id F8/02-55620-01094606; Wed, 31 Mar 2021 15:06:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1RWYkJJ
  g8HMfo8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH1+Tu2gkccFT8vdzE1MPZzdDFycQgJbGWS
  mDl9JguEs4dRYvPJ5YxdjJwcbAIGEvvPXmDvYuTgEBHQk7j6TxQkLCzgKrF00mpmEJtFQEVi3
  9fbYOW8At4S3W9vsoPYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzyEgJAUWJ2dPlIcqrJM
  7O/sI0gZFnFpKOWUg6FjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNM1MjXVS6zSTdJLLdU
  tTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMopSCI/93MC5/80HvEKMkB5OSKG9xb0qCEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQleoX6gnGBRanpqRVpmDjCgYdISHDxKIrwerUBp3uKCxNzizHSI1
  ClGRSlx3liQPgGQREZpHlwbLIouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVAKqAJnCk5lXAj
  f9FdBiJqDFVx4lgiwuSURISTUw+YvlM0xm4DvYGF66/bPbjIvnbt1z+iJkuTjCbsMsfdGPtf8
  jDFwf/p5dbr5DhyPrxb7PK6U69n80UOR79KY55lPeoVuHfWLc7r87fqffP8JR0WZL5T0P8dM8
  /8VLJTblX9U+I/3nw6OGaLcdDxiNXjidMWvzEZ1l8cFwl3HrzL3rdu/MEJhZ+/ft3XMhNj/SX
  bL6Nq52DbjfuIjxj5Ff9LOUKw9ZFh/5mpqbEPLWQptdTaw9ojE87/B697CJGoaBC/avXcCmtL
  dtPbP/9+ObddS+rfIRF1dcuPTYVz9xE/mXd12rX+scTmPSrY9+vvHyYfH/N68XrGg6373W7W7
  R69vXrgQ2P7j9SaVr2VRWNiWW4oxEQy3mouJEAJVNspodAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-287.messagelabs.com!1617203215!67536!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6706 invoked from network); 31 Mar 2021 15:06:55 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 15:06:55 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VF6tMk023911
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 16:06:55 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 16:06:54 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.22.0 -> 0.23.0
Date: Thu, 1 Apr 2021 07:38:34 +0800
Message-ID: <1617233914-40999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-dbusmock_0.22.0.bb => python3-dbusmock_0.23.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.22.0.bb => python3-dbusmock_0.23.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
index 0b87ab0380..80990d8fbb 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "2191919cc411fb94953b36e46bfd55ee5ad4162432ee0d0892bc2c4770ff5d7c"
+SRC_URI[sha256sum] = "8c0b873a3f23869b416b51deeec39b3d5ab4c9875b705fc90ae917e4969c2574"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1

