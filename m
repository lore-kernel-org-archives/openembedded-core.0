Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5C7A6011C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 05:48:25 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so5202423pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 22:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=6u2OWrdzxmwrqtYoYYMI6LAU0epqfOB1RARIDJRBR8w=;
	b=DdlL9UBNdpTghyIQrTjRK532xHrbubZdtsQ/yLBWYfjKvSYqtLw5vuXXiCqdSmUitY
	3m2MVOdIfeZZ6sRWW0fALpPwrK3//XN4sjMRDTMj9hodXT1nYlJx/RxYn1f7XRt8mHOt
	qFE9SavifU59jLMWPYx1kYVYXg42NrWwBc49/6cpnREX1EQMBaKFe8B1UsefMEFWPR87
	I9uVU/vfvEF94IiaBN3tHj/sF+fLGtGBq2ZCLHrfLUZJb2zwEZdVc/q8Pr/WkK0YkTzz
	c8CbnQ4gbRzln02maExG1B2H67TPXSgPxKgQh01zzgcfn8MJtx1HOuiv5qQL4xJ63sHc
	M+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=6u2OWrdzxmwrqtYoYYMI6LAU0epqfOB1RARIDJRBR8w=;
	b=mpEoZCaB1K6F2fjFkBY8aw77qNmD0MAXmtfdgikhpoD+Qwrbk6ImGXX88hRay2EzgJ
	p7JO8pYzGpUEZHJtQ94tbjKP2ICOLyhGg4WN2mtTtY+/BXykayjqH+TEQmmysUNGgEIW
	CR0BiMrqQCKM7EWoI71fGEaQPWslK4seibkWFlfQq3H5L8nJsUxj2i3bQWyfoSApFkNG
	/U9xdaHVLkyalQRmr+u8IoIYmIH4bUw+JDecGWc3SwLgrL2mI/8TtR4DNh11eZ8mb+Em
	+orWeM+dbtE6UacjtbmE3+bKB/Z+AgzIU+Cphcy8jxKljmsEw2/Lm5wjddXkDup0Tp9n
	N7zQ==
X-Gm-Message-State: AOPr4FXyxrRrb7cPHSo3tclrp3+rnHiyeXYtJOnSWVLPxyUumfrpG/Ul3MMXhXQfLAeuyA==
X-Received: by 10.66.241.73 with SMTP id wg9mr10859453pac.91.1463032105737;
	Wed, 11 May 2016 22:48:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7cb8:9b45:b830:2c9b?
	([2601:646:8800:5a9a:7cb8:9b45:b830:2c9b])
	by smtp.gmail.com with ESMTPSA id
	u65sm16451264pfa.9.2016.05.11.22.48.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 22:48:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6223674eea564ccd23988b46d41bcf6f3695c93d.1462987863.git.raj.khem@gmail.com>
Date: Wed, 11 May 2016 22:48:43 -0700
Message-Id: <9FF7B507-01EA-4BCB-BA60-DC7E8CA9DAA3@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<cover.1462987863.git.raj.khem@gmail.com>
	<6223674eea564ccd23988b46d41bcf6f3695c93d.1462987863.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 33/42] gdb: Upgrade to 7.11
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
X-List-Received-Date: Thu, 12 May 2016 05:48:25 -0000
X-Groupsio-MsgNum: 81954
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F9ED17DA-B470-4D7C-B907-573A91606E1A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F9ED17DA-B470-4D7C-B907-573A91606E1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

There is a v2 of this which I pushed to pull tree. I had to do to fix =
the build on musl/ppc target
Added

CFLAGS_append_libc-musl =3D " -Drpl_gettimeofday=3Dgettimeofday=E2=80=9D

> On May 11, 2016, at 10:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../gdb/{gdb-7.10.1.inc =3D> gdb-7.11.inc}           |  0
> meta/recipes-devtools/gdb/gdb-common.inc           | 20 +++++++--
> ...nadian_7.10.1.bb =3D> gdb-cross-canadian_7.11.bb} |  0
> meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb      |  4 --
> meta/recipes-devtools/gdb/gdb-cross_7.11.bb        |  2 +
> meta/recipes-devtools/gdb/gdb.inc                  | 10 -----
> .../gdb/0001-include-sys-types.h-for-mode_t.patch  | 10 ++---
> ...002-make-man-install-relative-to-DESTDIR.patch} |  8 ++--
> ...-linux-nat-Define-_ABIO32-if-not-defined.patch} |  8 ++--
> ...efine-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} | 11 ++---
> ...-support-for-Renesas-SH-sh4-architecture.patch} | 32 =
+++++++--------
> ...-libreadline.a-when-using-disable-static.patch} | 21 ++++++++--
> ...gidefs.h.patch =3D> 0007-use-asm-sgidefs.h.patch} | 15 +++----
> ...0008-Use-exorted-definitions-of-SIGRTMIN.patch} | 44 =
+++++++++-----------
> ...AGS.patch =3D> 0009-Change-order-of-CFLAGS.patch} | 18 ++++----
> .../0010-resolve-restrict-keyword-conflict.patch   | 48 =
++++++++++++++++++++++
> .../gdb/{gdb_7.10.1.bb =3D> gdb_7.11.bb}             |  0
> 17 files changed, 155 insertions(+), 96 deletions(-)
> rename meta/recipes-devtools/gdb/{gdb-7.10.1.inc =3D> gdb-7.11.inc} =
(100%)
> rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.10.1.bb =3D> =
gdb-cross-canadian_7.11.bb} (100%)
> delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
> create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.11.bb
> rename =
meta/recipes-devtools/gdb/gdb/{0001-make-man-install-relative-to-DESTDIR.p=
atch =3D> 0002-make-man-install-relative-to-DESTDIR.patch} (78%)
> rename =
meta/recipes-devtools/gdb/gdb/{0001-mips-linux-nat-Define-_ABIO32-if-not-d=
efined.patch =3D> =
0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (84%)
> rename =
meta/recipes-devtools/gdb/gdb/{0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs=
-on-GLIBC-syst.patch =3D> =
0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (83%)
> rename =
meta/recipes-devtools/gdb/gdb/{0003-Add-support-for-Renesas-SH-sh4-archite=
cture.patch =3D> 0005-Add-support-for-Renesas-SH-sh4-architecture.patch} =
(97%)
> rename meta/recipes-devtools/gdb/gdb/{force-readline-static.patch =3D> =
0006-Dont-disable-libreadline.a-when-using-disable-static.patch} (67%)
> rename meta/recipes-devtools/gdb/gdb/{0001-use-asm-sgidefs.h.patch =3D> =
0007-use-asm-sgidefs.h.patch} (69%)
> rename =
meta/recipes-devtools/gdb/gdb/{0001-Use-exported-definitions-of-SIGRTMIN.p=
atch =3D> 0008-Use-exorted-definitions-of-SIGRTMIN.patch} (49%)
> rename =
meta/recipes-devtools/gdb/gdb/{0002-Change-order-of-CFLAGS.patch =3D> =
0009-Change-order-of-CFLAGS.patch} (69%)
> create mode 100644 =
meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch=

> rename meta/recipes-devtools/gdb/{gdb_7.10.1.bb =3D> gdb_7.11.bb} =
(100%)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-7.10.1.inc =
b/meta/recipes-devtools/gdb/gdb-7.11.inc
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-7.10.1.inc
> rename to meta/recipes-devtools/gdb/gdb-7.11.inc
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc =
b/meta/recipes-devtools/gdb/gdb-common.inc
> index f208055..0e6ecd4 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -16,8 +16,6 @@ LTTNGUST_mips64eln32 =3D ""
> LTTNGUST_sh4 =3D ""
> LTTNGUST_libc-musl =3D ""
>=20
> -INC_PR =3D "r0"
> -
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> 		file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674 =
\
> 		file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> @@ -25,8 +23,22 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>=20
> inherit autotools texinfo
>=20
> -SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
> -          "
> +SRCREV =3D "1a982b689ce4e20523bdf69e47fdd574c4f63934"
> +
> +SRC_URI =3D =
"git://sourceware.org/git/binutils-gdb.git;branch=3Dgdb-7.11-branch \
> +           file://0001-include-sys-types.h-for-mode_t.patch \
> +           file://0002-make-man-install-relative-to-DESTDIR.patch \
> +           =
file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
> +           =
file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
> +           =
file://0005-Add-support-for-Renesas-SH-sh4-architecture.patch \
> +           =
file://0006-Dont-disable-libreadline.a-when-using-disable-static.patch \
> +           file://0007-use-asm-sgidefs.h.patch \
> +           file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
> +           file://0009-Change-order-of-CFLAGS.patch \
> +           file://0010-resolve-restrict-keyword-conflict.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
>=20
> B =3D "${WORKDIR}/build-${TARGET_SYS}"
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.10.1.bb =
b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.10.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb =
b/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
> deleted file mode 100644
> index 3a95cfb..0000000
> --- a/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require gdb-cross.inc
> -require gdb-${PV}.inc
> -
> -SRC_URI +=3D "file://0001-make-man-install-relative-to-DESTDIR.patch"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.11.bb =
b/meta/recipes-devtools/gdb/gdb-cross_7.11.bb
> new file mode 100644
> index 0000000..50cf159
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-cross_7.11.bb
> @@ -0,0 +1,2 @@
> +require gdb-cross.inc
> +require gdb-${PV}.inc
> diff --git a/meta/recipes-devtools/gdb/gdb.inc =
b/meta/recipes-devtools/gdb/gdb.inc
> index 5a2067e..52119a0 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -2,16 +2,6 @@ require gdb-common.inc
>=20
> inherit gettext
>=20
> -SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
> -           file://0002-Change-order-of-CFLAGS.patch \
> -           =
file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
> -           file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
> -           file://0001-include-sys-types.h-for-mode_t.patch \
> -           file://0001-use-asm-sgidefs.h.patch \
> -           file://force-readline-static.patch \
> -           =
file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
> -           =
file://0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
> -           "
> #LDFLAGS_append =3D " -s"
> #export CFLAGS_append=3D" -L${STAGING_LIBDIR}"
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch =
b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
> index a0292e4..0042c00 100644
> --- =
a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
> @@ -1,7 +1,7 @@
> -=46rom acbee4edacb80b5eeaff2480712fe98e56443997 Mon Sep 17 00:00:00 =
2001
> +=46rom fddd7178915968acf680814411b8b3cb137d0587 Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Tue, 19 Jan 2016 18:18:52 -0800
> -Subject: [PATCH] include sys/types.h for mode_t
> +Subject: [PATCH 01/10] include sys/types.h for mode_t
>=20
> mode_t is used in target.h, so we need to include sys/types.h to get =
the
> defintion
> @@ -14,10 +14,10 @@ Upstream-Status: Pending
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
> -index 9a40867..aaecab9 100644
> +index 5af2051..f42c510 100644
> --- a/gdb/gdbserver/target.h
> +++ b/gdb/gdbserver/target.h
> -@@ -27,6 +27,7 @@
> +@@ -28,6 +28,7 @@
>  #include "target/waitstatus.h"
>  #include "mem-break.h"
>  #include "btrace-common.h"
> @@ -26,5 +26,5 @@ index 9a40867..aaecab9 100644
>  struct emit_ops;
>  struct buffer;
> --
> -2.7.0
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.=
patch =
b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.=
patch
> similarity index 78%
> rename from =
meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.pa=
tch
> rename to =
meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.pa=
tch
> index 6996c18..defed62 100644
> --- =
a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.=
patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.=
patch
> @@ -1,7 +1,7 @@
> -=46rom 12b0506951460c3cc37d775478d024db3f95e9d8 Mon Sep 17 00:00:00 =
2001
> +=46rom 3229cb09033eeb5003a08d91fa9d43be8ba4c86b Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Mon, 2 Mar 2015 02:27:55 +0000
> -Subject: [PATCH 1/3] make man install relative to DESTDIR
> +Subject: [PATCH 02/10] make man install relative to DESTDIR
>=20
> Upstream-Status: Pending
>=20
> @@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
> -index d49a93b..2121c46 100644
> +index a05f507..8d0fa64 100644
> --- a/sim/common/Makefile.in
> +++ b/sim/common/Makefile.in
> @@ -35,7 +35,7 @@ tooldir =3D $(libdir)/$(target_alias)
> @@ -24,5 +24,5 @@ index d49a93b..2121c46 100644
>  includedir =3D @includedir@
>=20
> --
> -2.1.4
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-=
defined.patch =
b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-=
defined.patch
> similarity index 84%
> rename from =
meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-de=
fined.patch
> rename to =
meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-de=
fined.patch
> index 3173952..bac7939 100644
> --- =
a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-=
defined.patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-=
defined.patch
> @@ -1,7 +1,7 @@
> -=46rom e92f8932ef488de2a56db4299131ce6a4eb170bd Mon Sep 17 00:00:00 =
2001
> +=46rom 88e67caed662d8344c8db56176c9f1221e6cd2a2 Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Wed, 23 Mar 2016 06:30:09 +0000
> -Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
> +Subject: [PATCH 03/10] mips-linux-nat: Define _ABIO32 if not defined
>=20
> This helps building gdb on mips64 on musl, since
> musl does not provide sgidefs.h this define is
> @@ -17,7 +17,7 @@ Upstream-Status: Pending
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> -index fd5c705..753f29d 100644
> +index bfe9fcb..449b43a 100644
> --- a/gdb/mips-linux-nat.c
> +++ b/gdb/mips-linux-nat.c
> @@ -46,6 +46,11 @@
> @@ -33,5 +33,5 @@ index fd5c705..753f29d 100644
>     we'll clear this and use PTRACE_PEEKUSER instead.  */
>  static int have_ptrace_regsets =3D 1;
> --
> -1.8.3.1
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_reg=
s-on-GLIBC-syst.patch =
b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_reg=
s-on-GLIBC-syst.patch
> similarity index 83%
> rename from =
meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-=
on-GLIBC-syst.patch
> rename to =
meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-=
on-GLIBC-syst.patch
> index 342f1ce..a5fe2a2 100644
> --- =
a/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_reg=
s-on-GLIBC-syst.patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_reg=
s-on-GLIBC-syst.patch
> @@ -1,7 +1,8 @@
> -=46rom 33a2cdb731298b73277507f01b9a21cd340c5b5c Mon Sep 17 00:00:00 =
2001
> +=46rom bec564eb454bc7fc6ecfcb573aa53040bf39c1d5 Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Sat, 30 Apr 2016 16:46:03 +0000
> -Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC =
systems
> +Subject: [PATCH 04/10] ppc/ptrace: Define pt_regs uapi_pt_regs on =
!GLIBC
> + systems
>=20
> Upstream-Status: Pending
>=20
> @@ -12,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/gdb/gdbserver/linux-ppc-low.c =
b/gdb/gdbserver/linux-ppc-low.c
> -index 188fac0..f71d5ab 100644
> +index 2145c50..777905d 100644
> --- a/gdb/gdbserver/linux-ppc-low.c
> +++ b/gdb/gdbserver/linux-ppc-low.c
> @@ -21,7 +21,13 @@
> @@ -30,7 +31,7 @@ index 188fac0..f71d5ab 100644
>  #include "nat/ppc-linux.h"
>=20
> diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
> -index 0ff2223..c978daa 100644
> +index 85fbcd8..cbec9c5 100644
> --- a/gdb/nat/ppc-linux.h
> +++ b/gdb/nat/ppc-linux.h
> @@ -18,7 +18,13 @@
> @@ -48,5 +49,5 @@ index 0ff2223..c978daa 100644
>=20
>  /* This sometimes isn't defined.  */
> --
> -1.8.3.1
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-archit=
ecture.patch =
b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-archit=
ecture.patch
> similarity index 97%
> rename from =
meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architec=
ture.patch
> rename to =
meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architec=
ture.patch
> index 4a3e22c..8809e6f 100644
> --- =
a/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-archit=
ecture.patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-archit=
ecture.patch
> @@ -1,7 +1,7 @@
> -=46rom 407cb13cfb70697f45dfb761304e005e1ecbd0e9 Mon Sep 17 00:00:00 =
2001
> +=46rom 8c5fe58c5a0044ddb517a41b277ed27fb3d3bedc Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Mon, 2 Mar 2015 02:31:12 +0000
> -Subject: [PATCH 3/3] Add support for Renesas SH (sh4) architecture.
> +Subject: [PATCH 05/10] Add support for Renesas SH (sh4) architecture.
>=20
> gdb (7.4-1~cvs20111117.2) experimental; urgency=3Dlow
>  .
> @@ -27,10 +27,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  11 files changed, 617 insertions(+), 29 deletions(-)
>=20
> diff --git a/gdb/Makefile.in b/gdb/Makefile.in
> -index 7937801..63baf81 100644
> +index ec2af52..df8e84d 100644
> --- a/gdb/Makefile.in
> +++ b/gdb/Makefile.in
> -@@ -1707,6 +1707,7 @@ ALLDEPFILES =3D \
> +@@ -1736,6 +1736,7 @@ ALLDEPFILES =3D \
>  	score-tdep.c \
>  	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
>  	sh-tdep.c sh64-tdep.c shnbsd-tdep.c shnbsd-nat.c \
> @@ -39,10 +39,10 @@ index 7937801..63baf81 100644
>  	solib-svr4.c \
>  	sparc-linux-nat.c sparc-linux-tdep.c \
> diff --git a/gdb/configure.host b/gdb/configure.host
> -index d07be4b..b6391c5 100644
> +index ef265eb..322a1e2 100644
> --- a/gdb/configure.host
> +++ b/gdb/configure.host
> -@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=3Dlinux ;;
> +@@ -149,6 +149,7 @@ powerpc*-*-linux*)	gdb_host=3Dlinux ;;
>=20
>  s390*-*-linux*)		gdb_host=3Dlinux ;;
>=20
> @@ -51,7 +51,7 @@ index d07be4b..b6391c5 100644
>  			gdb_host=3Dnbsd ;;
>  sh*-*-openbsd*)		gdb_host=3Dnbsd ;;
> diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
> -index 2ff2ee8..1a11262 100644
> +index 2418d25..ac8ea9e 100644
> --- a/gdb/sh-linux-tdep.c
> +++ b/gdb/sh-linux-tdep.c
> @@ -18,14 +18,37 @@
> @@ -599,7 +599,7 @@ index 2ff2ee8..1a11262 100644
>=20
>    /* GNU/Linux uses SVR4-style shared libraries.  */
> diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
> -index 82cf2f4..b443e46 100644
> +index 336b48e..847b271 100644
> --- a/gdb/sh-tdep.c
> +++ b/gdb/sh-tdep.c
> @@ -21,6 +21,9 @@
> @@ -702,7 +702,7 @@ index 82cf2f4..b443e46 100644
>=20
>    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] !=3D -1)
>      return frame_unwind_got_memory (this_frame, regnum,
> -@@ -2237,8 +2224,8 @@ sh_return_in_first_hidden_param_p (struct =
gdbarch *gdbarch,
> +@@ -2240,8 +2227,8 @@ sh_return_in_first_hidden_param_p (struct =
gdbarch *gdbarch,
>  static struct gdbarch *
>  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list =
*arches)
>  {
> @@ -712,7 +712,7 @@ index 82cf2f4..b443e46 100644
>=20
>    /* SH5 is handled entirely in sh64-tdep.c.  */
>    if (info.bfd_arch_info->mach =3D=3D bfd_mach_sh5)
> -@@ -2254,6 +2241,18 @@ sh_gdbarch_init (struct gdbarch_info info, =
struct gdbarch_list *arches)
> +@@ -2257,6 +2244,18 @@ sh_gdbarch_init (struct gdbarch_info info, =
struct gdbarch_list *arches)
>    tdep =3D XCNEW (struct gdbarch_tdep);
>    gdbarch =3D gdbarch_alloc (&info, tdep);
>=20
> @@ -731,7 +731,7 @@ index 82cf2f4..b443e46 100644
>    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
>    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
>    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
> -@@ -2404,10 +2403,11 @@ sh_gdbarch_init (struct gdbarch_info info, =
struct gdbarch_list *arches)
> +@@ -2407,10 +2406,11 @@ sh_gdbarch_init (struct gdbarch_info info, =
struct gdbarch_list *arches)
>        break;
>      }
>=20
> @@ -745,7 +745,7 @@ index 82cf2f4..b443e46 100644
>    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
>=20
> diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
> -index fc671a5..699f59f 100644
> +index 666968f..62c65b5 100644
> --- a/gdb/sh-tdep.h
> +++ b/gdb/sh-tdep.h
> @@ -21,6 +21,12 @@
> @@ -828,10 +828,10 @@ index fc671a5..699f59f 100644
>       where each general-purpose register is stored inside the =
associated
>       core file section.  */
> diff --git a/gdb/testsuite/gdb.asm/asm-source.exp =
b/gdb/testsuite/gdb.asm/asm-source.exp
> -index 8854af0..ef44682 100644
> +index 6d9aef8..5b66b42 100644
> --- a/gdb/testsuite/gdb.asm/asm-source.exp
> +++ b/gdb/testsuite/gdb.asm/asm-source.exp
> -@@ -113,6 +113,11 @@ switch -glob -- [istarget] {
> +@@ -116,6 +116,11 @@ switch -glob -- [istarget] {
>              append link-flags " -m elf32ppc"
>          }
>      }
> @@ -873,7 +873,7 @@ index 424e1b8..0de2e7b 100644
>  void
>  handle_USR1 (int sig)
> diff --git a/gdb/testsuite/gdb.base/annota3.c =
b/gdb/testsuite/gdb.base/annota3.c
> -index 424e1b8..952aaf2 100644
> +index 424e1b8..952aaf21 100644
> --- a/gdb/testsuite/gdb.base/annota3.c
> +++ b/gdb/testsuite/gdb.base/annota3.c
> @@ -1,6 +1,10 @@
> @@ -917,5 +917,5 @@ index 7566068..1205a9b 100644
>  static int count =3D 0;
>=20
> --
> -2.1.4
> +2.8.2
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch =
b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using=
-disable-static.patch
> similarity index 67%
> rename from meta/recipes-devtools/gdb/gdb/force-readline-static.patch
> rename to =
meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-d=
isable-static.patch
> index d34ee8c..394d26d 100644
> --- a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using=
-disable-static.patch
> @@ -1,3 +1,8 @@
> +=46rom f3932cb2960fd54655a448b13d5a5b80f356f8de Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 30 Apr 2016 15:25:03 -0700
> +Subject: [PATCH 06/10] Dont disable libreadline.a when using =
--disable-static
> +
> If gdb is configured with --disable-static then this is dutifully =
passed to
> readline which then disables libreadline.a, which causes a problem =
when gdb
> tries to link against that.
> @@ -7,12 +12,17 @@ the sub-configure.
>=20
> Upstream-Status: Pending
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile.def | 3 ++-
> + Makefile.in  | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Makefile.def b/Makefile.def
> -index 4394188..05c661a 100644
> +index ea8453e..0fc66c6 100644
> --- a/Makefile.def
> +++ b/Makefile.def
> -@@ -100,7 +100,8 @@ host_modules=3D { module=3D libiconv;
> +@@ -104,7 +104,8 @@ host_modules=3D { module=3D libiconv;
>  		missing=3D install-html;
>  		missing=3D install-info; };
>  host_modules=3D { module=3D m4; };
> @@ -23,10 +33,10 @@ index 4394188..05c661a 100644
>  host_modules=3D { module=3D sim; };
>  host_modules=3D { module=3D texinfo; no_install=3D true; };
> diff --git a/Makefile.in b/Makefile.in
> -index 61e0ab6..837f36e 100644
> +index 2733c4d..3e04e80 100644
> --- a/Makefile.in
> +++ b/Makefile.in
> -@@ -24971,7 +24971,7 @@ configure-readline:
> +@@ -25380,7 +25380,7 @@ configure-readline:
>  	  $$s/$$module_srcdir/configure \
>  	  --srcdir=3D$${topdir}/$$module_srcdir \
>  	  $(HOST_CONFIGARGS) --build=3D${build_alias} =
--host=3D${host_alias} \
> @@ -35,3 +45,6 @@ index 61e0ab6..837f36e 100644
>  	  || exit 1
>  @endif readline
>=20
> +--
> +2.8.2
> +
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch =
b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
> similarity index 69%
> rename from meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
> rename to meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
> index eaec390..f32f8ee 100644
> --- a/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
> @@ -1,7 +1,7 @@
> -=46rom 677b5b56135141c0d259e370aacd0e11c810aa15 Mon Sep 17 00:00:00 =
2001
> -From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Fri, 5 Feb 2016 14:00:00 -0800
> -Subject: [PATCH] use <asm/sgidefs.h>
> +=46rom 048675a915a72989f2613386975730da016e7c5d Mon Sep 17 00:00:00 =
2001
> +From: Andre McCurdy <amccurdy@gmail.com>
> +Date: Sat, 30 Apr 2016 15:29:06 -0700
> +Subject: [PATCH 07/10] use <asm/sgidefs.h>
>=20
> Build fix for MIPS with musl libc
>=20
> @@ -13,12 +13,13 @@ instead.
> Upstream-Status: Pending
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  gdb/mips-linux-nat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> -index a36bb63..fd5c705 100644
> +index 449b43a..09603da 100644
> --- a/gdb/mips-linux-nat.c
> +++ b/gdb/mips-linux-nat.c
> @@ -31,7 +31,7 @@
> @@ -27,9 +28,9 @@ index a36bb63..fd5c705 100644
>=20
> -#include <sgidefs.h>
> +#include <asm/sgidefs.h>
> - #include <sys/ptrace.h>
> + #include "nat/gdb_ptrace.h"
>  #include <asm/ptrace.h>
>=20
> --
> -1.9.1
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.=
patch =
b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.p=
atch
> similarity index 49%
> rename from =
meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.pa=
tch
> rename to =
meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.pat=
ch
> index 5f0c096..7e58b61 100644
> --- =
a/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.=
patch
> +++ =
b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.p=
atch
> @@ -1,7 +1,7 @@
> -=46rom 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00 =
2001
> +=46rom e54ead9d81f4d38412751b815f909db3cb144bb1 Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 5 Jun 2015 20:21:38 -0700
> -Subject: [PATCH] Use exorted definitions of SIGRTMIN
> +Date: Sat, 30 Apr 2016 15:31:40 -0700
> +Subject: [PATCH 08/10] Use exorted definitions of SIGRTMIN
>=20
> Define W_STOPCODE if not defined already
>=20
> @@ -11,38 +11,34 @@ may not provide them
> Fixes
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D13012
>=20
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> Upstream-Status: Submitted
>=20
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
>  gdb/linux-nat.c     | 4 ++--
>  gdb/nat/linux-nat.h | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
> -index 396c30c..50320ee 100644
> +index 0829bcb..3b8a896 100644
> --- a/gdb/linux-nat.c
> +++ b/gdb/linux-nat.c
> -@@ -4856,10 +4856,10 @@ lin_thread_get_thread_signals (sigset_t *set)
> -      fortunately they don't change!  */
> -
> -   if (restart =3D=3D 0)
> --    restart =3D __SIGRTMIN;
> -+    restart =3D SIGRTMIN;
> -
> -   if (cancel =3D=3D 0)
> --    cancel =3D __SIGRTMIN + 1;
> -+    cancel =3D SIGRTMIN + 1;
> -
> -   sigaddset (set, restart);
> -   sigaddset (set, cancel);
> +@@ -4845,6 +4845,6 @@ lin_thread_get_thread_signals (sigset_t *set)
> +   /* NPTL reserves the first two RT signals, but does not provide =
any
> +      way for the debugger to query the signal numbers - fortunately
> +      they don't change.  */
> +-  sigaddset (set, __SIGRTMIN);
> +-  sigaddset (set, __SIGRTMIN + 1);
> ++  sigaddset (set, SIGRTMIN);
> ++  sigaddset (set, SIGRTMIN + 1);
> + }
> diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
> -index 83a6d91..efbe0fd 100644
> +index 2b485db..d058afc 100644
> --- a/gdb/nat/linux-nat.h
> +++ b/gdb/nat/linux-nat.h
> -@@ -25,4 +25,8 @@
> -    instead SIGTRAP with bit 7 set.  */
> - #define SYSCALL_SIGTRAP (SIGTRAP | 0x80)
> +@@ -85,4 +85,8 @@ extern enum target_stop_reason lwp_stop_reason =
(struct lwp_info *lwp);
> +
> + extern void linux_stop_lwp (struct lwp_info *lwp);
>=20
> +#ifndef W_STOPCODE
> +#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
> @@ -50,5 +46,5 @@ index 83a6d91..efbe0fd 100644
> +
>  #endif /* LINUX_NAT_H */
> --
> -2.1.4
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch =
b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
> similarity index 69%
> rename from =
meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
> rename to =
meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
> index bccb45f..a230047 100644
> --- a/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
> @@ -1,7 +1,7 @@
> -=46rom 262ccc4fdb2a3df0f16c61a807046964ae7729c9 Mon Sep 17 00:00:00 =
2001
> +=46rom ba0bbf887d4911ccee9df57cb13eafb1de34bb31 Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 2 Mar 2015 02:29:23 +0000
> -Subject: [PATCH 2/3] Change order of CFLAGS
> +Date: Sat, 30 Apr 2016 15:35:39 -0700
> +Subject: [PATCH 09/10] Change order of CFLAGS
>=20
> Lets us override Werror if need be
>=20
> @@ -13,22 +13,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
> -index 1ed2ec8..0cef95b 100644
> +index 1e874e3..91e8550 100644
> --- a/gdb/gdbserver/Makefile.in
> +++ b/gdb/gdbserver/Makefile.in
> -@@ -131,10 +131,10 @@ CFLAGS =3D @CFLAGS@
> +@@ -138,10 +138,10 @@ CXXFLAGS =3D @CXXFLAGS@
>  CPPFLAGS =3D @CPPFLAGS@
>=20
>  # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
> --INTERNAL_CFLAGS_BASE =3D  ${CFLAGS} ${GLOBAL_CFLAGS} \
> -+INTERNAL_CFLAGS_BASE =3D ${GLOBAL_CFLAGS} \
> +-INTERNAL_CFLAGS_BASE =3D  ${COMPILER_CFLAGS} ${GLOBAL_CFLAGS} \
> ++INTERNAL_CFLAGS_BASE =3D  ${GLOBAL_CFLAGS} \
>  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS}
>  INTERNAL_WARN_CFLAGS =3D  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
> -INTERNAL_CFLAGS =3D  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) =
-DGDBSERVER
> -+INTERNAL_CFLAGS =3D  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) =
${CFLAGS} -DGDBSERVER
> ++INTERNAL_CFLAGS =3D  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) =
${COMPILER_CFLAGS} -DGDBSERVER
>=20
>  # LDFLAGS is specifically reserved for setting from the command line
>  # when running make.
> --
> -2.1.4
> +2.8.2
>=20
> diff --git =
a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.pat=
ch =
b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.pat=
ch
> new file mode 100644
> index 0000000..16c34c7
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.pat=
ch
> @@ -0,0 +1,48 @@
> +=46rom 5a9ccb8c0728b658fc4f7f0f7b36873c64274f10 Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 10 May 2016 08:47:05 -0700
> +Subject: [PATCH 10/10] resolve restrict keyword conflict
> +
> +GCC detects that we call 'restrict' as param name in function
> +signatures and complains since both params are called 'restrict'
> +therefore we use __restrict to denote the C99 keywork
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gdb/gnulib/import/sys_time.in.h | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/gdb/gnulib/import/sys_time.in.h =
b/gdb/gnulib/import/sys_time.in.h
> +index c556c5d..2a6107f 100644
> +--- a/gdb/gnulib/import/sys_time.in.h
> ++++ b/gdb/gnulib/import/sys_time.in.h
> +@@ -93,20 +93,20 @@ struct timeval
> + #   define gettimeofday rpl_gettimeofday
> + #  endif
> + _GL_FUNCDECL_RPL (gettimeofday, int,
> +-                  (struct timeval *restrict, void *restrict)
> ++                  (struct timeval *__restrict, void *__restrict)
> +                   _GL_ARG_NONNULL ((1)));
> + _GL_CXXALIAS_RPL (gettimeofday, int,
> +-                  (struct timeval *restrict, void *restrict));
> ++                  (struct timeval *__restrict, void *__restrict));
> + # else
> + #  if !@HAVE_GETTIMEOFDAY@
> + _GL_FUNCDECL_SYS (gettimeofday, int,
> +-                  (struct timeval *restrict, void *restrict)
> ++                  (struct timeval *__restrict, void *__restrict)
> +                   _GL_ARG_NONNULL ((1)));
> + #  endif
> + /* Need to cast, because on glibc systems, by default, the second =
argument is
> +                                                   struct timezone *. =
 */
> + _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
> +-                       (struct timeval *restrict, void *restrict));
> ++                       (struct timeval *__restrict, void =
*__restrict));
> + # endif
> + _GL_CXXALIASWARN (gettimeofday);
> + #elif defined GNULIB_POSIXCHECK
> +--
> +2.8.2
> +
> diff --git a/meta/recipes-devtools/gdb/gdb_7.10.1.bb =
b/meta/recipes-devtools/gdb/gdb_7.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_7.10.1.bb
> rename to meta/recipes-devtools/gdb/gdb_7.11.bb
> --
> 2.8.2
>=20


--Apple-Mail=_F9ED17DA-B470-4D7C-B907-573A91606E1A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc0GUAACgkQuwUzVZGdMxR0dACgj4e/lleop6leW4qjpLFR1trW
Gc0AnjOQmDiYpPMQGT65j41JtM9HPZJw
=jux+
-----END PGP SIGNATURE-----

--Apple-Mail=_F9ED17DA-B470-4D7C-B907-573A91606E1A--
