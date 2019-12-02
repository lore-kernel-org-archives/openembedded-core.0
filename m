Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C26A7F2BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n1so189167wra.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uaameoyiGg3L9pt5mh/pAOKG9AMzDKoJ6H3iwxb8jqo=;
	b=uGNcpwXb3ICT81tf0iDqOYroLERQH5VDN7Pf9JTbNFvH1ybIf8PvRM3/AODiSkl3Gm
	HvudDFoyCripfvl2BiDoVDU5EX0n0IdHCUmUaV183RDNtF03lr2qujf7eUhHvIXr//F0
	G+y8y1e1Etf3VkpKVDdf4wMkpy0s9auqOKbxxeKQ7fIxEz9XuxmefPjWqmMgJAj72Nk5
	8GQNi32JSU4lFByem2Hvg5qIQbTBFrpSpG8ikHEW3CYq6mGZkveL7uomQAvg9q0lxIgj
	wh3fkPu22SxO8W1jhH+1IIpzEt5kVpmO3IsVRxpnDs3OmeK5ZvScdJcM7Ukb3SV0M5md
	+Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uaameoyiGg3L9pt5mh/pAOKG9AMzDKoJ6H3iwxb8jqo=;
	b=n0bvQCvCON/xla6joPDS464hBe/GxfsI8CEWP/ZITzKa5/7iKOciC6wrnOF5oDGE38
	YhUoMV2yRzOv4UwkEdzkvSa0o5HCFxUiSKhWVWLixcIDrSasLTNdzzj8VPMF8i7/eWEi
	KqfECtr2lfxEIZ2EOhV3SdDy6V1OUzQ+ye2NMVa4p0L3kZ1DoQBiAKx2JwsSOkn1g7MZ
	MZiNn+rvhrvOwydSWCCdzzOUmudOZmmnJbObi3OLD58h+Hk2pwwlR7MQT9SHKFaFo8iY
	bBlx/MGTRugonUmnQBR/JAh01EQU+c4UPKfsJntNbl+tO1KYfcJZCd6rByt34E7yXuXj
	2+Gg==
X-Gm-Message-State: APjAAAVPdofKnQ3yVbJD1SGBU2BXobuEDQO2ydiX7i7HBcvyNhxjegqn
	VWSQrRFrPRX3FoP6Hs6JM0mYPqvx
X-Google-Smtp-Source: APXvYqyFztEZUeduSOVrrAMq+D4hkrD1Lo/8crASwSsQMzXT8IeLZnP7xH6T342H+jMrvWLRzUhbKQ==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr75753wru.297.1575309316132;
	Mon, 02 Dec 2019 09:55:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:53 +0100
Message-Id: <20191202175459.112655-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/18] libcomps: update to 0.1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Dec 2019 17:55:15 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 50 +++++++------------
 .../recipes-devtools/libcomps/libcomps_git.bb |  4 +-
 2 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 26e8b06f378..59c09aa70a1 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,41 +1,25 @@
-From ff4aae4c8beaf17cb8e7a3431f6c541eccfae244 Mon Sep 17 00:00:00 2001
+From b28859ea93110d52d8a87d7b5a6c8796d0d523ed Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH 1/2] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- libcomps/src/python/src/python2/CMakeLists.txt | 2 +-
- libcomps/src/python/src/python3/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ libcomps/src/python/src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/libcomps/src/python/src/python2/CMakeLists.txt b/libcomps/src/python/src/python2/CMakeLists.txt
-index 3ad9e18..0e7dd4b 100644
---- a/libcomps/src/python/src/python2/CMakeLists.txt
-+++ b/libcomps/src/python/src/python2/CMakeLists.txt
-@@ -1,7 +1,7 @@
- find_package (PythonLibs 2.6)
- find_package (PythonInterp 2.6 REQUIRED)
- 
--execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- 
- include_directories(${PYTHON_INCLUDE_PATH})
- include_directories(${LIBCOMPS_INCLUDE_PATH})
-diff --git a/libcomps/src/python/src/python3/CMakeLists.txt b/libcomps/src/python/src/python3/CMakeLists.txt
-index 7fafa9f..ed82d3d 100644
---- a/libcomps/src/python/src/python3/CMakeLists.txt
-+++ b/libcomps/src/python/src/python3/CMakeLists.txt
-@@ -2,7 +2,7 @@ find_package (PythonLibs 3.0)
- find_package (PythonInterp 3.0)
- #add_custom_target(py3-copy)
+diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
+index fa590ae..6913214 100644
+--- a/libcomps/src/python/src/CMakeLists.txt
++++ b/libcomps/src/python/src/CMakeLists.txt
+@@ -117,7 +117,7 @@ IF (SKBUILD)
+     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/src/libcomps)
+     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/libcomps)
+ ELSE ()
+-    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  
--execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- 
- include_directories(${PYTHON_INCLUDE_PATH})
- include_directories(${LIBCOMPS_INCLUDE_PATH})
--- 
-2.11.0
-
+     INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
+     #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 372c3c35804..34881bba372 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.11"
-SRCREV = "d868a79b76fb980d1371c28124ae07f00d2b63a9"
+PV = "0.1.12"
+SRCREV = "d0c8aa312dcab75c265ed6123f8afe0d7c8e91db"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


