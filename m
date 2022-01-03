Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D603EC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:36:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.24408.1641191793556000734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bdvMh9BZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641191790; i=@fujitsu.com;
	bh=g4CrA8k1SJ4wuSZpkS6fJ74P4yABScbldvO8Yze3nIM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bdvMh9BZE8ElgwSiAYDj2QA9VnDBbmaXlfQDiRLiESUWCUz1ILvp+FHEgY33R7y0s
	 UJfgKuLLlCga6ExPfraNlwmAoVWjAoPKq7xDLoAjCST1FAQnVkhBXGuK0hfl0OR4Nh
	 HIwwFz826wsuZCtMP3Yb7mTBGNVDCWBoIPiS9WzPkI05U1NBmx+x/7P1tg7t284Fgb
	 h+nD7cBsOquFgyVAU4ejSgU9zCOqYK0q9Utfr7zzIHFJuf/gm4TD1Szg3IGDx8Tw3K
	 P3Z49FakmCjXa/DbYJdvd60purx7KGE3ii3Ml7imeqlmumPcF5qGocQ+o085UDx72v
	 MhDxKC3QfLR9Q==
Received: from [100.115.64.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 02/BB-31213-E6992D16; Mon, 03 Jan 2022 06:36:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqJs381K
  iwend4hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bj92vMBeckKnZ9ncPSwDhNrIuRi0NI4DGj
  xNyJb9khnPNMEv82f4NyjjNKvNz7hrWLkZODTUBNYvqtG0A2B4eIgJ7E1X+iIGFmARWJF7972
  EFsYQF3iXXrfrKA2CxA8R1ty8BaeQWcJNaenAVWIyGgIDHl4XtmEJtTwFliZv8xdpCRQkA1F8
  +GQZQLSpyc+YQFYryExMEXL5ghWhUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TSrKTM8oyU3MzNE1NDDQNTQ01TUz07U000us0k3USy3VTU7NKylKBMrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnJKsVPCDsZHfT/1DjFKcjApifJWKl1MFOJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBGz3tUqKQYFFqempFWmYOMKpg0hIcPEoivDunAKV5iwsSc4sz0yFSpxgVpcR5fWYAJQ
  RAEhmleXBtsEi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdx3Idp7MvBK46a+AFjMBLeb
  VOg+yuCQRISXVwGRdwy2ht7w3cPO5IwL25pGri6V+vN7ad0jvtuAbnmJHhUq1fO96b72J3BNP
  tnj9SPyg9uhV8oEOi4V55Xk660pjtkV9zOW+eaD/4+1E8dUqKT9N1zHOCmvav/3idQHd69orn
  lusXexy6+YFdZc5e57MPcGUtfTWr+SM+in1J334JsTlS69eVP/0gtHDCfvDTrKnsAp32Ofa9V
  66G35q+clrgiJ+G2RFdzDymuXVH7snWJJ9c5L9u1Lvjs9H+RV4GReueink/sKMb9auU6m72MQ
  nXv+15LSI07myOtbkdp+eg4I7LQW9/zT9tHxSI3k58v5k8wOvg8+csd/+qcahc7/k8lqf+X4t
  erP1leOafyuxFGckGmoxFxUnAgAvYcKSXwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-528.messagelabs.com!1641191790!168475!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13874 invoked from network); 3 Jan 2022 06:36:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:36:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DDEF3100191
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:36:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D1AFE10018C
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:36:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:36:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 59.5.0 -> 60.2.0
Date: Mon, 3 Jan 2022 14:36:02 +0800
Message-ID: <1641191763-41666-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641191763-41666-1-git-send-email-wangmy@fujitsu.com>
References: <1641191763-41666-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 06:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160109

refresh 0001-conditionally-do-not-fetch-code-by-easy_install.patch

Changes
------
 #2974: Setuptools now relies on the Python logging infrastructure to log
 messages. Instead of using distutils.log.*, use logging.getLogger(name).*.
 #2987: Sync with pypa/distutils@2def21c5d74fdd2fe7996ee4030ac145a9d751bd,
 including fix for missing get_versions attribute (#2969), more reliance
 on sysconfig from stdlib.

Misc
------
 #2962: Avoid attempting to use local distutils when the presiding version of
 Setuptools on the path doesn't have one.
 #2983: Restore 'add_shim' as the way to invoke the hook. Avoids compatibility
 issues between different versions of Setuptools with the distutils local
 implementation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_59.5.0.bb => python3-setuptools_60.2.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb => python3-setuptools_60.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5e2ee454da..6efef9b36c 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
+From 8d9a601b5a5d572fef512d3addf8c4d7c50d012c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index fc848d0..c04a5de 100644
+index fb34d10..217fce1 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -642,6 +642,11 @@ class easy_install(Command):
+@@ -649,6 +649,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
index 878fa08404..8748f91388 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
+SRC_URI[sha256sum] = "675fcebecb43c32eb930481abf907619137547f4336206e4d673180242e1a278"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


