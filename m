Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA6357F35A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:48:33 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t132so32398610pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CWNYA5pqDaZnnH65JvnOc/XW+SRDJoEfJRR8bxabTAk=;
	b=s5UVZofFnu6PYC5br+dIiaj6ZzWdhFkYvlQuCJno6p6WpZI2vzKJFPw2W0zxidMOev
	Uny2XgF4dxajobEmqJUVEd6JHG72PO1v6pbfg6wM2vP5CBCvmywMjBXs0VOC8jCGHCrM
	KofDSUeCB1sEbEkjrei96LRGn6KxfX3rtAkLQow/MhUPGBtX+gQkk/lURzDT3Yu9yxmh
	7E5ivwq29IkVOLoFVPpGPdzcuXbe1V90vlXVn2bURHWkis3N9E0eNUiouJXjCgpetGkB
	iSCYlCxyr3Ykg+AyWI1z2u6d9Ev+P8kPqHQKT5lB3TLQygJv8tAdGExgAZILuUTULjKE
	IoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CWNYA5pqDaZnnH65JvnOc/XW+SRDJoEfJRR8bxabTAk=;
	b=VKulYrCNP9yfuP1aSQKLHOLzvo/gqMXf2HpMEnF32a8V0iQLLLPjiRE+ANKAWyP4pN
	tCk0FvdM008eyKlv8DN6FFkYWl//MjJNdUiWJvP5xHhbnayqDpX5VFdGqwuo/zJBMdIk
	iu7B3pNK/Dt3y0GIe+onf6IMnsiSm7+QYZkdON8rIU0/BAyhKNp4Qi7Rqe5nHCbnzRjM
	dvEBSQbO1N7zJYyvb5MhVumNR9L00mXMcCCn7rKeeby+RxcmZknJlR3XoK7sjvkDNuys
	gcnwg4LdLRUM2e6HKarb3W/73XWs/OFgmmcfxxEcUpTSC1RJY9vfJTY4EtCH+JBIkyCu
	9JWQ==
X-Gm-Message-State: APjAAAWEwsLvPA5blth4uWOkbM0Iex4JrZPvzoyzUxT7JZxQdWGaaV3D
	ybdLS3XYWb03rxIKKxRx5LxqVSwG2o0=
X-Google-Smtp-Source: APXvYqzae0p7i80MBLvx3OV2xRf6hciYz34H2FRnDbu2dBfmjVSz0gaZ+KBpVhBqL5Oh1APozwhKyw==
X-Received: by 2002:a63:3112:: with SMTP id x18mr32978780pgx.385.1564595314165;
	Wed, 31 Jul 2019 10:48:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	m4sm114750440pff.108.2019.07.31.10.48.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 10:48:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 10:48:19 -0700
Message-Id: <20190731174820.16459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] libedit: Move from meta-oe
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
X-List-Received-Date: Wed, 31 Jul 2019 17:48:33 -0000
Content-Transfer-Encoding: 8bit

libedit is needed by llvm on linux and this makes it useful
for both oe-core and clang layer among other users

Thanks to various contributors in maintaing it in meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libedit/libedit/stdc-predef.patch         | 18 +++++++++++++++
 .../libedit/libedit_20190324-3.1.bb           | 23 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/libedit/libedit/stdc-predef.patch
 create mode 100644 meta/recipes-devtools/libedit/libedit_20190324-3.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 77af8b6dad..201130e771 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -326,6 +326,7 @@ RECIPE_MAINTAINER_pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libdmx = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER_pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libepoxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-liberror-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
new file mode 100644
index 0000000000..75ef308fad
--- /dev/null
+++ b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -0,0 +1,18 @@
+__STDC_ISO_10646__ is defined in stdc-predef.h
+therefore include it to see if its there on a platform
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libedit-20160903-3.1/src/chartype.h
+===================================================================
+--- libedit-20160903-3.1.orig/src/chartype.h
++++ libedit-20160903-3.1/src/chartype.h
+@@ -29,6 +29,7 @@
+ #ifndef _h_chartype_f
+ #define _h_chartype_f
+ 
++#include <stdc-predef.h>
+ /* Ideally we should also test the value of the define to see if it
+  * supports non-BMP code points without requiring UTF-16, but nothing
+  * seems to actually advertise this properly, despite Unicode 3.1 having
diff --git a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
new file mode 100644
index 0000000000..01e7f36009
--- /dev/null
+++ b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "BSD replacement for libreadline"
+DESCRIPTION = "Command line editor library providing generic line editing, \
+history, and tokenization functions"
+HOMEPAGE = "http://www.thrysoee.dk/editline/"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e4228d0c5a9093b01aeaaeae6641533"
+
+DEPENDS = "ncurses"
+
+inherit autotools
+
+# upstream site does not allow wget's User-Agent
+FETCHCMD_wget += "-U bitbake"
+SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
+           file://stdc-predef.patch \
+          "
+SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
+SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
+
+UPSTREAM_CHECK_REGEX = "libedit-(?P<pver>\d+(\.\d+)+)\.tar.gz"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.22.0


