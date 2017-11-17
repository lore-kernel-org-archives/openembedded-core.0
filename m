Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5734D78775
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 00:25:44 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id n134so2158344itg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 16:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VguowaMC4R00BVd6Z455XXEnRg0KUgoyyYJTzF5XIeY=;
	b=MsoxqAol07U9ayt/oG457jquCuqr3WFcszycLC4dvf3gs5twFr1nmeG8ozQr9giILX
	uTCVbZoCp1Q2L1eOp203NMc55zp/OVtmgXE75bSNs4tCVSYXLagaUTO6t521PebNPiV+
	QY2Vf+vAYSRIqVYrIAQHWFdfTkkSSCDw+ZHf146ITD9T1MNSJVh+bK8kedjluHWOcqOl
	p+HDzLQjn4SkptySCQLKJnjIOd7BkkKa6bWbB3XZ93eokQNKIj1tpsIZdJTFRneqc5NB
	LRQvEG+CKHBve9BMPwEtkBhF5tQCp6lOUYpKhNpqMynT6kTHi0jg3AxYPzYiuep2rKPv
	ez+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VguowaMC4R00BVd6Z455XXEnRg0KUgoyyYJTzF5XIeY=;
	b=oBqMP9Tw3D14dnePR9QB1B/GpJR46MXl/Vm1HNd+vPeg8Fmt1N5UOgBTqb/gldfMo5
	V9oEljlmt/pln4zfkNdjaPvAZH1JVwyBJswIuouIzA4zFvDdogDlZyhmVuyGlc9j0K8+
	5JV9Hu1AGw8fKjlglv85Mzmh12WmC0hKR82jGmDxgL2LJz9trdWEdmmvsdEhpIi58Ucl
	qmvSN1+KK7BTs4V8gIdTbXXjNfZ1M/JTLb4D5txMqA4XBuTsP8koT8Al1zHz68/IeEaG
	tDKwwvIWkQ6EJiyRWcem294Lo1gC5ZaNoKckTw2n8thYhXlm7AGps4BaK3/odV0LDjBd
	a/dQ==
X-Gm-Message-State: AJaThX5GuASNEeWkrJUd9lf759U+wb7DA4EJAQP5CuFqutm1sWV4rl6v
	vmew8Nf+jHHFM9/PaTh20evhx6MToGusc9CFy9M/FA==
X-Google-Smtp-Source: AGs4zMYhTwcLw+m1zH0vNtBJ1qyVRi+zqUj8GZBoZ6nut/dlhVifRVgyrtu0gX/2VF8Z5QxoBN1V3psn6bvhRnlnBFU=
X-Received: by 10.36.71.74 with SMTP id t71mr4602968itb.53.1510878345331; Thu,
	16 Nov 2017 16:25:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 16:25:24 -0800 (PST)
In-Reply-To: <20171114145754.9643-18-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
	<20171114145754.9643-18-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Nov 2017 00:25:24 +0000
Message-ID: <CAJTo0LZLK6THGLwVAgZBaH0JZjyUukipy+LvTXWGHcn2cmaOrw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/27] psmisc: update to 23.0
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
X-List-Received-Date: Fri, 17 Nov 2017 00:25:44 -0000
Content-Type: multipart/alternative; boundary="001a113f6a2012ab5a055e22c79d"

--001a113f6a2012ab5a055e22c79d
Content-Type: text/plain; charset="UTF-8"

I'm not sure that disabling translations entirely is a suitable fix for
upstreams makefile being broken (or our recipe breaking)...

Did you look at the upstream repo to see if they've a fix, or how
complicated the fix would be?

Ross

On 14 November 2017 at 14:57, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Switch to gitlab, as that's where development now happens.
> Drop two upstreamed patches, add two patches to avoid newly
> introduced build errors.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...001-Typo-in-fuser-makes-M-on-all-the-time.patch | 46
> ----------------------
>  .../files/0002-Include-limits.h-for-PATH_MAX.patch | 29 --------------
>  ...-create-src-directory-before-attempting-t.patch | 30 ++++++++++++++
>  ...efile.am-do-not-recurse-into-po-directory.patch | 30 ++++++++++++++
>  meta/recipes-extended/psmisc/psmisc_22.21.bb       | 12 ------
>  meta/recipes-extended/psmisc/psmisc_23.0.bb        | 11 ++++++
>  6 files changed, 71 insertions(+), 87 deletions(-)
>  delete mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-
> makes-M-on-all-the-time.patch
>  delete mode 100644 meta/recipes-extended/psmisc/
> files/0002-Include-limits.h-for-PATH_MAX.patch
>  create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-
> create-src-directory-before-attempting-t.patch
>  create mode 100644 meta/recipes-extended/psmisc/
> psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
>  delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb
>  create mode 100644 meta/recipes-extended/psmisc/psmisc_23.0.bb
>
> diff --git a/meta/recipes-extended/psmisc/files/0001-Typo-in-
> fuser-makes-M-on-all-the-time.patch b/meta/recipes-extended/
> psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
> deleted file mode 100644
> index e57d60f6a34..00000000000
> --- a/meta/recipes-extended/psmisc/files/0001-Typo-in-
> fuser-makes-M-on-all-the-time.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 3638cc55b4d08851faba46635d737b24d016665b Mon Sep 17 00:00:00 2001
> -From: Brad Jorsch <anomie@users.sourceforge.net>
> -Date: Fri, 28 Feb 2014 21:55:02 +1100
> -Subject: [PATCH] Typo in fuser makes -M on all the time
> -
> -Brad found that fuser had the -M option on all the time.
> -A simple but significant typo caused this, thanks the the patch.
> -
> -Bug-Debian: http://bugs.debian.org/740275
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Craig Small <csmall@enc.com.au>
> ----
> - ChangeLog   | 4 ++++
> - src/fuser.c | 2 +-
> - 2 files changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/ChangeLog b/ChangeLog
> -index fd1cccf..e5f784c 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -1,3 +1,7 @@
> -+Changes in 22.22
> -+================
> -+      * Fixed typo in fuser which has -M on Debian #740275
> -+
> - Changes in 22.21
> - ================
> -       * Missing comma in fuser(1) added Debian #702391
> -diff --git a/src/fuser.c b/src/fuser.c
> -index b485f65..389b302 100644
> ---- a/src/fuser.c
> -+++ b/src/fuser.c
> -@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])
> -               usage(_("No process specification given"));
> -
> -       /* Check if -M flag was used and if so check mounts */
> --      if (opts * OPT_ISMOUNTPOINT) {
> -+      if (opts & OPT_ISMOUNTPOINT) {
> -           check_mountpoints(&mounts, &names_head, &names_tail);
> -       }
> -
> ---
> -1.8.4.2
> -
> diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
> b/meta/recipes-extended/psmisc/files/0002-Include-
> limits.h-for-PATH_MAX.patch
> deleted file mode 100644
> index c8afcac8a8b..00000000000
> --- a/meta/recipes-extended/psmisc/files/0002-Include-
> limits.h-for-PATH_MAX.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From aa66afecd8ba9cc4139f25ab15ec315173413a7d Mon Sep 17 00:00:00 2001
> -From: Paul Barker <paul@paulbarker.me.uk>
> -Date: Wed, 20 Aug 2014 10:31:37 +0000
> -Subject: [PATCH] Include <limits.h> for PATH_MAX
> -
> -When building against musl libc, PATH_MAX is defined in <limits.h>.
> -
> -Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> -
> -Upstream-Status: Accepted (Should be in next release after 22.21)
> ----
> - src/pstree.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/pstree.c b/src/pstree.c
> -index 071e6c4..0d28260 100644
> ---- a/src/pstree.c
> -+++ b/src/pstree.c
> -@@ -41,6 +41,7 @@
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <sys/ioctl.h>
> -+#include <limits.h>
> -
> - #include "i18n.h"
> - #include "comm.h"
> ---
> -2.0.4
> -
> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.
> am-create-src-directory-before-attempting-t.patch b/meta/recipes-extended/
> psmisc/psmisc/0001-Makefile.am-create-src-directory-
> before-attempting-t.patch
> new file mode 100644
> index 00000000000..4d44495fd3f
> --- /dev/null
> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.
> am-create-src-directory-before-attempting-t.patch
> @@ -0,0 +1,30 @@
> +From 285877b7761d74736aca2687ed9bef2f78b82c33 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 2 Nov 2017 16:21:22 +0200
> +Subject: [PATCH] Makefile.am: create src directory before attempting to
> write
> + there
> +
> +Otherwise out of tree builds will fail.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 9f61ab4..b4ced7f 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -79,7 +79,7 @@ EXTRA_DIST = src/signames.c README.md
> + CLEANFILES = src/signames.h
> +
> + src/signames.h: src/signames.c Makefile
> +-              export LC_ALL=C ; \
> ++              export LC_ALL=C ; mkdir -p src ; \
> +               @CPP@ -dM $< |\
> +               tr -s '\t ' ' ' | sort -n -k 3 | sed \
> +       's:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9][0-9]*\).*$\:{\ \2,"\1"
> },:p;d' | \
> +--
> +2.14.2
> +
> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.
> am-do-not-recurse-into-po-directory.patch b/meta/recipes-extended/
> psmisc/psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
> new file mode 100644
> index 00000000000..72f993a1702
> --- /dev/null
> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.
> am-do-not-recurse-into-po-directory.patch
> @@ -0,0 +1,30 @@
> +From bbd69f375a0eaeba3bfa17008f8ff41e836c1688 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 2 Nov 2017 16:39:59 +0200
> +Subject: [PATCH] Makefile.am: do not recurse into po directory
> +
> +Some broken autoconf logic results in a missing Makefile - let's
> +just skip the directory with translations, as users of psmisc are unlikely
> +to need those anyway.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile.am | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index b4ced7f..0d343a6 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -11,7 +11,6 @@ ACLOCAL_AMFLAGS = -I m4
> +
> + SUBDIRS = \
> +         doc \
> +-        po \
> +         icons \
> +         testsuite
> +
> +--
> +2.14.2
> +
> diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb
> b/meta/recipes-extended/psmisc/psmisc_22.21.bb
> deleted file mode 100644
> index 1c6473ebf43..00000000000
> --- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require psmisc.inc
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> -
> -SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
> -SRC_URI[sha256sum] = "97323cad619210845b696d7d722c38
> 3852b2acb5c49b5b0852c4f29c77a8145a"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
> -           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
> -           file://0002-Include-limits.h-for-PATH_MAX.patch \
> -           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
> -           "
> diff --git a/meta/recipes-extended/psmisc/psmisc_23.0.bb
> b/meta/recipes-extended/psmisc/psmisc_23.0.bb
> new file mode 100644
> index 00000000000..e036ae25508
> --- /dev/null
> +++ b/meta/recipes-extended/psmisc/psmisc_23.0.bb
> @@ -0,0 +1,11 @@
> +require psmisc.inc
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +
> +SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
> +           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
> +          file://0001-Makefile.am-create-src-directory-before-
> attempting-t.patch \
> +           file://0001-Makefile.am-do-not-recurse-into-po-directory.patch
> \
> +           "
> +SRCREV = "67b1da268f4c0ce6859980e3dfcfaec5b2448e80"
> +S = "${WORKDIR}/git"
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f6a2012ab5a055e22c79d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure that disabling translations entirely is a=
 suitable fix for upstreams makefile being broken (or our recipe breaking).=
..<div><br></div><div>Did you look at the upstream repo to see if they&#39;=
ve a fix, or how complicated the fix would be?</div><div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1=
4 November 2017 at 14:57, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Switch to gitlab, as that&#39;s where development now happens.<br>
Drop two upstreamed patches, add two patches to avoid newly<br>
introduced build errors.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0...001-Typo-in-fuser-makes-M-<wbr>on-all-the-time.patch | 46 --------=
--------------<br>
=C2=A0.../files/0002-Include-limits.<wbr>h-for-PATH_MAX.patch | 29 --------=
------<br>
=C2=A0...-create-src-directory-<wbr>before-attempting-t.patch | 30 ++++++++=
++++++<br>
=C2=A0...efile.am-do-not-recurse-<wbr>into-po-directory.patch | 30 ++++++++=
++++++<br>
=C2=A0meta/recipes-extended/psmisc/<a href=3D"http://psmisc_22.21.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>smisc_22.21.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ------<br>
=C2=A0meta/recipes-extended/psmisc/<a href=3D"http://psmisc_23.0.bb" rel=3D=
"noreferrer" target=3D"_blank">p<wbr>smisc_23.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 ++++++<br>
=C2=A06 files changed, 71 insertions(+), 87 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/psmisc/<wbr>files/0001-Typo-=
in-fuser-<wbr>makes-M-on-all-the-time.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/psmisc/<wbr>files/0002-Inclu=
de-limits.h-<wbr>for-PATH_MAX.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/psmisc/<wbr>psmisc/0001-Make=
file.am-<wbr>create-src-directory-before-<wbr>attempting-t.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/psmisc/<wbr>psmisc/0001-Make=
file.am-do-<wbr>not-recurse-into-po-directory.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/psmisc/<a href=3D"http://psm=
isc_22.21.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>smisc_22.21.bb</a>=
<br>
=C2=A0create mode 100644 meta/recipes-extended/psmisc/<a href=3D"http://psm=
isc_23.0.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>smisc_23.0.bb</a><b=
r>
<br>
diff --git a/meta/recipes-extended/<wbr>psmisc/files/0001-Typo-in-<wbr>fuse=
r-makes-M-on-all-the-time.<wbr>patch b/meta/recipes-extended/<wbr>psmisc/fi=
les/0001-Typo-in-<wbr>fuser-makes-M-on-all-the-time.<wbr>patch<br>
deleted file mode 100644<br>
index e57d60f6a34..00000000000<br>
--- a/meta/recipes-extended/<wbr>psmisc/files/0001-Typo-in-<wbr>fuser-makes=
-M-on-all-the-time.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 3638cc55b4d08851faba46635d737b<wbr>24d016665b Mon Sep 17 00:00:00 200=
1<br>
-From: Brad Jorsch &lt;<a href=3D"mailto:anomie@users.sourceforge.net">anom=
ie@users.sourceforge.net</a>&gt;<br>
-Date: Fri, 28 Feb 2014 21:55:02 +1100<br>
-Subject: [PATCH] Typo in fuser makes -M on all the time<br>
-<br>
-Brad found that fuser had the -M option on all the time.<br>
-A simple but significant typo caused this, thanks the the patch.<br>
-<br>
-Bug-Debian: <a href=3D"http://bugs.debian.org/740275" rel=3D"noreferrer" t=
arget=3D"_blank">http://bugs.debian.org/740275</a><br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Craig Small &lt;<a href=3D"mailto:csmall@enc.com.au">csmall=
@enc.com.au</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0| 4 ++++<br>
- src/fuser.c | 2 +-<br>
- 2 files changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index fd1cccf..e5f784c 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,3 +1,7 @@<br>
-+Changes in 22.22<br>
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 * Fixed typo in fuser which has -M on Debian #740275=
<br>
-+<br>
- Changes in 22.21<br>
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* Missing comma in fuser(1) added Debian #70239=
1<br>
-diff --git a/src/fuser.c b/src/fuser.c<br>
-index b485f65..389b302 100644<br>
---- a/src/fuser.c<br>
-+++ b/src/fuser.c<br>
-@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage(_(&quot;No pr=
ocess specification given&quot;));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if -M flag was used and if so check mo=
unts */<br>
--=C2=A0 =C2=A0 =C2=A0 if (opts * OPT_ISMOUNTPOINT) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (opts &amp; OPT_ISMOUNTPOINT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_mountpoints(&amp;mounts, &a=
mp;names_head, &amp;names_tail);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-1.8.4.2<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>psmisc/files/0002-Include-<wbr>limi=
ts.h-for-PATH_MAX.patch b/meta/recipes-extended/<wbr>psmisc/files/0002-Incl=
ude-<wbr>limits.h-for-PATH_MAX.patch<br>
deleted file mode 100644<br>
index c8afcac8a8b..00000000000<br>
--- a/meta/recipes-extended/<wbr>psmisc/files/0002-Include-<wbr>limits.h-fo=
r-PATH_MAX.patch<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-From aa66afecd8ba9cc4139f25ab15ec31<wbr>5173413a7d Mon Sep 17 00:00:00 200=
1<br>
-From: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">paul@paulba=
rker.me.uk</a>&gt;<br>
-Date: Wed, 20 Aug 2014 10:31:37 +0000<br>
-Subject: [PATCH] Include &lt;limits.h&gt; for PATH_MAX<br>
-<br>
-When building against musl libc, PATH_MAX is defined in &lt;limits.h&gt;.<=
br>
-<br>
-Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pa=
ul@paulbarker.me.uk</a>&gt;<br>
-<br>
-Upstream-Status: Accepted (Should be in next release after 22.21)<br>
----<br>
- src/pstree.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/src/pstree.c b/src/pstree.c<br>
-index 071e6c4..0d28260 100644<br>
---- a/src/pstree.c<br>
-+++ b/src/pstree.c<br>
-@@ -41,6 +41,7 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/ioctl.h&gt;<br>
-+#include &lt;limits.h&gt;<br>
-<br>
- #include &quot;i18n.h&quot;<br>
- #include &quot;comm.h&quot;<br>
---<br>
-2.0.4<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>psmisc/psmisc/0001-Makefile.<wbr>am=
-create-src-directory-<wbr>before-attempting-t.patch b/meta/recipes-extende=
d/<wbr>psmisc/psmisc/0001-Makefile.<wbr>am-create-src-directory-<wbr>before=
-attempting-t.patch<br>
new file mode 100644<br>
index 00000000000..4d44495fd3f<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>psmisc/psmisc/0001-Makefile.<wbr>am-create=
-src-directory-<wbr>before-attempting-t.patch<br>
@@ -0,0 +1,30 @@<br>
+From 285877b7761d74736aca2687ed9bef<wbr>2f78b82c33 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 2 Nov 2017 16:21:22 +0200<br>
+Subject: [PATCH] Makefile.am: create src directory before attempting to wr=
ite<br>
+ there<br>
+<br>
+Otherwise out of tree builds will fail.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ Makefile.am | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 9f61ab4..b4ced7f 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -79,7 +79,7 @@ EXTRA_DIST =3D src/signames.c README.md<br>
+ CLEANFILES =3D src/signames.h<br>
+<br>
+ src/signames.h: src/signames.c Makefile<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LC_ALL=3DC ; \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LC_ALL=3DC ; mkdi=
r -p src ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@CPP@ -dM $&lt; |\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr -s &#39;\t &#39;=
 &#39; &#39; | sort -n -k 3 | sed \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;s:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9]=
[0-9]*\).*$\:{\ \2,&quot;\1&quot; },:p;d&#39; | \<br>
+--<br>
+2.14.2<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>psmisc/psmisc/0001-Makefile.<wbr>am=
-do-not-recurse-into-po-<wbr>directory.patch b/meta/recipes-extended/<wbr>p=
smisc/psmisc/0001-Makefile.<wbr>am-do-not-recurse-into-po-<wbr>directory.pa=
tch<br>
new file mode 100644<br>
index 00000000000..72f993a1702<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>psmisc/psmisc/0001-Makefile.<wbr>am-do-not=
-recurse-into-po-<wbr>directory.patch<br>
@@ -0,0 +1,30 @@<br>
+From bbd69f375a0eaeba3bfa17008f8ff4<wbr>1e836c1688 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 2 Nov 2017 16:39:59 +0200<br>
+Subject: [PATCH] Makefile.am: do not recurse into po directory<br>
+<br>
+Some broken autoconf logic results in a missing Makefile - let&#39;s<br>
+just skip the directory with translations, as users of psmisc are unlikely=
<br>
+to need those anyway.<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ Makefile.am | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index b4ced7f..0d343a6 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -11,7 +11,6 @@ ACLOCAL_AMFLAGS =3D -I m4<br>
+<br>
+ SUBDIRS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doc \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 po \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0icons \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testsuite<br>
+<br>
+--<br>
+2.14.2<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>psmisc/<a href=3D"http://psmisc_22.=
21.bb" rel=3D"noreferrer" target=3D"_blank">psmisc_22.21.bb</a> b/meta/reci=
pes-extended/<wbr>psmisc/<a href=3D"http://psmisc_22.21.bb" rel=3D"noreferr=
er" target=3D"_blank">psmisc_22.21.bb</a><br>
deleted file mode 100644<br>
index 1c6473ebf43..00000000000<br>
--- a/meta/recipes-extended/<wbr>psmisc/<a href=3D"http://psmisc_22.21.bb" =
rel=3D"noreferrer" target=3D"_blank">psmisc_22.21.bb</a><br>
+++ /dev/null<br>
@@ -1,12 +0,0 @@<br>
-require psmisc.inc<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>0636e73ff0215e8d672dc=
4c32c317b<wbr>b3&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>935c0fd6eb208288262b385fa656f1<wbr>bf&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>97323cad619210845b696d7d722c38<wbr>3852b=
2acb5c49b5b0852c4f29c77a8<wbr>145a&quot;<br>
-<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/psmisc/<wbr>psmisc-${PV}.tar.gz \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Typo-in-fuser-<wbr>ma=
kes-M-on-all-the-time.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Include-limits.h-<wbr=
>for-PATH_MAX.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-UINTPTR_MAX-<wbr>=
instead-of-__WORDSIZE.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/meta/recipes-extended/<wbr>psmisc/<a href=3D"http://psmisc_23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">psmisc_23.0.bb</a> b/meta/recipe=
s-extended/<wbr>psmisc/<a href=3D"http://psmisc_23.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">psmisc_23.0.bb</a><br>
new file mode 100644<br>
index 00000000000..e036ae25508<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>psmisc/<a href=3D"http://psmisc_23.0.bb" r=
el=3D"noreferrer" target=3D"_blank">psmisc_23.0.bb</a><br>
@@ -0,0 +1,11 @@<br>
+require psmisc.inc<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>0636e73ff0215e8d672dc=
4c32c317b<wbr>b3&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/psmisc/psmisc.git;pro=
tocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.com/psmisc/<wbr>=
psmisc.git;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-UINTPTR_MAX-<wbr>=
instead-of-__WORDSIZE.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.am-<wbr>create-src=
-directory-before-<wbr>attempting-t.patch=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-do-<wbr>n=
ot-recurse-into-po-directory.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRCREV =3D &quot;<wbr>67b1da268f4c0ce6859980e3dfcfae<wbr>c5b2448e80&quot;<=
br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f6a2012ab5a055e22c79d--
