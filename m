Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E87EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:25:17 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.17915.1687962308857071649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uUxvBqG0;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.53, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso8176598e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687962307; x=1690554307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISSGdiYb4EoCGXjD4poP3co/9GkJkNWTuqONCZkQ5Pc=;
        b=uUxvBqG0wzl97RqXrquGnl/6aS+cI7RvnVKWZlkpb5pU3o8YzbPxcaxzi4d65fjO3p
         kWAYpDqcrnTPEGQ7z27IP/BQHAeF7iA/BZSNHZMna0dDS2srwdNBYRbs8+btkkxuFFml
         RBNNviRErBkku0hFQtoD08rfpRi409IkjAOJrrqfURpNNm+Er2YrpAGl2NFFhfrn4tfK
         4tRo/5fmit10JbffvKnyPtQvv03X8pWSdAGNnwwPMjueMqBJJOYiTJw1rLPCH3kpmKUs
         xohdAqcghxljg7hSOsWf57B1Aa6fVkNfpQ7svQwcpC7DKFliy1e7e57w0RYPKUuh41ZH
         Uu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687962307; x=1690554307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISSGdiYb4EoCGXjD4poP3co/9GkJkNWTuqONCZkQ5Pc=;
        b=Br1twjmCWB6LdocSNHZ0qroJtKB6pt/DOhHCJYPwIGz9/mD07h5YAZKlbAP5rGMBIr
         4uZV6fNoeqj5EATakby0lcgPkZP5Q6gYWu8o15g32chDUOVy1RbaYqaSD9sb9axcehKP
         FVzZq2q3MhzDq+oxKCuG2xooTXORtCpR/HV9bu5G9L2osKTtRKo5mZLhZqlmX6Xn/isD
         7f7uUVQHAH1XPx+g89RHuse+jMEdJpKWq9uXpic8/GfkBaLueF9R0FWJVUXaUhKTIgze
         XYK29styfxWPHqOe+p1gWQTuokFLAogDVLkAo8fBSXBK0cR2YjxqrI7tB2//B7Jm5rpj
         T1MA==
X-Gm-Message-State: AC+VfDwlM/tSBFNe3hgZD3ZVIZp+mIUk0+Qr1vuVWKGr2xlMpmEJ/PGf
	nGUNhGto/kgq7faPFwy85HujUhPJPL9HnNwqSGZGJL6uTTwKFQWwzFMtMw==
X-Google-Smtp-Source: ACHHUZ50aAv7L8SNSC4HnNeQ/ip2jH1mgM91GjHDp0+rQKrUwGNzw407aP7qZmLZhuTPIQi5XXloXkOOAToOyR331po=
X-Received: by 2002:a05:6512:12d2:b0:4fb:7b50:3fc9 with SMTP id
 p18-20020a05651212d200b004fb7b503fc9mr6494381lfg.58.1687962306688; Wed, 28
 Jun 2023 07:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230627070552.2017915-1-changqing.li@windriver.com>
In-Reply-To: <20230627070552.2017915-1-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 28 Jun 2023 04:24:55 -1000
Message-ID: <CAOSpxdYytw7y9EJ2BQ9h+HgY5WakQwO-vW10q3c3Fpcf9rZiaQ@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 1/2] erofs-utils: update 1.5 -> 1.6
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183586

Sorry, I can only take bug/security fix version bumps .  This update
includes new features:

erofs-utils 1.6
* This release includes the following updates:
- support fragments by using `-Efragments` (Yue Hu);
- support compressed data deduplication by using `-Ededupe` (Ziyang Zhang);
- (erofsfuse) support extended attributes (Huang Jianan);
- (mkfs.erofs) support multiple algorithms in a single image (Gao Xiang);
- (mkfs.erofs) support chunk-based sparse files (Gao Xiang);
- (mkfs.erofs) add volume-label setting support (Naoto Yamaguchi);
- (mkfs.erofs) add uid/gid offsetting support (Naoto Yamaguchi);
- (mkfs.erofs) pack files entirely by using `-Eall-fragments` (Gao Xiang);
- various bugfixes and cleanups;

I assume this also means that I can't take the second patch in the
series (the CVE backports)  If this isn't the case, please submit a v2
of the CVE patch.

Thanks!

Steve

On Mon, Jun 26, 2023 at 9:05=E2=80=AFPM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Drop patches merged upstream.
>
> --enable-largefile is no longer necessary, as compiler options are being =
passed in explicitly.
>
> (From OE-Core rev: 39d38b278cba7b46fd9b367e6f8c989327899e6f)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../0001-configure-use-AC_SYS_LARGEFILE.patch |  43 -------
>  ...eplace-l-stat64-by-equivalent-l-stat.patch | 109 ------------------
>  ...-Make-LFS-mandatory-for-all-usecases.patch |  41 -------
>  ...{erofs-utils_1.5.bb =3D> erofs-utils_1.6.bb} |  10 +-
>  4 files changed, 3 insertions(+), 200 deletions(-)
>  delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-co=
nfigure-use-AC_SYS_LARGEFILE.patch
>  delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0002-er=
ofs-replace-l-stat64-by-equivalent-l-stat.patch
>  delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0003-in=
ternal.h-Make-LFS-mandatory-for-all-usecases.patch
>  rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.5.bb =3D> erofs-=
utils_1.6.bb} (62%)
>
> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure=
-use-AC_SYS_LARGEFILE.patch b/meta/recipes-devtools/erofs-utils/erofs-utils=
/0001-configure-use-AC_SYS_LARGEFILE.patch
> deleted file mode 100644
> index 75c91f51a7..0000000000
> --- a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC=
_SYS_LARGEFILE.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From fef3b16dba2c5f6ad88951b80cdfbedd423e80a0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 7 Dec 2022 20:16:52 -0800
> -Subject: [PATCH v3 1/3] configure: use AC_SYS_LARGEFILE
> -
> -The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=3D64
> -where necessary to ensure that off_t and all interfaces using off_t
> -are 64bit, even on 32bit systems.
> -
> -Pass -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D66 via CFLAGS
> -
> -Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215=
064758.93821-1-raj.khem@gmail.com/T/#t]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index a736ff0..e8bb003 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -13,6 +13,8 @@ AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_AUX_DIR(config)
> - AM_INIT_AUTOMAKE([foreign -Wall])
> -
> -+AC_SYS_LARGEFILE
> -+
> - # Checks for programs.
> - AM_PROG_AR
> - AC_PROG_CC
> -@@ -319,6 +321,9 @@ if test "x$enable_lzma" =3D "xyes"; then
> -   CPPFLAGS=3D"${saved_CPPFLAGS}"
> - fi
> -
> -+# Enable 64-bit off_t
> -+CFLAGS+=3D" -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
> -+
> - # Set up needed symbols, conditionals and compiler/linker flags
> - AM_CONDITIONAL([ENABLE_LZ4], [test "x${have_lz4}" =3D "xyes"])
> - AM_CONDITIONAL([ENABLE_LZ4HC], [test "x${have_lz4hc}" =3D "xyes"])
> ---
> -2.39.0
> -
> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-rep=
lace-l-stat64-by-equivalent-l-stat.patch b/meta/recipes-devtools/erofs-util=
s/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
> deleted file mode 100644
> index d12bebbf87..0000000000
> --- a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-=
stat64-by-equivalent-l-stat.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -From 856189c324834b838f0e9cfc0d2e05f12518f264 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 7 Dec 2022 22:17:35 -0800
> -Subject: [PATCH v3 2/3] erofs: replace [l]stat64 by equivalent [l]stat
> -
> -Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215=
064758.93821-2-raj.khem@gmail.com/T/#u]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/inode.c | 10 +++++-----
> - lib/xattr.c |  4 ++--
> - mkfs/main.c |  4 ++--
> - 3 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/lib/inode.c b/lib/inode.c
> -index f192510..38003fc 100644
> ---- a/lib/inode.c
> -+++ b/lib/inode.c
> -@@ -773,7 +773,7 @@ static u32 erofs_new_encode_dev(dev_t dev)
> -
> - #ifdef WITH_ANDROID
> - int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
> --                             struct stat64 *st,
> -+                             struct stat *st,
> -                              const char *path)
> - {
> -       /* filesystem_config does not preserve file type bits */
> -@@ -818,7 +818,7 @@ int erofs_droid_inode_fsconfig(struct erofs_inode *i=
node,
> - }
> - #else
> - static int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
> --                                    struct stat64 *st,
> -+                                    struct stat *st,
> -                                     const char *path)
> - {
> -       return 0;
> -@@ -826,7 +826,7 @@ static int erofs_droid_inode_fsconfig(struct erofs_i=
node *inode,
> - #endif
> -
> - static int erofs_fill_inode(struct erofs_inode *inode,
> --                          struct stat64 *st,
> -+                          struct stat *st,
> -                           const char *path)
> - {
> -       int err =3D erofs_droid_inode_fsconfig(inode, st, path);
> -@@ -910,7 +910,7 @@ static struct erofs_inode *erofs_new_inode(void)
> - /* get the inode from the (source) path */
> - static struct erofs_inode *erofs_iget_from_path(const char *path, bool =
is_src)
> - {
> --      struct stat64 st;
> -+      struct stat st;
> -       struct erofs_inode *inode;
> -       int ret;
> -
> -@@ -918,7 +918,7 @@ static struct erofs_inode *erofs_iget_from_path(cons=
t char *path, bool is_src)
> -       if (!is_src)
> -               return ERR_PTR(-EINVAL);
> -
> --      ret =3D lstat64(path, &st);
> -+      ret =3D lstat(path, &st);
> -       if (ret)
> -               return ERR_PTR(-errno);
> -
> -diff --git a/lib/xattr.c b/lib/xattr.c
> -index 71ffe3e..fd0e728 100644
> ---- a/lib/xattr.c
> -+++ b/lib/xattr.c
> -@@ -467,7 +467,7 @@ static int erofs_count_all_xattrs_from_path(const ch=
ar *path)
> - {
> -       int ret;
> -       DIR *_dir;
> --      struct stat64 st;
> -+      struct stat st;
> -
> -       _dir =3D opendir(path);
> -       if (!_dir) {
> -@@ -502,7 +502,7 @@ static int erofs_count_all_xattrs_from_path(const ch=
ar *path)
> -                       goto fail;
> -               }
> -
> --              ret =3D lstat64(buf, &st);
> -+              ret =3D lstat(buf, &st);
> -               if (ret) {
> -                       ret =3D -errno;
> -                       goto fail;
> -diff --git a/mkfs/main.c b/mkfs/main.c
> -index d2c9830..5279805 100644
> ---- a/mkfs/main.c
> -+++ b/mkfs/main.c
> -@@ -581,7 +581,7 @@ int main(int argc, char **argv)
> -       struct erofs_buffer_head *sb_bh;
> -       struct erofs_inode *root_inode;
> -       erofs_nid_t root_nid;
> --      struct stat64 st;
> -+      struct stat st;
> -       erofs_blk_t nblocks;
> -       struct timeval t;
> -       char uuid_str[37] =3D "not available";
> -@@ -609,7 +609,7 @@ int main(int argc, char **argv)
> -                       return 1;
> -       }
> -
> --      err =3D lstat64(cfg.c_src_path, &st);
> -+      err =3D lstat(cfg.c_src_path, &st);
> -       if (err)
> -               return 1;
> -       if (!S_ISDIR(st.st_mode)) {
> ---
> -2.39.0
> -
> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.=
h-Make-LFS-mandatory-for-all-usecases.patch b/meta/recipes-devtools/erofs-u=
tils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch
> deleted file mode 100644
> index 97faa5d673..0000000000
> --- a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-=
LFS-mandatory-for-all-usecases.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 8f8cbc7b773da63bce8226249784ba6824635c9c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 7 Dec 2022 20:19:27 -0800
> -Subject: [PATCH v3 3/3] internal.h: Make LFS mandatory for all usecases
> -
> -erosfs depend on the consistent use of a 64bit offset
> -type, force downstreams to use transparent LFS (_FILE_OFFSET_BITS=3D64),
> -so that it becomes impossible for them to use 32bit interfaces.
> -
> -Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215=
064758.93821-3-raj.khem@gmail.com/T/#u]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - include/erofs/internal.h | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/include/erofs/internal.h b/include/erofs/internal.h
> -index 6a70f11..d3b2986 100644
> ---- a/include/erofs/internal.h
> -+++ b/include/erofs/internal.h
> -@@ -21,6 +21,7 @@ typedef unsigned short umode_t;
> -
> - #include "erofs_fs.h"
> - #include <fcntl.h>
> -+#include <sys/types.h> /* for off_t definition */
> -
> - #ifndef PATH_MAX
> - #define PATH_MAX        4096    /* # chars in a path name including nul=
 */
> -@@ -104,6 +105,10 @@ struct erofs_sb_info {
> -       };
> - };
> -
> -+
> -+/* make sure that any user of the erofs headers has atleast 64bit off_t=
 type */
> -+extern int erofs_assert_largefile[sizeof(off_t)-8];
> -+
> - /* global sbi */
> - extern struct erofs_sb_info sbi;
> -
> ---
> -2.39.0
> -
> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/meta/=
recipes-devtools/erofs-utils/erofs-utils_1.6.bb
> similarity index 62%
> rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
> rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
> index 2b5861882d..43643e07bb 100644
> --- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
> +++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
> @@ -5,12 +5,8 @@ SECTION =3D "base"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73001d804ea1e3d84365f652242cc=
a20"
>  HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erof=
s-utils.git/tree/README"
>
> -SRCREV =3D "a2821a66b42aee5430bccee82c280e38d1e9ab29"
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-u=
tils.git;branch=3Dmaster;protocol=3Dhttps \
> -           file://0001-configure-use-AC_SYS_LARGEFILE.patch \
> -           file://0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch=
 \
> -           file://0003-internal.h-Make-LFS-mandatory-for-all-usecases.pa=
tch \
> -           "
> +SRCREV =3D "21710612d35cd952490959bfa6ea9fe87aaa52dd"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-u=
tils.git;branch=3Dmaster;protocol=3Dhttps"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
>
> @@ -23,7 +19,7 @@ inherit pkgconfig autotools
>  PACKAGECONFIG ??=3D "lz4"
>  PACKAGECONFIG[lz4] =3D "--enable-lz4,--disable-lz4,lz4"
>
> -EXTRA_OECONF =3D "${PACKAGECONFIG_CONFARGS} --disable-fuse --enable-larg=
efile"
> +EXTRA_OECONF =3D "${PACKAGECONFIG_CONFARGS} --disable-fuse"
>
>  CFLAGS:append:powerpc64le =3D " -D__SANE_USERSPACE_TYPES__"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183440): https://lists.openembedded.org/g/openembedde=
d-core/message/183440
> Mute This Topic: https://lists.openembedded.org/mt/99804978/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

