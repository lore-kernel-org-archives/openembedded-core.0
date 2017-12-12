Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 531CD788C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c204so14685077pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wDR+EdlvUhw6VqOV5LnV13shkSXSM6cC0Otcffc1iA4=;
	b=NQW+I4oyTdyf93UnKbTvcImif/cpCde+NDCe7F2GL42z8/PzBVgwhCAu/6ycECJXrS
	fTq7S7zgIRZs4I1IB4WB1MjF9hf/Fh9eBqO3IUtfOopLoCMacxkNfv3tt3DAe+gPhXy/
	FexCdMksYWvgvzPHX5vkeRVg0pKKnE55Nw1cfth/whfGG3+Hi5uF1o1oReAFKi5U5qi5
	a9fcOcG0hCBWBMUjuFLaQU1zjIOyaeTGwGBvIgl3y51lbTHHo7rCnJhGL+ym7W2HOVCJ
	u7pgXLj4U72FwRBauqMaxs4Otsk38dSXdRE0ufa1uP/b+jEz2qhKkaL+zi10nFllKkLj
	Ew5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wDR+EdlvUhw6VqOV5LnV13shkSXSM6cC0Otcffc1iA4=;
	b=OxzQ+LxYtcYI+9MOvsl/VJ6nIPVRLxQNTUpLrwKJxzlnYq+1Y6a+qlPGZlD5Z/UJId
	aIN1ILUAqN2XvBnj+0jBQRd7SA8Go7/HAJb7QSd5Cf0mnv2BJkZ2hvObu1iiCqmVAtCf
	Pco9sCHRu8D4IdyEuMvIWLu+C0CNmRpLS208mOc9JQpllJSmsXtfMSmKzEXCNnmhQg8y
	jUg9/IXme3VxultpfDsX6IlTTvem1mZDKBleoTAUrD2yp7buq/WR3hAsNf9S6xrvEQeA
	9dreW4gAQNDbJTrM565tViDYe+tYi33SJhngLqNkjo49qw/l7Lxm9/d0rjXpNjmAQVGc
	H4Kg==
X-Gm-Message-State: AKGB3mLldxu2tbGlRLo8umgKYwnFlFRcyW8JXTyZi4JSfMtqBtFrvE38
	IDt9MyevLelfMcDrnSBHAQZPsg==
X-Google-Smtp-Source: ACJfBotts0UoKIAjg155u+JBxzBClrLc4W5wHTkdwgVW1/Qpi6FbXXcaXFhhREuBJGyE2yRZhesE1g==
X-Received: by 10.99.151.2 with SMTP id n2mr2708042pge.374.1513099414301;
	Tue, 12 Dec 2017 09:23:34 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:16 -0800
Message-Id: <20171212172317.601-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 8/9] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:33 -0000

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library
`../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 1d40cba731..baf98aeba8 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            file://0048-gcc-Enable-static-PIE.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
            file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
+           file://0051-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
new file mode 100644
index 0000000000..a71b6b0bee
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
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
+index 2857af5943f9..e07760069a3c 100644
+--- a/libgfortran/Makefile.am
++++ b/libgfortran/Makefile.am
+@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	$(HWCAP_LDFLAGS) \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
+ 	      -I$(MULTIBUILDTOP)../libgcc \
+ 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
+ 	      -I$(MULTIBUILDTOP)../libbacktrace \
+-	      -I../libbacktrace
++	      -I../../libbacktrace
+ 
+ # Fortran rules for complex multiplication and division
+ AM_CFLAGS += -fcx-fortran-rules
+diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
+index 05b183dcadb0..c9e0280e412c 100644
+--- a/libgfortran/Makefile.in
++++ b/libgfortran/Makefile.in
+@@ -581,7 +581,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	$(HWCAP_LDFLAGS) \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
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


