Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFD147888D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w122IVc9026576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:31 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:30 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:13 +0800
Message-ID: <1517537774-12847-7-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
References: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 6/7] tcl: update to 8.6.8
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:29 -0000
Content-Type: text/plain

Rebase tcl-add-soname.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch       | 4 ++--
 meta/recipes-devtools/tcltk/{tcl_8.6.7.bb => tcl_8.6.8.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.7.bb => tcl_8.6.8.bb} (95%)

diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index 96276ea..d1fc9b9 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -11,7 +11,7 @@ Index: unix/configure
 +	    # following line added by CW for Debian GNU/Linux
 +	    TCL_SHLIB_LD_EXTRAS="-Wl,-soname,\${TCL_LIB_FILE}.0"
 +
- 	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
+ 	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
  	    DL_OBJS="tclLoadDl.o"
  	    DL_LIBS="-ldl"
 Index: unix/tcl.m4
@@ -25,7 +25,7 @@ Index: unix/tcl.m4
 +	    # following line added by CW for Debian GNU/Linux
 +	    TCL_SHLIB_LD_EXTRAS="-Wl,-soname,\${TCL_LIB_FILE}.0"
 +
- 	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
+ 	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
  	    DL_OBJS="tclLoadDl.o"
  	    DL_LIBS="-ldl"
 Index: unix/Makefile.in
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.7.bb b/meta/recipes-devtools/tcltk/tcl_8.6.8.bb
similarity index 95%
rename from meta/recipes-devtools/tcltk/tcl_8.6.7.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.8.bb
index dac73be..4be2e89 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.7.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.8.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "5673aaf45b5de5d8dd80bb3daaeb8838"
-SRC_URI[sha256sum] = "7c6b8f84e37332423cfe5bae503440d88450da8cc1243496249faa5268026ba5"
+SRC_URI[md5sum] = "81656d3367af032e0ae6157eff134f89"
+SRC_URI[sha256sum] = "c43cb0c1518ce42b00e7c8f6eaddd5195c53a98f94adc717234a65cbcfd3f96a"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.7.4


