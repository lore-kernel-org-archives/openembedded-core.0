Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5614.1794387837967298681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=XqYFXYw9;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so16946245e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387836; x=1794992636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3V9LOkFAlRLxLEi4JF3Fe2AtCSJ0Hvv+BedkqhOFuic=;
        b=XqYFXYw9UXSXp52mSnGs+7i7nn6ieZqQ8g49eLh7D1O2qIYonacRivaxCmT1Vpd2Lr
         aDhrFhxYsbbJ3NFWq7vngAKL3IIlAPM6xhAfl2mVIQcdKc+pIUfX/PfV9wrD6G71G4Dp
         MSGJlQI/hu6ecknRJLB/8KuUOKYIhSNHchSLTzYILFpIWgKLE7CQifaTDabxuf4dWcRb
         3xZ/WG6rF1mUyyKrNFqN8ye6xqwVU4oHtGPIwGrvs0/K0BoBpnFOZoW+m9M2OiCOSPVI
         7PJVZu3l9RkjtPife9uSIoDF67uBK/gFuZw+j2uuC9Aqngp7q6K1U2d84uwv1aX2HLVz
         sMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387836; x=1794992636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3V9LOkFAlRLxLEi4JF3Fe2AtCSJ0Hvv+BedkqhOFuic=;
        b=p3OXBEBU7cNZzSzqEZm5PW54a7EYgObTTvDuicp9+2YwpCUUXN87s8nfqp+T8BHFx2
         k/NHAxrTRMH87wZpAucF9cRXU4I9R//Nn2TOQOrvVOAkW8ngJ5tPPgjSVbGA3xdh50Bu
         RRqna3iu+knPsvesS25LTXElgSndMk4rknzbawUfK+ZbRuqmFFIM/fmJYzMgkOGR0lbM
         OSZUBbjjcGjnrPn63RB3pTc0jrCHhqXQktF1/07S1YmtSIMLUbGXXENbTn8/0EcOcCpS
         2/aHb8o4QDqZA611SoL2e6UJNa/76m1qzOCNQNm57Dky0GClt4TStbkTh2b1s6lTpRaP
         zWjA==
X-Gm-Message-State: APuU4Z9R/OkQy+vOxAZ2pCDRcwqNaVh7WiVpWA/8+UzFyjpp3YJBApAW
	FYZVHj1S7X+3RhNaS8w6jVq8d6cjxworto7tQE7WTt69ousaeDnvpA3jBb0O6Hby3uS+Vrz/qfb
	xea0tgbg=
X-Gm-Gg: AYBFou0I+iQHZlaZ1lb83nvwlW/wq7nnCEYPsBYPPs+vml4egdYeP+ogJNijZjwcIfs
	Dn5ZPYn63HWRS8ZYwJLqZ0XuTr6dLflqAW8VN6r1Njjq8Jm5ekkldXZ299GB4cItxOMgUVTcWcM
	65riNC56seAuj3MB55teGcJmFVtN6xASmOvmnrDfo6Fr8wkeJqnjc0b3Es+XEhBfK7axUdUuYpF
	46Ewjv3gb57LqwSsehpF8h5Shaf2f3HWCfXtXIOg3hMlFOFFfcegP6zsFqnmtYRXpIPmp92aWRx
	x4d2R2Ekj7hB6vwi3Nb8nGX4OsKAtZyDFpJEbfnPL2zcTsU9jz5L9a7qIpXMMl2ZjlhxeE1i/OK
	JHtzrLL79Zv9uBiy2ZhnEcx9CL9vP7D7ZbVusrzqvu2Nd3hEgWomCVbqIsUCvCNkgRSZMJIoEoh
	6Y1ua/84Ufbd1X02farI4cKKkaA7TQIOb2bcbETUME+tEp+4z48NAAGF31yh7D5jw1zvBWbNxLV
	1nOA8q8fVNx2+BoSeTgbrNONAGB00YctfjFIX+lVob23dHs2OTXSLTsIEfynWt5vDOMdI8DVtS3
	+pVExXOkKoA0DD1izG16DZMQcdFYU46a2eZoX/Vzv6T9yNCB1h6ckEaKC0g20AFYuJVspMNmI4P
	RRxSb0kiD1uHMbMHoW6+TVZg9lQyC
X-Received: by 2002:a05:600c:1547:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4ba0935bcdfmr30808615e9.3.1794387836011;
        Wed, 11 Nov 2026 01:03:56 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/35] gnupg: Fix CVE-2026-105712
Date: Wed, 11 Nov 2026 10:02:55 +0100
Message-ID: <200ec2cd3f398da5223f16763ad72491fca1fddf.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250001
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch backports the upstream gpgtar security fix and its
follow-up to GnuPG 2.5.17. The security fix, directory handling
follow-up, and public CVE advisory are referenced in [1], [2],
and [3]. The follow-up includes a regression check for dry-run
extraction with a non-existing -C directory.

[1] https://github.com/gpg/gnupg/commit/7a2692fe5e580ae3bbb2a47abc4baaf1af65aa88
[2] https://github.com/gpg/gnupg/commit/1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-105712

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/CVE-2026-105712-regression.patch    |  39 ++++
 .../gnupg/gnupg/CVE-2026-105712.patch         | 194 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   2 +
 3 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
new file mode 100644
index 00000000000..6097da38c30
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
@@ -0,0 +1,39 @@
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
+- Used gnupg_access() for the existence check because 2.5.17 does not
+  have the upstream COMPAT_NO_DIR_CHECK compatibility flag.
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit 1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
index 6b2af1c96c9..04666ee8d77 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
@@ -20,6 +20,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            file://CVE-2026-57062.patch \
+           file://CVE-2026-105712.patch \
+           file://CVE-2026-105712-regression.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
