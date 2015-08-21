Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id CF19B60657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:38:09 +0000 (UTC)
Received: by wijp15 with SMTP id p15so29648260wij.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=bKOMP8GPDAurVXAZKCyyXgDp0eMQqv06/Ky8MtFcg5s=;
	b=TnCF6C0h27OyWZpov3Dx2cg2pqL7PUhgL/e7ouGNQ8mvb7/kVoYziDLdatgKRGI0QY
	fRPPP8U1vYo6zfsC0eZ/+3rc17fJudXoLt3WJX2xL7/0Xk+BQd0srEMEJSgcSZORIey9
	O4eJkZs1C3RCfBcTe4NAgbJecKv6U3tZAkV5U6mKSoNYLfnVzji4uuIopnCnybn/E/L5
	Od30U8Me3HGXR3vkdFOkuXbNUJixaKvfXBvk8Q8YwTiDv5rU9ON595t1G+7dAiuYehbZ
	eH6FYgUxGZJke/MqSEqDnr2aOZ40LpnNlNdH3wzOrf+csZGW+KVcxze+j9bCAZGZ1Fqg
	Gxyw==
X-Received: by 10.194.84.211 with SMTP id b19mr19992956wjz.120.1440193089003; 
	Fri, 21 Aug 2015 14:38:09 -0700 (PDT)
Received: from localhost (83-244-151-247.cust-83.exponential-e.net.
	[83.244.151.247]) by smtp.gmail.com with ESMTPSA id
	a19sm11616469wjr.27.2015.08.21.14.38.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 14:38:07 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 21 Aug 2015 18:38:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 18:38:02 -0300
Message-Id: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Fri, 21 Aug 2015 21:38:10 -0000

The 'BRANCH' variable name has no explicit relation with the
SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
identify.

This patch makes the use consistent across the metadata.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 4 ++--
 meta/recipes-core/glibc/glibc_2.22.bb                  | 4 ++--
 meta/recipes-devtools/mmc/mmc-utils_git.bb             | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 2153ece..869cb3a 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -14,10 +14,10 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-BRANCH ?= "release/${PV}/master"
+SRC_BRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
-SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
+SRC_URI = "${GLIBC_GIT_URI};branch=${SRC_BRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            file://fix_for_centos_5.8.patch \
            ${EGLIBCPATCHES} \
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 6aaf722..c02b6c8 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -9,11 +9,11 @@ DEPENDS += "gperf-native kconfig-frontends-native"
 
 SRCREV ?= "a34d1c6afc86521d6ad17662a3b5362d8481514c"
 
-BRANCH ?= "release/${PV}/master"
+SRC_BRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
-SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
+SRC_URI = "${GLIBC_GIT_URI};branch=${SRC_BRANCH};name=glibc \
            file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
            file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
            file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 8950360..c6947e8 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
 
-BRANCH ?= "master"
+SRC_BRANCH ?= "master"
 SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${BRANCH} \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRC_BRANCH} \
            file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
 
 S = "${WORKDIR}/git"
-- 
2.5.0


