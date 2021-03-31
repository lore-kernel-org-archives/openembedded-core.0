Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web12.8073.1617203230638133088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 08:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 1F/A2-55620-C1094606; Wed, 31 Mar 2021 15:07:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0ZWZkJJ
  gsOuBisWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtH18S9LwUXeip+XrRsYD/N0MXJxCAlsZZLY
  0/iWBcLZwyhxeuccpi5GTg42AQOJ/WcvsHcxcnCICOhJXP0nChIWFnCQ6GxrYQexWQRUJF6/O
  coGYvMKeEu8PTSJGcSWEFCQmPLwPTNEXFDi5MwnLCA2s4CExMEXL5hBRkoIKErMni4PUV4lcX
  b2F6YJjDyzkHTMQtKxgJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlua6hsbleYpVukl5qqW5
  5anGJrqFeYnmxXnFlbnJOil5easkmRmAIpRQc7dzB+OvVB71DjJIcTEqivMW9KQlCfEn5KZUZ
  icUZ8UWlOanFhxhlODiUJHiF+oFygkWp6akVaZk5wHCGSUtw8CiJ8Hq0AqV5iwsSc4sz0yFSp
  xgVpcR5Y0H6BEASGaV5cG2wGLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRCagCZApPZl4J3P
  RXQIuZgBZfeZQIsrgkESEl1cAUbuFQxLpuYmjQ2bvd51jn/HCreLLW6mUmR7x69ippY9uJx2P
  PzhBjN7scspF1TuTh7GsaNn6lhu23dx5oj3tSHSpbvOX1SpP1uTIXDQ+35E98fS+gcUHlNl27
  v71fuFXa0jlliw/vuPbq5e6u+q9nPzrt7KotXHLpg7BTl5jtyjdBbzQ3XZiSfk6JYcN9lcep6
  R0bn50Q49YRezuxeY9gw5M8t4vm08tuOvBFtqtNEDWcYcL+b+2HuS/F357/3bgmZ8OBgor2CR
  fnM91zrE0Oyd5XP69bvKbQPUlwg7jNd+k9LyJdfH6kbv2zM/7+79sTkpf9fXsu8ae3f96irj9
  BE89+ENHVaP91TGhxQIuZEktxRqKhFnNRcSIAA4SVhRwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1617203228!68742!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 813 invoked from network); 31 Mar 2021 15:07:08 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 15:07:08 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VF78FF020696
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 16:07:08 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 16:07:06 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-gitdb: upgrade 4.0.5 -> 4.0.7
Date: Thu, 1 Apr 2021 07:38:51 +0800
Message-ID: <1617233931-41046-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 2 +-
 meta/recipes-devtools/python/python3-gitdb_4.0.5.bb | 4 ----
 meta/recipes-devtools/python/python3-gitdb_4.0.7.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-gitdb_4.0.7.bb

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 618d85ff8d..53d925a495 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,7 +8,7 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "c9e1f2d0db7ddb9a704c2a0217be31214e91a4fe1dea1efad19ae42ba0c285c9"
+SRC_URI[sha256sum] = "96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
deleted file mode 100644
index fe56bf9640..0000000000
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-gitdb.inc
-
-SRC_URI[md5sum] = "0e2d3f34efece5deda7c55fede6507cc"
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
new file mode 100644
index 0000000000..988d67b5f1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-gitdb.inc
+
+SRC_URI[md5sum] = "3f52187435ab0b6e64a15782ffaf29ab"
-- 
2.25.1

