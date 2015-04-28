Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68B4273D60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 03:43:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3S3hW2N021275
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:43:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 20:43:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 20:43:21 -0700
Message-ID: <3e9df78dab0b31b109404b75a67d2a65b57c2982.1430192424.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430192424.git.liezhi.yang@windriver.com>
References: <cover.1430192424.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] python3: remove sys_platform_is_now_always_linux2.patch
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
X-List-Received-Date: Tue, 28 Apr 2015 03:43:33 -0000
Content-Type: text/plain

It is aready in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../sys_platform_is_now_always_linux2.patch        |   29 --------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch

diff --git a/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
deleted file mode 100644
index 506210f..0000000
--- a/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Accepted [http://hg.python.org/cpython/rev/c816479f6aaf/]
-Bugtracker: http://bugs.python.org/issue12326
-
-[Removed "Misc/NEWS" hunk]
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
-# HG changeset patch
-# User Victor Stinner <victor.stinner@haypocalc.com>
-# Date 1313841758 -7200
-# Node ID c816479f6aaf71dbd3f3fe4b239186d60c55ce48
-# Parent  3e093590ac57fdda428c7da3f72ddf0c475ecf2b
-Issue #12326: sys.platform is now always 'linux2' on Linux
-
-Even if Python is compiled on Linux 3.
-
-Index: Python-3.3.0rc2/configure.ac
-===================================================================
---- Python-3.3.0rc2.orig/configure.ac	2012-09-09 02:11:14.000000000 -0700
-+++ Python-3.3.0rc2/configure.ac	2012-09-20 00:44:03.317124001 -0700
-@@ -366,7 +366,7 @@
-     MACHDEP="$ac_md_system$ac_md_release"
- 
-     case $MACHDEP in
--	linux*) MACHDEP="linux";;
-+	linux*) MACHDEP="linux2";;
- 	cygwin*) MACHDEP="cygwin";;
- 	darwin*) MACHDEP="darwin";;
- 	irix646) MACHDEP="irix6";;
-- 
1.7.9.5


