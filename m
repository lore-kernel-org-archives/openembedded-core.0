Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id E6B53772ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 05:24:44 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ts10so69631722obc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fJRJOn0d84b0Kh2g+JkMaPHwog8H81zUWq4C01XtAJU=;
	b=SePWEeELUl9VRjSJFFkFSR1EGmg5A5+IKd4499tyoscSxDwJuZoZa9Cv68zGJbe6/T
	17EcFstO+Ghqm85iq86O6H5sUjOhGrB9FiM/NAA2WXyk8GCdazkmV/ESmQHiY9pgSsNR
	uMk+w4ALZ6in3LSUJn72MyG1yuWdSSli4c5azQoLZAf3wnGC8Q/qO6GFH9ss5nZpW/l/
	tzX1GAtvzgtfiZmsG0ju7vFLjh5oQnxQ7VVQtt5TC8Gb0xQ6+/9p1QuBkyopllMdwCaB
	WkwbmOmsCiIKTsuTKv73OQKuIxwc1JAC5L8kXIfqesU388LekaVDklvuRSZoECOIb40+
	rlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fJRJOn0d84b0Kh2g+JkMaPHwog8H81zUWq4C01XtAJU=;
	b=Fv/zFX3B90VT2eajJBurT2bXrfUWb9E/u+aYyHJcaOE/LKy72Hrp10dHvrH0mQI6Cq
	N2LSlzShZWXekvYYIHWYyNbPCOMZOBNJtCyJ2QU7tlSwrHLI8SS2HaTZzyg3SuHEfGjm
	5BNVReyjTSYI3g7MFWdeic3zenQQLoVnnz2J5nJ3SEMu8I1xddfeEkkqsBf+GsfA+bU+
	spDEHIsDLIylYW2HWeC+ju+JWzN0Y6weZUCDvf2AedB1UZWBsa0fFbDmJ9EJxnJnyEUg
	lExphTUahhdXG/ot5CNHwLKuSlc3KAG401HpHiFOgyk3OWwkCBA3ee6d+NIFtZZ83Xch
	iA3A==
X-Gm-Message-State: AG10YOSf6kwWX6cLGC1NEg4CTeAjgSvbbE/RN1y+odpmp42Ip8woObL+AH/EZsLvsLfgYQ==
X-Received: by 10.60.173.10 with SMTP id bg10mr41757218oec.32.1456464284948;
	Thu, 25 Feb 2016 21:24:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm7784181obc.10.2016.02.25.21.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 21:24:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 21:24:38 -0800
Message-Id: <1456464278-12416-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dosfstools_2.11: fix build following removal of -e from EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 26 Feb 2016 05:24:47 -0000

Also misc formatting tweaks to align with v3.0.28 recipe and remove
BBCLASSEXTEND = "native" (native builds should always use the GPLv3
recipe).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index beec488..176504d 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "DOS FAT Filesystem Utilities"
-HOMEPAGE = "http://daniel-baumann.ch/software/dosfstools/"
+HOMEPAGE = "https://github.com/dosfstools/dosfstools"
 
 SECTION = "base"
 LICENSE = "GPLv2"
@@ -18,21 +18,17 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.src.tar.gz/407d4
            file://include-linux-types.patch \
            file://nofat32_autoselect.patch \
            file://fix_populated_dosfs_creation.patch \
-	   file://0001-Include-fcntl.h-for-getting-loff_t-definition.patch \
-	   "
+           file://0001-Include-fcntl.h-for-getting-loff_t-definition.patch \
+"
 
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
 SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
 
-# Makefile sets this, but we clobber its CFLAGS, so
-# add this in here to for sure allow for big files.
-#
-CFLAGS_append = " -D_FILE_OFFSET_BITS=64"
-CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
+CFLAGS += "-D_GNU_SOURCE ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+
+EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 
 do_install () {
 	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${base_sbindir}" \
 		   "MANDIR=${D}${mandir}/man8" install
 }
-
-BBCLASSEXTEND = "native"
-- 
1.9.1


