Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC5526C484
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:15:26 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o13so9950702ioh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Hiv2uu6FNyAnYQ52kSpQNdMet2HMboQac0Tx7Wo664I=;
	b=OEBstUjxMbMlhdQ/+jwEiNj7hZOLopQTVTp+iQtHOMENWRvDGK0r4BWBKW3A8kI6lY
	VQny2GSfpXJWR/A7GtS2KtTZlOIStTuGGyMut65WaJoXXJTWBCMqimLaw76Vc+b/XJuI
	7HL6PfEaYdbyr+EZArhYzZT5wwPHXE1Q5n58wUaGN7P4TxF2fITOLe6/WAsBTy1PEpXe
	0sqtu2REcTg1GAnn94AxZiLmJn3s6gxPLLKxaXpeWcl49i3gQbMxwDtFsu/DqY19oTVX
	PkXiq7Qy7JlCBxTSs9eMirXsh9tH4T372/M/jKSXt1zznoDzt/TIJe60VHbu4iQ3KhlQ
	qWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Hiv2uu6FNyAnYQ52kSpQNdMet2HMboQac0Tx7Wo664I=;
	b=GyLnn/qaRiH8WcgGtXDPJy2SU6g3Dz0sTRLRVLktYE8WvgYVI65SWp0NlA3ObJeTwT
	7C7plDE1YPLtIf+w/pqvzmeDyuQQlNFLtIjhsY61e3MEGfHZAavijqxdLi43G6pIfkYj
	bR7TQDIiY2nxK5mFwifpeyv44OW6pQczHSoDARL0WDDc4npG3WL9SZ7u+bd4RoDpSKfp
	nZoJUyYuJ/R0FUeknNUbjfcnPKVg0bdXYoq+/1qZuwL8/UBYy/l6IDYxAJD7i1ciM9bz
	vaJM8f8C9B81zSePLJ8yr4pBdLuljtua0gsWfmbRjBXWNd1jK/jLsXCKwMCXa80msjOq
	gnoQ==
X-Gm-Message-State: AA+aEWYdAdgwGZtc2F1oQAr/8TTjWZF2e5lSExKKTIJ/U8O/TlYEF5df
	JbKjMf5wgD3GN8bGUC1KbeuS/9eBKbKpzQeiXh5H0Z1kxV4=
X-Google-Smtp-Source: AFSGD/WJ9Gffba42VVqUysjEvnpfFPaMGks/2QoYs6KkuezkUhqzEqPV50akRIsMvLcmO3BfuHYU+kLG3PtqUYuJqgk=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr9878566iog.270.1545052527980; 
	Mon, 17 Dec 2018 05:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
	<20181214181430.1517643-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20181214181430.1517643-1-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2018 13:15:17 +0000
Message-ID: <CAJTo0LbuYUZSMW7oLThvgLVaXi7JNi4GWpCXKPvQ0Y3qvsg4rg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: build with recent attr
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
X-List-Received-Date: Mon, 17 Dec 2018 13:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

| In file included from port_wrappers.c:8:0,
|                  from pseudo_wrappers.c:307:
| ports/linux/xattr/pseudo_wrappers.c: In function =E2=80=98shared_getxattr=
=E2=80=99:
| ports/linux/xattr/pseudo_wrappers.c:134:11: error: =E2=80=98ENOATTR=E2=80=
=99
undeclared (first use in this function)
|    errno =3D ENOATTR;
|            ^~~~~~~
| ports/linux/xattr/pseudo_wrappers.c:134:11: note: each undeclared
identifier is reported only once for each function it appears in
| ports/linux/xattr/pseudo_wrappers.c: In function =E2=80=98shared_listxatt=
r=E2=80=99:
| ports/linux/xattr/pseudo_wrappers.c:255:11: error: =E2=80=98ENOATTR=E2=80=
=99
undeclared (first use in this function)
|    errno =3D ENOATTR;
|            ^~~~~~~

Breaks when building with old xattr.

Ross
On Fri, 14 Dec 2018 at 18:16, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>
> Recent attr package removed <attr/xattr.h> which is shipped by libc
> for a very long time already.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  ...001-use-sys-xattr.h-not-attr-xattr.h.patch | 54 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-use-sys-xattr=
.h-not-attr-xattr.h.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-=
attr-xattr.h.patch b/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.=
h-not-attr-xattr.h.patch
> new file mode 100644
> index 0000000000..5eddea5ba1
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xa=
ttr.h.patch
> @@ -0,0 +1,54 @@
> +From 7132668ce2409e0919a79d6f236827665f068427 Mon Sep 17 00:00:00 2001
> +From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> +Date: Fri, 14 Dec 2018 18:41:04 +0100
> +Subject: [PATCH, pseudo] use <sys/xattr.h>, not <attr/xattr.h>
> +
> +<attr/xattr.h> has been removed from recent attr package:
> +
> +   The xattr syscalls are provided by glibc since ages, so there is
> +   no need to use the indirect system call "syscall" anymore. This
> +   removes the need for the <attr/xattr.h> header; use <sys/xattr.h>
> +   instead.
> +
> +   http://git.savannah.nongnu.org/cgit/attr.git/commit/include?id=3D7921=
157890d07858d092f4003ca4c6bae9fd2c38
> +
> +For Linux, we have to include <attr/attributes.h> to define ENODATA.
> +
> +Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> +---
> +Upstream-Status: pending
> +
> + ports/linux/subports         | 4 ++--
> + ports/linux/xattr/portdefs.h | 3 ++-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/ports/linux/subports b/ports/linux/subports
> +index a29044a..44e0e9e 100755
> +--- a/ports/linux/subports
> ++++ b/ports/linux/subports
> +@@ -29,11 +29,11 @@ fi
> + if    $port_xattr; then
> +       cat > dummy.c <<EOF
> + #include <sys/types.h>
> +-#include <attr/xattr.h>
> ++#include <sys/xattr.h>
> + int i;
> + EOF
> +       if ! ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
> +-              echo >&2 "Warning: Can't compile trivial program using <a=
ttr/xattr.h>".
> ++              echo >&2 "Warning: Can't compile trivial program using <s=
ys/xattr.h>".
> +               echo >&2 "         xattr support will require that header=
."
> +       fi
> +       echo "linux/xattr"
> +diff --git a/ports/linux/xattr/portdefs.h b/ports/linux/xattr/portdefs.h
> +index 367ca60..bb577f1 100644
> +--- a/ports/linux/xattr/portdefs.h
> ++++ b/ports/linux/xattr/portdefs.h
> +@@ -1,2 +1,3 @@
> +-#include <attr/xattr.h>
> ++#include <sys/xattr.h>
> ++#include <attr/attributes.h>
> + #include <stdint.h>
> +--
> +2.19.2
> +
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 79e0b6bd21..a0147d2d19 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -6,6 +6,7 @@ SRC_URI =3D "git://git.yoctoproject.org/pseudo \
>             file://fallback-group \
>             file://moreretries.patch \
>             file://toomanyfiles.patch \
> +           file://0001-use-sys-xattr.h-not-attr-xattr.h.patch \
>             "
>
>  SRCREV =3D "6294b344e5140f5467e6860f45a174440015304e"
> --
> 2.19.2
>

