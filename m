Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACEC7F7AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 16:15:40 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k197so19697218pga.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 08:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WeQ2Ffd6xvXsmLWvKnOj5LMeiUT6cCwbNvvcOjLycvg=;
	b=lXOYCaAmywdFU+VvcUuJrw7wvNGDcCr7/u8AezCrQu9RVhZbWgmn7tZwvCsKFVJag/
	L50LMWZTYQYWikQYQ5r47pCguNpmnMYdjC1wg9RHoPawP+/dIQaYskgN3icYLfH5u13u
	LMTtbKxfUNam2gHe3Pje9dB5IbL4BbE7ktig6wORfaU/dtTOtsz9B7DW/4ySQZNRYcMv
	laWWDjW9L83yj77Ws3iicgtUHojQjVokM7fIrbBdXvsoe2WqV7gix/po2UFwBXlCHOmF
	WcQWKN7uylN/t9bZX4S13AWpD9+hypog9MoVx0moebR5agoceL/N6yehDrRxJt+6JMcQ
	hPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WeQ2Ffd6xvXsmLWvKnOj5LMeiUT6cCwbNvvcOjLycvg=;
	b=HBPOJs0F6WW4HDhKPaZYUEUwY0yiY7QuqK2c1nGJgvzGrDigTj8ZmkCSKfu2anKZVI
	EwbXN5I4KoVZklk4SyAKWRgNvkte7ObThfQyvsfPCABRipCUEUEzaT/fu4loSNseqfPo
	eFF8eZakv0b9OVSkvMKkUG7rEogXmhcMW0+oa8MvCWWxYPs9CuuWJH6JmibnA7kUnv7V
	0fnpz5I4KKN4RNWWrWyAMAgmQv+qu0WMxtz236lv73Sjafm7z//Lfm++ONdIoLLVpthk
	K/5zIgC20/ofbiPXxPiDvynTCH/3zD1f0jyWv9vOua10Vl6vAATrEEmwS8yisgaruhmI
	O6bg==
X-Gm-Message-State: APjAAAXURIu5pfe99n9sp/TlywqguDnR03UhqzQ/mpwuwvZjZuBYvoEZ
	V4PaoTLnY8BUXUj0wojWkInpi8gva9k=
X-Google-Smtp-Source: APXvYqyrXEQQ+dStkGrEBgT9vPlNUneQphRYf2xXIhEYQSaFBmLXFJfNj0BKm261CVWuAnsOCOqjuA==
X-Received: by 2002:a65:6088:: with SMTP id t8mr79622197pgu.329.1577808941643; 
	Tue, 31 Dec 2019 08:15:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	a22sm60770180pfk.108.2019.12.31.08.15.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 08:15:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 08:15:34 -0800
Message-Id: <20191231161534.67158-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V2] nfs-utils: Drop unneeded patches, cmdline option overrides
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
X-List-Received-Date: Tue, 31 Dec 2019 16:15:41 -0000
Content-Transfer-Encoding: 8bit

0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch is no longer
needed

disabling format warnings is no longer needed as well therefore remove
it from recipe and address the warnings (if any in patches)

Ensure that it can build with clang as well on the way via the new clang-warnings.patch
patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve commit message a bit

 ...-Do-not-fatalize-Wmissing-prototypes.patch | 40 ------------
 .../nfs-utils/nfs-utils/clang-warnings.patch  | 61 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.4.2.bb              |  5 +-
 3 files changed, 62 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
deleted file mode 100644
index d14f0789ff..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 66471fbf7106917da7a1536b18a0a77d07479779 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Mon, 17 Dec 2018 15:29:47 +0800
-Subject: [PATCH] configure.ac: Do not fatalize -Wmissing-prototypes
-
-There comes below error when run "make -C tests/nsm_client nsm_client"
-| nlm_sm_inter_svc.c:20:1: error: no previous prototype for 'nlm_sm_prog_3' [-Werror=missing-prototypes]
-
-It is because rpcgen doesn't generate -Wmissing-prototypes
-free code for nlm_sm_inter_svc.c with below logic
-in tests/nsm_client/Makefile.am
-[snip]
-GENFILES_SVC    = nlm_sm_inter_svc.c
-[snip]
-$(GENFILES_SVC): %_svc.c: %.x $(RPCGEN)
-        test -f $@ && rm -rf $@ || true
-        $(RPCGEN) -m -o $@ $<
-
-So add the logic not to fatalize -Wmissing-prototypes.
-
-Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154503260323936&w=2]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 50002b4..aebff01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -582,7 +582,7 @@ my_am_cflags="\
-  -Wall \
-  -Wextra \
-  $rpcgen_cflags \
-- -Werror=missing-prototypes \
-+ -Wmissing-prototypes \
-  -Werror=missing-declarations \
-  -Werror=format=2 \
-  -Werror=undef \
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
new file mode 100644
index 0000000000..20400fef67
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
@@ -0,0 +1,61 @@
+Detect warning options during configure
+
+Certain options maybe compiler specific therefore its better
+to detect them before use.
+
+nfs_error copies the format string and appends newline to it
+but compiler can forget that it was format string since its not
+same fmt string that was passed. Ignore the warning
+
+Wdiscarded-qualifiers is gcc specific and this is no longer needed
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -599,7 +599,6 @@ my_am_cflags="\
+  -Werror=parentheses \
+  -Werror=aggregate-return \
+  -Werror=unused-result \
+- -Wno-cast-function-type \
+  -fno-strict-aliasing \
+ "
+ 
+@@ -619,9 +618,10 @@ CHECK_CCSUPPORT([-Werror=format-overflow
+ CHECK_CCSUPPORT([-Werror=int-conversion], [flg2])
+ CHECK_CCSUPPORT([-Werror=incompatible-pointer-types], [flg3])
+ CHECK_CCSUPPORT([-Werror=misleading-indentation], [flg4])
++CHECK_CCSUPPORT([-Wno-cast-function-type], [flg5])
+ AX_GCC_FUNC_ATTRIBUTE([format])
+ 
+-AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4"])
++AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4 $flg5"])
+ 
+ # Make sure that $ACLOCAL_FLAGS are used during a rebuild
+ AC_SUBST([ACLOCAL_AMFLAGS], ["-I $ac_macro_dir \$(ACLOCAL_FLAGS)"])
+--- a/support/nfs/xcommon.c
++++ b/support/nfs/xcommon.c
+@@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
+ 
+      fmt2 = xstrconcat2 (fmt, "\n");
+      va_start (args, fmt);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+      vfprintf (stderr, fmt2, args);
++#pragma GCC diagnostic pop
+      va_end (args);
+      free (fmt2);
+ }
+--- a/utils/mount/stropts.c
++++ b/utils/mount/stropts.c
+@@ -1094,9 +1094,7 @@ static int nfsmount_fg(struct nfsmount_i
+ 		if (nfs_try_mount(mi))
+ 			return EX_SUCCESS;
+ 
+-#pragma GCC diagnostic ignored "-Wdiscarded-qualifiers"
+ 		if (errno == EBUSY && is_mountpoint(mi->node)) {
+-#pragma GCC diagnostic warning "-Wdiscarded-qualifiers"
+ 			/*
+ 			 * EBUSY can happen when mounting a filesystem that
+ 			 * is already mounted or when the context= are
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
index df3070bd8b..6647d3428b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
@@ -31,9 +31,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
+           file://clang-warnings.patch \
            "
-SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
-
 SRC_URI[md5sum] = "d427c6b3014e9a04e8498f0598b1c1b9"
 SRC_URI[sha256sum] = "4464737a03d5f73ded2ffefe19d5543ed7b1d6c541985d8acaafdc8025aa1038"
 
@@ -62,8 +61,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --with-statdpath=/var/lib/nfs/statd \
                "
 
-CFLAGS += "-Wno-error=format-overflow"
-
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-- 
2.24.1


