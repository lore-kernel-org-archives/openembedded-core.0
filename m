Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 523D374623
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 18:18:35 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id e67-v6so9311704vke.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Jr7RcK+b5SXrG6SSwYJL2xz/ffLvoi6NvMU9wIOcJnA=;
	b=fB30KYGsjS3foiu5q+Xu6CJPiJQ1QiE8/+FwdyyG9rSP4T5rTIrpMaZP2ex0opjZpl
	/0uT01FH9eWpBmGfFuS9P3GeqzwPLalePeWmYGf008PexSvFUCIsrYY2dVkKBj7RRih/
	n9xKazUdrQpxnVuIfA2qerrVtiiqiIXPekPF1MPY+TalhrA8oGWNqmDud9FA11PgxJ81
	5MeaOsonZIkTpm6AM2+mkhV4XMQN1H5yeRbo7XuHIGmGHyIp5EyeMhfiX5C8jnyzKvNR
	DzBi7RsJGgu0fbQb9RbRMBR9EaP/6+MDnbYME9Iv9KffuF1Un7MI/uUCmHb24v/74uhs
	hdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Jr7RcK+b5SXrG6SSwYJL2xz/ffLvoi6NvMU9wIOcJnA=;
	b=D805X2JrWuRqWpdzQfzwsHgmT7Jq2crJYjbb+aRJ/A3ye6/dg5O3Gw+zaH7yHBfOaM
	mTXCwj/j9g3PGdHdyNvxtWFHr4afa0wx3EfjVaI9UdMdJLPmMGpv7resoVGWLT4o2XGy
	UTWvrcqCyWcV6igdnPH3bJ4hz6W6lNk+GFcShiW2R2KYHaij2Q08lzCaCYK81seCom4I
	MLUBUPAgno5VpJZ9dCiGZciCR4Cv6B9f3sguvOyeY9y1WJ/fxLOwbB3/2DgvmZ5nZ8e+
	bNAARX/hpxjNL0B03wD3w3F6lec1MS9dU3g3eAWPy69KLuRV9umF0bJuIJvxDlipDGW8
	xCSw==
X-Gm-Message-State: ALKqPwdbLenRpdSxEgUBEMFOWLelzBiEuIZH8NA95vZOmu3JdzELK9jR
	hknaQDT2jchr4JvrsX5gccEFNqXfMvY+sJM4+8M=
X-Google-Smtp-Source: AB8JxZrFNXieQAbIWXS7Yro3aXEUaHSq6oTPPPdCUocYjkh8JbbEeQsQ7kKepTJwXFbISqa2AedUTTswEoOubZB/XKo=
X-Received: by 2002:a1f:3451:: with SMTP id
	b78-v6mr13853236vka.2.1526926716160; 
	Mon, 21 May 2018 11:18:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Mon, 21 May 2018 11:18:35
	-0700 (PDT)
In-Reply-To: <1526827795-10448-1-git-send-email-akuster@mvista.com>
References: <1526827795-10448-1-git-send-email-akuster@mvista.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 21 May 2018 11:18:35 -0700
Message-ID: <CAJ86T=XKQdbiH3ND0Smmpne7FX=PqEtox9GJrJJi9WfiRZcOBQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] busybox: update to 1.28.3
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
X-List-Received-Date: Mon, 21 May 2018 18:18:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2018 at 7:49 AM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster808@gmail.com>
>
> [v2]
> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>
> [v1]
> removed patches included in update:
> busybox/CVE-2011-5325.patch
> busybox/CVE-2017-15873.patch
> busybox/busybox-CVE-2017-16544.patch
>
> refactored busybox-udhcpc-no_deconfig.patch for this update

Did you check the defconfig?

Often it needs a refresh, otherwise any new config options added
between busybox 1.27.2 and 1.28.3 will take busybox's defaults (which
may enable new applets or features which we haven't historically
enabled when configuring busybox for OE).

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../busybox/busybox/CVE-2011-5325.patch            | 481 ---------------=
------
>  .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
>  .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  36 +-
>  .../{busybox_1.27.2.bb =3D> busybox_1.28.3.bb}       |   7 +-
>  5 files changed, 20 insertions(+), 642 deletions(-)
>  delete mode 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15873.patc=
h
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2017-16=
544.patch
>  rename meta/recipes-core/busybox/{busybox_1.27.2.bb =3D> busybox_1.28.3.=
bb} (86%)
>
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2011-5325.patch b/meta=
/recipes-core/busybox/busybox/CVE-2011-5325.patch
> deleted file mode 100755
> index 0926107..0000000
> --- a/meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
> +++ /dev/null
> @@ -1,481 +0,0 @@
> -busybox-1.27.2: Fix CVE-2011-5325
> -
> -[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=3D841=
1
> -
> -libarchive: do not extract unsafe symlinks
> -
> -Prevent unsafe links extracting unless env variable $EXTRACT_UNSAFE_SYML=
INKS=3D1
> -is not set. Untarring file with -C DESTDIR parameter could be extracted =
with
> -unwanted symlinks. This doesn't feel right, and IIRC GNU tar doesn't do =
that.
> -Include necessary changes from previous commits.
> -
> -Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
bc9bbeb2b81001e8731cd2ae501c8fccc8d87cc7]
> -CVE: CVE-2011-5325
> -bug: 8411
> -Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/archival/libarchive/Kbuild.src b/archival/libarchive/Kbuild=
.src
> -index 942e755..e1a8a75 100644
> ---- a/archival/libarchive/Kbuild.src
> -+++ b/archival/libarchive/Kbuild.src
> -@@ -12,6 +12,8 @@ COMMON_FILES:=3D \
> -       data_extract_all.o \
> -       data_extract_to_stdout.o \
> - \
> -+      unsafe_symlink_target.o \
> -+\
> -       filter_accept_all.o \
> -       filter_accept_list.o \
> -       filter_accept_reject_list.o \
> -diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchiv=
e/data_extract_all.c
> -index 1830ffb..b828b65 100644
> ---- a/archival/libarchive/data_extract_all.c
> -+++ b/archival/libarchive/data_extract_all.c
> -@@ -128,10 +128,9 @@ void FAST_FUNC data_extract_all(archive_handle_t *a=
rchive_handle)
> -               res =3D link(hard_link, dst_name);
> -               if (res !=3D 0 && !(archive_handle->ah_flags & ARCHIVE_EX=
TRACT_QUIET)) {
> -                       /* shared message */
> --                      bb_perror_msg("can't create %slink "
> --                                      "%s to %s", "hard",
> --                                      dst_name,
> --                                      hard_link);
> -+                      bb_perror_msg("can't create %slink '%s' to '%s'",
> -+                                       "hard", dst_name, hard_link
> -+                      );
> -               }
> -               /* Hardlinks have no separate mode/ownership, skip chown/=
chmod */
> -               goto ret;
> -@@ -178,15 +177,17 @@ void FAST_FUNC data_extract_all(archive_handle_t *=
archive_handle)
> -       case S_IFLNK:
> -               /* Symlink */
> - //TODO: what if file_header->link_target =3D=3D NULL (say, corrupted ta=
rball?)
> --              res =3D symlink(file_header->link_target, dst_name);
> --              if (res !=3D 0
> --               && !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
> --              ) {
> --                      /* shared message */
> --                      bb_perror_msg("can't create %slink "
> --                              "%s to %s", "sym",
> --                              dst_name,
> --                              file_header->link_target);
> -+              if (!unsafe_symlink_target(file_header->link_target)) {
> -+                      res =3D symlink(file_header->link_target, dst_nam=
e);
> -+                      if (res !=3D 0
> -+                              && !(archive_handle->ah_flags & ARCHIVE_E=
XTRACT_QUIET)
> -+                      ) {
> -+                                              /* shared message */
> -+                                              bb_perror_msg("can't crea=
te %slink '%s' to '%s'",
> -+                                                      "sym",
> -+                                                      dst_name, file_he=
ader->link_target
> -+                                              );
> -+                      }
> -               }
> -               break;
> -       case S_IFSOCK:
> -diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/liba=
rchive/unsafe_symlink_target.c
> -new file mode 100644
> -index 0000000..ee46e28
> ---- /dev/null
> -+++ b/archival/libarchive/unsafe_symlink_target.c
> -@@ -0,0 +1,48 @@
> -+/* vi: set sw=3D4 ts=3D4: */
> -+/*
> -+ * Licensed under GPLv2 or later, see file LICENSE in this source tree.
> -+ */
> -+#include "libbb.h"
> -+#include "bb_archive.h"
> -+
> -+int FAST_FUNC unsafe_symlink_target(const char *target)
> -+{
> -+      const char *dot;
> -+
> -+      if (target[0] =3D=3D '/') {
> -+              const char *var;
> -+unsafe:
> -+              var =3D getenv("EXTRACT_UNSAFE_SYMLINKS");
> -+              if (var) {
> -+                      if (LONE_CHAR(var, '1'))
> -+                              return 0; /* pretend it's safe */
> -+                      return 1; /* "UNSAFE!" */
> -+              }
> -+              bb_error_msg("skipping unsafe symlink to '%s' in archive,=
"
> -+                      " set %s=3D1 to extract",
> -+                      target,
> -+                      "EXTRACT_UNSAFE_SYMLINKS"
> -+              );
> -+              /* Prevent further messages */
> -+              setenv("EXTRACT_UNSAFE_SYMLINKS", "0", 0);
> -+              return 1; /* "UNSAFE!" */
> -+      }
> -+
> -+      dot =3D target;
> -+      for (;;) {
> -+              dot =3D strchr(dot, '.');
> -+                      if (!dot)
> -+                              return 0; /* safe target */
> -+
> -+                      /* Is it a path component starting with ".."? */
> -+                      if ((dot[1] =3D=3D '.')
> -+                              && (dot =3D=3D target || dot[-1] =3D=3D '=
/')
> -+                                      /* Is it exactly ".."? */
> -+                              && (dot[2] =3D=3D '/' || dot[2] =3D=3D '\=
0')
> -+                      ) {
> -+                              goto unsafe;
> -+                      }
> -+                      /* NB: it can even be trailing ".", should only a=
dd 1 */
> -+                      dot +=3D 1;
> -+      }
> -+}
> -\ No newline at end of file
> -diff --git a/archival/unzip.c b/archival/unzip.c
> -index 9037262..270e261 100644
> ---- a/archival/unzip.c
> -+++ b/archival/unzip.c
> -@@ -335,6 +335,44 @@ static void unzip_create_leading_dirs(const char *f=
n)
> -       free(name);
> - }
> -
> -+static void unzip_extract_symlink(zip_header_t *zip, const char *dst_fn=
)
> -+{
> -+      char *target;
> -+
> -+      if (zip->fmt.ucmpsize > 0xfff) /* no funny business please */
> -+              bb_error_msg_and_die("bad archive");
> -+
> -+      if (zip->fmt.method =3D=3D 0) {
> -+              /* Method 0 - stored (not compressed) */
> -+              target =3D xzalloc(zip->fmt.ucmpsize + 1);
> -+              xread(zip_fd, target, zip->fmt.ucmpsize);
> -+      } else {
> -+#if 1
> -+              bb_error_msg_and_die("compressed symlink is not supported=
");
> -+#else
> -+              transformer_state_t xstate;
> -+              init_transformer_state(&xstate);
> -+              xstate.mem_output_size_max =3D zip->fmt.ucmpsize;
> -+              /* ...unpack... */
> -+              if (!xstate.mem_output_buf)
> -+                      WTF();
> -+              target =3D xstate.mem_output_buf;
> -+              target =3D xrealloc(target, xstate.mem_output_size + 1);
> -+              target[xstate.mem_output_size] =3D '\0';
> -+#endif
> -+      }
> -+      if (!unsafe_symlink_target(target)) {
> -+//TODO: libbb candidate
> -+              if (symlink(target, dst_fn)) {
> -+                      /* shared message */
> -+                      bb_perror_msg_and_die("can't create %slink '%s' t=
o '%s'",
> -+                              "sym", dst_fn, target
> -+                      );
> -+              }
> -+      }
> -+      free(target);
> -+}
> -+
> - static void unzip_extract(zip_header_t *zip, int dst_fd)
> - {
> -       transformer_state_t xstate;
> -@@ -813,7 +851,7 @@ int unzip_main(int argc, char **argv)
> -               }
> -  check_file:
> -               /* Extract file */
> --              if (stat(dst_fn, &stat_buf) =3D=3D -1) {
> -+              if (lstat(dst_fn, &stat_buf) =3D=3D -1) {
> -                       /* File does not exist */
> -                       if (errno !=3D ENOENT) {
> -                               bb_perror_msg_and_die("can't stat '%s'", =
dst_fn);
> -@@ -834,6 +872,7 @@ int unzip_main(int argc, char **argv)
> -                       goto do_open_and_extract;
> -               printf("replace %s? [y]es, [n]o, [A]ll, [N]one, [r]ename:=
 ", dst_fn);
> -               my_fgets80(key_buf);
> -+//TODO: redo lstat + ISREG check! user input could have taken a long ti=
me!
> -
> -               switch (key_buf[0]) {
> -               case 'A':
> -@@ -842,7 +881,8 @@ int unzip_main(int argc, char **argv)
> -  do_open_and_extract:
> -                       unzip_create_leading_dirs(dst_fn);
> - #if ENABLE_FEATURE_UNZIP_CDF
> --                      dst_fd =3D xopen3(dst_fn, O_WRONLY | O_CREAT | O_=
TRUNC, file_mode);
> -+                      if (!S_ISLNK(file_mode))
> -+                              dst_fd =3D xopen3(dst_fn, O_WRONLY | O_CR=
EAT | O_TRUNC, file_mode);
> - #else
> -                       dst_fd =3D xopen(dst_fn, O_WRONLY | O_CREAT | O_T=
RUNC);
> - #endif
> -@@ -852,10 +892,18 @@ int unzip_main(int argc, char **argv)
> -                                       ? " extracting: %s\n"
> -                                       : */ "  inflating: %s\n", dst_fn)=
;
> -                       }
> --                      unzip_extract(&zip, dst_fd);
> --                      if (dst_fd !=3D STDOUT_FILENO) {
> --                              /* closing STDOUT is potentially bad for =
future business */
> --                              close(dst_fd);
> -+#if ENABLE_FEATURE_UNZIP_CDF
> -+                      if (S_ISLNK(file_mode)) {
> -+                              if (dst_fd !=3D STDOUT_FILENO) /* no -p *=
/
> -+                                      unzip_extract_symlink(&zip, dst_f=
n);
> -+                      } else
> -+#endif
> -+                      {
> -+                              unzip_extract(&zip, dst_fd);
> -+                              if (dst_fd !=3D STDOUT_FILENO) {
> -+                                      /* closing STDOUT is potentially =
bad for future business */
> -+                                      close(dst_fd);
> -+                              };
> -                       }
> -                       break;
> -
> -diff --git a/coreutils/link.c b/coreutils/link.c
> -index ac3ef85..aab249d 100644
> ---- a/coreutils/link.c
> -+++ b/coreutils/link.c
> -@@ -32,9 +32,8 @@ int link_main(int argc UNUSED_PARAM, char **argv)
> -       argv +=3D optind;
> -       if (link(argv[0], argv[1]) !=3D 0) {
> -               /* shared message */
> --              bb_perror_msg_and_die("can't create %slink "
> --                                      "%s to %s", "hard",
> --                                      argv[1], argv[0]
> -+              bb_perror_msg_and_die("can't create %slink '%s' to '%s'",
> -+                                      "hard", argv[1], argv[0]
> -               );
> -       }
> -       return EXIT_SUCCESS;
> -diff --git a/include/bb_archive.h b/include/bb_archive.h
> -index 2b9c5f0..1e4da3c 100644
> ---- a/include/bb_archive.h
> -+++ b/include/bb_archive.h
> -@@ -196,6 +196,7 @@ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
> - void seek_by_read(int fd, off_t amount) FAST_FUNC;
> -
> - const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
> -+int unsafe_symlink_target(const char *target) FAST_FUNC;
> -
> - void data_align(archive_handle_t *archive_handle, unsigned boundary) FA=
ST_FUNC;
> - const llist_t *find_list_entry(const llist_t *list, const char *filenam=
e) FAST_FUNC;
> -diff --git a/libbb/copy_file.c b/libbb/copy_file.c
> -index 23c0f83..be90066 100644
> ---- a/libbb/copy_file.c
> -+++ b/libbb/copy_file.c
> -@@ -371,7 +371,10 @@ int FAST_FUNC copy_file(const char *source, const c=
har *dest, int flags)
> -                       int r =3D symlink(lpath, dest);
> -                       free(lpath);
> -                       if (r < 0) {
> --                              bb_perror_msg("can't create symlink '%s'"=
, dest);
> -+                              /* shared message */
> -+                              bb_perror_msg("can't create %slink '%s' t=
o '%s'",
> -+                                      "sym", dest, lpath
> -+                              );
> -                               return -1;
> -                       }
> -                       if (flags & FILEUTILS_PRESERVE_STATUS)
> -diff --git a/testsuite/tar.tests b/testsuite/tar.tests
> -index 9f7ce15..b7cd74c 100755
> ---- a/testsuite/tar.tests
> -+++ b/testsuite/tar.tests
> -@@ -10,9 +10,6 @@ unset LC_COLLATE
> - unset LC_ALL
> - umask 022
> -
> --rm -rf tar.tempdir 2>/dev/null
> --mkdir tar.tempdir && cd tar.tempdir || exit 1
> --
> - # testing "test name" "script" "expected result" "file input" "stdin"
> -
> - testing "Empty file is not a tarball" '\
> -@@ -53,6 +50,7 @@ dd if=3D/dev/zero bs=3D512 count=3D20 2>/dev/null | ta=
r xvf - 2>&1; echo $?
> - "" ""
> - SKIP=3D
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - # "tar cf test.tar input input_dir/ input_hard1 input_hard2 input_hard1=
 input_dir/ input":
> - # GNU tar 1.26 records as hardlinks:
> - #  input_hard2 -> input_hard1
> -@@ -64,7 +62,6 @@ SKIP=3D
> - # We also don't use "hrw-r--r--" notation for hardlinks in "tar tv" lis=
ting.
> - optional FEATURE_TAR_CREATE FEATURE_LS_SORTFILES
> - testing "tar hardlinks and repeated files" '\
> --rm -rf input_* test.tar 2>/dev/null
> - >input_hard1
> - ln input_hard1 input_hard2
> - mkdir input_dir
> -@@ -95,10 +92,11 @@ drwxr-xr-x input_dir
> - " \
> - "" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - optional FEATURE_TAR_CREATE FEATURE_LS_SORTFILES
> - testing "tar hardlinks mode" '\
> --rm -rf input_* test.tar 2>/dev/null
> - >input_hard1
> - chmod 741 input_hard1
> - ln input_hard1 input_hard2
> -@@ -128,10 +126,11 @@ Ok: 0
> - " \
> - "" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - optional FEATURE_TAR_CREATE FEATURE_LS_SORTFILES
> - testing "tar symlinks mode" '\
> --rm -rf input_* test.tar 2>/dev/null
> - >input_file
> - chmod 741 input_file
> - ln -s input_file input_soft
> -@@ -159,10 +158,11 @@ lrwxrwxrwx input_file
> - " \
> - "" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - optional FEATURE_TAR_CREATE FEATURE_TAR_LONG_OPTIONS
> - testing "tar --overwrite" "\
> --rm -rf input_* test.tar 2>/dev/null
> - ln input input_hard
> - tar cf test.tar input_hard
> - echo WRONG >input
> -@@ -174,12 +174,13 @@ Ok
> - " \
> - "Ok\n" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - test x"$SKIP_KNOWN_BUGS" =3D x"" && {
> - # Needs to be run under non-root for meaningful test
> - optional FEATURE_TAR_CREATE
> - testing "tar writing into read-only dir" '\
> --rm -rf input_* test.tar 2>/dev/null
> - mkdir input_dir
> - >input_dir/input_file
> - chmod 550 input_dir
> -@@ -201,7 +202,9 @@ dr-xr-x--- input_dir
> - "" ""
> - SKIP=3D
> - }
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - # Had a bug where on extract autodetect first "switched off" -z
> - # and then failed to recognize .tgz extension
> - optional FEATURE_TAR_CREATE FEATURE_SEAMLESS_GZ GUNZIP
> -@@ -217,7 +220,9 @@ Ok
> - " \
> - "" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - # Do we detect XZ-compressed data (even w/o .tar.xz or txz extension)?
> - # (the uuencoded hello_world.txz contains one empty file named "hello_w=
orld")
> - optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_XZ
> -@@ -236,7 +241,9 @@ AAAEWVo=3D
> - =3D=3D=3D=3D
> - "
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - # On extract, everything up to and including last ".." component is str=
ipped
> - optional FEATURE_TAR_CREATE
> - testing "tar strips /../ on extract" "\
> -@@ -255,7 +262,9 @@ Ok
> - " \
> - "" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - # attack.tar.bz2 has symlink pointing to a system file
> - # followed by a regular file with the same name
> - # containing "root::0:0::/root:/bin/sh":
> -@@ -270,6 +279,7 @@ optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEA=
MLESS_BZ2
> - testing "tar does not extract into symlinks" "\
> - >>/tmp/passwd && uudecode -o input && tar xf input 2>&1 && rm passwd; c=
at /tmp/passwd; echo \$?
> - " "\
> -+tar: skipping unsafe symlink to '/tmp/passwd' in archive, set EXTRACT_U=
NSAFE_SYMLINKS=3D1 to extract
> - 0
> - " \
> - "" "\
> -@@ -281,12 +291,15 @@ l4/V8LDoe90yiWJhOJvIypgEfxdyRThQkBVn/bI=3D
> - =3D=3D=3D=3D
> - "
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -+
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - # And same with -k
> - optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_BZ2
> - testing "tar -k does not extract into symlinks" "\
> - >>/tmp/passwd && uudecode -o input && tar xf input -k 2>&1 && rm passwd=
; cat /tmp/passwd; echo \$?
> - " "\
> --tar: can't open 'passwd': File exists
> -+tar: skipping unsafe symlink to '/tmp/passwd' in archive, set EXTRACT_U=
NSAFE_SYMLINKS=3D1 to extract
> - 0
> - " \
> - "" "\
> -@@ -298,7 +311,9 @@ l4/V8LDoe90yiWJhOJvIypgEfxdyRThQkBVn/bI=3D
> - =3D=3D=3D=3D
> - "
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> - optional UNICODE_SUPPORT FEATURE_TAR_GNU_EXTENSIONS FEATURE_SEAMLESS_BZ=
2 FEATURE_TAR_AUTODETECT
> - testing "Pax-encoded UTF8 names and symlinks" '\
> - tar xvf ../tar.utf8.tar.bz2 2>&1; echo $?
> -@@ -309,17 +324,45 @@ rm -rf etc usr
> - ' "\
> - etc/ssl/certs/3b2716e5.0
> - etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa=C4=9Flay=C4=B1c=C4=B1s=
=C4=B1.pem
> -+tar: skipping unsafe symlink to '/usr/share/ca-certificates/mozilla/EBG=
_Elektronik_Sertifika_Hizmet_Sa=C4=9Flay=C4=B1c=C4=B1s=C4=B1.crt' in archiv=
e, set EXTRACT_UNSAFE_SYMLINKS=3D1 to extract
> - etc/ssl/certs/f80cc7f6.0
> - usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa=C4=
=9Flay=C4=B1c=C4=B1s=C4=B1.crt
> - 0
> - etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sa=C4=9Flay=
=C4=B1c=C4=B1s=C4=B1.pem
> --etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa=C4=9Flay=C4=B1c=C4=B1s=
=C4=B1.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_H=
izmet_Sa=C4=9Flay=C4=B1c=C4=B1s=C4=B1.crt
> - etc/ssl/certs/f80cc7f6.0 -> EBG_Elektronik_Sertifika_Hizmet_Sa=C4=9Flay=
=C4=B1c=C4=B1s=C4=B1.pem
> - " \
> - "" ""
> - SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> --
> --cd .. && rm -rf tar.tempdir || exit 1
> -+mkdir tar.tempdir && cd tar.tempdir || exit 1
> -+optional UUDECODE FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT
> -+testing "Symlink attack: create symlink and then write through it" '\
> -+exec 2>&1
> -+uudecode -o input && tar xvf input; echo $?
> -+ls /tmp/bb_test_evilfile
> -+ls bb_test_evilfile
> -+ls symlink/bb_test_evilfile
> -+' "\
> -+anything.txt
> -+symlink
> -+tar: skipping unsafe symlink to '/tmp' in archive, set EXTRACT_UNSAFE_S=
YMLINKS=3D1 to extract
> -+symlink/bb_test_evilfile
> -+0
> -+ls: /tmp/bb_test_evilfile: No such file or directory
> -+ls: bb_test_evilfile: No such file or directory
> -+symlink/bb_test_evilfile
> -+" \
> -+"" "\
> -+begin-base64 644 tar_symlink_attack.tar.bz2
> -+QlpoOTFBWSZTWZgs7bQAALT/hMmQAFBAAf+AEMAGJPPv32AAAIAIMAC5thlR
> -+omAjAmCMADQT1BqNE0AEwAAjAEwElTKeo9NTR6h6gaeoA0DQNLVdwZZ5iNTk
> -+AQwCAV6S00QFJYhrlfFkVCEDEGtgNVqYrI0uK3ggnt30gqk4e1TTQm5QIAKa
> -+SJqzRGSFLMmOloHSAcvLiFxxRiQtQZF+qPxbo173ZDISOAoNoPN4PQPhBhKS
> -+n8fYaKlioCTzL2oXYczyUUIP4u5IpwoSEwWdtoA=3D
> -+=3D=3D=3D=3D
> -+"
> -+SKIP=3D
> -+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
> -
> - exit $FAILCOUNT
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch b/met=
a/recipes-core/busybox/busybox/CVE-2017-15873.patch
> deleted file mode 100644
> index 5a027c9..0000000
> --- a/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -busybox-1.27.2: Fix CVE-2017-15873
> -
> -[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=3D104=
31
> -
> -bunzip2: fix runCnt overflow
> -
> -The get_next_block function in archival/libarchive/decompress_bunzip2.c
> -in BusyBox 1.27.2 has an Integer Overflow that may lead to a write
> -access violation.
> -
> -Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
0402cb32df015d9372578e3db27db47b33d5c7b0]
> -CVE: CVE-2017-15873
> -bug: 10431
> -Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
> -
> -diff --git a/archival/libarchive/decompress_bunzip2.c b/archival/libarch=
ive/decompress_bunzip2.c
> -index 7cd18f5..bec89ed 100644
> ---- a/archival/libarchive/decompress_bunzip2.c
> -+++ b/archival/libarchive/decompress_bunzip2.c
> -@@ -156,15 +156,15 @@ static unsigned get_bits(bunzip_data *bd, int bits=
_wanted)
> - static int get_next_block(bunzip_data *bd)
> - {
> -       struct group_data *hufGroup;
> --      int dbufCount, dbufSize, groupCount, *base, *limit, selector,
> --              i, j, runPos, symCount, symTotal, nSelectors, byteCount[2=
56];
> --      int runCnt =3D runCnt; /* for compiler */
> -+      int groupCount, *base, *limit, selector,
> -+              i, j, symCount, symTotal, nSelectors, byteCount[256];
> -       uint8_t uc, symToByte[256], mtfSymbol[256], *selectors;
> -       uint32_t *dbuf;
> -       unsigned origPtr, t;
> -+      unsigned dbufCount, runPos;
> -+      unsigned runCnt =3D runCnt; /* for compiler */
> -
> -       dbuf =3D bd->dbuf;
> --      dbufSize =3D bd->dbufSize;
> -       selectors =3D bd->selectors;
> -
> - /* In bbox, we are ok with aborting through setjmp which is set up in s=
tart_bunzip */
> -@@ -187,7 +187,7 @@ static int get_next_block(bunzip_data *bd)
> -          it didn't actually work. */
> -       if (get_bits(bd, 1)) return RETVAL_OBSOLETE_INPUT;
> -       origPtr =3D get_bits(bd, 24);
> --      if ((int)origPtr > dbufSize) return RETVAL_DATA_ERROR;
> -+      if (origPtr > bd->dbufSize) return RETVAL_DATA_ERROR;
> -
> -       /* mapping table: if some byte values are never used (encoding th=
ings
> -          like ascii text), the compression code removes the gaps to hav=
e fewer
> -@@ -435,7 +435,14 @@ static int get_next_block(bunzip_data *bd)
> -                          symbols, but a run of length 0 doesn't mean an=
ything in this
> -                          context).  Thus space is saved. */
> -                       runCnt +=3D (runPos << nextSym); /* +runPos if RU=
NA; +2*runPos if RUNB */
> --                      if (runPos < dbufSize) runPos <<=3D 1;
> -+//The 32-bit overflow of runCnt wasn't yet seen, but probably can happe=
n.
> -+//This would be the fix (catches too large count way before it can over=
flow):
> -+//                    if (runCnt > bd->dbufSize) {
> -+//                            dbg("runCnt:%u > dbufSize:%u RETVAL_DATA_=
ERROR",
> -+//                                            runCnt, bd->dbufSize);
> -+//                            return RETVAL_DATA_ERROR;
> -+//                    }
> -+                      if (runPos < bd->dbufSize) runPos <<=3D 1;
> -                       goto end_of_huffman_loop;
> -               }
> -
> -@@ -445,14 +452,15 @@ static int get_next_block(bunzip_data *bd)
> -                  literal used is the one at the head of the mtfSymbol a=
rray.) */
> -               if (runPos !=3D 0) {
> -                       uint8_t tmp_byte;
> --                      if (dbufCount + runCnt > dbufSize) {
> --                              dbg("dbufCount:%d+runCnt:%d %d > dbufSize=
:%d RETVAL_DATA_ERROR",
> --                                              dbufCount, runCnt, dbufCo=
unt + runCnt, dbufSize);
> -+                      if (dbufCount + runCnt > bd->dbufSize) {
> -+                              dbg("dbufCount:%u+runCnt:%u %u > dbufSize=
:%u RETVAL_DATA_ERROR",
> -+                                              dbufCount, runCnt, dbufCo=
unt + runCnt, bd->dbufSize);
> -                               return RETVAL_DATA_ERROR;
> -                       }
> -                       tmp_byte =3D symToByte[mtfSymbol[0]];
> -                       byteCount[tmp_byte] +=3D runCnt;
> --                      while (--runCnt >=3D 0) dbuf[dbufCount++] =3D (ui=
nt32_t)tmp_byte;
> -+                      while ((int)--runCnt >=3D 0)
> -+                              dbuf[dbufCount++] =3D (uint32_t)tmp_byte;
> -                       runPos =3D 0;
> -               }
> -
> -@@ -466,7 +474,7 @@ static int get_next_block(bunzip_data *bd)
> -                  first symbol in the mtf array, position 0, would have =
been handled
> -                  as part of a run above.  Therefore 1 unused mtf positi=
on minus
> -                  2 non-literal nextSym values equals -1.) */
> --              if (dbufCount >=3D dbufSize) return RETVAL_DATA_ERROR;
> -+              if (dbufCount >=3D bd->dbufSize) return RETVAL_DATA_ERROR=
;
> -               i =3D nextSym - 1;
> -               uc =3D mtfSymbol[i];
> -
> ---
> -cgit v0.12
> diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.pat=
ch b/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
> deleted file mode 100644
> index fc19ee3..0000000
> --- a/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From c3797d40a1c57352192c6106cc0f435e7d9c11e8 Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Tue, 7 Nov 2017 18:09:29 +0100
> -Subject: lineedit: do not tab-complete any strings which have control
> - characters
> -
> -function                                             old     new   delta
> -add_match                                             41      68     +27
> -
> -CVE: CVE-2017-16544
> -Upstream-Status: Backport
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ----
> - libbb/lineedit.c | 12 ++++++++++++
> - 1 file changed, 12 insertions(+)
> -
> -diff --git a/libbb/lineedit.c b/libbb/lineedit.c
> -index c0e35bb..56e8140 100644
> ---- a/libbb/lineedit.c
> -+++ b/libbb/lineedit.c
> -@@ -645,6 +645,18 @@ static void free_tab_completion_data(void)
> -
> - static void add_match(char *matched)
> - {
> -+      unsigned char *p =3D (unsigned char*)matched;
> -+      while (*p) {
> -+              /* ESC attack fix: drop any string with control chars */
> -+              if (*p < ' '
> -+               || (!ENABLE_UNICODE_SUPPORT && *p >=3D 0x7f)
> -+               || (ENABLE_UNICODE_SUPPORT && *p =3D=3D 0x7f)
> -+              ) {
> -+                      free(matched);
> -+                      return;
> -+              }
> -+              p++;
> -+      }
> -       matches =3D xrealloc_vector(matches, 4, num_matches);
> -       matches[num_matches] =3D matched;
> -       num_matches++;
> ---
> -cgit v0.12
> diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig=
.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
> index 582a258..9e74653 100644
> --- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
> +++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
> @@ -31,11 +31,11 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.o=
rg>
>   networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++---=
---
>   1 file changed, 21 insertions(+), 8 deletions(-)
>
> -Index: busybox-1.27.2/networking/udhcp/dhcpc.c
> +Index: busybox-1.28.3/networking/udhcp/dhcpc.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.27.2.orig/networking/udhcp/dhcpc.c
> -+++ busybox-1.27.2/networking/udhcp/dhcpc.c
> -@@ -49,6 +49,8 @@ struct tpacket_auxdata {
> +--- busybox-1.28.3.orig/networking/udhcp/dhcpc.c
> ++++ busybox-1.28.3/networking/udhcp/dhcpc.c
> +@@ -48,6 +48,8 @@ struct tpacket_auxdata {
>   };
>   #endif
>
> @@ -44,7 +44,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>
>   /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
>
> -@@ -104,8 +106,9 @@ enum {
> +@@ -103,8 +105,9 @@ enum {
>         OPT_x =3D 1 << 18,
>         OPT_f =3D 1 << 19,
>         OPT_B =3D 1 << 20,
> @@ -55,7 +55,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>         USE_FOR_MMU(             OPTBIT_b,)
>         IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
>         IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
> -@@ -1110,7 +1113,8 @@ static void perform_renew(void)
> +@@ -1122,7 +1125,8 @@ static void perform_renew(void)
>                 state =3D RENEW_REQUESTED;
>                 break;
>         case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
> @@ -65,7 +65,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>         case REQUESTING:
>         case RELEASED:
>                 change_listen_mode(LISTEN_RAW);
> -@@ -1146,7 +1150,8 @@ static void perform_release(uint32_t server_addr, =
uint32_t requested_ip)
> +@@ -1158,7 +1162,8 @@ static void perform_release(uint32_t ser
>    * Users requested to be notified in all cases, even if not in one
>    * of the states above.
>    */
> @@ -75,16 +75,16 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>
>         change_listen_mode(LISTEN_NONE);
>         state =3D RELEASED;
> -@@ -1298,7 +1303,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
> -       /* O,x: list; -T,-t,-A take numeric param */
> -       IF_UDHCP_VERBOSE(opt_complementary =3D "vv";)
> -       IF_LONG_OPTS(applet_long_options =3D udhcpc_longopts;)
> --      opt =3D getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
> -+      opt =3D getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
> +@@ -1270,7 +1275,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> +       /* Parse command line */
> +       opt =3D getopt32long(argv, "^"
> +               /* O,x: list; -T,-t,-A take numeric param */
> +-              "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
> ++              "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
>                 USE_FOR_MMU("b")
>                 IF_FEATURE_UDHCPC_ARPING("a::")
>                 IF_FEATURE_UDHCP_PORT("P:")
> -@@ -1409,6 +1414,10 @@ int udhcpc_main(int argc UNUSED_PARAM, char **arg=
v)
> +@@ -1384,6 +1389,10 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>                 logmode |=3D LOGMODE_SYSLOG;
>         }
>
> @@ -95,7 +95,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>         /* Make sure fd 0,1,2 are open */
>         bb_sanitize_stdio();
>         /* Equivalent of doing a fflush after every \n */
> -@@ -1423,7 +1432,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
> +@@ -1398,7 +1407,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>         srand(monotonic_us());
>
>         state =3D INIT_SELECTING;
> @@ -105,7 +105,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>         change_listen_mode(LISTEN_RAW);
>         packet_num =3D 0;
>         timeout =3D 0;
> -@@ -1577,7 +1587,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
> +@@ -1565,7 +1575,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>                                 }
>                                 /* Timed out, enter init state */
>                                 bb_error_msg("lease lost, entering init s=
tate");
> @@ -115,7 +115,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>                                 state =3D INIT_SELECTING;
>                                 client_config.first_secs =3D 0; /* make s=
ecs field count from 0 */
>                                 /*timeout =3D 0; - already is */
> -@@ -1770,7 +1781,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
> +@@ -1757,7 +1768,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>                                                 send_decline(/*xid,*/ ser=
ver_addr, packet.yiaddr);
>
>                                                 if (state !=3D REQUESTING=
)
> @@ -125,7 +125,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
>                                                 change_listen_mode(LISTEN=
_RAW);
>                                                 state =3D INIT_SELECTING;
>                                                 client_config.first_secs =
=3D 0; /* make secs field count from 0 */
> -@@ -1840,7 +1852,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
> +@@ -1827,7 +1839,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>                                 bb_error_msg("received %s", "DHCP NAK");
>                                 udhcp_run_script(&packet, "nak");
>                                 if (state !=3D REQUESTING)
> diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-c=
ore/busybox/busybox_1.28.3.bb
> similarity index 86%
> rename from meta/recipes-core/busybox/busybox_1.27.2.bb
> rename to meta/recipes-core/busybox/busybox_1.28.3.bb
> index 36a6342..8f25c64 100644
> --- a/meta/recipes-core/busybox/busybox_1.27.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.28.3.bb
> @@ -42,11 +42,8 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-=
${PV}.tar.bz2;name=3Dtarball \
>             file://rcK \
>             file://runlevel \
>             file://makefile-libbb-race.patch \
> -           file://CVE-2011-5325.patch \
> -           file://CVE-2017-15873.patch \
> -           file://busybox-CVE-2017-16544.patch \
>  "
>  SRC_URI_append_libc-musl =3D " file://musl.cfg "
>
> -SRC_URI[tarball.md5sum] =3D "476186f4bab81781dab2369bfd42734e"
> -SRC_URI[tarball.sha256sum] =3D "9d4be516b61e6480f156b11eb42577a13529f75d=
3383850bb75c50c285de63df"
> +SRC_URI[tarball.md5sum] =3D "82e5ad09ae4a07c266fc179492b51757"
> +SRC_URI[tarball.sha256sum] =3D "ad0d22033f23e696f9a71a4c2f9210194dda39b0=
24a79151f4ac278995332a6e"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

