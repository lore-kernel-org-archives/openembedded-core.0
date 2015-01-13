Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD5C172694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5iXJ5021736
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:33 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:03 +0800
Message-ID: <10dec9b6012d8d072fe9417c4e3fcf4d5b1df803.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] xmlto: upgrade to 0.0.25
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:36 -0000
Content-Type: text/plain

Drop obsolete_automake_macros.patch, it has been merged to 0.0.25

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../xmlto/xmlto-0.0.25/obsolete_automake_macros.patch        | 12 ------------
 .../configure.in-drop-the-test-of-xmllint-and-xsltproc.patch |  0
 .../xmlto/{xmlto_0.0.25.bb => xmlto_0.0.26.bb}               |  5 ++---
 3 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.25 => xmlto-0.0.26}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (100%)
 rename meta/recipes-devtools/xmlto/{xmlto_0.0.25.bb => xmlto_0.0.26.bb} (84%)

diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
deleted file mode 100644
index faa8acc..0000000
--- a/meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
---- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
-+++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
-@@ -1,7 +1,7 @@
- AC_INIT(xmlto, 0.0.25)
- AC_CONFIG_SRCDIR(xmlto.spec.in)
- AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_PROG_CC
- AM_PROG_CC_C_O
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
similarity index 100%
rename from meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
rename to meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
similarity index 84%
rename from meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
rename to meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
index 2698b1c..160aa5d 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
@@ -6,12 +6,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
            file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
            file://catalog.xml \
 "
-SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
-SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
+SRC_URI[md5sum] = "0cca8be787ba01e00c618cb390c988b9"
+SRC_URI[sha256sum] = "cfd8d2a26077be1d5566dfe22dd66099ae4f4600dea97d6e113a2cc5b8708977"
 
 inherit autotools
 
-- 
1.9.1


