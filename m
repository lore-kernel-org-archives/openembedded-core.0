Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2369673F47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 08:11:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4E8B5Kt012943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 01:11:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 01:11:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 01:11:04 -0700
Message-ID: <268bc2f75252f5da7609501fe931810528ffa405.1431591045.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431591045.git.liezhi.yang@windriver.com>
References: <cover.1431591045.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc-5: fix installed-vs-shipped
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
X-List-Received-Date: Thu, 14 May 2015 08:11:06 -0000
Content-Type: text/plain

gcc-5.1.0: gcc: Files/directories were installed but not shipped in any package:
  /usr/bin/i586-poky-linux-gcov-tool

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index e348517..5d31446 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -83,8 +83,12 @@ FILES_cpp = "\
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
 FILES_cpp-symlinks = "${bindir}/cpp"
 
-FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
-FILES_gcov-symlinks = "${bindir}/gcov"
+FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov \
+    ${bindir}/${TARGET_PREFIX}gcov-tool \
+"
+FILES_gcov-symlinks = "${bindir}/gcov \
+    ${bindir}/gcov-tool \
+"
 
 FILES_g++ = "\
     ${bindir}/${TARGET_PREFIX}g++ \
-- 
1.7.9.5


