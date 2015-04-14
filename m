Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD247390D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:04:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E94lB9009980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:04:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:04:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:04:44 -0700
Message-ID: <0b76b225269578835f88c494256386cb9a7c3064.1429002178.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002178.git.liezhi.yang@windriver.com>
References: <cover.1429002178.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gcc-target: remove gcc-plugin-dev from PACKAGES
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
X-List-Received-Date: Tue, 14 Apr 2015 09:04:46 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 4c3eea6..e348517 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -19,7 +19,6 @@ PACKAGES = "\
     g77 g77-symlinks \
     gfortran gfortran-symlinks \
     gcov gcov-symlinks \
-    ${PN}-plugin-dev \
     ${PN}-doc \
     ${PN}-dev \
     ${PN}-dbg \
@@ -47,8 +46,6 @@ FILES_${PN}-dbg += "\
 FILES_${PN}-dev = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
-"
-FILES_${PN}-plugin-dev = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
-- 
1.7.9.5


