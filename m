Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4CF7DFB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:12:39 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id w1so9232538ljw.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1m505wlK4e9OxmI/di2aS9026jc1r7qOsOgKLDR4tQc=;
	b=m39x90Tg5G9rms79pb3J8Qjnm1Pk1F7V9NLPjXqIzyEmMaVyQCD6LeRSFtmAGUpimk
	+fqI3wRLh9VLcQYP03A+z4YMfUlz6MyicN+GuAcJhHjcfRygdYpKqwLTIfjkT9gyRmga
	lZ8nsdsQdINJBAzYY/mQEOk7u7j936mKJ4mCURTFcwRzuSDMpkXCWTxVGg/nkyQEGnJs
	aLu3nB53zd4sBRklnoTvmouqeJ2qy+tEKRosnuf/z7mEuFSeSmorbNIEDGwe8UuRb907
	oB+54t/5TuIV0w25KDVNlR3hhBbGt+GvxK6S9Mz/Ax84tvdtyNQTmmasAY3CIh2fetuY
	uLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1m505wlK4e9OxmI/di2aS9026jc1r7qOsOgKLDR4tQc=;
	b=jnLOx0FvS54zrUID69ByhJWduLAn8KfGuYM4WX+g3GwMfl+9Zim+79o46k7zPbpQ2m
	rMKMlgIWZJzrAwxcVQLvwxS866SZv/nlDXc9e7/1pZd9JFOEehqQaLUD6eLGHGCAc9Rt
	7oXYXNHU3mP2ZjtQJPOPedTi3AVwhzIHmhS7IagS7CnqYisgsJWVXgz8jyKRax4o2Ss5
	Uh0fSa0ANVKsMgVn6+qmIWOiRU+QJHUgRXl+qyPxcF+f2W9qnkbboh/REKCAocHMFvxX
	2w1TdLsi+wYoJLBvOreQ/3HaiFP1Hx/ZzWklzE5kIC5NDtTprE+Jyt3jjSq5w480b8Ar
	SWUA==
X-Gm-Message-State: APjAAAUQV+sZWmrC/6rGWRdmMREx9eQgxQyw5uqSAnp9L2sLpSxBEzSH
	PYUzCIQggiTNLTkH6oiCNEm+o35IyzI=
X-Google-Smtp-Source: APXvYqy5drFw511QVOJZ3dLNS/gg/t6a06/AmezTIRMrLd3iEHyRSK8jojS2VhjGR0P6HNeRooDkHw==
X-Received: by 2002:a2e:9a94:: with SMTP id p20mr21366830lji.2.1558213959546; 
	Sat, 18 May 2019 14:12:39 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id f16sm953723lfk.75.2019.05.18.14.12.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 May 2019 14:12:39 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 23:12:24 +0200
Message-Id: <1558213945-10235-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558213945-10235-1-git-send-email-liu.ming50@gmail.com>
References: <1558213945-10235-1-git-send-email-liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2 1/2] u-boot: clean up some redundant code
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
X-List-Received-Date: Sat, 18 May 2019 21:12:39 -0000

From: Ming Liu <liu.ming50@gmail.com>

- Merge some DEPENDS lines.
- Drop some unnecessary 'cd ${DEPLOYDIR}' and 'rm -f'.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9a754fd..e5af762 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,11 +5,9 @@ B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS += "kern-tools-native"
-
 inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1
 
-DEPENDS += "swig-native python-native"
+DEPENDS += "kern-tools-native swig-native python-native"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
@@ -227,6 +225,7 @@ do_install () {
 FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
 
 do_deploy () {
+    install -d ${DEPLOYDIR}
     if [ -n "${UBOOT_CONFIG}" ]
     then
         for config in ${UBOOT_MACHINE}; do
@@ -235,25 +234,20 @@ do_deploy () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -d ${DEPLOYDIR}
                     install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-                    cd ${DEPLOYDIR}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_SYMLINK}-${type}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARY}-${type}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARY}
                 fi
             done
             unset  j
         done
         unset  i
     else
-        install -d ${DEPLOYDIR}
         install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-        cd ${DEPLOYDIR}
-        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -295,7 +289,6 @@ do_deploy () {
                     if [ $j -eq $i ]
                     then
                         install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
-                        rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}
                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}
                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
@@ -307,7 +300,6 @@ do_deploy () {
             unset  i
         else
             install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-            rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
         fi
@@ -317,7 +309,6 @@ do_deploy () {
     if [ -n "${UBOOT_ENV}" ]
     then
         install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
-        rm -f ${DEPLOYDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
     fi
-- 
2.7.4


