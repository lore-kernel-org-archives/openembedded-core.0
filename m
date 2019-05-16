Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3F67DF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 11:49:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g12so2762065wro.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gkk1+EWZBgwNFXtMeN6PVaNDGO2RlbWb5lCYcdXAWsY=;
	b=DBw2SoAJ3waSj+VaV5J8EJMV5g7KbCO3/BsfK3UQd+xFpQFIUUL409hkRkCYgVEs8M
	v+niOIJkYJY6Wf8slfURhilq0W26inTeMnSZ0JH5Tsq3MXmRBXq24jJRohk4TZpCcw8i
	lGw2D9/LO/DRPVME1vCbbupRhqut1RTPxGACs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gkk1+EWZBgwNFXtMeN6PVaNDGO2RlbWb5lCYcdXAWsY=;
	b=XwoMUfbn1+FlISmC55RANlTUfDngL4C/hQwqdT+1HhZDawkgbWX3DAQiVu21+sFaI1
	zkIWgxwQpbGeR5YSdy/S+BVp1fuoLcAi7E2qKRfOa55nICZYc8XQ/ueY8slOyWENcUMB
	USDK7qwpBdLUNfcc+qHUeeI/0ZX1yZFzxVRLNLpRCcq5yE1Do17pCj47MkYujWonayE+
	VrqdSZ5r03BLw/jqx5eLCO8bkM9qre/qd4r+wnnEU1eEMU9QRuuZhSgzPpwYIyXITgEU
	JZwOKn1N4kpe1rmkxrtS9Rvic5mXx68AoIwi12M3R/RLIig4gofhrmm6tOTcJ7EX98Ep
	hbDw==
X-Gm-Message-State: APjAAAVcsmjvJp27VvN6jDTZff+QyopGQN9+3IYMLqbyZgEvmWEmlwZg
	Kt0aHC4X51iPnu6UowrhC+2N+dveMFg=
X-Google-Smtp-Source: APXvYqyhqcPOLbgt9Aw5XQoXJPUTxsJfB7sFbCDGuUMxWzgT0lVtCwGfd3qO44mdN5B5CKM/I/PtUQ==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr6056740wrt.217.1558007355924; 
	Thu, 16 May 2019 04:49:15 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f6sm5561990wro.12.2019.05.16.04.49.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 04:49:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 12:49:13 +0100
Message-Id: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gettext/flex/m4/bzip2/gzip/parted/slang/attr: Add make to -ptest packages
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
X-List-Received-Date: Thu, 16 May 2019 11:49:15 -0000
Content-Transfer-Encoding: 8bit

This solves ptest runtime errors where make was missing causing the ptests
to fail.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 1 +
 meta/recipes-devtools/flex/flex_2.6.0.bb      | 2 +-
 meta/recipes-devtools/m4/m4-1.4.18.inc        | 2 ++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb    | 2 ++
 meta/recipes-extended/gzip/gzip_1.10.bb       | 2 ++
 meta/recipes-extended/parted/parted_3.2.bb    | 2 +-
 meta/recipes-extended/slang/slang_2.3.2.bb    | 2 ++
 meta/recipes-support/attr/attr.inc            | 2 +-
 8 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 627568bc3f7..30121ad23e1 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -166,6 +166,7 @@ do_install_ptest() {
     fi
 }
 
+RDEPENDS_${PN}-ptest += "make"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
     glibc-gconv-big5 \
     glibc-charmap-big5 \
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index b89b7515b56..b477cd8c7f2 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -48,7 +48,7 @@ PACKAGES =+ "${PN}-libfl"
 FILES_${PN}-libfl = "${libdir}/libfl.so.* ${libdir}/libfl_pic.so.*"
 
 RDEPENDS_${PN} += "m4"
-RDEPENDS_${PN}-ptest += "bash gawk"
+RDEPENDS_${PN}-ptest += "bash gawk make"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests -f ${B}/tests/Makefile top_builddir=${B} INCLUDES=-I${S}/src buildtests
diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index f433b3f2dd0..af0ff45863c 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -52,6 +52,8 @@ do_install_ptest() {
                      ${D}${PTEST_PATH}/tests/test-xalloc-die
 }
 
+
+RDEPENDS_${PN}-ptest += "make"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
      locale-base-fr-fr.iso-8859-1 \
 "
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 7d04e30d536..15a8e51550a 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -40,6 +40,8 @@ do_install_ptest () {
 
 FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
 
+RDEPENDS_${PN}-ptest += "make"
+
 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extended/gzip/gzip_1.10.bb
index 75de9706310..6a5b2459e6d 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 PROVIDES_append_class-native = " gzip-replacement-native"
 
+RDEPENDS_${PN}-ptest += "make"
+
 BBCLASSEXTEND = "native"
 
 inherit ptest
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 6189fd22465..ceac52892db 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -47,7 +47,7 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.2.bb
index e53c4321b9a..e3293109379 100644
--- a/meta/recipes-extended/slang/slang_2.3.2.bb
+++ b/meta/recipes-extended/slang/slang_2.3.2.bb
@@ -75,6 +75,8 @@ do_install_ptest() {
 
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 
+RDEPENDS_${PN}-ptest += "make"
+
 PARALLEL_MAKE = ""
 PARALLEL_MAKEINST = ""
 
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index cfa38a71964..1a29eb339e7 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -41,6 +41,6 @@ do_install_ptest() {
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
 }
 
-RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
+RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix make"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


