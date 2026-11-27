Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1543.1795801791938800871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=pqgJmkNU;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4805815f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801790; x=1796406590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GX/8I1zWbhbODowbkCrd86ptE6O8hTlGU1WoHxPlDlc=;
        b=pqgJmkNUqxLQB4oExyyCQIR3dL3WkB2684Flg9+DJxby3xNm2NNy2iUxCYFjcjRD6Y
         7Ham11cUZU9dEsxZtiFvRAIr7tXX0REFfpDp5yZjH3TszjMSIhByYe0JQfk1LHQmFqfp
         ttmjg8LG9AGrwzK3Sprsh78iSXE/NmXOM6QOMfLWVrLWHla6SgOwusYFOm8LcR2393lU
         LhnHYNdLiRIddH9laCFOXuo4/GlQB4EunzCi4ycWvg/BjoDc0UN1E0QDhF1QQKjLRh0/
         RvzDq+iKOGGc4Xhe/WdXqVebIhDNmzdRuiKrF52GgWUkL66V98vScFa3Id++ksbBZcFP
         Fe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801790; x=1796406590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GX/8I1zWbhbODowbkCrd86ptE6O8hTlGU1WoHxPlDlc=;
        b=vAAplZyvnMkn7t3q3JmX79rEMOiiavmNlPp0kx5+OK4OgkLDE1Mc7DaawU2zPrukWL
         4Z6V3+G9WIE744+NBu/WUQ/Rcx5S1TpOihg4Z/YHoVfSmcPObAngX+rsH1BCadYiFD2a
         46ISf3hkpoqF/Ofjxs/jc6Z8S20JvV6Xcuv57TH904qGIWK8Dvbc4HEyYcnI6YbfQdIo
         8fWHOi8es38OiAWF4CPeGBFzxmgfJ964kG9CLACCWoSEynVsqKFV0pMYLuGOQ3wD38Yg
         0JpoZSX+6osM2nBnJlYO6IaGD6bEm8MTQsGnjjPPadEjlXW+I3q6RUgo6XAmb7HvVEtc
         Ao1w==
X-Gm-Message-State: APuU4Z99n4s9Rcj5KnBLdWA6A5965uP3RbnBa42jGP4/1qAl/meqvhmu
	yD6+UoY6OYDuZjL4S7rIa1ZHqys6QgvQArSS9lf/nvXHhDtsCafXoW/pfPuueyrSd3Xga8i9U7E
	BnjjyjLg=
X-Gm-Gg: AZFdTZe96eZnazdajWhI/CpMQcmq3ei6tQ/WSpFeKxEa6MwaVHgacHx/uiM+/nKle6B
	GcWOu+uz5BxmElqHO0jOLz4YeOxLPwwRuyT5G6kWBDl27fDMzBCFu61FxlMvoQjE6OUvGyYEA5v
	nVI3qrtXlVAq3SB3/nR+ivso2AVb+zevX4QavPsQswPDiaejLg3CBJuWKvbtwE3b02LVRBFs7aT
	oyTGXms+nXXe/kWwDNBHaj/airVO4ZG+oOVMtyoCQA/GsvhHT7QT8ZFiQBPU+uCOejRRKU21dy+
	xpdtl3qEDN4x2ZlCTeSNHH1hncS7uj1bOHR9h7TL64Wb5JAwcU4S0afyBCdH19tuZEFy7hx+ykv
	TacRImSmkcdJ0M2ySunWh1pCcd0V+tcYKDzrEkmgFES1GdQBWwL58kuhkeg9F+KyBzd0bt1sWvv
	pW81CpzKeBgw775sBKeyQcATYJXGXow9ai0n8n1Dxi/gaWhqi6iNACXIEZ4WOboIPb4d24KaS0z
	rFTAlEp4C3KLZtB5XtVXebwPkm1MJpB6KbBCfGHm/MvqZ3Wh1lNYqVZ2B5qic0ixKrMdQOjW7Bd
	9z0aMTG80l5FnTGgvXl57Ih2bGycAE7YUfiqGJTNtLwWHQCD68a/lndtSD4YATouK3fx4Qbg0+w
	rhU/+x8v+yAOC5DbqAF4eVwFvugHx
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr49264033f8f.4.1795801790102;
        Fri, 27 Nov 2026 09:49:50 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/37] gnupg: fix CVE-2026-105712
Date: Fri, 27 Nov 2026 18:49:11 +0100
Message-ID: <89fcace08b898610ac3bd9035fb0106db3176d86.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251434
Content-Type: text/plain; charset="utf-8"

From: Prasanth R <ragaprasanth@gmail.com>

gpgtar does not check the output directory given with --directory.
Backport the upstream fix and its follow-up, as done for wrynose. The
follow-up uses gnupg_access() since 2.4.9 lacks COMPAT_NO_DIR_CHECK.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/CVE-2026-105712-regression.patch    |  40 ++++
 .../gnupg/gnupg/CVE-2026-105712.patch         | 194 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.9.bb     |   2 +
 3 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
new file mode 100644
index 00000000000..d2b49b74fef
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
index 00000000000..9b0bc1ca663
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
index 57f918b75f3..f211dcd2aa9 100644
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
