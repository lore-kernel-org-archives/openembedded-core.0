Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.1042.1623888693577094372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 17:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fU28VLZp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623888691; i=@fujitsu.com;
	bh=kEB9wSBQ3iGB3MAYVWv9tiNwJRzy0Enb4lHYfLjI9uE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fU28VLZpbXFuV8CuLOfBR1EfnkomXgVNfTIB59Zin8BnrOeWqLNrjQuFLCOc8wajU
	 oySI86mghlKXZT56guFKUZzY1fM8kxbXXrvjuatjtNJwHOWjmKO7MkFFPV2pr4qR6Z
	 4PhyI8uyzW5p77m0d5Yqe8qEoGsTl3Iiit54zD1p4arxYg6tJVnAyTL+J7ufJiB3dL
	 UM43FqmcuHW7hHNsuy2SI+sFZS2pGFSErx5Qi8EEb8mkeyCLd89AXfCeqk3ayBfYwb
	 UoGY01b8qLbVl7JG03KNdd0Ku64dZDaTu8QlH0uDkIHzFYzzGawnvivCO3fMEEIcgU
	 G8Gh0rIsyuCoA==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id FB/61-38619-2339AC06; Thu, 17 Jun 2021 00:11:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVddo8qk
  Eg6nrOS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyZlzuYC15IVHQ8Ps3ewHhCrIuRi0NIYBaT
  xJx3J1kgnBOMElt3TmLtYuTkYBNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvHnaQsLCAo8Til
  1UgYRYBVYlTO/4ygti8Ak4SPxdOYwaxJQQUJKY8fA9mcwo4S3xvO8MGYgsB1WxvvMQKUS8ocX
  LmExaI8RISB1+8gOpVlJh9uZkFwq6QeH34EvMERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9f
  QwEDX0NBY11TXyNhCL7FKN0kvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERiOKYWs73Yw
  Pnv9Qe8QoyQHk5Iob3PnqQQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErz8E4FygkWp6akVaZk5w
  NiASUtw8CiJ8H7uB0rzFhck5hZnpkOkTjEqSonzvgTpEwBJZJTmwbXB4vESo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHe+yBTeDLzSuCmvwJazAS0uE0IbHFJIkJKqoFpc6F2pkJH+fGr+2t
  vfzkksvfj8mlRqZzupqzi78RTE2M3eanNsvy0K3/2zJioiS7/3ZRN59h0HLnF99/3be8Vo8iY
  WetPzk7XsqmaOvXFr1W8gXOerDvirxOf9fLnYz4O/t3P8lemsp17eohdPndRertEkLxNXjLjj
  pu/D8UGfPls38PyK6H3TiHDrFX7Xvs8cCo3XLrlj+E6xZUv1Z/0rN9n7Z8/Zf+G3VGRSuH3TK
  5IC2wRePzXau90bfY9kYvnX3hwv/Hj4ZCEFwcE+cJ93swx2SLNeKWis1LrnV0H+8W1Bxcb3v9
  +KCFU7Glsvdyyd8VtbUGZcT7GVhXn/zyxP79xZd/v1rkO/ks4T/62VmIpzkg01GIuKk4EAHD5
  QtFCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-238.messagelabs.com!1623888689!206908!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29877 invoked from network); 17 Jun 2021 00:11:30 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-25.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 00:11:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H0BPi6027694
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 01:11:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 01:11:23 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.17.2 -> 0.17.3
Date: Thu, 17 Jun 2021 08:10:59 +0800
Message-ID: <1623888661-63658-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
References: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 11 +++++++----
 ...{createrepo-c_0.17.2.bb => createrepo-c_0.17.3.bb} |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.2.bb => createrepo-c_0.17.3.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 4b844574ea..b63fe53944 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -5,21 +5,24 @@ Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  src/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index ecc262d..a86514c 100644
+index a31b14d..01fd8ca 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -14,7 +14,7 @@ if (NOT SKBUILD)
      FIND_PACKAGE(PythonLibs 3 REQUIRED)
  endif (NOT SKBUILD)
  
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
index 76bdd69836..481c4bff29 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "8eff6ed99f5fd0ba844cb8513963435caab5fd3c"
+SRCREV = "8196982f0974c268898a5550d61b374bd58103e2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

