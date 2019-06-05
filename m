Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD917D771
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 18:41:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45JyL63cHXz3L
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 20:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559760079;
	bh=4qs4IB63apncuc6Z4YyIVFjMujlocWpkC1m3LU6A5+Q=;
	h=From:To:Subject:Date:From;
	b=ewtK6nQDsB2FWCQhHXRdRE2qa/vs6o+NJn/T6emBmbletiaTk65PY7qIaiUnWrtYZ
	k9Au3newgmZUMnP+7BiujbqP9c48ee6Jtfk9fkn8KMns/K4DYErLdm008XY4PV6xBp
	NtOMp+a7bxzFmdgODxWUCVr84EVmXT16bgnzsToTocl55nvo1y/2XzsczSmSMC75rj
	drXVTP5EitsdpxCpGR+xf1WgUXcInQoiHmVyX1YptTpoiz6jWiHMEnDS8Q4a1jbd46
	Y7OJIhJM8Z4BFI7T+jGfi7JaOIoaqgcimvC0+Ngqu8PdzQY18/+neHKzkqgXhJ9qPF
	yNxNdVEdpmPShsRKGHpm5NWM8XodDZEz2fZORvCb/sYa2kOwSsHjJFvVtjABI62Lo6
	8Aa7/fivc2D52+SQKwfCWTlInvXn98Q6FTPrQP/QT1+USkTidc3N3yTKLglJuBz9dU
	JlaCXA3Yk4fIlOQUG0aEdLCQBh7oust5w8UqsziKsB5+zww83PqeM2VA1c0uIpY/9I
	yvVngD6dZ6BupKid9AZq3woI+3Lf6picI34RmofZa8m85cj2YBOq8YEA0EAz0/1DOz
	TzvLl0Ru/dUGPePdg55Fj3vAMJG21Za3q61HVQFi301LHFe97IYmpet6RDOx2nb31Q
	dpguCZH3l+YoTFOOUXL7pySM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 21:41:14 +0300
Message-Id: <20190605184116.24297-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Wed, 05 Jun 2019 18:41:19 -0000

They are now added automatically by the ptest class.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb | 2 +-
 meta/recipes-devtools/elfutils/elfutils_0.176.bb    | 2 +-
 meta/recipes-extended/sed/sed_4.2.2.bb              | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
index 54b135eaef..ed946159bd 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
@@ -113,7 +113,7 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
 ALTERNATIVE_${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
-RDEPENDS_${PN}-ptest += "${PN} coreutils procps bash bzip2 diffutils perl sed"
+RDEPENDS_${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed"
 RDEPENDS_${PN}-ptest += "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
 
 do_compile_ptest() {
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 1a5c70b088..6ed329fd55 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -44,7 +44,7 @@ inherit autotools gettext ptest
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
-RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
+RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
 
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index f10e365ea4..8e436bad80 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
 inherit autotools texinfo update-alternatives gettext ptest
-RDEPENDS_${PN}-ptest += "make ${PN}"
+RDEPENDS_${PN}-ptest += "make"
 RRECOMMENDS_${PN}-ptest_append_libc-glibc = " locale-base-ru-ru"
 
 EXTRA_OECONF = "--disable-acl \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 7e80bb45d1..9583ee3abb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
-- 
2.17.1


