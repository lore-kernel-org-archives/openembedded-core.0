Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5F84D7899B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 18:26:21 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v25-v6so3731078wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VYQIRST2XMacXlicbVeYeeW0yhimMTJpF4NWEQU352E=;
	b=gR7xq6nux9li726kGejyo+D8TECO/n5oRvcVONzZLkkFZU6u5wl+RiITPDukGsl/HJ
	HqIiKy+3ocEQcvTFtfcABLgbp8IRxfQkKt3K1it4rO6Qt4eRWRUGmAPMVDXHXq85l/xf
	hoQkE8mZguP+56ZiABBCaABER54p4hO4EDHLSTwoVovg7BsYCx54R2B9RH2h6sOkgQhx
	iGaybD12rWaz236ltxJGBkR+4JNai1TL2nlmymanew8gpkhM8DBKxZzs6eYNbIwhiPmt
	NZFqMyumndIvpB5UpgkAKXx5eaTzeGmq+1lmh0JbnL/MHisxeedhi1xs+3DQ7XOSS4Tb
	25gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VYQIRST2XMacXlicbVeYeeW0yhimMTJpF4NWEQU352E=;
	b=LcoDPYB/VjU55x01vQGnYoiHpN2s4oMfIwkFg0230UZALew8IwLZ3+XGR6nT7hJfI7
	dR6YSRGeGD2+JKAl7EvbjRwWY4oG/MVFQyHf9XnZDSXoxQTEcmytV4DqRc5KwBJj7PNC
	Q2FvtdTsikvlfksNBT8d25BgM8nsri0YnKvHVKxmTKrt7Mc/kmFdS5GSLpsWVRKFifEN
	Q0HGZZERmtMVNVCHOIg6JNGyZKJ57DaGTQfKTpzDq20/VDQ6eFIxWeA4pqS4idYJQ8lg
	3FNJ2lpyFWg/kOl6DESxI1ITPUhOit9ewgOwU9lEyea2zdE4T19zPxwPLrcHJSXOyve5
	47aw==
X-Gm-Message-State: AOUpUlGphliMsbjBJ267On3BrnVW8hMJpN+B1TSfsIDhP1mBAF0f6t8+
	egn7eLytuJkkG8fDFTP2boHRIfD4
X-Google-Smtp-Source: AAOMgpcXzkVKfSRiOt5l/r+MhHVTHrrixoOvdaRqAPbeqCpSGS2FZ6dbQZNNMP2Hs9AdvDC7LutDgQ==
X-Received: by 2002:a1c:864c:: with SMTP id
	i73-v6mr2419125wmd.40.1531938381694; 
	Wed, 18 Jul 2018 11:26:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x124-v6sm1886158wmg.38.2018.07.18.11.26.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 11:26:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 19:26:15 +0100
Message-Id: <20180718182616.18372-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] gnu-config: remove obsolete version
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
X-List-Received-Date: Wed, 18 Jul 2018 18:26:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnu-config/gnu-config/musl-support.patch       | 25 --------------
 .../gnu-config/gnu-config_20120814.bb              | 40 ----------------------
 2 files changed, 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch
 delete mode 100644 meta/recipes-devtools/gnu-config/gnu-config_20120814.bb

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch b/meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch
deleted file mode 100644
index 3147435a6e5..00000000000
--- a/meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-support musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: gnu-config-20120814/config.sub
-===================================================================
---- gnu-config-20120814.orig/config.sub	2012-09-18 02:27:45.000000000 -0700
-+++ gnu-config-20120814/config.sub	2014-03-26 00:34:19.955996709 -0700
-@@ -123,6 +123,7 @@
- maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
- case $maybe_os in
-   nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux-newlib* | \
-+  linux-musl* | \
-   linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
-   knetbsd*-gnu* | netbsd*-gnu* | \
-   kopensolaris*-gnu* | \
-@@ -1365,6 +1366,7 @@
- 	      | -cygwin* | -msys* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
- 	      | -mingw32* | -mingw64* | -linux-gnu* | -linux-android* \
- 	      | -linux-newlib* | -linux-uclibc* \
-+	      | -linux-musl* \
- 	      | -uxpv* | -beos* | -mpeix* | -udk* \
- 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
- 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
deleted file mode 100644
index 3d428b9b78f..00000000000
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "gnu-configize"
-DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=b79a4663475f4d724846463277817e0d"
-
-DEPENDS_class-native = "hostperl-runtime-native"
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV}.tar.bz2 \
-	   file://musl-support.patch \
-           file://gnu-configize.in"
-
-SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
-SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
-
-CLEANBROKEN = "1"
-
-do_compile[noexec] = "1"
-
-do_install () {
-	install -d ${D}${datadir}/gnu-config \
-		   ${D}${bindir}
-	cat ${WORKDIR}/gnu-configize.in | \
-		sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
-		    -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > ${D}${bindir}/gnu-configize
-	# In the native case we want the system perl as perl-native can't have built yet
-	if [ "${PN}" != "gnu-config-native" -a "${PN}" != "nativesdk-gnu-config" ]; then
-		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
-	fi
-	chmod 755 ${D}${bindir}/gnu-configize
-	install -m 0644 config.guess config.sub ${D}${datadir}/gnu-config/
-}
-
-PACKAGES = "${PN}"
-FILES_${PN} = "${bindir} ${datadir}/gnu-config"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


