Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75C4C001DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7468.1686734968198660332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bjGBpBNH;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-977c8423dccso88121566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734966; x=1689326966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54hGTk+8Z4hLoFIxMXPe36HbE4M01WYOHIoVWF85vPY=;
        b=bjGBpBNHcn9XqGHDYdzQzKkdMSH9s7W5C4sMuqjNdoZ6FBtPxmfGCyoA6GxWjevADc
         jpxoIIQ5vX/40DK972PCRCyZsXC1vdvJ/JXuaTB5+KSgHmPub09YV4BR0svRQI8nFQAE
         wXRVbk9jP1Q0zzlMI8TQPPxc1uSqU7IGcKPaMVI74gL12GP8nTwgRupsUmWeRgL9N3xC
         PtuLRYoztDpreMd5rBrJUk8jqNVCB9Yf9t9TncGBXTBSL77gWuoAMnnoxq+og29TK3E+
         eDiJFeNK3miLV1NQAqZ+XgR55wEQw6V/59hiqFhLh1qqMuW5n40E4bocgg/lH9l9ccI5
         /QMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734966; x=1689326966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54hGTk+8Z4hLoFIxMXPe36HbE4M01WYOHIoVWF85vPY=;
        b=b62Z+6Frejj7/VZWoXMZWElmQTTR023hqpHxrE5wKEKw9SbBdfwzk03OUI70Shlaot
         FVdwBtwEM5W9hKOHlEYgvD/SYDoAI3rlGVLSjQwdEQO2bjXbfDj06BhFjDEyc6ohFMLZ
         2jHjJQBKoHNMUL7g2Yz94X4Iv/727EJSwmC4HbwPZ+jiJary+WfDt7voC7uOYZqP7z4t
         V/4KpZyOm2ycSkdhJPRg01+uy9+GNs4A6hK7T5L6mZLwwsC5cgskYYcwJ4v3fUgylrqA
         dbDZRuKf8SAcxNwKgBXzSql8MrHc0HIayHBJrU/uNbs/FT4evGExZaA2cr59lXtRaioS
         8CUQ==
X-Gm-Message-State: AC+VfDxoSNlatEe9EOK+FprA6cXk8wEafSdqSoHxwQc8QTeVvKoixvDS
	dkftJ2xDekI5uaWdZ90/OzfhLOjbujM=
X-Google-Smtp-Source: ACHHUZ5tbdsAOVOLqsRqNsxk7gNBlcJ1eHyN0qeuN7utDB5+Of9FO6huoJN1oEMvFImE7XGJebl1Ow==
X-Received: by 2002:a17:907:940f:b0:977:e95d:efdf with SMTP id dk15-20020a170907940f00b00977e95defdfmr1060939ejc.29.1686734966635;
        Wed, 14 Jun 2023 02:29:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/55] sysfsutils: update 2.1.0 -> 2.1.1
Date: Wed, 14 Jun 2023 11:28:29 +0200
Message-Id: <20230614092918.4065570-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182751

Drop all patches, as issues are all fixed upstream.

License-Update: clarification that GPL applies to all executables
(not just test), formatting.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../obsolete_automake_macros.patch            | 15 -----
 .../sysfsutils-2.1.0/separatebuild.patch      | 65 -------------------
 .../sysfsutils-2.0.0-class-dup.patch          | 23 -------
 ...ysfsutils_2.1.0.bb => sysfsutils_2.1.1.bb} | 14 ++--
 4 files changed, 5 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
 delete mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch
 rename meta/recipes-core/sysfsutils/{sysfsutils_2.1.0.bb => sysfsutils_2.1.1.bb} (55%)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_macros.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_macros.patch
deleted file mode 100644
index 9d828d7026e..00000000000
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [http://sourceforge.net/tracker/?func=detail&aid=3600345&group_id=44427&atid=439544]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd sysfsutils-2.1.0/configure.ac sysfsutils-2.1.0/configure.ac
---- sysfsutils-2.1.0/configure.ac	2006-08-07 08:08:00.000000000 +0300
-+++ sysfsutils-2.1.0/configure.ac	2013-01-11 08:13:08.651550634 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(sysfsutils, 2.1.0, linux-diag-devel@lists.sourceforge.net)
- AM_INIT_AUTOMAKE
- AC_CONFIG_SRCDIR([config.h.in])
--AM_CONFIG_HEADER([config.h])
-+AC_CONFIG_HEADERS([config.h])
-
- # Checks for KLIBC support (should be before AC_PROG_LIBTOOL and AC_PROG_CC)
- AC_CHECK_KLIBC
diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
deleted file mode 100644
index 82e725e2aca..00000000000
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Pending
-
-Fix out of tree build issues so ${B} != ${S} works.
-
-RP 2013/03/18
-
-Index: sysfsutils-2.1.0/cmd/Makefile.am
-===================================================================
---- sysfsutils-2.1.0.orig/cmd/Makefile.am	2013-03-08 08:57:27.224556508 +0000
-+++ sysfsutils-2.1.0/cmd/Makefile.am	2013-03-08 08:57:27.480556502 +0000
-@@ -1,6 +1,6 @@
- bin_PROGRAMS = systool 
- systool_SOURCES = systool.c names.c names.h
--INCLUDES = -I../include
-+INCLUDES = -I$(srcdir)/../include
- LDADD = ../lib/libsysfs.la
- EXTRA_CFLAGS = @EXTRA_CFLAGS@
- AM_CFLAGS = -Wall -W -Wstrict-prototypes $(EXTRA_CFLAGS)
-Index: sysfsutils-2.1.0/lib/Makefile.am
-===================================================================
---- sysfsutils-2.1.0.orig/lib/Makefile.am	2013-03-08 08:57:27.224556508 +0000
-+++ sysfsutils-2.1.0/lib/Makefile.am	2013-03-08 08:57:27.480556502 +0000
-@@ -1,7 +1,7 @@
- lib_LTLIBRARIES = libsysfs.la
- libsysfs_la_SOURCES = sysfs_utils.c sysfs_attr.c sysfs_class.c dlist.c \
-       sysfs_device.c sysfs_driver.c sysfs_bus.c sysfs_module.c sysfs.h
--INCLUDES = -I../include
-+INCLUDES = -I$(srcdir)/../include
- libsysfs_la_LDFLAGS = -version-info 2:1:0
- EXTRA_CFLAGS = @EXTRA_CLFAGS@
- libsysfs_la_CFLAGS = -Wall -W -Wstrict-prototypes $(EXTRA_CLFAGS)
-Index: sysfsutils-2.1.0/test/Makefile.am
-===================================================================
---- sysfsutils-2.1.0.orig/test/Makefile.am	2013-03-08 08:57:27.224556508 +0000
-+++ sysfsutils-2.1.0/test/Makefile.am	2013-03-08 09:06:48.196543326 +0000
-@@ -2,14 +2,14 @@
- BUILT_SOURCES = test.h
- CLEANFILES = test.h
- test.h:
--	./create-test
-+	$(srcdir)/create-test $(srcdir)/libsysfs.conf
- get_device_SOURCES = get_device.c
- get_driver_SOURCES = get_driver.c
- get_module_SOURCES = get_module.c
- testlibsysfs_SOURCES = test.c test_attr.c test_bus.c test_class.c \
- 		       test_device.c test_driver.c test_module.c test_utils.c \
- 		       testout.c test-defs.h libsysfs.conf create-test
--INCLUDES = -I../include
-+INCLUDES = -I$(srcdir)/../include
- LDADD = ../lib/libsysfs.la
- EXTRA_CFLAGS = @EXTRA_CLFAGS@
- AM_CFLAGS = -Wall -W -Wstrict-prototypes $(EXTRA_CLFAGS)
-Index: sysfsutils-2.1.0/test/create-test
-===================================================================
---- sysfsutils-2.1.0.orig/test/create-test	2005-11-28 10:22:10.000000000 +0000
-+++ sysfsutils-2.1.0/test/create-test	2013-03-08 09:07:03.372542838 +0000
-@@ -2,7 +2,7 @@
- 
- rm -f test.h
- 
--conf_file=./libsysfs.conf
-+conf_file=$1
- 
- . $conf_file
- 
diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch
deleted file mode 100644
index 1a35b7897a7..00000000000
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Backport [from fedora core 9]
-
-This patch is from the Fedora Core 9 sysfsutils-2.1.0-3.fc9 package.
-
-It fixes a problem in the upstream package where not all devices 
-will be returned by the function.
-
-The package License indicates this is GPLv2 licensed.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -puN lib/sysfs_class.c~sysfsutils_class_dup lib/sysfs_class.c
---- sysfsutils-2.1.0/lib/sysfs_class.c~sysfsutils_class_dup	2006-09-07 17:01:26.000000000 -0500
-+++ sysfsutils-2.1.0-bjking1/lib/sysfs_class.c	2006-09-07 17:01:26.000000000 -0500
-@@ -66,7 +66,7 @@ static int cdev_name_equal(void *a, void
- 		return 0;
- 
- 	if (strncmp((char *)a, ((struct sysfs_class_device *)b)->name,
--				strlen((char *)a)) == 0)
-+				SYSFS_NAME_LEN) == 0)
- 		return 1;
- 
- 	return 0;
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
similarity index 55%
rename from meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
rename to meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index fd72cf41659..64a6cc26d33 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -5,17 +5,13 @@ HOMEPAGE = "http://linux-diag.sourceforge.net/Sysfsutils.html"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LICENSE:${PN} = "GPL-2.0-only"
 LICENSE:libsysfs = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
-                    file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
-                    file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
-PR = "r5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dcc19fa9307a50017fca61423a7d9754 \
+                    file://cmd/GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://lib/LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=master \
-           file://sysfsutils-2.0.0-class-dup.patch \
-           file://obsolete_automake_macros.patch \
-           file://separatebuild.patch"
+SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=master"
 
-SRCREV = "0d5456e1c9d969cdad6accef2ae2d4881d5db085"
+SRCREV = "da2f1f8500c0af6663a56ce2bff07f67e60a92e0"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


