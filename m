Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B382F78844
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 14:42:40 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u42so6529485qte.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 06:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xsb9FhVpw+Z6P+42fZFS+qp4cH56gFnEk0YLSSx2mSw=;
	b=ftDURL1j654oHj4O06wWAbF7Ye+v+j/PD2/St8AgpGxC1VGPWurBGmbhnOhiDn0TVl
	1rRDfKysROye/A9g51ucDp95euSYT6freAVMeJL/CP5FJLclFE2C9VbbnxISnHRgK+0X
	lXZWiTiv84JqnUUvsm9noX8NtTSd8AtfZiCWKJYFjx/jMFJSjqEetkDu2Qxx9/H/xpAt
	YuHJMrtgRjIetx04VseVNKjZOZLlI8MU4Wa6f1cq+hPHlwS015m6nXCWZxpnFttNZe9/
	ExVYoWqhoBX28FFJYtOt7KHF84ip6JjrX5tI9YX3Ys9vLPc0FmN7Clb+EtIIROoQsrSy
	h2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xsb9FhVpw+Z6P+42fZFS+qp4cH56gFnEk0YLSSx2mSw=;
	b=cl7ltexwhSu4mNSmOejinITbHX5vG/obqNsvq5gor2bKmQ4WXm6Oa9nsqMEp8j7MKf
	nuwDlRl/SCTP3rB70DjiVFTywHlni5bgnwYU5LRoEUEz5huck6Die2P4EKE1o9Sro0U5
	GDXEJkPtUZsWkhEqCDHRS9/T4BBMGZP09dHcGTP4etLxZFq1/YS03ENPLKA2q2bxadFc
	EmtmqYC02rS5u9mUlY6AbSspYSnhaw5XrLga5xaUtgIR9kwL+e++DHmWjjaGEWbrlC3I
	l1Sh4xKTFhb3/EMkAP4cyt5VFGVWY9gzhoSbCika/xu6ScKmdErh+REtM9DIR2lPnTAr
	Y2ug==
X-Gm-Message-State: AJaThX5cO/zM8hDmr4r5WHJFSPMwKNO7CBtFJi+VPdoFOvy9Kppybmsg
	cz0qDiVAgudNYWYwoNNzIoY0Ig==
X-Google-Smtp-Source: AGs4zMYOLEQxtf28XhvUaIF7kEbP4cXinYKPnYloHqBiWb9sjRNCKNRkv+kjD7hoNyhYLXFgC3+L6g==
X-Received: by 10.55.217.85 with SMTP id u82mr8116665qki.257.1510929761419;
	Fri, 17 Nov 2017 06:42:41 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id 13sm2604199qtv.67.2017.11.17.06.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 06:42:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 06:42:28 -0800
Message-Id: <54828c1c50a8caea8725aba3ea59bd8589a4e4ff.1510807196.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510807196.git.raj.khem@gmail.com>
References: <cover.1510807196.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Fri, 17 Nov 2017 14:42:41 -0000

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
2.15.0


