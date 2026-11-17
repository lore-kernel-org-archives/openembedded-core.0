Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12547.1794899208961808844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hHempIke;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso2197437a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899208; x=1795504008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqzf48rjfAM4EHEPW0FsAA7FSXeKtJoJIfsrpGgVy7k=;
        b=hHempIkeiIaV47xBi93q31u/p4UvSCVkvtASKi9hDUEebZ4FizbreShjCsqQJdEUDX
         4MaWEEN4bXmxnzI9dj6M3njCVIJ3P7EbASMdaEc32L+iPeBd5ZLd1TPlhcMkMf0oS6C3
         GCvX0LbltN5P5Z+izoh4q3wjAY6Q3lO0eXOZjsgO00o4xAykxh81lELHNztGkiBJ5aQq
         srQFBIA/pPoAvzq2bP77c2J3S+6E2ZNlphS8q4CDqRIzB9d3VmSDuJO/0w833VMbQnV0
         zZiFd7mtjzZKQYMe+rSHBkFV8IGF72p6mv/y2ed9P1ylSiTc2JaWPfcafsEnyvkGrSPP
         yFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899208; x=1795504008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqzf48rjfAM4EHEPW0FsAA7FSXeKtJoJIfsrpGgVy7k=;
        b=aKQrk1jTUq5fLSmaRBnwUeGBuTiOqWVWplGcknmf98tjPLcUfQS+iomqVrGoHKVxaH
         kg9qzZetElJvas6q0vDKNR4QOXjRYPeXta3uCWpFUZJBqSChKVtHN5YH1FXT5h54azO2
         mUBoU9pBWvrm4p7dL7TOHrOLka6rR7bOgaCsJV/7i9j+vvW3QQ/rWMlRcAtTgt1tkk8u
         DSFQw6l0kDWzjnSignXfGsGeoDaV0S38ZECzj41cCBLdK34tNwoA30n8ygZYBE4L1uhs
         30MG6v/bEsfUMoYuj32EeFFl4XavNh480LKdcvImCyXuArvjKXEiLIX6MmIG8JDWjZ3U
         qwig==
X-Gm-Message-State: APuU4Z/nNKmvrioVPfKh56DC0TkJiCvCbGYrgJZENtr4v7HnPVVZaYrx
	+6saF+ujwE6Io9+RmU6r9htCbUd6SNRztxpnsWEoCXFoD05EhyVmDRTVJFeKXgMs
X-Gm-Gg: AZFdTZeyIH52vWt6T8yViWWpJLrMx/5iF815SW3Qe5UBzrwK4A2S/gP9SWpRfJJH0Ed
	vacg5dyiwYn+do6G8qphysDKSOLKgdFy2euixkPQqecisJFJMb5Cz6zKWgUc/Fy45y6eOeSCfJO
	I962F2SMbNI/d3BXzywICtUwzC/kz+EgFxeamTB0rZRK2dpt2pnjnejZT7aGpzxrauBhHrrfBOu
	QIAeFhXS3hmKPKVc7pk/YwxnelALrE08Fi9TNBKm2TirATyJGyTqZX4dIPOFV9qweqbyg7LY8/1
	yL/GwJ4fITgEhh5xREyTlc88ksHEmgVtGZXrGyHiU28lD4DSI2kQK1e218NV1SWtycx03yyWv6+
	1EWKGNcjR8iBfqpCl/Ra9xmDw6jzm3ZQA5D4Mp79cLm3dWmaw5WGaNf4NnXqkJM4El9y8HS+1Xo
	w3w+8G0xWLCrqSjHFMLa4Qu9PKISfALux52PY5ALajw1U9VyRpj7IB+4QpaxGETaHDDSMXDyTbR
	2C/Psrs/bM3aUtQ074r1ICxMPJilzjVTwQZVaGPQEmD9vnLOTi2xHV/m+XfHM2Vt5PXLBlNGnY2
	Ku2BNRRqEQUxqcwCgQlJ0U17CUMKNA+0UdQC+G81+y02LnQZDdSfxOUJPotAj5IhY9FrYiYpKDS
	2SYzzvR9n9A==
X-Received: by 2002:a17:90b:37d0:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b1b07e9b1amr12809561a91.3.1794899208104;
        Mon, 16 Nov 2026 23:06:48 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm2595929a91.12.2026.11.16.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:06:47 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [scarthgap][PATCH 2/2] gnupg: fix CVE-2026-105712
Date: Tue, 17 Nov 2026 16:06:25 +0900
Message-Id: <20261117070625.3040397-2-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117070625.3040397-1-ragaprasanth@gmail.com>
References: <20261117070625.3040397-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 07:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250408
Content-Type: text/plain; charset="utf-8"

gpgtar does not check the output directory given with --directory.
Backport the upstream fix and its follow-up, as done for wrynose. The
follow-up uses gnupg_access() since 2.4.9 lacks COMPAT_NO_DIR_CHECK.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
Tested on qemux86-64: gpgtar refuses a non-empty or symlinked
--directory, an empty one still works, and --dry-run into a
non-existing directory still succeeds.

 .../gnupg/CVE-2026-105712-regression.patch    |  40 ++++
 .../gnupg/gnupg/CVE-2026-105712.patch         | 194 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.9.bb     |   2 +
 3 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
new file mode 100644
index 0000000000..d2b49b74fe
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
@@ -0,0 +1,40 @@
+From 1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Tue, 14 Apr 2026 04:32:00 +0000
+Subject: [PATCH] tools:gpgtar: Fix for a case of non existing dir with -C.
+
+* tools/gpgtar-extract.c (gpgtar_extract): Call the
+check_output_directory function only when DIRNAME exists.
+
+--
+GnuPG-bug-id: 8159
+
+CVE: CVE-2026-105712
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5]
+
+Backport Changes:
+- Used gnupg_access() for the existence check because 2.4.9 does not
+  have the upstream COMPAT_NO_DIR_CHECK compatibility flag.
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit 1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
+---
+ tools/gpgtar-extract.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/gpgtar-extract.c b/tools/gpgtar-extract.c
+index 5ca80cb..a5a925c 100644
+--- a/tools/gpgtar-extract.c
++++ b/tools/gpgtar-extract.c
+@@ -504,7 +504,8 @@ gpgtar_extract (const char *filename, int decrypt)
+           goto leave;
+         }
+ 
+-      if (!check_output_directory (dirname))
++      if (gnupg_access (dirname, F_OK) == 0
++          && !check_output_directory (dirname))
+         {
+           err = gpg_error (GPG_ERR_INV_ARG);
+           goto leave;
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch
new file mode 100644
index 0000000000..9b0bc1ca66
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch
@@ -0,0 +1,194 @@
+From 8df56dd913f3c910c9b265691efaac6c36a007a1 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 20 Mar 2026 13:33:00 +0900
+Subject: [PATCH] tool:gpgtar: Check the output directory with --directory.
+
+* doc/tools.texi (gpgtar): Clarify about the --directory option.
+* tools/gpgtar-extract.c (check_output_directory): New.
+(gpgtar_extract): Call check_output_directory.
+
+--
+
+GnuPG-bug-id: 8159
+
+CVE: CVE-2026-105712
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/7a2692fe5e580ae3bbb2a47abc4baaf1af65aa88]
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit 7a2692fe5e580ae3bbb2a47abc4baaf1af65aa88)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ doc/tools.texi         |  11 ++--
+ tools/gpgtar-extract.c | 123 ++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 128 insertions(+), 6 deletions(-)
+
+diff --git a/doc/tools.texi b/doc/tools.texi
+index 45f3e897d..691b7dc9c 100644
+--- a/doc/tools.texi
++++ b/doc/tools.texi
+@@ -2024,11 +2024,12 @@ Do not actually output the extracted files.
+ @item --directory @var{dir}
+ @itemx -C @var{dir}
+ @opindex directory
+-Extract the files into the directory @var{dir}.  The default is to
+-take the directory name from the input filename.  If no input filename
+-is known a directory named @file{GPGARCH} is used.  For tarball
+-creation, switch to directory @var{dir} before performing any
+-operations.
++Extract the files into the directory @var{dir}.  It raises an error
++when @var{dir} is not empty, or @var{dir} is a symlink to other
++directory.  When this option is not given, the default is to take the
++directory name from the input filename.  If no input filename is known
++a directory, named @file{GPGARCH} is used.  For tarball creation,
++switch to directory @var{dir} before performing any operations.
+ 
+ @item --files-from @var{file}
+ @itemx -T @var{file}
+diff --git a/tools/gpgtar-extract.c b/tools/gpgtar-extract.c
+index d23ccc579..5ca80cb89 100644
+--- a/tools/gpgtar-extract.c
++++ b/tools/gpgtar-extract.c
+@@ -24,6 +24,8 @@
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <dirent.h>
++#include <fcntl.h>
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -369,6 +371,112 @@ create_directory (const char *dirprefix)
+ }
+ 
+ 
++/* Check the output directory DIRNAME if it's not symlink and empty.
++   Return 1 if good, 0 otherwise.  */
++static int
++check_output_directory (const char *dirname)
++{
++#ifdef HAVE_W32_SYSTEM
++#define dirent _wdirent
++#define DIR _WDIR
++#define readdir _wreaddir
++#define closedir _wclosedir
++#endif
++  DIR *d;
++  struct dirent *dent;
++  int count = 0;
++
++#ifdef HAVE_W32_SYSTEM
++  wchar_t *wdirname;
++  DWORD attr;
++
++  wdirname = utf8_to_wchar (dirname);
++  if (!wdirname)
++    return 0;
++
++  attr = GetFileAttributesW (wdirname);
++
++  if (attr == INVALID_FILE_ATTRIBUTES)
++    {
++      log_error ("error getting attributes '%s': %s\n", dirname, w32_strerror (-1));
++      xfree (wdirname);
++      return 0;
++    }
++  else if ((attr & FILE_ATTRIBUTE_REPARSE_POINT))
++    {
++      /* It's reparse point (possibly symlink), not good.  */
++      log_error ("Not a regular directory (may be symlink): %s\n", dirname);
++      xfree (wdirname);
++      return 0;
++    }
++
++  d = _wopendir (wdirname);
++  xfree (wdirname);
++#else
++# if O_NOFOLLOW == 0
++  struct stat sbuf;
++
++  if (lstat (dirname, &sbuf))
++    return 0;
++
++  if (S_ISLNK (sbuf.st_mode))
++    {
++      /* It's symlink, not good.  */
++      log_error ("It's symbolic link: %s\n", dirname);
++      return 0;
++    }
++
++  d = opendir (dirname);
++# else
++  int fd;
++
++  /* With O_NOFOLLOW, make sure it's not symlink.  */
++  fd = open (dirname, (O_RDONLY | O_NOFOLLOW));
++  if (fd < 0)
++    {
++      log_error ("Can't open (symlink?): %s\n", dirname);
++      return 0;
++    }
++
++  d = fdopendir (fd);
++# endif
++#endif
++
++  if (d == NULL)
++    return 0;
++
++  while ((dent = readdir (d)) != NULL)
++    {
++      if (dent->d_name[0] == '.' && dent->d_name[1] == 0)
++        continue;
++
++      if (dent->d_name[0] == '.' && dent->d_name[1] == '.'
++          && dent->d_name[2] == 0)
++        continue;
++
++      count++;
++    }
++
++  /* In case of fdopendir, FD is released by closedir. */
++  closedir (d);
++
++  if (count)
++    {
++      /* It's not empty, not good.  */
++      log_error ("Directory not empty: %s\n", dirname);
++      return 0;
++    }
++
++  /* Good.  */
++  return 1;
++}
++
++#ifdef HAVE_W32_SYSTEM
++#undef dirent
++#undef DIR
++#undef readdir
++#undef closedir
++#endif
+ 
+ gpg_error_t
+ gpgtar_extract (const char *filename, int decrypt)
+@@ -388,7 +496,20 @@ gpgtar_extract (const char *filename, int decrypt)
+   memset (&tarinfo_buffer, 0, sizeof tarinfo_buffer);
+ 
+   if (opt.directory)
+-    dirname = xtrystrdup (opt.directory);
++    {
++      dirname = xtrystrdup (opt.directory);
++      if (!dirname)
++        {
++          err = gpg_error_from_syserror ();
++          goto leave;
++        }
++
++      if (!check_output_directory (dirname))
++        {
++          err = gpg_error (GPG_ERR_INV_ARG);
++          goto leave;
++        }
++    }
+   else
+     {
+       if (opt.filename)
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.9.bb b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
index 57f918b75f..f211dcd2aa 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.9.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://CVE-2026-24882-0001.patch \
            file://CVE-2026-24882-0002.patch \
            file://CVE-2026-57062.patch \
+           file://CVE-2026-105712.patch \
+           file://CVE-2026-105712-regression.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.34.1

