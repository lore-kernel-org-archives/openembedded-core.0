Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web10.1431.1615507897780507698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id DC/A3-64503-7B1BA406; Fri, 12 Mar 2021 00:11:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVXfbRq8
  Eg7ZeS4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePU90csBY0iFU/3PGNrYOwX6mLk4hASmMEk
  se/PciYI5zijxPklO1m7GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQsLiC0s4CLR9
  n8ZG4jNIqAqsaJ/HjOIzQsU3/f0JyOILSGgIDHl4XuouKDEyZlPWCDmSEgcfPGCGaJGUWL25W
  YWCLtSYs/mh6wTGHlnIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLC11DYwO9xCr
  dJL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMDwSik41rSD8eTrD3qHGCU5mJREeaVWeiUI
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCdsgEoJ1iUmp5akZaZAwx1mLQEB4+SCK/TWqA0b3FBY
  m5xZjpE6hSjopQ475H1QAkBkERGaR5cGyy+LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5s
  0H2c6TmVcCN/0V0GImoMVeqmCLSxIRUlINTOvmvDd+s3leT1SrxbIrcd9ORO51PjRrFqt23ZV
  nqw9PWfngs8n3nPmLKz7eSxe1f/32u2GMzp/X+sqS7Ma6fB0KT059vVJ9/WXM5P07Bc8e/K79
  4NL2mrc7tx5SPjGnQyrS/2Rn+s6m2GsFfFc8+G4In2B4k50foMOUp+C09wfThsAPM37GJARHJ
  z2OXX/QQqmOa2ua1IMr4k2bjGdd4ptalP5s47Tb83+/Stzx2PWg/sETblyHW9dsldx+bO6kO3
  Ganmfkd85PnRcze7uy63WXydatKyM/HFu43PG0obtatJ7pBE2ZO/e2H/i0fJ03h57H+gPlnn6
  20oqPprMoPPrGpb7seJv74lSnKJnkWK+vSizFGYmGWsxFxYkA5wBWJioDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-287.messagelabs.com!1615507894!1122876!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21361 invoked from network); 12 Mar 2021 00:11:34 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2021 00:11:34 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12C0BSwa020599
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 00:11:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 00:11:26 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] createrepo-c: upgrade 0.17.0 -> 0.17.1
Date: Fri, 12 Mar 2021 08:11:15 +0800
Message-ID: <1615507876-7478-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
updated since it is not available in 0.17.1

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...1-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 7 +++++--
 .../{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb}     | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index d675af4f8b..130d3fdac4 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 855127f..dff1d97 100644
+index ecc262d..a86514c 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -14,7 +14,7 @@ if (NOT SKBUILD)
-     FIND_PACKAGE(PythonInterp 3 EXACT REQUIRED)
+     FIND_PACKAGE(PythonLibs 3 REQUIRED)
  endif (NOT SKBUILD)
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
@@ -23,3 +23,6 @@ index 855127f..dff1d97 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
index e0433806b2..f621bff8a1 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
+SRCREV = "956a318b427e2489ccac754d199a09d32690ddc3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

