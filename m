Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 874D660111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 12:29:02 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a66so27230065wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vaARyGkexyP1NJIcxqPBnLMnd8P+CPq+3Yam4PQWnXQ=;
	b=MmX/WGRG38N4ryY4I3TovdmfGwK6w5YYBor9voha9zHwL8hVsNakK/Z0WUVQIhTYcl
	qk415vrlfw7yiaToKUd9qXsvtL2CbEU3ydjjAMrtGLGdLDDFzSeRVpXLyHNYTHj/j9nZ
	2bPB2KXks0aTGsAjmsDTlufS8G1Eo+TOspr29MfkWPKn23/SOSmZLOoFAqakuM0yAi8p
	6qNtaIBVEs5Bn4DenLqnJZHEKyNF+bwASbOQSB2BYfEGJ+BAy9ykFyXd9ybC/d305Gxf
	cGbjfA80ES1n1T+jd22SRx3mnx60WLXQvg9FDVVjZ2u/GNLKTeJ8TNnrTl7wDsVn0Gcv
	HTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vaARyGkexyP1NJIcxqPBnLMnd8P+CPq+3Yam4PQWnXQ=;
	b=hoOs/BncKoy5NKr414sL//fchxPlMe/9kFA6ay8oRkoCug/wW9XzxO7vaR8MM4qZXf
	+qyn3vRW5CzAaGu9HfWayls7pJEICPVLK/zmUIlTd/jRXnOiOfKS5Qr/O+Q68qKEq+Uc
	keHPkfQuwCIlqvvVqiQIOF8R3l86ZBZf6KVaJbtAQMtUoR53KyzX7sqS/0l90uEJQp7Z
	LKnvZlOBqXepXgAOeCmn8tFG9nDEgIujXCJYGrwCIrQsGXQkrMm1ueRSgFkgFvDCSWDC
	Gk+Q2M59EzpnH7AkjiZ3NTp13EKOs7UaY1lY9yuPKA9Wy9w1Tu7X2FQ7SfKZb/UhJq9K
	H7AA==
X-Gm-Message-State: ALyK8tLZI5LA4G9V1l4MZ+P8DpTjSh6dlZAAN5iOpPJnz7E+1r52JJD7ns0hp4aHYXNKnutv
X-Received: by 10.194.203.233 with SMTP id kt9mr3422502wjc.75.1467376142410;
	Fri, 01 Jul 2016 05:29:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	hf7sm8111027wjc.48.2016.07.01.05.29.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 05:29:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 13:28:55 +0100
Message-Id: <1467376136-19506-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] gcc: remove unused patch
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
X-List-Received-Date: Fri, 01 Jul 2016 12:29:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-Symlink-c-header-in-target_triplet-for-S.patch | 49 ----------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch

diff --git a/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch b/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
deleted file mode 100644
index c598a0d..0000000
--- a/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 0ef3d75514ee5a74b7c04ea36423cff97843fbb8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 10 May 2016 01:07:24 -0700
-Subject: [PATCH] gcc-runtime: Symlink c++ header in target_triplet for SDK use
-
-We build SDKs such that gcc-cross-candian is built for only one
-target *-*-linux and then use -muclibc or -mmusl to let it compile
-code for other libc variants. This works fine when libc = glibc
-however it does not work for c++ programs when libc != glibc since
-there are c++ headers installed under ${includedir}/c++/${BINV}/${TARGET_SYS}
-which is fine when gcc-runtime and gcc-cross-candian uses same --target options
-gxx includedir searches in right triplet, but it fails with musl/uclibc
-since gcc will look for glibc based triplet but gcc-runtime will install
-them under musl/uclibc triplet.
-
-This patch symlinks the musl/uclibc triplet to glibc triplet when libc != glibc
-
-This fixes SDKs for musl/uclibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meta/recipes-devtools/gcc/gcc-runtime.inc | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
-index 8639c1c..8e4d5eb 100644
---- a/meta/recipes-devtools/gcc/gcc-runtime.inc
-+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
-@@ -70,13 +70,15 @@ do_install () {
- 	if [ -d ${D}${infodir} ]; then
- 		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
- 	fi
-+}
-+
-+do_install_append_class-target () {
- 	if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
- 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
- 	fi
--	if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
-+	if [ "${TARGET_OS}" = "linux-gnuspe" -o "${TCLIBC}" != "glibc" ]; then
- 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
- 	fi
--	chown -R root:root ${D}
- }
- 
- INHIBIT_DEFAULT_DEPS = "1"
--- 
-2.8.2
-
-- 
2.8.1


