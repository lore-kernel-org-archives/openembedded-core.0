Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 650BF76DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:21:33 +0000 (UTC)
Received: by qgez77 with SMTP id z77so12163032qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=Dvk2TX2BsB8ZdE2WWTeVs7e7ZkSzAj6Yf6Hxiu1WofY=;
	b=TC3mmpcLacw64LsJ6cZqTC9DZ8Ut4sR3M6mNZ2VMit2FsKcy90r69LnK5LcS/5/D14
	IfVfFhuK9zuY1oZftwUc+AAiRR3SEuvBKxf2K0yIYKmtXPfMpH0cNi7ZWOW5oEbA1jKG
	ONQfGhZVBD8MBmwtI1F3LAJVCSCSvpTx5PR3wYOWMiI+V7VQWw3fpeJ6nn1bVJFzSOQ7
	9znkGwVxPbk1lB3H3q7BFCfYtUrzNhTO+Fk941t5itTnKl5UEwpXV0NgkaEKSKKAEioX
	51eNR5fcpfEIPA0DWeXek7B4MN3I/7FcB5/UIZ3m8qU/YQn7RvbNMbNrenU7Ozm+7Eq/
	Xo0g==
X-Received: by 10.140.151.140 with SMTP id 134mr53989642qhx.49.1442496093980; 
	Thu, 17 Sep 2015 06:21:33 -0700 (PDT)
Received: from localhost ([177.194.193.199]) by smtp.gmail.com with ESMTPSA id
	s90sm1238564qki.46.2015.09.17.06.21.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 06:21:32 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 17 Sep 2015 10:21:27 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 10:21:26 -0300
Message-Id: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] Rename 'BRANCH' variable to 'SRCBRANCH' for clearness
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
X-List-Received-Date: Thu, 17 Sep 2015 13:21:35 -0000

The 'BRANCH' variable name has no explicit relation with the
SRC_URI. Using 'SRCBRANCH' makes it more obvious and easier to
identify.

This patch makes the use consistent across the metadata.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Use SRCBRANCH instead of SRC_BRANCH (Khem)

 meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 4 ++--
 meta/recipes-core/glibc/glibc_2.22.bb                  | 4 ++--
 meta/recipes-devtools/mmc/mmc-utils_git.bb             | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 2153ece..03be9c0 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -14,10 +14,10 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-BRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
-SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
+SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            file://fix_for_centos_5.8.patch \
            ${EGLIBCPATCHES} \
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index f0e1fad..09df3f6 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -9,11 +9,11 @@ DEPENDS += "gperf-native kconfig-frontends-native"
 
 SRCREV ?= "a34d1c6afc86521d6ad17662a3b5362d8481514c"
 
-BRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
-SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
+SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
            file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
            file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 8950360..546f7f2 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
 
-BRANCH ?= "master"
+SRCBRANCH ?= "master"
 SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${BRANCH} \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
            file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
 
 S = "${WORKDIR}/git"
-- 
2.5.2


