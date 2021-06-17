Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web08.1100.1623888695339583313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 17:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tKYYQyy3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623888693; i=@fujitsu.com;
	bh=+W+LDpycuML4wF8VTr86FqT1kfJQSAzYyFGyy6Y4MtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tKYYQyy3NRFMwb3+Ipl2b0hUVJwKHVk9+ZocsRpZD/vRb1bSZNOuoUD1eDS8umE5X
	 g8q/bBDYOLRIX96ux0qtjLf7Rh+FItNBOhXd+pQ2PyQ6fcILQ9iBBf7WjDl0W30sFX
	 8nc4qKA287qoKpy61EfvnPnjsQYRiwByrh+6dJzzmNUWNa9FysO/R9WrM0mtB/Zs0i
	 tQ8gzcstS3R9eo96aqBSDMyN3cGTsqNQN7esRxIGPZCqbvxgPZkVjBpPtuQWH4L8bT
	 +AqaQNXk68Sa6adnJ+Vzir1u1plOumMzyLj2Df6h5WbWuFobpSTRTk3wPv0OFdJb/Y
	 /Ys9uwM4eB3oQ==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 9C/9B-14259-5339AC06; Thu, 17 Jun 2021 00:11:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8MRoms6+VS
  CwZKrbBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8adKzIFCyUqmh5VNjC2iHUxcnIICcxiklg5
  o6SLkQvIPsEo8WrzU2aQBJuAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+N3DDmILC9hIrH9+h
  xXEZhFQlZi64QBYK6+Ak8S/xoNgNRICChJTHr4Hi3MKOEt8bzvDBrHXSWJ74yVWiHpBiZMzn7
  BAzJeQOPjiBTNEr6LE7MvNLBB2hcTrw5eYJzDyz0LSMgtJywJGplWMFklFmekZJbmJmTm6hgY
  GuoaGxrpmuhbmeolVukl6qaW6yal5JUWJQEm9xPJiveLK3OScFL281JJNjMBATClkC9/BeOb1
  B71DjJIcTEqivM2dpxKE+JLyUyozEosz4otKc1KLDzHKcHAoSfDyTwTKCRalpqdWpGXmAKMCJ
  i3BwaMkwvu5HyjNW1yQmFucmQ6ROsUYzvFm7ZJFzBxvwWTbvbtAsh1MzlxwcDUzxywweb/9EJ
  B8ACKFWPLy81KlxHlfgmwTABmXUZoHtwwW9ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfP
  eB5nCk5lXAnfTK6BzmYDObRMCO7ckESEl1cDkoPBJ6ea+7SEfo/N478z7VMXrm5a8YA2zTgNP
  7Zkz7283SPG5G57K5lz0o7KttsnKqGLW7+2JNw5nF9byXXa9EtT4+buQr+Ny2R9/uzaIxmx58
  e1cMtu7uZWLTD/tfeY8vWsWs2ei+YegDyv/iJ2osJyWc1Guoes6TySfl5HglWKf/2dNnpmdYU
  3faLxR4vLUs9aTNpmK/xc9EpNnm1ihGXc8YKPX7bPPJm1lu3PpUXLcxluuf3Xn3TBJ/bLw0iq
  lHyc/nVIz8fV7U89Ws6ng6lOnX7FsOV+rp3y2unyp2pPv2vrnjWWfFl4tsfl4b+OtN1uvaLft
  Cf387vzjQwZXsm8ef3VB+ZtdlckiLaOmGUosxRmJhlrMRcWJAERnK3t1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-238.messagelabs.com!1623888692!206910!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30110 invoked from network); 17 Jun 2021 00:11:33 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 00:11:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H0BVDS018810
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 01:11:32 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 01:11:29 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librepo: upgrade 1.14.0 -> 1.14.1
Date: Thu, 17 Jun 2021 08:11:01 +0800
Message-ID: <1623888661-63658-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
References: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...o-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 15 +++++++++------
 .../{librepo_1.14.0.bb => librepo_1.14.1.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.0.bb => librepo_1.14.1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 46ab9a1132..2ea50f00ff 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -5,13 +5,13 @@ Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  librepo/python/CMakeLists.txt | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/librepo/python/CMakeLists.txt b/librepo/python/CMakeLists.txt
-index 52fc39e..2024407 100644
+index 8523ca7..06e5f7b 100644
 --- a/librepo/python/CMakeLists.txt
 +++ b/librepo/python/CMakeLists.txt
 @@ -16,12 +16,12 @@ SET (librepomodule_SRCS
@@ -20,16 +20,19 @@ index 52fc39e..2024407 100644
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
 -from sys import stdout
--from distutils import sysconfig
--path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
+-from sysconfig import get_path
+-path=get_path(name='platlib', vars={'platbase':'${CMAKE_INSTALL_PREFIX}'})
 -stdout.write(path)"
 -OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
 +#from sys import stdout
-+#from distutils import sysconfig
-+#path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
++#from sysconfig import get_path
++#path=get_path(name='platlib', vars={'platbase':'${CMAKE_INSTALL_PREFIX}'})
 +#stdout.write(path)"
 +#OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python3 install dir is ${PYTHON_INSTALL_DIR}")
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.0.bb b/meta/recipes-devtools/librepo/librepo_1.14.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.1.bb
index 109b40ce3d..8676452587 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "88b769eceefc1b151937e6b54d108b48f2177d87"
+SRCREV = "c5fe6b85b47f2e4f7a37cff3f3214205d1b54db5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

