Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20B3A731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9GmEI019345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:48 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:31 -0400
Message-ID: <89eb06df35a49ec74f4c431a3ade52d7dcf90a46.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] libnewt/libnewt-python: upgrade to 0.52.19
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:48 -0000
Content-Type: text/plain

- Drop remove_slang_include.patch, libnewt 0.52.19 has fixed it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../newt/files/remove_slang_include.patch                | 16 ----------------
 ...bnewt-python_0.52.18.bb => libnewt-python_0.52.19.bb} |  0
 .../newt/{libnewt_0.52.18.bb => libnewt_0.52.19.bb}      |  5 ++---
 3 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/remove_slang_include.patch
 rename meta/recipes-extended/newt/{libnewt-python_0.52.18.bb => libnewt-python_0.52.19.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.18.bb => libnewt_0.52.19.bb} (88%)

diff --git a/meta/recipes-extended/newt/files/remove_slang_include.patch b/meta/recipes-extended/newt/files/remove_slang_include.patch
deleted file mode 100644
index a2634ec..0000000
--- a/meta/recipes-extended/newt/files/remove_slang_include.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-Upstream-Status: Pending
-
-Index: git/Makefile.in
-===================================================================
---- git.orig/Makefile.in
-+++ git/Makefile.in
-@@ -5,7 +5,7 @@ CC = @CC@
- CPP = @CPP@
- CFLAGS = @CFLAGS@
- LDFLAGS = @LDFLAGS@
--CPPFLAGS = -D_GNU_SOURCE -I/usr/include/slang @CPPFLAGS@ 
-+CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@ 
- GNU_LD = @GNU_LD@
- 
- VERSION = @VERSION@
diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb b/meta/recipes-extended/newt/libnewt-python_0.52.19.bb
similarity index 100%
rename from meta/recipes-extended/newt/libnewt-python_0.52.18.bb
rename to meta/recipes-extended/newt/libnewt-python_0.52.19.bb
diff --git a/meta/recipes-extended/newt/libnewt_0.52.18.bb b/meta/recipes-extended/newt/libnewt_0.52.19.bb
similarity index 88%
rename from meta/recipes-extended/newt/libnewt_0.52.18.bb
rename to meta/recipes-extended/newt/libnewt_0.52.19.bb
index b6a9cd4..b45461c 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.19.bb
@@ -18,15 +18,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 DEPENDS = "slang popt"
 
 SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
-           file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
            file://pie-flags.patch \
 "
 
-SRC_URI[md5sum] = "685721bee1a318570704b19dcf31d268"
-SRC_URI[sha256sum] = "771b0e634ede56ae6a6acd910728bb5832ac13ddb0d1d27919d2498dab70c91e"
+SRC_URI[md5sum] = "e4aa0f7943edd39c52481a87f68f412a"
+SRC_URI[sha256sum] = "08c0db56c21996af6a7cbab99491b774c6c09cef91cd9b03903c84634bff2e80"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.8.1


