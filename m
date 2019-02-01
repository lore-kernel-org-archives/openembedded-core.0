Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id D269D6B005
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 15:20:59 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t27so7496254wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 07:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CFKOlE7tAcIHVzGfip42F/yRENgQB3tWnjJucELDizg=;
	b=A0LzPBzS6YwmO0DMmHcP/d/qZCCBn1wK0gy07y+oyu6sZJyw8oxQtXRZ32Tze6pK0+
	eo3t/GedNE1gkTQqZiFdJMJqNpKltOqghagmnf7uvWS5jd8ihcvi/7fAbQ4dXQUpnEFO
	nfmtYiViFObLUzotdyEYzfq1eFZzNr7Htmbe6NFURaJOrio42Adlw3IcZsJLx3Gqyg5V
	cvSA29KRYOXEAmY6rYZZKsApP/JO4bgTIGY61R9I4Xu0JOj9/NW61TQ/wkPltEnwP3Sj
	ZzS5/u7Pheis/gKsp5yTavsq9d/1zI+6SadqQW+KO4jGaU+4tVAHYAU9CdgP3vh+3pOk
	3TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CFKOlE7tAcIHVzGfip42F/yRENgQB3tWnjJucELDizg=;
	b=Zra+aF5kSvpzURdAMrRZ9lDKdoD15yCakktzf8rRxm0vP16957muC8aGdGtx0PLZKi
	7t5vVBEO6h6nw2BeTNGTlHE90XSqjpQYNV2dj8yC04Hkzvkt4f9x+KsgEkNJ1n1ziaGQ
	LDGOESK28Fa6e1UnUBjdK/eN8I61ZJg7tQaZ354D+rbCcFO5EsXWdrpq9bHwv9fdFtA0
	53aFlXPpBUCxSEXI9J8vO70ix1nnz10PGS7nmMc2rMvWYJZMV0+f6MmGWhclqZ4cuf8D
	bsMmdbDIrvysK4vCggy3HDgm5M2RijKIAaZsiEKFWdxw/XTb68P3xftS7IQJQ9PHMdoK
	WJxg==
X-Gm-Message-State: AJcUukfrTJcBON1mPJlJdzoi1L99AaXkpWndAV/fELyjsV+OedPgW8xr
	75MkuQJHhlc5kb78p9WDw2FwfIRp
X-Google-Smtp-Source: ALg8bN4h8e6HfYSFukZDMdpWfu6LgFy3CZoYGLV1Szr9JgB/dZWf7KoVMpyOFrd+C8BBDEdu5VW6fw==
X-Received: by 2002:adf:df01:: with SMTP id y1mr40640917wrl.127.1549034460009; 
	Fri, 01 Feb 2019 07:21:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l20sm14889040wrb.93.2019.02.01.07.20.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 07:20:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 16:20:49 +0100
Message-Id: <20190201152050.115214-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] perl: update perl-cross to 1.2.2
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
X-List-Received-Date: Fri, 01 Feb 2019 15:21:00 -0000

This allows us to drop the build race fixes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...oader-separately-as-race-failures-ha.patch | 31 ----------------
 ...install.perl-runs-before-install.man.patch | 27 --------------
 ...e-install.perl-depend-on-install.sym.patch | 32 -----------------
 .../files/fix-race-failures-2.patch           | 34 ------------------
 .../perl-sanity/files/fix-race-failures.patch | 36 -------------------
 .../perl-sanity/perl_5.28.1.bb                | 14 +++-----
 6 files changed, 5 insertions(+), 169 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch
 delete mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch
 delete mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch
 delete mode 100644 meta/recipes-devtools/perl-sanity/files/fix-race-failures-2.patch
 delete mode 100644 meta/recipes-devtools/perl-sanity/files/fix-race-failures.patch

diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch b/meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch
deleted file mode 100644
index 15678b83ba7..00000000000
--- a/meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9c68cdd1a89f9b944edc804d7c5d000c45de7b85 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 14 Jan 2019 11:45:20 +0100
-Subject: [PATCH] Also build dynaloader separately as race failures have been
- observed in Yocto.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/issues/72]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7846406..cd8d75f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -74,10 +74,13 @@ $(CROSSPATCHED): %.applied: %.patch
- # Force full patching before any building starts. Als, force early building
- # of miniperl -- not really necessary, but makes the build process more logical.
- # No reason to try CC if HOSTCC fails.
-+#
-+# Dynaloader is also built separately as race failures have been observed.
- all:
- 	$(MAKE) crosspatch
- 	$(MAKE) miniperl$X
--	$(MAKE) dynaloader perl$x nonxs_ext utilities extensions pods
-+	$(MAKE) dynaloader
-+	$(MAKE) perl$x nonxs_ext utilities extensions pods
- 
- config.h: config.sh config_h.SH
- 	CONFIG_H=$@ CONFIG_SH=$< ./config_h.SH
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch b/meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch
deleted file mode 100644
index 26590f59088..00000000000
--- a/meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 965adc80636e24e9608ca983c18c95cae08de021 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 21 Jan 2019 12:09:13 +0100
-Subject: [PATCH] Make sure install.perl runs before install.man
-
-Otherwise, install.man may attempt to write to non-existing directory:
-|   Can't open file /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/perl/5.28.1-r0/image/usr/libx32/perl5/5.28.1/x86_64-linux/.packlist: No such file or directory at installman line 183.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/issues/72]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index cd8d75f..82bdc1d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -410,7 +410,7 @@ install.perl: installperl | miniperl$X
- 	./miniperl_top installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
- 	-@test ! -s extras.lst || $(MAKE) extras.install
- 
--install.man: installman pod/perltoc.pod | miniperl$X
-+install.man: install.perl installman pod/perltoc.pod | miniperl$X
- 	./miniperl_top installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
- 
- ifneq ($(perlname),perl)
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch b/meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch
deleted file mode 100644
index 12673399781..00000000000
--- a/meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a0a2fcac3735ca90017976d2b87f550d051a969b Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 22 Jan 2019 19:21:27 -0800
-Subject: [PATCH] Makefile: Make install.perl depend on install.sym
-
-Fix a race issue when install, there might be no
-$(installbin)/$(perlname)$(version) when install.sym runs after install.perl
-since install.sym removes it.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/73]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index cd8d75f..1aa8ef2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -406,7 +406,7 @@ META.yml: Porting/makemeta Porting/Maintainers.pl Porting/Maintainers.pm miniper
- 
- install: install.perl install.sym install.man
- 
--install.perl: installperl | miniperl$X
-+install.perl: installperl install.sym | miniperl$X
- 	./miniperl_top installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
- 	-@test ! -s extras.lst || $(MAKE) extras.install
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/perl-sanity/files/fix-race-failures-2.patch b/meta/recipes-devtools/perl-sanity/files/fix-race-failures-2.patch
deleted file mode 100644
index bc42342e14c..00000000000
--- a/meta/recipes-devtools/perl-sanity/files/fix-race-failures-2.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e1e159a189247af1557fe400ca861714e5ed5af4 Mon Sep 17 00:00:00 2001
-From: Alex Suykov <alex.suykov@gmail.com>
-Date: Thu, 3 Jan 2019 22:03:20 +0200
-Subject: [PATCH] force crosspatch before any CC/HOSTCC rules
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/issues/72]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 01644cd..62bfc8c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -71,9 +71,13 @@ $(CROSSPATCHED): %.applied: %.patch
- # (mostly Makefile.PLs, but others can be annoying too)
- .SECONDARY:
- 
--# Force early building of miniperl -- not really necessary, but makes
--# the build process more logical. No reason to try CC if HOSTCC fails.
--all: crosspatch miniperl$X dynaloader perl$x nonxs_ext utilities extensions pods
-+# Force full patching before any building starts. Als, force early building
-+# of miniperl -- not really necessary, but makes the build process more logical.
-+# No reason to try CC if HOSTCC fails.
-+all:
-+	$(MAKE) crosspatch
-+	$(MAKE) miniperl$X
-+	$(MAKE) dynaloader perl$x nonxs_ext utilities extensions pods
- 
- config.h: config.sh config_h.SH
- 	CONFIG_H=$@ CONFIG_SH=$< ./config_h.SH
-
diff --git a/meta/recipes-devtools/perl-sanity/files/fix-race-failures.patch b/meta/recipes-devtools/perl-sanity/files/fix-race-failures.patch
deleted file mode 100644
index f3bffd0abde..00000000000
--- a/meta/recipes-devtools/perl-sanity/files/fix-race-failures.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3e2c1ddd06be97ba75104b1be4b6fdbd08e16bbe Mon Sep 17 00:00:00 2001
-From: Alex Suykov <alex.suykov@gmail.com>
-Date: Wed, 2 Jan 2019 20:37:47 +0200
-Subject: [PATCH] fix Yocto intermittent failures with modules
-
-Having -Ilib/ above -Idist/... in miniperl_top means miniperl may
-attempt to switch from dist/ to lib/ while the modules are being
-built, possibly picking incompletely-written files there.
-
-Any module available via -Idist/* should only be loaded from dist/
-and never from lib/ even if it gets installed into lib/ at some point.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/issues/72]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- miniperl_top | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/miniperl_top b/miniperl_top
-index 96ab1a2..a0426b9 100755
---- a/miniperl_top
-+++ b/miniperl_top
-@@ -25,7 +25,6 @@ top=$(cd $top; pwd)
- exec $top/miniperl\
- 	-I$top/cnf/stub\
- 	-I$top/cnf/cpan\
--	-I$top/lib\
- 	-I$top/cpan/AutoLoader/lib\
- 	-I$top/dist/Exporter/lib\
- 	-I$top/dist/Cwd\
-@@ -50,4 +49,5 @@ exec $top/miniperl\
- 	-I$top/cpan/parent/lib\
- 	-I$top/cpan/version/lib\
- 	-I$top/dist/Pod-Simple/lib\
-+	-I$top/lib\
- 	"$@"
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index a2ec264100c..dc6689738d5 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.2.1/perl-cross-1.2.1.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.2.2/perl-cross-1.2.2.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -19,17 +19,14 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://perl-dynloader.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
-           file://fix-race-failures.patch \
-           file://fix-race-failures-2.patch \
-           file://0001-Also-build-dynaloader-separately-as-race-failures-ha.patch \
-           file://0001-Make-sure-install.perl-runs-before-install.man.patch \
-           file://0001-Makefile-Make-install.perl-depend-on-install.sym.patch \
            "
 
 SRC_URI[perl.md5sum] = "838198c43d4f39d7af797e2f59c2bee5"
 SRC_URI[perl.sha256sum] = "3ebf85fe65df2ee165b22596540b7d5d42f84d4b72d84834f74e2e0b8956c347"
-SRC_URI[perl-cross.md5sum] = "c5cdc8b7ebc449ee57fe18fc1ac60c80"
-SRC_URI[perl-cross.sha256sum] = "8b706bc688ddf71b62d649bde72f648669f18b37fe0c54ec6201142ca3943498"
+SRC_URI[perl-cross.md5sum] = "9a6c05497bdde9a3106e3be9246f4da1"
+SRC_URI[perl-cross.sha256sum] = "e6987838f27d8cd3368ea68fc56a68cc52371505950927b8b7c5cb76e3a94caa"
+
+PR = "r1"
 
 S = "${WORKDIR}/perl-${PV}"
 
@@ -127,7 +124,6 @@ do_install_append_class-native () {
     # path location) works and that in the nativesdk case, the SDK can be
     # installed to a different location from the one it was built for.
     create_wrapper ${D}${bindir}/perl-native/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl5/site_perl/${PV}:${STAGING_LIBDIR}/perl5/vendor_perl/${PV}:${STAGING_LIBDIR}/perl5/${PV}'
-    create_wrapper ${D}${bindir}/perl-native/perl${PV} PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl5/site_perl/${PV}:${STAGING_LIBDIR}/perl5/vendor_perl/${PV}:${STAGING_LIBDIR}/perl5/${PV}'
 
     # Use /usr/bin/env nativeperl for the perl script.
     for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
-- 
2.17.1


