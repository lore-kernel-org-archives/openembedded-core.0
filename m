Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 81555745D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 15:48:41 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id a12-v6so17391190wro.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=GOUMoyP0bExfxhKUKTYHJEabKgZ4F9jzJEPBkrFw9Uc=;
	b=gg9ecB2GUehX1CQb9wGNlpwQ7Vz4DMa166ZaSzSaR9UBc+ke70zkoJccKxq7V1gPeN
	6WiBy4cbOFIUyeBVrW3ohjqpWfLp+CVHoiQfBYn54gjwLFewu5Ktv0jxNFOV8bubKwi5
	6nKICVqHrIjQxoKId1NGjm9eQ/OJoWVK9LGKi+2OS0sOR+qYJfQhGH95JGC3uRDjhAvG
	4O55bPX/vTG9v6CjYyp2c+Q3pgzHflXQletWyKfxIa+jVSJZczuIa5QHnZnGs02WBvuL
	R+PHoWiUFSc9VhJrXVhd/L40/0DqAqCG3oj813nTEbdoSxfZNYD75zgTsPzx/uctCGRQ
	Fd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GOUMoyP0bExfxhKUKTYHJEabKgZ4F9jzJEPBkrFw9Uc=;
	b=Ec4LMlCYe54rZ6Zmgt/8+61Q41vLF+4YqVJ7YE2hZ6Jo7klh+gX1wwqzbhm72qGgee
	/0bdawej0yLpNIl/Kbf0LSwckYg5ncSPO4+Ec/Yi+AZbH3aaJHdzOehQBFv36ZzvfYuK
	a+AkJkwpDFRy6/2l6+TIxRGxokIONDRANecQPHTwIcHwBrhpx/CHNEvVHJYqz+pK0v9v
	xLY+i1HbVqmWYkd5U/PtevIOVkJva1p2H2LDSHKwbRuRjA4G+d8dEK9lBzkLbjLoE3bO
	SdWfZ2Oz6zGTMihceNi+3Pk4bg7ei0EmveFBwzO1obOzxfE9rFHHCvIAlf/CoUZdLZaq
	nIsw==
X-Gm-Message-State: APt69E1gbt6U/J4HQIdVB6Z6FgWmaslypdoM41Utr7UgdxesEuE2Ht/X
	40lPAK5mm0sErNr1dnL4XN6+M5wX
X-Google-Smtp-Source: ADUXVKLV3Lhi7VcgxNeVx2yApOh5uNyjMGlA/ibhrVi3DTPC0dOdpBuji9ssetmbiM1glwFoGVwGNQ==
X-Received: by 2002:adf:a419:: with SMTP id
	d25-v6mr10696573wra.121.1529336921834; 
	Mon, 18 Jun 2018 08:48:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m10-v6sm16482685wrq.56.2018.06.18.08.48.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 08:48:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 16:48:33 +0100
Message-Id: <20180618154833.10526-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mktemp: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 15:48:41 -0000

Both busybox and coreutils provide mktemp, and the only difference between those
(and standalone mktemp) is that coreutils supports --suffix.

Also mktemp.org has disappeared, so it's fair to assume that the standalone
mktemp (last released in 2010) is dead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../packagegroups/packagegroup-self-hosted.bb      |  1 -
 .../mktemp/files/disable-strip.patch               | 15 ---------
 .../mktemp/files/fix-parallel-make.patch           | 24 ---------------
 meta/recipes-extended/mktemp/mktemp_1.7.bb         | 36 ----------------------
 .../packagegroup-core-full-cmdline.bb              |  1 -
 .../packagegroups/packagegroup-core-lsb.bb         |  1 -
 8 files changed, 80 deletions(-)
 delete mode 100644 meta/recipes-extended/mktemp/files/disable-strip.patch
 delete mode 100644 meta/recipes-extended/mktemp/files/fix-parallel-make.patch
 delete mode 100644 meta/recipes-extended/mktemp/mktemp_1.7.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 2edcd5838bf..58c110dbe42 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -242,7 +242,6 @@ DISTRO_PN_ALIAS_pn-mini-x-session = "OSPDT"
 DISTRO_PN_ALIAS_pn-mkelfimage = "Ubuntu=mkelfimage Fedora=mkelfimage"
 DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 DISTRO_PN_ALIAS_pn-mkfontscale = "Mandriva=mkfontscale Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
-DISTRO_PN_ALIAS_pn-mktemp = "Mandriva=mktemp Fedora=mktemp"
 DISTRO_PN_ALIAS_pn-mmc-utils = "OE-Core"
 DISTRO_PN_ALIAS_pn-modutils-initscripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-mtd-utils = "Debian=mtd-utils Ubuntu=mtd-utils"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9382d23ef9e..585eac4fc74 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -492,7 +492,6 @@ RECIPE_MAINTAINER_pn-mkelfimage = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-mkfontdir = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-mktemp = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-mmc-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 28f06d9c5aa..9a6721ce031 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -80,7 +80,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     libstdc++-dev \
     libtool \
     make \
-    mktemp \
     perl-module-re \
     perl-module-text-wrap \
     pkgconfig \
diff --git a/meta/recipes-extended/mktemp/files/disable-strip.patch b/meta/recipes-extended/mktemp/files/disable-strip.patch
deleted file mode 100644
index e06869e3adf..00000000000
--- a/meta/recipes-extended/mktemp/files/disable-strip.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/Makefile.in b/Makefile.in
-index 37b3cc9..f1026f3 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -95,7 +95,7 @@ install-dirs:
- 	    $(DESTDIR)$(mandir)/man1
- 
- install-binaries: $(PROG)
--	$(INSTALL) -m 0555 -s $(PROG) $(DESTDIR)$(bindir)/$(PROG)
-+	$(INSTALL) -m 0555 $(PROG) $(DESTDIR)$(bindir)/$(PROG)
- 
- install-man:
- 	$(INSTALL) -m 0444 $(srcdir)/mktemp.$(mantype) \
diff --git a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch b/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
deleted file mode 100644
index f3b6dcc34ab..00000000000
--- a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-This fixes the parallel make install failure
-
-Upstream-Status: Accepted
-http://www.gratisoft.us/bugzilla/show_bug.cgi?id=528
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: mktemp-1.7/Makefile.in
-===================================================================
---- mktemp-1.7.orig/Makefile.in
-+++ mktemp-1.7/Makefile.in
-@@ -94,10 +94,10 @@ install-dirs:
- 	$(SHELL) $(srcdir)/mkinstalldirs $(DESTDIR)$(bindir) \
- 	    $(DESTDIR)$(mandir)/man1
- 
--install-binaries: $(PROG)
-+install-binaries: install-dirs $(PROG)
- 	$(INSTALL) -m 0555 $(PROG) $(DESTDIR)$(bindir)/$(PROG)
- 
--install-man:
-+install-man: install-dirs
- 	$(INSTALL) -m 0444 $(srcdir)/mktemp.$(mantype) \
- 	    $(DESTDIR)$(mandir)/man1/mktemp.1
- 
diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
deleted file mode 100644
index e8ae5c6b724..00000000000
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Enables safe temporary file creation from shell scripts"
-HOMEPAGE = "http://www.mktemp.org/"
-BUGTRACKER = "http://www.mktemp.org/bugs"
-SECTION = "console/utils"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"
-
-PR = "r3"
-
-SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${BPN}-${PV}.tar.gz \
-        file://disable-strip.patch \
-        file://fix-parallel-make.patch \
-        "
-
-SRC_URI[md5sum] = "787bbed9fa2ee8e7645733c0e8e65172"
-SRC_URI[sha256sum] = "8e94b9e1edf866b2609545da65b627996ac5d158fda071e492bddb2f4a482675"
-
-inherit autotools update-alternatives
-
-EXTRA_OECONF = "--with-libc"
-
-do_install_append () {
-	if [ "${base_bindir}" != "${bindir}" ] ; then
-		install -d ${D}${base_bindir}
-		mv ${D}${bindir}/mktemp ${D}${base_bindir}/mktemp
-		rmdir ${D}${bindir}
-	fi
-}
-
-ALTERNATIVE_${PN} = "mktemp"
-ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
-ALTERNATIVE_PRIORITY = "60"
-
-ALTERNATIVE_${PN}-doc = "mktemp.1"
-ALTERNATIVE_PRIORITY_${PN}-doc = "300"
-ALTERNATIVE_LINK_NAME[mktemp.1] = "${mandir}/man1/mktemp.1"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 92881e9f322..22b3f6782fe 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -86,7 +86,6 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
-    mktemp \
     ncurses \
     net-tools \
     popt \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 53d100ce740..ef6347c7120 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -158,7 +158,6 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     make \
     man \
     man-pages \
-    mktemp \
     msmtp \
     patch \
     procps \
-- 
2.11.0


