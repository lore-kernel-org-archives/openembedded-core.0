Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63FD87888A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p84so14702884pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i1N0tkf/k2LnmMF1x5/ocGYITkfzxdxUjdWJoTQShHE=;
	b=RJLzR81Wsi7MizGrqxdX33fpF3UhOx9JKOcABj7MbsH13F6CRnnpW6AbOTYs8rmJBf
	lNxDFe94Hzpq6wuy0ONXze/Fb/65LIcsLYBWV8GYocwcRYldLCOqR274XSzqtMU75/im
	Ou+DHBlXxCYAJIWTfEqBH0pux58S6TgAht+p12UDoIVfkYB2i0eVu3xnIAQBp1Qs/+Z/
	XVeXppvG7mgSFk1DmeTXENQWny6YjfXFDclb+bbMBn19uI+xIOqFBbid67KO0DJWsX29
	6gpml6vLI3/DxDqT1ijUv4XvNCPuHlymTPnDEJcSeD/7z15IP/peX5+xAqrlCLtsN6R1
	Bnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i1N0tkf/k2LnmMF1x5/ocGYITkfzxdxUjdWJoTQShHE=;
	b=mJ1Xehw5mUSJRGCBa41RclTXtT58GBs3OCuXscscJ46JRVdtw6OhaXJIWZ1nDOuWWc
	pdAWUTOluZljNQ/uwhZgTyd0/XL6DLBXmBe+8BM0Sv2JRsK11NEp0AgI3O4wlkckFMaj
	NBdgIzqrsYQuCW2bj0CBeChmLTWPQ7uHP7C6o8czkjrU715wuOGWTtoouBBOmgkqVc9o
	0xMTfdz5gmGhMkEvu632XSRs5MK/5jXuw2/6nPAKx9tYPoj/7jzIlM6GCFZRWqyfPVcK
	oNzLxqsRaSTT5odgg6t2aqJZnKEhwbo3ALNzcH1V48iF9N6R/juPTppIaGSnPWEF0RWz
	dmtA==
X-Gm-Message-State: AKGB3mIgVCdMCw1Pr9KyzrLy6imbjBE48HBq4ORG7R8kbvCTj8CdaLRO
	Sh99IDHzGR71VJcLto0/f88cVA==
X-Google-Smtp-Source: ACJfBovC7bT73WGYiaSl/QoSp+6QJJvzno3lU5ScjgNjC1K9X/BCUjKHguq8E/ZSBRemqOqnXYYLWg==
X-Received: by 10.98.149.72 with SMTP id p69mr3036116pfd.76.1513099415620;
	Tue, 12 Dec 2017 09:23:35 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:17 -0800
Message-Id: <20171212172317.601-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 9/9] gcc-6.4: Fix libgfortran build
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:34 -0000

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 .../gcc/gcc-6.4/0057-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 03f2bf045d..a191fd70a3 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -76,6 +76,7 @@ SRC_URI = "\
            file://0054_all_nopie-all-flags.patch \
            file://0055-unwind_h-glibc26.patch \
            file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
+           file://0057-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch
new file mode 100644
index 0000000000..30b135b978
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch
@@ -0,0 +1,53 @@
+Without this patch libbacktrace cannot be included/link during
+libgfortran build.
+
+libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
+or unhandled argument `../libbacktrace/libbacktrace.la'
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+
+diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
+index 39d3e11d223c..b5efe6dfe195 100644
+--- a/libgfortran/Makefile.am
++++ b/libgfortran/Makefile.am
+@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+ libgfortran_la_DEPENDENCIES = $(version_dep) libgfortran.spec $(LIBQUADLIB_DEP)
+@@ -63,7 +63,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
+ 	      -I$(MULTIBUILDTOP)../libgcc \
+ 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
+ 	      -I$(MULTIBUILDTOP)../libbacktrace \
+-	      -I../libbacktrace
++	      -I../../libbacktrace
+ 
+ # Fortran rules for complex multiplication and division
+ AM_CFLAGS += -fcx-fortran-rules
+diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
+index 7ed080cf7b0d..d197fbd6b683 100644
+--- a/libgfortran/Makefile.in
++++ b/libgfortran/Makefile.in
+@@ -598,7 +598,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+ 
+@@ -618,7 +618,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
+ 	      -I$(MULTIBUILDTOP)../libgcc \
+ 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
+ 	      -I$(MULTIBUILDTOP)../libbacktrace \
+-	      -I../libbacktrace
++	      -I../../libbacktrace
+ 
+ gfor_io_src = io/size_from_kind.c $(am__append_2)
+ gfor_io_headers = \
-- 
2.15.1


