Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web12.6108.1612518911340986420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 01:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C314mEIn;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id u9so820676vkb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+AQBw6UQmFzoA+ZI1UiyX65MDc0MtV0nZgnfbvUl1oM=;
        b=C314mEInCX3G7islYSjz/El9bGGUbFypmPzpwsSpYgP60vS8gmRIgQoDjWkDuy+GWR
         GnhP0ShQwChegQonHqykgqqW2mftFMkuyqV9rBdUToH/y1c6ZD2XwroeNqcDJsiK6Uhi
         TkcpCD6jjTvJPXTUcN4yui9KXP8UnB3zLMkSty1lbndPiQmc2Lo+DJr+qdGnL2xVW31Z
         ITeSPD4TpR9BL29WAYRuuhcyPl6ClOB9klWJnbgqOZZ3fN9CETJAJYqV5s2eNrjIadec
         wXJhJuyJ1jCCXal0tXfydFN4Kv9Yg33k0+97GaVgZR3JT6aZFO+UiA3Y2/9UDAVPrC60
         dn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+AQBw6UQmFzoA+ZI1UiyX65MDc0MtV0nZgnfbvUl1oM=;
        b=e7g0arCZXpWeppSpZ7yHxe2182pu+huRgO0vY2PYdlwiEqVUJhBNpvnzUCvd0YIblK
         1IT0QbNUs6ukQg60jp8HbQK/5AADdG2Sle4lNq9HR6LBEqXAo51SRTmKTcw5Vb74irhA
         1Y8tpCFBOgNOvBx2anYQmr3J9V4UwGYFXUoBmlHUKT9MxaucdH5/8rA+CwbK7sEkvp6S
         4ql0N2g558yc7KaFfRy7xqyMwrn3XinY0yNTFPVNBqhk394pVh8CygP6ulcHPKh6nvOj
         AYIsjkrSnJHIxkHlvb5Yd+kKvgrOlXN80hEBxUJooG1cGOG2j0LtR36pbBazbA02XK03
         KKtA==
X-Gm-Message-State: AOAM5319fzdzqOjqJdTlcN/NVVIsVMvr/LnvwFb0d8lLsc82uabF0r7M
	ARc/XJD37+ZBxSo+w7DqJ1HvyK6lmKSL6sfuVL0=
X-Google-Smtp-Source: ABdhPJzEgeQAUn8YrW0Mq/CnAoih4IFuIjAUPWQv0L+0mntQQvPE8PfZZRpDuX5pdPbxwBfXm9BdDw6w6slvx/s3fpI=
X-Received: by 2002:a05:6122:129b:: with SMTP id i27mr2683582vkp.7.1612518910451;
 Fri, 05 Feb 2021 01:55:10 -0800 (PST)
MIME-Version: 1.0
References: <1612492091-33259-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1612492091-33259-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 5 Feb 2021 10:54:58 +0100
Message-ID: <CANNYZj_01bqusn4ECXe+a_e26T9gC=RTy01XsW7L9sW8FJhU6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] parted: upgrade 3.3 -> 3.4
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d9e16c05ba93d075"

--000000000000d9e16c05ba93d075
Content-Type: text/plain; charset="UTF-8"

Have you confirmed that ptests still pass?

Alex

On Fri, 5 Feb 2021 at 03:28, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> 0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
> 0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
> 0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
> removed since they are included in 3.4
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...er-scripts-used-only-in-tests-to-Pyt.patch | 33 ----------
>  ...s-add-sourcedir-lib-to-include-paths.patch | 26 --------
>  ...rather-than-skip_test_-which-is-unde.patch | 66 -------------------
>  .../parted/{parted_3.3.bb => parted_3.4.bb}   |  7 +-
>  4 files changed, 2 insertions(+), 130 deletions(-)
>  delete mode 100644
> meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
>  delete mode 100644
> meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
>  delete mode 100644
> meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
>  rename meta/recipes-extended/parted/{parted_3.3.bb => parted_3.4.bb}
> (83%)
>
> diff --git
> a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
> b/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
> deleted file mode 100644
> index 829c0c8b78..0000000000
> ---
> a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From ddbefd80d74c3baaae328332458db447e1666240 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 27 Apr 2017 16:37:24 +0300
> -Subject: [PATCH] Move python helper scripts (used only in tests) to
> Python 3
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - tests/gpt-header-move | 2 +-
> - tests/msdos-overlap   | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/gpt-header-move b/tests/gpt-header-move
> -index 3dda5cb..a2b9508 100755
> ---- a/tests/gpt-header-move
> -+++ b/tests/gpt-header-move
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/python
> -+#!/usr/bin/env python3
> -
> - # open img file, subtract 33 from altlba address, and move the last 33
> sectors
> - # back by 33 sectors
> -diff --git a/tests/msdos-overlap b/tests/msdos-overlap
> -index d6ae8d6..2c6747b 100755
> ---- a/tests/msdos-overlap
> -+++ b/tests/msdos-overlap
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/python
> -+#!/usr/bin/env python3
> - """
> -     Write an overlapping partition to a msdos disk
> -
> diff --git
> a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
> b/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
> deleted file mode 100644
> index 4dc2ab259d..0000000000
> ---
> a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From d60a8a86f6593738b5324ccd8fe3e6d84a1fe7bc Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 11 Dec 2019 14:18:36 +0100
> -Subject: [PATCH] libparted/fs: add $sourcedir/lib to include paths
> -
> -Otherwise, getopt-pfx-core.h won't be found.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - libparted/fs/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
> -index 286bff6..65f45d3 100644
> ---- a/libparted/fs/Makefile.am
> -+++ b/libparted/fs/Makefile.am
> -@@ -3,7 +3,7 @@
> - #
> - # This file may be modified and/or distributed without restriction.
> -
> --partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include
> -+partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include
> -I$(top_srcdir)/lib
> -
> - AM_CFLAGS = $(WARN_CFLAGS)
> -
> diff --git
> a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
> b/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
> deleted file mode 100644
> index 9524adf7b8..0000000000
> ---
> a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From 9f844484cedb39e301b016e9da7852c1a0fb6eea Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 11 Dec 2019 16:27:48 +0100
> -Subject: [PATCH] tests: use skip_ rather than skip_test_ (which is
> undefined)
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - tests/t6001-psep.sh               | 2 +-
> - tests/t6004-dm-many-partitions.sh | 2 +-
> - tests/t6005-dm-uuid.sh            | 2 +-
> - tests/t6006-dm-512b-sectors.sh    | 2 +-
> - 4 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/tests/t6001-psep.sh b/tests/t6001-psep.sh
> -index e350bd2..67014a0 100644
> ---- a/tests/t6001-psep.sh
> -+++ b/tests/t6001-psep.sh
> -@@ -21,7 +21,7 @@
> - require_root_
> - require_udevadm_settle_
> -
> --(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
> -+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
> -
> - # Device maps names - should be random to not conflict with existing
> ones on
> - # the system
> -diff --git a/tests/t6004-dm-many-partitions.sh
> b/tests/t6004-dm-many-partitions.sh
> -index b4be975..7214f60 100755
> ---- a/tests/t6004-dm-many-partitions.sh
> -+++ b/tests/t6004-dm-many-partitions.sh
> -@@ -21,7 +21,7 @@
> -
> - require_root_
> - require_udevadm_settle_
> --(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
> -+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
> -
> - ss=$sector_size_
> - ns=300
> -diff --git a/tests/t6005-dm-uuid.sh b/tests/t6005-dm-uuid.sh
> -index 4266747..4790a8b 100755
> ---- a/tests/t6005-dm-uuid.sh
> -+++ b/tests/t6005-dm-uuid.sh
> -@@ -21,7 +21,7 @@
> -
> - require_root_
> - require_udevadm_settle_
> --(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
> -+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
> -
> - ss=$sector_size_
> - ns=300
> -diff --git a/tests/t6006-dm-512b-sectors.sh
> b/tests/t6006-dm-512b-sectors.sh
> -index bf32135..b679adb 100644
> ---- a/tests/t6006-dm-512b-sectors.sh
> -+++ b/tests/t6006-dm-512b-sectors.sh
> -@@ -25,7 +25,7 @@ require_scsi_debug_module_
> - grep '^#define USE_BLKID 1' "$CONFIG_HEADER" > /dev/null ||
> -   skip_ 'this system lacks a new-enough libblkid'
> -
> --(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
> -+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
> -
> - # Device maps names - should be random to not conflict with existing
> ones on
> - # the system
> diff --git a/meta/recipes-extended/parted/parted_3.3.bb
> b/meta/recipes-extended/parted/parted_3.4.bb
> similarity index 83%
> rename from meta/recipes-extended/parted/parted_3.3.bb
> rename to meta/recipes-extended/parted/parted_3.4.bb
> index ce40c04ad4..8b42a6d35d 100644
> --- a/meta/recipes-extended/parted/parted_3.3.bb
> +++ b/meta/recipes-extended/parted/parted_3.4.bb
> @@ -9,14 +9,11 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>             file://no_check.patch \
>             file://fix-doc-mandir.patch \
>
> file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
> -
>  file://0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch \
>             file://run-ptest \
> -
>  file://0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch \
> -
>  file://0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch \
>             "
>
> -SRC_URI[md5sum] = "090655d05f3c471aa8e15a27536889ec"
> -SRC_URI[sha256sum] =
> "57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44"
> +SRC_URI[md5sum] = "357d19387c6e7bc4a8a90fe2d015fe80"
> +SRC_URI[sha256sum] =
> "e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342"
>
>  EXTRA_OECONF = "--disable-device-mapper"
>
> --
> 2.25.1
>
>
>
>
> 
>
>

--000000000000d9e16c05ba93d075
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Have you confirmed that ptests still pass?</div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 5 Feb 2021 at 03:28, Wang Mingyu &lt=
;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">0001-Move-py=
thon-helper-scripts-used-only-in-tests-to-Pyt.patch<br>
0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch<br>
0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch<br>
removed since they are included in 3.4<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...er-scripts-used-only-in-tests-to-Pyt.patch | 33 ----------<br>
=C2=A0...s-add-sourcedir-lib-to-include-paths.patch | 26 --------<br>
=C2=A0...rather-than-skip_test_-which-is-unde.patch | 66 -----------------=
--<br>
=C2=A0.../parted/{<a href=3D"http://parted_3.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">parted_3.3.bb</a> =3D&gt; <a href=3D"http://parted_3.4.bb" re=
l=3D"noreferrer" target=3D"_blank">parted_3.4.bb</a>}=C2=A0 =C2=A0|=C2=A0 7=
 +-<br>
=C2=A04 files changed, 2 insertions(+), 130 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/parted/files/0001-Move-pyth=
on-helper-scripts-used-only-in-tests-to-Pyt.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/parted/files/0001-libparted=
-fs-add-sourcedir-lib-to-include-paths.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/parted/files/0002-tests-use=
-skip_-rather-than-skip_test_-which-is-unde.patch<br>
=C2=A0rename meta/recipes-extended/parted/{<a href=3D"http://parted_3.3.bb=
" rel=3D"noreferrer" target=3D"_blank">parted_3.3.bb</a> =3D&gt; <a href=3D=
"http://parted_3.4.bb" rel=3D"noreferrer" target=3D"_blank">parted_3.4.bb</=
a>} (83%)<br>
<br>
diff --git a/meta/recipes-extended/parted/files/0001-Move-python-helper-sc=
ripts-used-only-in-tests-to-Pyt.patch b/meta/recipes-extended/parted/files/=
0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch<br>
deleted file mode 100644<br>
index 829c0c8b78..0000000000<br>
--- a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-u=
sed-only-in-tests-to-Pyt.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From ddbefd80d74c3baaae328332458db447e1666240 Mon Sep 17 00:00:00 2001<br=
>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Thu, 27 Apr 2017 16:37:24 +0300<br>
-Subject: [PATCH] Move python helper scripts (used only in tests) to Pytho=
n 3<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-<br>
----<br>
- tests/gpt-header-move | 2 +-<br>
- tests/msdos-overlap=C2=A0 =C2=A0| 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/tests/gpt-header-move b/tests/gpt-header-move<br>
-index 3dda5cb..a2b9508 100755<br>
---- a/tests/gpt-header-move<br>
-+++ b/tests/gpt-header-move<br>
-@@ -1,4 +1,4 @@<br>
--#!/usr/bin/python<br>
-+#!/usr/bin/env python3<br>
- <br>
- # open img file, subtract 33 from altlba address, and move the last 33 s=
ectors<br>
- # back by 33 sectors<br>
-diff --git a/tests/msdos-overlap b/tests/msdos-overlap<br>
-index d6ae8d6..2c6747b 100755<br>
---- a/tests/msdos-overlap<br>
-+++ b/tests/msdos-overlap<br>
-@@ -1,4 +1,4 @@<br>
--#!/usr/bin/python<br>
-+#!/usr/bin/env python3<br>
- &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0Write an overlapping partition to a msdos disk<br>
- <br>
diff --git a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sour=
cedir-lib-to-include-paths.patch b/meta/recipes-extended/parted/files/0001-=
libparted-fs-add-sourcedir-lib-to-include-paths.patch<br>
deleted file mode 100644<br>
index 4dc2ab259d..0000000000<br>
--- a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-l=
ib-to-include-paths.patch<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-From d60a8a86f6593738b5324ccd8fe3e6d84a1fe7bc Mon Sep 17 00:00:00 2001<br=
>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Wed, 11 Dec 2019 14:18:36 +0100<br>
-Subject: [PATCH] libparted/fs: add $sourcedir/lib to include paths<br>
-<br>
-Otherwise, getopt-pfx-core.h won&#39;t be found.<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- libparted/fs/Makefile.am | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am<br>
-index 286bff6..65f45d3 100644<br>
---- a/libparted/fs/Makefile.am<br>
-+++ b/libparted/fs/Makefile.am<br>
-@@ -3,7 +3,7 @@<br>
- #<br>
- # This file may be modified and/or distributed without restriction.<br>
- <br>
--partedincludedir =3D -I$(top_builddir)/include -I$(top_srcdir)/include<b=
r>
-+partedincludedir =3D -I$(top_builddir)/include -I$(top_srcdir)/include -=
I$(top_srcdir)/lib<br>
- <br>
- AM_CFLAGS =3D $(WARN_CFLAGS)<br>
- <br>
diff --git a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rathe=
r-than-skip_test_-which-is-unde.patch b/meta/recipes-extended/parted/files/=
0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch<br>
deleted file mode 100644<br>
index 9524adf7b8..0000000000<br>
--- a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-=
skip_test_-which-is-unde.patch<br>
+++ /dev/null<br>
@@ -1,66 +0,0 @@<br>
-From 9f844484cedb39e301b016e9da7852c1a0fb6eea Mon Sep 17 00:00:00 2001<br=
>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Wed, 11 Dec 2019 16:27:48 +0100<br>
-Subject: [PATCH] tests: use skip_ rather than skip_test_ (which is undefi=
ned)<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- tests/t6001-psep.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
- tests/t6004-dm-many-partitions.sh | 2 +-<br>
- tests/t6005-dm-uuid.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
- tests/t6006-dm-512b-sectors.sh=C2=A0 =C2=A0 | 2 +-<br>
- 4 files changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/tests/t6001-psep.sh b/tests/t6001-psep.sh<br>
-index e350bd2..67014a0 100644<br>
---- a/tests/t6001-psep.sh<br>
-+++ b/tests/t6001-psep.sh<br>
-@@ -21,7 +21,7 @@<br>
- require_root_<br>
- require_udevadm_settle_<br>
- <br>
--(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_test_ &quot;No dmset=
up installed&quot;<br>
-+(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_ &quot;No dmsetup in=
stalled&quot;<br>
- <br>
- # Device maps names - should be random to not conflict with existing one=
s on<br>
- # the system<br>
-diff --git a/tests/t6004-dm-many-partitions.sh b/tests/t6004-dm-many-part=
itions.sh<br>
-index b4be975..7214f60 100755<br>
---- a/tests/t6004-dm-many-partitions.sh<br>
-+++ b/tests/t6004-dm-many-partitions.sh<br>
-@@ -21,7 +21,7 @@<br>
- <br>
- require_root_<br>
- require_udevadm_settle_<br>
--(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_test_ &quot;No dmset=
up installed&quot;<br>
-+(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_ &quot;No dmsetup in=
stalled&quot;<br>
- <br>
- ss=3D$sector_size_<br>
- ns=3D300<br>
-diff --git a/tests/t6005-dm-uuid.sh b/tests/t6005-dm-uuid.sh<br>
-index 4266747..4790a8b 100755<br>
---- a/tests/t6005-dm-uuid.sh<br>
-+++ b/tests/t6005-dm-uuid.sh<br>
-@@ -21,7 +21,7 @@<br>
- <br>
- require_root_<br>
- require_udevadm_settle_<br>
--(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_test_ &quot;No dmset=
up installed&quot;<br>
-+(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_ &quot;No dmsetup in=
stalled&quot;<br>
- <br>
- ss=3D$sector_size_<br>
- ns=3D300<br>
-diff --git a/tests/t6006-dm-512b-sectors.sh b/tests/t6006-dm-512b-sectors=
.sh<br>
-index bf32135..b679adb 100644<br>
---- a/tests/t6006-dm-512b-sectors.sh<br>
-+++ b/tests/t6006-dm-512b-sectors.sh<br>
-@@ -25,7 +25,7 @@ require_scsi_debug_module_<br>
- grep &#39;^#define USE_BLKID 1&#39; &quot;$CONFIG_HEADER&quot; &gt; /dev=
/null ||<br>
-=C2=A0 =C2=A0skip_ &#39;this system lacks a new-enough libblkid&#39;<br>
- <br>
--(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_test_ &quot;No dmset=
up installed&quot;<br>
-+(dmsetup --help) &gt; /dev/null 2&gt;&amp;1 || skip_ &quot;No dmsetup in=
stalled&quot;<br>
- <br>
- # Device maps names - should be random to not conflict with existing one=
s on<br>
- # the system<br>
diff --git a/meta/recipes-extended/parted/<a href=3D"http://parted_3.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">parted_3.3.bb</a> b/meta/recipes-exte=
nded/parted/<a href=3D"http://parted_3.4.bb" rel=3D"noreferrer" target=3D"_=
blank">parted_3.4.bb</a><br>
similarity index 83%<br>
rename from meta/recipes-extended/parted/<a href=3D"http://parted_3.3.bb" =
rel=3D"noreferrer" target=3D"_blank">parted_3.3.bb</a><br>
rename to meta/recipes-extended/parted/<a href=3D"http://parted_3.4.bb" re=
l=3D"noreferrer" target=3D"_blank">parted_3.4.bb</a><br>
index ce40c04ad4..8b42a6d35d 100644<br>
--- a/meta/recipes-extended/parted/<a href=3D"http://parted_3.3.bb" rel=3D=
"noreferrer" target=3D"_blank">parted_3.3.bb</a><br>
+++ b/meta/recipes-extended/parted/<a href=3D"http://parted_3.4.bb" rel=3D=
"noreferrer" target=3D"_blank">parted_3.4.bb</a><br>
@@ -9,14 +9,11 @@ SRC_URI =3D &quot;${GNU_MIRROR}/parted/parted-${PV}.tar.=
xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no_check.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-doc-mandir.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-libparted_fs_resize-=
link-against-libuuid-explicitly-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Move-python-helper-s=
cripts-used-only-in-tests-to-Pyt.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libparted-fs-add-sou=
rcedir-lib-to-include-paths.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tests-use-skip_-rath=
er-than-skip_test_-which-is-unde.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;090655d05f3c471aa8e15a27536889ec&quot;<br>
-SRC_URI[sha256sum] =3D &quot;57e2b4bd87018625c515421d4524f6e3b55175b47230=
2056391c5f7eccb83d44&quot;<br>
+SRC_URI[md5sum] =3D &quot;357d19387c6e7bc4a8a90fe2d015fe80&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfba=
d03dc642afd009da5342&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-device-mapper&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d9e16c05ba93d075--
