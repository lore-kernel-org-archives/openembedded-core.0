Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 29D717E323
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e6so7193869pgd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0H1d7Tq3a+BUpQb2zYsJx13XYdGoYrmLOdJUi6WlCEw=;
	b=ZnBTD0ac0tvXurB4BWutn5lbPUmJIBa1ym6MpQsc0uMKMcKDPavj5+bIr40/0D0Le/
	/HNbdg3xwrqFjq5+l5IJ01Np9gh208WmFz8vzAX0dBDOQZOsYH8QDwjprSRpgmf4i7I7
	QY9j7AAEP30qF6coK8i5maKIWdhs9feMq32W69LDs2RwVzcbGfTZ2Gr6l68Z/5IPKhPD
	idpvTBqSzVryAJgEeOtTDWXulA12lNT3xMlt8u5XUQtEdorBrEqUTGOb/Wn4ZEFnvJHn
	xSBZ6LWY5+7rX/nFRLeEk0RQ+O+tn3hwrdS8xgiALGhn8LMBO4b0d7X+ccbqnFWBFLF5
	9+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0H1d7Tq3a+BUpQb2zYsJx13XYdGoYrmLOdJUi6WlCEw=;
	b=KhbBDzXJ/5g+QHQhzdmtQtuiB7TbvlLQ5NLdrEZ8g0hAQ3EcvnMFcfLcfB+tjxOQbR
	P6nd0nIt0OyAfqJ59/z/3ycKyDZxz1Is51fEG4RkbBK1/0RTXMZOgBSaQ9bZazksaVGy
	C2zY6bZw5m9HfuMFzvTZdLuedbMbU8tg6Q67B9aZzFRG1P0yh0SoxULUpREN9WHBLsZy
	w+ZJ0Kv/pd81QXynUEvfc//bBhz3UJJimQnu0xthVzyGebpegJv6hd0F1cQNVtMsSAoj
	IE5x/6++CsJ/T7IFct/uBfy/4kxNCxyn6fCHRr1bs9ld9O/qruriDH9tRhuEz+aYSwxJ
	Y+yg==
X-Gm-Message-State: APjAAAW8uXPhKDj2WItdS7oJvfrs9E2rTzDfCLnwZKTyv5l7QoqJ8RdW
	mE9KJmLmiRwNswAIbrw6C4MDtprc
X-Google-Smtp-Source: APXvYqzfjvO5QxCqQM+hpQ1pfy+AaNnnkcN2wrsZzlSgygMibNB160V6rg+RA8kn/rwsvqFhOnonzA==
X-Received: by 2002:a17:90a:be0b:: with SMTP id
	a11mr30408553pjs.88.1559574436092; 
	Mon, 03 Jun 2019 08:07:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:51 -0700
Message-Id: <47bcd4dec32e87b7353b079f63931d11cd0568e6.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 08/21] gettext/flex/m4/bzip2/gzip/parted/slang/attr: Add make to -ptest packages
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This solves ptest runtime errors where make was missing causing the ptests
to fail.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Fixup for warrior context]
[Dropped ptest fixes for pkg w/o ptests in warrior]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb   | 2 +-
 meta/recipes-extended/gzip/gzip_1.10.bb    | 2 ++
 meta/recipes-extended/parted/parted_3.2.bb | 2 +-
 meta/recipes-extended/slang/slang_2.3.2.bb | 2 ++
 meta/recipes-support/attr/attr.inc         | 2 +-
 5 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index b89b751..b477cd8 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -48,7 +48,7 @@ PACKAGES =+ "${PN}-libfl"
 FILES_${PN}-libfl = "${libdir}/libfl.so.* ${libdir}/libfl_pic.so.*"
 
 RDEPENDS_${PN} += "m4"
-RDEPENDS_${PN}-ptest += "bash gawk"
+RDEPENDS_${PN}-ptest += "bash gawk make"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests -f ${B}/tests/Makefile top_builddir=${B} INCLUDES=-I${S}/src buildtests
diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extended/gzip/gzip_1.10.bb
index 75de970..6a5b245 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 PROVIDES_append_class-native = " gzip-replacement-native"
 
+RDEPENDS_${PN}-ptest += "make"
+
 BBCLASSEXTEND = "native"
 
 inherit ptest
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 6189fd2..ceac528 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -47,7 +47,7 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.2.bb
index e53c432..e329310 100644
--- a/meta/recipes-extended/slang/slang_2.3.2.bb
+++ b/meta/recipes-extended/slang/slang_2.3.2.bb
@@ -75,6 +75,8 @@ do_install_ptest() {
 
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 
+RDEPENDS_${PN}-ptest += "make"
+
 PARALLEL_MAKE = ""
 PARALLEL_MAKEINST = ""
 
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index cfa38a7..1a29eb3 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -41,6 +41,6 @@ do_install_ptest() {
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
 }
 
-RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
+RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix make"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


