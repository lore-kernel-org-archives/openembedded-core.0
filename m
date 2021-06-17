Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web09.1865.1623893376686531915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 18:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ynB1FiQi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623893374; i=@fujitsu.com;
	bh=n+MMP+A8exi3MaStkz0egXyEJJfVH6UXdS7Wiva8a94=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ynB1FiQiCU/XAB4GA/FLFBz+0o/7XV+3KtogbYTVALoakXuRxcgR68fV9QBceboZ3
	 A8stQ31q59vHQ/H7RJ+ovUTsYBpdIDhFkMF9qQRmi2iYzBsA8JjUSSdiAlpD4vdPai
	 0UebrAHQpMxZTOYZ0TT8UAW4ktcTd4dFMol7HkQH5jbDHMLf3hLIid+vPeDeg3m/1h
	 7eaDhRuivM5mccyZQZLlwZkmkYkcV6aR7LG/SSQ4Ft7exxhpdko9oU1pO5//K53o7J
	 sNbXUT/RpCqaF2uQTL46SgF9b6rRKNmFBFfdLrW0eLQgDcVIRxUWnoqD70/A9+IQ2K
	 pn9G8w2Cax2tA==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id D7/0A-62504-D75AAC06; Thu, 17 Jun 2021 01:29:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1a1deir
  BYF6TuMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH6+3TmgtsSFacfv2VqYFwt1sXIxSEkMItJ
  4srLlWwQzh5Giftz1gM5nBxsAroS5x6vZe9i5OAQEdCTuPpPFCQsLGAr0dK4gh3EZhFQlbh2e
  h9YOa+Ap8SzV7eZQGwJAQWJKQ/fM0PEBSVOznzCAmIzC0hIHHzxghlkpISAosTs6fIQ5RUSM2
  ZsY5vAyDMLSccsJB0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlpa6BoaG+glVukm6aWW6pa
  nFpfoGuollhfrFVfmJuek6OWllmxiBAZRSsGxph2MJ19/0DvEKMnBpCTK29x5KkGILyk/pTIj
  sTgjvqg0J7X4EKMMB4eSBC/TYqCcYFFqempFWmYOMKBh0hIcPEoivLqLgNK8xQWJucWZ6RCpU
  4yKUuK8FiB9AiCJjNI8uDZYFF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbuARoCk9mXg
  nc9FdAi5mAFrcJgS0uSURISTUwtaq0SGvK5DXPObDaIrUjaY/o9CIzlw3TbkX/1lc+uWfFFtO
  cPw/mprP90GSWW8YmXb9+34SS2m+LXlZebtn7bMfu63f/8bNn3ZL5cMv8Nfvr/IsRna/iGnM4
  POc+z8m/pHp+9xeR1/XvqxITaiSnXTqX6/48c8ZsiZlK835m2W51N1aKOcXzyOWF8+2UhqYH1
  jHybF9+RemzPOWyDjq8xsWu4XlIWfhazQSXmRIfRHKsbGarzvzJruJ/eHWe/1J9Vt4lRsutOl
  9uv3r437vY3zX3+7+9Mjsl4bRbLDVLZ9GCsrZDGt6Wi9abNkzO+aZgKdNbKepx4sqnCtbHN9W
  dfF5ya/vvdlx7Qqbl8L5CJZbijERDLeai4kQAwdfgUB0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1623893373!224795!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21465 invoked from network); 17 Jun 2021 01:29:33 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 01:29:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H1TRc7012313
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:29:33 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 02:29:25 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libcomps: upgrade 0.1.16 -> 0.1.17
Date: Thu, 17 Jun 2021 18:29:15 +0800
Message-ID: <1623925755-129560-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 10 +++++-----
 .../{libcomps_0.1.16.bb => libcomps_0.1.17.bb}         |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.16.bb => libcomps_0.1.17.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 3e9102605b..6cd052889a 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -10,18 +10,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index b9b96ab..6d44567 100644
+index f813af4..9eebb6c 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -115,7 +115,7 @@ IF (SKBUILD)
+@@ -85,7 +85,7 @@ IF (SKBUILD)
      INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/src/libcomps)
      INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/libcomps)
  ELSE ()
--    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+-    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
      #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.16.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
index 851ec5b817..502bc4688b 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "f3289ed1d812648558ab48ade4fae850b375fa65"
+SRCREV = "dfaffdce1969042bda4a184865861573bb07a5a3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

