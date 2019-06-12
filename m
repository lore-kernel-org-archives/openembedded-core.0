Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC0C7E78D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 12:41:50 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y13so11951710lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HpWt6w0L7f8PHUfU3dmyv12vhzK2YUfKFH8wKhd4vBc=;
	b=oWuhVVw6InSURK0k/VpmB705CsjwzQZaBnd8Uosodh1e3Ei/Aim35iJe+IrErjuURy
	amM/s33GQ8FmcB4Dq1sLuCrsPN919tr4gXQp1agZK4qp8vVpqr3abndntg9qkyLU8Yin
	tmlEVqplNF4K7JzdRcuWrnovLN++rGxMNKZNtlhqSgB9UrPItzHxozlowVfk92VxtcxR
	WF91IJfzdS52i2OhrYgsodxpnZ2EqcYW1rjMUhryGCgq76OFO2RhRygKwyD5kz6ZAn5P
	KG4ov6L0htrV+tlaA14R0dtJPKgEOKdLG/EIeyU80riGWElbBxcIvsMxNJuG2+GF/kFz
	41Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HpWt6w0L7f8PHUfU3dmyv12vhzK2YUfKFH8wKhd4vBc=;
	b=Fqk7jy/broD6aV0ExZvjaHaGDbnUpe+H8ieCCkTdbZTxTRqybZV1C20N6BWA4mXQja
	OsbitXPVYSB/xPYX0KpVa72/nuh3Q4IMVIMjywAYJmVEvFdyKVnVN7nq3JVyLF9ocm5v
	anyJyslGV0qm7HhPN2eBKoV5hUKM6eRim988ivND9NG0qhpiNdbdMq/T0OzTNAks2FtA
	eWUA1wsRohrkqarnV51NUaD6nzb5WBrNs3bWOgVPoGnKosUFWEwmAUg3r6PAHy3IT77p
	u8FHYlm2jObxlIf3PONk8iXCCExaPxaGK9kS4mTHBL5T4mtNPVHvET0UWiFiZn49kMWN
	/ZJA==
X-Gm-Message-State: APjAAAXE2ckcYbvt/5GJMHAS39JfTrYtKRH0OpTF5UdZaK3fOTetN5Sf
	eU2Gvxue/uwPKd6+LMt7rq3dEd79U/DipJFufrw=
X-Google-Smtp-Source: APXvYqwGkSpaNm5OuyP5M8KuHG02JBxzBMxf40uMznp7aPzqkoG4lAsPGenlOtxAMSKU1rM1MsaAZ1SqLAM20/m0gkw=
X-Received: by 2002:ac2:4109:: with SMTP id b9mr10048995lfi.31.1560343310300; 
	Wed, 12 Jun 2019 05:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190606151814.5114-1-nick83ola@gmail.com>
	<20190606151814.5114-2-nick83ola@gmail.com>
	<CAJTo0Lb5aj==0AhfoNN-MTPqWV9Y2E6dWSeEtUwUybcOhuMY9Q@mail.gmail.com>
In-Reply-To: <CAJTo0Lb5aj==0AhfoNN-MTPqWV9Y2E6dWSeEtUwUybcOhuMY9Q@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 12 Jun 2019 13:41:38 +0100
Message-ID: <CABPh3UO0qLdFTLLKWtbC=6s-PRY2WJntM=q6uOY07J=LU2NTCA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] rng-tools: 6.6->6.7
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
X-List-Received-Date: Wed, 12 Jun 2019 12:41:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Ok I will clean it up and re-submit it (also because it will need
another patch that I'm testing now)

Thanks
Nicola Lunghi

On Thu, 6 Jun 2019 at 17:20, Burton, Ross <ross.burton@intel.com> wrote:
>
> The patches you're adding all need your Signed-off-by alongside the
> Upstream-Status, specifically
> 0008-configure-If-the-libc-is-lacking-argp-use-libargp.patch doesn't
> have a Sob or U-S.
>
> For the patches that are submitted, please add the pull request:
>
> Upstream-Status: Submitted [https://github.com/nhorman/rng-tools/pull/66]
>
> This lets us find the patches in the future.
>
> Ross
>
> On Thu, 6 Jun 2019 at 16:18, Nicola Lunghi <nick83ola@gmail.com> wrote:
> >
> > update rng-tools to release 6.7
> >
> > - add new option to compile with pkcs11/libp11 (added in 6.7)
> >
> > - submitted the following yocto patches upstream (and added as backport=
s):
> >     0001-If-the-libc-is-lacking-argp-use-libargp.patch \
> >     0002-Add-argument-to-control-the-libargp-dependency.patch \
> >     -> squashed in 0008-configure-If-the-libc-is-lacking-argp-use-libar=
gp.patch
> >     underquote.patch
> >     -> 0010-Fix-underquoted-m4-entry.-This-causes-a-failure-if-g.patch
> >     rng-tools-5-fix-textrels-on-PIC-x86.patch
> >     -> 0009-Fix-assemby-textrels-on-rdrand_asm.S-on-PIC-x86.patch
> >
> > - the following patch has been merged upstream: remove
> >     0001-configure.ac-fix-typo.patch
> >
> > - backport the following patches from master
> >     0001-Remove-superfluous-variables.patch
> >     0002-Fix-a-few-typos-in-log-messages.patch
> >     0003-Fix-up-some-compile-warnings.patch
> >     0004-Fix-a-race-condition-on-shutdown.patch
> >     0005-rngd-prioritize-faster-sources-of-entropy.patch
> >     0006-rngd_jitter-replace-non-standard-pthread_yield-with-.patch
> >     0007-Make-rngd_pkcs11.c-explicitly-link-against-libcrypto.patch
> >
> > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > ---
> >  ...the-libc-is-lacking-argp-use-libargp.patch |  60 ------
> >  .../0001-Remove-superfluous-variables.patch   |  28 +++
> >  .../0001-configure.ac-fix-typo.patch          |  27 ---
> >  ...nt-to-control-the-libargp-dependency.patch |  95 ----------
> >  ...0002-Fix-a-few-typos-in-log-messages.patch |  48 +++++
> >  .../0003-Fix-up-some-compile-warnings.patch   | 172 ++++++++++++++++++
> >  ...004-Fix-a-race-condition-on-shutdown.patch |  55 ++++++
> >  ...prioritize-faster-sources-of-entropy.patch |  72 ++++++++
> >  ...ace-non-standard-pthread_yield-with-.patch |  27 +++
> >  ....c-explicitly-link-against-libcrypto.patch |  73 ++++++++
> >  ...the-libc-is-lacking-argp-use-libargp.patch | 103 +++++++++++
> >  ...textrels-on-rdrand_asm.S-on-PIC-x86.patch} |   8 +-
> >  ...4-entry.-This-causes-a-failure-if-g.patch} |  16 +-
> >  .../{rng-tools_6.6.bb =3D> rng-tools_6.7.bb}    |  18 +-
> >  14 files changed, 602 insertions(+), 200 deletions(-)
> >  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-If-th=
e-libc-is-lacking-argp-use-libargp.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Remov=
e-superfluous-variables.patch
> >  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-confi=
gure.ac-fix-typo.patch
> >  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Add-a=
rgument-to-control-the-libargp-dependency.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Fix-a=
-few-typos-in-log-messages.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0003-Fix-u=
p-some-compile-warnings.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0004-Fix-a=
-race-condition-on-shutdown.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0005-rngd-=
prioritize-faster-sources-of-entropy.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0006-rngd_=
jitter-replace-non-standard-pthread_yield-with-.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0007-Make-=
rngd_pkcs11.c-explicitly-link-against-libcrypto.patch
> >  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0008-confi=
gure-If-the-libc-is-lacking-argp-use-libargp.patch
> >  rename meta/recipes-support/rng-tools/rng-tools/{rng-tools-5-fix-textr=
els-on-PIC-x86.patch =3D> 0009-Fix-assemby-textrels-on-rdrand_asm.S-on-PIC-=
x86.patch} (94%)
> >  rename meta/recipes-support/rng-tools/rng-tools/{underquote.patch =3D>=
 0010-Fix-underquoted-m4-entry.-This-causes-a-failure-if-g.patch} (77%)
> >  rename meta/recipes-support/rng-tools/{rng-tools_6.6.bb =3D> rng-tools=
_6.7.bb} (72%)
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-=
is-lacking-argp-use-libargp.patch b/meta/recipes-support/rng-tools/rng-tool=
s/0001-If-the-libc-is-lacking-argp-use-libargp.patch
> > deleted file mode 100644
> > index 06d1d94369..0000000000
> > --- a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lack=
ing-argp-use-libargp.patch
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -From 06ba71887f667d45dd231a782a2751f36e8fe025 Mon Sep 17 00:00:00 2001
> > -From: Christopher Larson <chris_larson@mentor.com>
> > -Date: Mon, 15 Feb 2016 15:59:58 -0700
> > -Subject: [PATCH 1/4] If the libc is lacking argp, use libargp
> > -
> > -Patch pulled from Gentoo:
> > -
> > -    On glibc systems, argp is provided by libc.  However, on
> > -    uclibc and other systems which lack argp in their C library,
> > -    argp might be provided by a stand alone library, libargp.
> > -    This patch adds tests to the build system to find who provides
> > -    argp.
> > -
> > -    X-Gentoo-Bug: 292191
> > -    X-Gentoo-Bug-URL: https://bugs.gentoo.org/show_bug.cgi?id=3D292191
> > -    Reported-by: Ed Wildgoose <gentoo@wildgooses.com>
> > -    Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ----
> > - configure.ac | 22 ++++++++++++++++++++++
> > - 1 file changed, 22 insertions(+)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 4e799dc..c4a5dd8 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -135,6 +135,28 @@ AS_IF(
> > -       ]
> > - )
> > -
> > -+dnl First check if we have argp available from libc
> > -+AC_LINK_IFELSE(
> > -+      [AC_LANG_PROGRAM(
> > -+              [#include <argp.h>],
> > -+              [int argc=3D1; char *argv[]=3D{"test"}; argp_parse(0,ar=
gc,argv,0,0,0); return 0;]
> > -+              )],
> > -+      [libc_has_argp=3D"true"],
> > -+      [libc_has_argp=3D"false"]
> > -+)
> > -+
> > -+dnl If libc doesn't provide argp, then test for libargp
> > -+if test "$libc_has_argp" =3D "false" ; then
> > -+      AC_MSG_WARN("libc does not have argp")
> > -+      AC_CHECK_LIB([argp], [argp_parse], [have_argp=3D"true"], [have_=
argp=3D"false"])
> > -+
> > -+      if test "$have_argp" =3D "false"; then
> > -+              AC_MSG_ERROR("no libargp found")
> > -+      else
> > -+              LIBS+=3D" -largp"
> > -+      fi
> > -+fi
> > -+
> > - dnl -----------------
> > - dnl Configure options
> > - dnl -----------------
> > ---
> > -2.7.4
> > -
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Remove-super=
fluous-variables.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Remo=
ve-superfluous-variables.patch
> > new file mode 100644
> > index 0000000000..32c2858999
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0001-Remove-superfluous-=
variables.patch
> > @@ -0,0 +1,28 @@
> > +From e3971caa78f16c83bfb6d7537427b935ec603f63 Mon Sep 17 00:00:00 2001
> > +From: ideal <idealities@gmail.com>
> > +Date: Thu, 21 Mar 2019 15:23:11 +0800
> > +Subject: [PATCH 01/10] Remove superfluous variables
> > +
> > +Upstream-Status: Backport
> > +---
> > + rngd_linux.c | 3 ---
> > + 1 file changed, 3 deletions(-)
> > +
> > +diff --git a/rngd_linux.c b/rngd_linux.c
> > +index b473419..9eca968 100644
> > +--- a/rngd_linux.c
> > ++++ b/rngd_linux.c
> > +@@ -58,10 +58,7 @@ extern int kent_pool_size;
> > +  */
> > + int default_watermark(void)
> > + {
> > +-      char psbuf[64], *p;
> > +-      unsigned long ps;
> > +       FILE *f;
> > +-      size_t l;
> > +       unsigned int wm =3D 4096; /* Default guess */
> > +
> > +       f =3D fopen("/proc/sys/kernel/random/poolsize", "r");
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac=
-fix-typo.patch b/meta/recipes-support/rng-tools/rng-tools/0001-configure.a=
c-fix-typo.patch
> > deleted file mode 100644
> > index d4d28a01c4..0000000000
> > --- a/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-ty=
po.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -From 99b0efebd765803203686d89bc4f995bcb103e78 Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sat, 10 Nov 2018 09:53:19 +0800
> > -Subject: [PATCH] configure.ac: fix typo
> > -
> > -Upstream-Status: Submitted [https://github.com/nhorman/rng-tools.git]
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ----
> > - configure.ac | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 4e799dc..0251928 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -62,7 +62,7 @@ AS_IF([test $target_cpu =3D powerpc64le], [AC_DEFINE=
([HAVE_DARN],1,[Enable DARN])]
> > - AM_CONDITIONAL([JITTER], [false])
> > -
> > - AC_ARG_ENABLE(jitterentropy,
> > --      AS_HELP_STRING([--disable-jitterntropy | --enable-jitterentropy=
=3D<path>],
> > -+      AS_HELP_STRING([--disable-jitterentropy | --enable-jitterentrop=
y=3D<path>],
> > -       [Disable jitterentropy source, or specify its location]),
> > -       [if [ test -d $enable_jitterentropy ]; then
> > -               export LDFLAGS+=3D-L$enable_jitterentropy;
> > ---
> > -2.7.4
> > -
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument=
-to-control-the-libargp-dependency.patch b/meta/recipes-support/rng-tools/r=
ng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
> > deleted file mode 100644
> > index be60fe97f6..0000000000
> > --- a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-con=
trol-the-libargp-dependency.patch
> > +++ /dev/null
> > @@ -1,95 +0,0 @@
> > -From 711e2f76890e3c5b08f64859d9fd913ddbec7d50 Mon Sep 17 00:00:00 2001
> > -From: Christopher Larson <chris_larson@mentor.com>
> > -Date: Mon, 22 Oct 2018 15:26:47 +0800
> > -Subject: [PATCH 2/4] Add argument to control the libargp dependency
> > -
> > -This ensures that the builds are always deterministic. If the argument=
 isn't
> > -passed, the default behavior is to use libargp if the libc doesn't hav=
e argp.
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > -
> > -Rebase to 6.6
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ----
> > - configure.ac | 55 ++++++++++++++++++++++++++++++++++++---------------=
----
> > - 1 file changed, 36 insertions(+), 19 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index c4a5dd8..dd1c30f 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -40,6 +40,13 @@ AC_ARG_WITH([nistbeacon],
> > -       [with_nistbeacon=3Dcheck]
> > - )
> > -
> > -+AC_ARG_WITH([libargp],
> > -+      AS_HELP_STRING([--without-libargp],
> > -+              [Disable libargp support. Systems whose libc lacks argp=
 can use libargp instead. (Default: check if libc lacks argp)]),
> > -+      [with_libargp=3D$withval],
> > -+      [with_libargp=3Dcheck]
> > -+)
> > -+
> > - dnl Make sure anyone changing configure.ac/Makefile.am has a clue
> > - AM_MAINTAINER_MODE
> > - AM_PROG_AS
> > -@@ -135,27 +142,37 @@ AS_IF(
> > -       ]
> > - )
> > -
> > --dnl First check if we have argp available from libc
> > --AC_LINK_IFELSE(
> > --      [AC_LANG_PROGRAM(
> > --              [#include <argp.h>],
> > --              [int argc=3D1; char *argv[]=3D{"test"}; argp_parse(0,ar=
gc,argv,0,0,0); return 0;]
> > --              )],
> > --      [libc_has_argp=3D"true"],
> > --      [libc_has_argp=3D"false"]
> > -+dnl Determine if we need libargp: either user requested, or libc has =
no argp
> > -+AS_IF(
> > -+      [test "x$with_libargp" !=3D "xyes"],
> > -+      [
> > -+              AC_LINK_IFELSE(
> > -+                      [AC_LANG_PROGRAM(
> > -+                              [#include <argp.h>],
> > -+                              [int argc=3D1; char *argv[]=3D{"test"};=
 argp_parse(0,argc,argv,0,0,0); return 0;]
> > -+                              )],
> > -+                      [need_libargp=3Dno],
> > -+                      [need_libargp=3Dyes
> > -+                       if test "x$with_libargp" =3D "xno"; then
> > -+                              AC_MSG_FAILURE([libargp disabled and li=
bc does not have argp])
> > -+                       fi]
> > -+              )
> > -+      ],
> > -+      [need_libargp=3Dyes],
> > - )
> > -
> > --dnl If libc doesn't provide argp, then test for libargp
> > --if test "$libc_has_argp" =3D "false" ; then
> > --      AC_MSG_WARN("libc does not have argp")
> > --      AC_CHECK_LIB([argp], [argp_parse], [have_argp=3D"true"], [have_=
argp=3D"false"])
> > --
> > --      if test "$have_argp" =3D "false"; then
> > --              AC_MSG_ERROR("no libargp found")
> > --      else
> > --              LIBS+=3D" -largp"
> > --      fi
> > --fi
> > -+dnl Check for libargp
> > -+AS_IF(
> > -+      [test "x$need_libargp" =3D "xyes"],
> > -+      [
> > -+              AC_CHECK_LIB(
> > -+                      [argp],
> > -+                      [argp_parse],
> > -+                      [LIBS=3D"$LIBS -largp"],
> > -+                      [AC_MSG_FAILURE([libargp not found])]
> > -+              )
> > -+      ]
> > -+)
> > -
> > - dnl -----------------
> > - dnl Configure options
> > ---
> > -2.7.4
> > -
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Fix-a-few-ty=
pos-in-log-messages.patch b/meta/recipes-support/rng-tools/rng-tools/0002-F=
ix-a-few-typos-in-log-messages.patch
> > new file mode 100644
> > index 0000000000..32163a5162
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0002-Fix-a-few-typos-in-=
log-messages.patch
> > @@ -0,0 +1,48 @@
> > +From 93a1d001e51c6558e86161060b33c3785d509ac5 Mon Sep 17 00:00:00 2001
> > +From: Ruben Kerkhof <ruben@rubenkerkhof.com>
> > +Date: Wed, 17 Apr 2019 18:39:09 +0200
> > +Subject: [PATCH 02/10] Fix a few typos in log messages
> > +
> > +---
> > + rngd.c        | 4 ++--
> > + rngd_jitter.c | 2 +-
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/rngd.c b/rngd.c
> > +index 0d4582a..b854eab 100644
> > +--- a/rngd.c
> > ++++ b/rngd.c
> > +@@ -743,7 +743,7 @@ int main(int argc, char **argv)
> > +                       message(LOG_CONS|LOG_INFO, "None");
> > +               msg_squash =3D true;
> > +       } else
> > +-              message(LOG_DAEMON|LOG_INFO, "\nInitalizing available s=
ources\n");
> > ++              message(LOG_DAEMON|LOG_INFO, "\nInitializing available =
sources\n");
> > +
> > +       /* Init entropy sources */
> > +
> > +@@ -753,7 +753,7 @@ int main(int argc, char **argv)
> > +                               ent_sources++;
> > +                               entropy_sources[i].fipsctx =3D malloc(s=
izeof(fips_ctx_t));
> > +                               fips_init(entropy_sources[i].fipsctx, d=
iscard_initial_data(&entropy_sources[i]));
> > +-                              message(LOG_INFO | LOG_DAEMON, "Initali=
zing entropy source %s\n",
> > ++                              message(LOG_INFO | LOG_DAEMON, "Initial=
izing entropy source %s\n",
> > +                                       entropy_sources[i].rng_sname);
> > +                       } else {
> > +                               message(LOG_ERR | LOG_DAEMON, "Failed t=
o init entropy source %s\n",
> > +diff --git a/rngd_jitter.c b/rngd_jitter.c
> > +index f68e2ca..23d96b3 100644
> > +--- a/rngd_jitter.c
> > ++++ b/rngd_jitter.c
> > +@@ -440,7 +440,7 @@ int init_jitter_entropy_source(struct rng *ent_src=
)
> > +                * Temporarily disable aes so we don't try to use it du=
ring init
> > +                */
> > +
> > +-              message(LOG_CONS|LOG_INFO, "Initalizing AES buffer\n");
> > ++              message(LOG_CONS|LOG_INFO, "Initializing AES buffer\n")=
;
> > +               aes_buf =3D malloc(tdata[0].buf_sz);
> > +               ent_src->rng_options[JITTER_OPT_USE_AES].int_val =3D 0;
> > +               if (xread_jitter(key, AES_BLOCK, ent_src)) {
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0003-Fix-up-some-=
compile-warnings.patch b/meta/recipes-support/rng-tools/rng-tools/0003-Fix-=
up-some-compile-warnings.patch
> > new file mode 100644
> > index 0000000000..63ffe281bc
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0003-Fix-up-some-compile=
-warnings.patch
> > @@ -0,0 +1,172 @@
> > +From 13beeeeed455306daf899f9e8a97b8b84f2e6c42 Mon Sep 17 00:00:00 2001
> > +From: Neil Horman <nhorman@tuxdriver.com>
> > +Date: Mon, 29 Apr 2019 15:26:42 -0400
> > +Subject: [PATCH 03/10] Fix up some compile warnings
> > +
> > +fixes issue https://github.com/nhorman/rng-tools/issues/57
> > +
> > +Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
> > +
> > +Upstream-Status: Backport
> > +---
> > + rngd.c            | 10 +++++-----
> > + rngd_jitter.c     | 14 +++++---------
> > + rngd_linux.c      |  8 ++++++--
> > + rngd_nistbeacon.c |  2 +-
> > + 4 files changed, 17 insertions(+), 17 deletions(-)
> > +
> > +diff --git a/rngd.c b/rngd.c
> > +index b854eab..1b3d73d 100644
> > +--- a/rngd.c
> > ++++ b/rngd.c
> > +@@ -153,7 +153,7 @@ static enum {
> > +       ENT_JITTER,
> > +       ENT_PKCS11,
> > +       ENT_MAX
> > +-} entropy_indexes;
> > ++} entropy_indexes __attribute__((used));
> > +
> > +
> > + static struct rng_option drng_options[] =3D {
> > +@@ -358,7 +358,7 @@ static int find_ent_src_idx(const char *name_idx)
> > +       } else {
> > +               idx =3D strtoul(name_idx, NULL, 10);
> > +               if ((idx =3D=3D LONG_MAX) || (idx >=3D ENT_MAX)) {
> > +-                      message(LOG_CONS|LOG_INFO, "option index out of=
 range: %lu\n", idx);
> > ++                      message(LOG_CONS|LOG_INFO, "option index out of=
 range: %u\n", idx);
> > +                       return -ERANGE;
> > +               }
> > +               message(LOG_CONS|LOG_INFO, "Note, reference of entropy =
sources by index "
> > +@@ -449,7 +449,7 @@ static error_t parse_opt (int key, char *arg, stru=
ct argp_state *state)
> > +                       }
> > +                       options++;
> > +               }
> > +-              message(LOG_CONS|LOG_INFO, "Option %s not found for sou=
rce idx %d\n", optkey, idx);
> > ++              message(LOG_CONS|LOG_INFO, "Option %s not found for sou=
rce idx %lu\n", optkey, idx);
> > +               return -ERANGE;
> > +               break;
> > +
> > +@@ -828,10 +828,10 @@ int main(int argc, char **argv)
> > +               test_time =3D ((test_time * NSECS_IN_SECOND) + (end_tes=
t.tv_nsec - start_test.tv_nsec)) / NSECS_IN_SECOND;
> > +
> > +               if ((sum_entropy/test_time) >=3D MEGABITS) {
> > +-                      message(LOG_CONS|LOG_INFO, "\nEntropy rate: %6.=
4g Mbits/sec averaged over %d iterations for %6.4g seconds\n",
> > ++                      message(LOG_CONS|LOG_INFO, "\nEntropy rate: %6.=
4g Mbits/sec averaged over %lu iterations for %6.4g seconds\n",
> > +                               (sum_entropy/test_time/MEGABITS), test_=
iterations, test_time);
> > +               } else {
> > +-                      message(LOG_CONS|LOG_INFO, "\nEntropy rate: %6.=
4g Kbits/sec averaged over %d iterations for %6.4g seconds\n",
> > ++                      message(LOG_CONS|LOG_INFO, "\nEntropy rate: %6.=
4g Kbits/sec averaged over %lu iterations for %6.4g seconds\n",
> > +                               (sum_entropy/test_time/KILOBITS), test_=
iterations, test_time);
> > +               }
> > +       }
> > +diff --git a/rngd_jitter.c b/rngd_jitter.c
> > +index 23d96b3..c08c0d2 100644
> > +--- a/rngd_jitter.c
> > ++++ b/rngd_jitter.c
> > +@@ -38,8 +38,6 @@
> > + #include "exits.h"
> > + #include "rngd_entsource.h"
> > +
> > +-static struct rand_data *ec =3D NULL;
> > +-
> > + static int num_threads =3D 0;
> > + struct thread_data {
> > +       int core_id;
> > +@@ -56,7 +54,7 @@ static struct thread_data *tdata;
> > + static pthread_t *threads;
> > + int pipefds[2];
> > +
> > +-char *aes_buf;
> > ++unsigned char *aes_buf;
> > +
> > + #ifdef HAVE_LIBGCRYPT
> > +
> > +@@ -147,13 +145,12 @@ int xread_jitter(void *buf, size_t size, struct =
rng *ent_src)
> > +       ssize_t request;
> > +       int rc =3D 1;
> > +       int retry_count =3D 0;
> > +-      struct timespec sleep;
> > +       ssize_t need=3Dsize;
> > +       char *bptr =3D buf;
> > +       size_t total;
> > + try_again:
> > +       while (need) {
> > +-              message(LOG_DAEMON|LOG_DEBUG, "xread_jitter requests %d=
 bytes from pipe\n", need);
> > ++              message(LOG_DAEMON|LOG_DEBUG, "xread_jitter requests %l=
u bytes from pipe\n", need);
> > +               request =3D read(pipefds[0], &bptr[size-need], need);
> > +               if ((request < need) && ent_src->rng_options[JITTER_OPT=
_USE_AES].int_val) {
> > +                       message(LOG_DAEMON|LOG_DEBUG, "xread_jitter fal=
ls back to AES\n");
> > +@@ -173,7 +170,7 @@ try_again:
> > +                               message(LOG_DAEMON|LOG_DEBUG, "failed r=
ead: %s\n", strerror(errno));
> > +                               pthread_yield();
> > +                       } else
> > +-                              message(LOG_DAEMON|LOG_DEBUG, "request =
of random data returns %d less than need %d\n",
> > ++                              message(LOG_DAEMON|LOG_DEBUG, "request =
of random data returns %ld less than need %ld\n",
> > +                                       request, need);
> > +                       if (retry_count < ent_src->rng_options[JITTER_O=
PT_RETRY_COUNT].int_val) {
> > +                               retry_count++;
> > +@@ -185,7 +182,7 @@ try_again:
> > +                       goto out;
> > +               }
> > +
> > +-              message(LOG_DAEMON|LOG_DEBUG, "xread_jitter gets %d byt=
es\n", request);
> > ++              message(LOG_DAEMON|LOG_DEBUG, "xread_jitter gets %ld by=
tes\n", request);
> > +               need -=3D request;
> > +       }
> > +
> > +@@ -236,7 +233,6 @@ static void *thread_entropy_task(void *data)
> > +       cpu_set_t cpuset;
> > +
> > +       ssize_t ret;
> > +-      size_t need;
> > +       struct thread_data *me =3D data;
> > +       char *tmpbuf;
> > +       struct timespec start, end;
> > +@@ -287,7 +283,7 @@ static void *thread_entropy_task(void *data)
> > +               while(written !=3D me->buf_sz) {
> > +                       message(LOG_DAEMON|LOG_DEBUG, "Writing to pipe\=
n");
> > +                       ret =3D write(me->pipe_fd, &tmpbuf[written], me=
->buf_sz - written);
> > +-                      message(LOG_DAEMON|LOG_DEBUG, "DONE Writing to =
pipe with return %d\n", ret);
> > ++                      message(LOG_DAEMON|LOG_DEBUG, "DONE Writing to =
pipe with return %ld\n", ret);
> > +                       if (first)
> > +                               me->active =3D 1;
> > +                       if (ret < 0)
> > +diff --git a/rngd_linux.c b/rngd_linux.c
> > +index 9eca968..51c38ac 100644
> > +--- a/rngd_linux.c
> > ++++ b/rngd_linux.c
> > +@@ -59,12 +59,16 @@ extern int kent_pool_size;
> > + int default_watermark(void)
> > + {
> > +       FILE *f;
> > +-      unsigned int wm =3D 4096; /* Default guess */
> > ++      unsigned int wm;        /* Default guess */
> > +
> > +       f =3D fopen("/proc/sys/kernel/random/poolsize", "r");
> > +       if (!f)
> > +               goto err;
> > +-      fscanf(f,"%d", &wm);
> > ++      /*
> > ++       * Default to 4096 if fscanf fails
> > ++       */
> > ++      if(fscanf(f,"%d", &wm) < 1)
> > ++              wm =3D 4096;
> > +       kent_pool_size =3D wm;
> > +       wm =3D wm*3/4;
> > + err:
> > +diff --git a/rngd_nistbeacon.c b/rngd_nistbeacon.c
> > +index 10fc4a4..aafb300 100644
> > +--- a/rngd_nistbeacon.c
> > ++++ b/rngd_nistbeacon.c
> > +@@ -414,7 +414,7 @@ static int get_nist_record()
> > +                       goto out;
> > +               }
> > +
> > +-              message(LOG_DAEMON|LOG_DEBUG, "NIST: timestamp is %d, f=
requency is %d, tv_sec is %d\n",
> > ++              message(LOG_DAEMON|LOG_DEBUG, "NIST: timestamp is %lu, =
frequency is %u, tv_sec is %lu\n",
> > +                       block.timestamp, block.frequency, ct.tv_sec);
> > +               if (block.timestamp + block.frequency >=3D ct.tv_sec) {
> > +                       message(LOG_DAEMON|LOG_ERR, "Multiple nist read=
s in same frequency period of %d sec\n",
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0004-Fix-a-race-c=
ondition-on-shutdown.patch b/meta/recipes-support/rng-tools/rng-tools/0004-=
Fix-a-race-condition-on-shutdown.patch
> > new file mode 100644
> > index 0000000000..c4e982551a
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0004-Fix-a-race-conditio=
n-on-shutdown.patch
> > @@ -0,0 +1,55 @@
> > +From 8203e08efd8ae6de110bc9bcc36f02e2302c8f6a Mon Sep 17 00:00:00 2001
> > +From: Neil Horman <nhorman@tuxdriver.com>
> > +Date: Thu, 23 May 2019 12:36:03 -0400
> > +Subject: [PATCH 04/10] Fix a race condition on shutdown
> > +
> > +It was possible that, during shutdown, a thread may exit prior to us
> > +checking for it being exited, leading us to block on a read of a pipe
> > +that was never going to be written to, causing a shutdown hang.  Fix i=
t
> > +by using pthread_kill to kill each thread instead
> > +
> > +Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
> > +
> > +Upstream-Status: Backport
> > +---
> > + rngd_jitter.c | 12 ++++--------
> > + 1 file changed, 4 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/rngd_jitter.c b/rngd_jitter.c
> > +index c08c0d2..979e613 100644
> > +--- a/rngd_jitter.c
> > ++++ b/rngd_jitter.c
> > +@@ -469,26 +469,22 @@ void close_jitter_entropy_source(struct rng *ent=
_src)
> > +       for (i=3D0; i < num_threads; i++)
> > +               tdata[i].active =3D 0;
> > +
> > +-      flags =3D fcntl(pipefds[1], F_GETFL, 0);
> > +-      flags |=3D O_NONBLOCK;
> > +-      fcntl(pipefds[1], F_SETFL, &flags);
> > ++      close(pipefds[1]);
> > +
> > +       /* And wait for completion of each thread */
> > +       for (i=3D0; i < num_threads; i++) {
> > +               message(LOG_DAEMON|LOG_DEBUG, "Checking on done for thr=
ead %d\n", i);
> > +               while (!tdata[i].done)
> > ++                      pthread_kill(threads[i], SIGINT);
> > +                       if(tdata[i].done) {
> > +                               message(LOG_DAEMON|LOG_INFO, "Closing t=
hread %d\n", tdata[i].core_id);
> > +                               pthread_join(threads[i], NULL);
> > +                               jent_entropy_collector_free(tdata[i].ec=
);
> > +-                      } else {
> > +-                              read(pipefds[0], tmpbuf, 1024);
> > ++                      } else
> > +                               sched_yield();
> > +-                      }
> > +       }
> > +
> > +-      close(pipefds[2]);
> > +-      close(pipefds[1]);
> > ++      close(pipefds[0]);
> > +       free(tdata);
> > +       free(threads);
> > +       return;
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0005-rngd-priorit=
ize-faster-sources-of-entropy.patch b/meta/recipes-support/rng-tools/rng-to=
ols/0005-rngd-prioritize-faster-sources-of-entropy.patch
> > new file mode 100644
> > index 0000000000..2f553fc606
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0005-rngd-prioritize-fas=
ter-sources-of-entropy.patch
> > @@ -0,0 +1,72 @@
> > +From ba8adb4c6e275e85f906922b6fcf18b4ac16534e Mon Sep 17 00:00:00 2001
> > +From: Neil Horman <nhorman@tuxdriver.com>
> > +Date: Tue, 4 Jun 2019 10:51:53 -0400
> > +Subject: [PATCH 05/10] rngd: prioritize faster sources of entropy
> > +
> > +We have two broad categories of entropy sources in rngd.  Fast sources
> > +and slow sources.  Slow sources (like jitterentropy) provided entropy =
to
> > +systems that have no other entropy source, but can actually hinder
> > +performance when large amounts of entropy are requested (consider a ca=
se
> > +where the entropy pool is empty, and the rdrand source can provide
> > +twice the entropy in half the time that jitterentropy can).  Its still
> > +valuable to have jitterentropy enabled, but we shouldn't be extracting
> > +entropy from it, if a faster source can provide it.  So lets prioritiz=
e
> > +our fast sources over the slow ones.  in the do_loop, lets by default
> > +not collect entropy from sources marked as slow.  If we pass
> > +through an interation of the do_loop with no entropy collected, then
> > +lets include the slow sources on the next pass to give us a better
> > +chance at collection.  Then, when entropy is gathered, we can go back =
to
> > +only using the fast sources.
> > +
> > +Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
> > +
> > +Upstream-Status: Backport
> > +---
> > + rngd.c | 19 +++++++++++++++++++
> > + 1 file changed, 19 insertions(+)
> > +
> > +diff --git a/rngd.c b/rngd.c
> > +index 1b3d73d..a086949 100644
> > +--- a/rngd.c
> > ++++ b/rngd.c
> > +@@ -577,6 +577,7 @@ static void do_loop(int random_step)
> > +       int i;
> > +       int retval;
> > +       struct rng *iter;
> > ++      bool try_slow_sources =3D false;
> > +
> > +       int (*random_add_fn)(struct rng *rng, int random_step,
> > +               unsigned char *buf, fips_ctx_t *fipsctx_in);
> > +@@ -587,11 +588,29 @@ continue_trying:
> > +       for (no_work =3D 0; no_work < 100; no_work =3D (work_done ? 0 :=
 no_work+1)) {
> > +
> > +               work_done =3D false;
> > ++
> > ++              /*
> > ++               * Exclude slow sources when faster sources are working=
 well
> > ++               * sources like jitterentropy can provide some entropy =
when needed
> > ++               * but can actually hinder performance when large amoun=
ts of entropy are needed
> > ++               * owing to the fact that they may block while generati=
ng said entropy
> > ++               * So, lets prioritize the faster sources.  Start by on=
ly trying to collect
> > ++               * entropy from the fast sources, then iff that fails, =
start including the slower
> > ++               * sources as well.  Once we get some entropy, return t=
o only using fast sources
> > ++               */
> > ++              if (no_work)
> > ++                      try_slow_sources =3D true;
> > ++              else
> > ++                      try_slow_sources =3D false;
> > ++
> > +               for (i =3D 0; i < ENT_MAX; ++i)
> > +               {
> > +                       int rc;
> > +                       /*message(LOG_CONS|LOG_INFO, "I is %d\n", i);*/
> > +                       iter =3D &entropy_sources[i];
> > ++                      if (!try_slow_sources && iter->flags.slow_sourc=
e)
> > ++                              continue;
> > ++
> > +               retry_same:
> > +                       if (!server_running)
> > +                               return;
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0006-rngd_jitter-=
replace-non-standard-pthread_yield-with-.patch b/meta/recipes-support/rng-t=
ools/rng-tools/0006-rngd_jitter-replace-non-standard-pthread_yield-with-.pa=
tch
> > new file mode 100644
> > index 0000000000..5bd6a4a01c
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0006-rngd_jitter-replace=
-non-standard-pthread_yield-with-.patch
> > @@ -0,0 +1,27 @@
> > +From 93abcd77d9b5bae9c2018cf8fedb27c87d0ca5e6 Mon Sep 17 00:00:00 2001
> > +From: Nicola Lunghi <25422924+nicola-lunghi@users.noreply.github.com>
> > +Date: Wed, 5 Jun 2019 16:38:21 +0100
> > +Subject: [PATCH 06/10] rngd_jitter: replace non standard pthread_yield=
 with
> > + sched_yield
> > +
> > +Upstream-Status: Backport
> > +---
> > + rngd_jitter.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/rngd_jitter.c b/rngd_jitter.c
> > +index 979e613..54070ae 100644
> > +--- a/rngd_jitter.c
> > ++++ b/rngd_jitter.c
> > +@@ -168,7 +168,7 @@ try_again:
> > +               } else if (request < need) {
> > +                       if (request =3D=3D -1) {
> > +                               message(LOG_DAEMON|LOG_DEBUG, "failed r=
ead: %s\n", strerror(errno));
> > +-                              pthread_yield();
> > ++                              sched_yield();
> > +                       } else
> > +                               message(LOG_DAEMON|LOG_DEBUG, "request =
of random data returns %ld less than need %ld\n",
> > +                                       request, need);
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0007-Make-rngd_pk=
cs11.c-explicitly-link-against-libcrypto.patch b/meta/recipes-support/rng-t=
ools/rng-tools/0007-Make-rngd_pkcs11.c-explicitly-link-against-libcrypto.pa=
tch
> > new file mode 100644
> > index 0000000000..003049fb7e
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0007-Make-rngd_pkcs11.c-=
explicitly-link-against-libcrypto.patch
> > @@ -0,0 +1,73 @@
> > +From ee078086ee8209f593f16ac5f6393fb1a95452c4 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?G=3DC3=3DB6kt=3DC3=3DBCrk=3D20Y=3DC3=3DBCksek?=3D <g=
okturk@gentoo.org>
> > +Date: Wed, 5 Jun 2019 13:54:14 -0400
> > +Subject: [PATCH 07/10] Make rngd_pkcs11.c explicitly link against libc=
rypto
> > +
> > +In function init_pkcs11_entropy_source(), there is a call to
> > +ERR_reason_error_string(), which is defined in libcrypto. This causes
> > +linking problems for rng-tools under certain configurations:
> > +
> > +$ ./configure --disable-jitterentropy --without-nistbeacon --with-pkcs=
11
> > +...
> > +$ make
> > +...
> > +gcc     -pthread -g -O2 -pthread   -o rngd rngd-rngd.o rngd-rngd_entso=
urce.o rngd-rngd_linux.o rngd-util.o  rngd-rngd_rdrand.o rdrand_asm.o   rng=
d-rngd_pkcs11.o librngd.a -lsysfs -lgcrypt -lsysfs  -lp11     -lgcrypt -lsy=
sfs
> > +/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: rngd-rngd_pkcs11.o: undefined reference to symbol 'ERR_reason_erro=
r_string@@OPENSSL_1_1_0'
> > +/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: /usr/lib64/libcrypto.so.1.1: error adding symbols: DSO missing fro=
m command line
> > +collect2: error: ld returned 1 exit status
> > +make[2]: *** [Makefile:609: rngd] Error 1
> > +make[2]: Leaving directory '/tmp/rng-tools'
> > +make[1]: *** [Makefile:888: all-recursive] Error 1
> > +make[1]: Leaving directory '/tmp/rng-tools'
> > +make: *** [Makefile:458: all] Error 2
> > +
> > +This symbol is defined in libcrypto:
> > +
> > +$ readelf --dyn-syms /usr/lib64/libcrypto.so | grep ERR_reason_error_s=
tring
> > +   314: 000000000012cf60   155 FUNC    GLOBAL DEFAULT   12 ERR_reason_=
error_string@@OPENSSL_1_1_0
> > +
> > +Linking rngd against libcrypto when pkcs11 is enabled fixes the issue.
> > +
> > +Bug: https://bugs.gentoo.org/684228
> > +
> > +Upstream-Status: Backport
> > +---
> > + Makefile.am  | 4 ++--
> > + configure.ac | 1 +
> > + 2 files changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index ff56efe..db4fcfc 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -27,13 +27,13 @@ if JITTER
> > + rngd_SOURCES  +=3D rngd_jitter.c
> > + endif
> > +
> > +-rngd_LDADD    =3D librngd.a -lsysfs $(LIBS) ${libp11_LIBS} ${libcurl_=
LIBS} ${libxml2_LIBS} ${openssl_LIBS} $(PTHREAD_LIBS)
> > ++rngd_LDADD    =3D librngd.a -lsysfs $(LIBS) ${libp11_LIBS} ${libcrypt=
o_LIBS} ${libcurl_LIBS} ${libxml2_LIBS} ${openssl_LIBS} $(PTHREAD_LIBS)
> > +
> > + if PKCS11
> > + rngd_SOURCES  +=3D rngd_pkcs11.c
> > + endif
> > +
> > +-rngd_CFLAGS   =3D ${pkcs11_CFLAGS} ${libp11_CFLAGS} ${libxml2_CFLAGS}=
 ${openssl_CFLAGS} $(PTHREAD_CFLAGS)
> > ++rngd_CFLAGS   =3D ${pkcs11_CFLAGS} ${libp11_CFLAGS} ${libcrypto_CFLAG=
S} ${libxml2_CFLAGS} ${openssl_CFLAGS} $(PTHREAD_CFLAGS)
> > + rngd_LDFLAGS  =3D $(PTHREAD_CFLAGS)
> > +
> > + rngtest_SOURCES       =3D exits.h stats.h stats.c rngtest.c
> > +diff --git a/configure.ac b/configure.ac
> > +index d00a6f1..29a46fa 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -102,6 +102,7 @@ AS_IF(
> > +       [ test "x$with_pkcs11" !=3D "xno"],
> > +       [
> > +               PKG_CHECK_MODULES([libp11], [libp11], [], [AC_MSG_ERROR=
([libp11 is required])])
> > ++              PKG_CHECK_MODULES([libcrypto], [libcrypto], [], [AC_MSG=
_ERROR([libcrypto is required])])
> > +               AC_DEFINE([HAVE_PKCS11],1,[Enable PKCS11])
> > +       ]
> > + )
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0008-configure-If=
-the-libc-is-lacking-argp-use-libargp.patch b/meta/recipes-support/rng-tool=
s/rng-tools/0008-configure-If-the-libc-is-lacking-argp-use-libargp.patch
> > new file mode 100644
> > index 0000000000..e50bbbc8b8
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0008-configure-If-the-li=
bc-is-lacking-argp-use-libargp.patch
> > @@ -0,0 +1,103 @@
> > +From 53a6f99e0bf9f70fce659268ab0354760d8f7586 Mon Sep 17 00:00:00 2001
> > +From: Christopher Larson <chris_larson@mentor.com>
> > +Date: Mon, 15 Feb 2016 15:59:58 -0700
> > +Subject: [PATCH 08/10] configure:If the libc is lacking argp, use liba=
rgp
> > +
> > +This is the squash of two patches from yocto recipe
> > +that are needed in case the libc used lacks argp
> > +to specify to use the libargp library.
> > +
> > +Needed in particular for musl
> > +
> > +0001: Patch pulled from Gentoo:
> > +
> > +    On glibc systems, argp is provided by libc.  However, on
> > +    uclibc and other systems which lack argp in their C library,
> > +    argp might be provided by a stand alone library, libargp.
> > +    This patch adds tests to the build system to find who provides
> > +    argp.
> > +
> > +    X-Gentoo-Bug: 292191
> > +    X-Gentoo-Bug-URL: https://bugs.gentoo.org/show_bug.cgi?id=3D292191
> > +    Reported-by: Ed Wildgoose <gentoo@wildgooses.com>
> > +    Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
> > +
> > +    Upstream-Status: Pending
> > +    Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +
> > +0002: Add argument to control the libargp dependency
> > +
> > +    This ensures that the builds are always deterministic. If the argu=
ment isn't
> > +    passed, the default behavior is to use libargp if the libc doesn't=
 have argp.
> > +
> > +    Upstream-Status: Pending
> > +    Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +
> > +    Rebase to 6.6
> > +    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> > +Signed-off-by: Nicola Lunghi <25422924+nicola-lunghi@users.noreply.git=
hub.com>
> > +---
> > + configure.ac | 39 +++++++++++++++++++++++++++++++++++++++
> > + 1 file changed, 39 insertions(+)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 29a46fa..671c174 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -47,6 +47,13 @@ AC_ARG_WITH([pkcs11],
> > +       [with_pkcs11=3Dcheck]
> > + )
> > +
> > ++AC_ARG_WITH([libargp],
> > ++      AS_HELP_STRING([--without-libargp],
> > ++              [Disable libargp support. Systems whose libc lacks argp=
 can use libargp instead. (Default: check if libc lacks argp)]),
> > ++      [with_libargp=3D$withval],
> > ++      [with_libargp=3Dcheck]
> > ++)
> > ++
> > + dnl Make sure anyone changing configure.ac/Makefile.am has a clue
> > + AM_MAINTAINER_MODE
> > + AM_PROG_AS
> > +@@ -153,6 +160,38 @@ AS_IF(
> > +       ]
> > + )
> > +
> > ++dnl Determine if we need libargp: either user requested, or libc has =
no argp
> > ++AS_IF(
> > ++      [test "x$with_libargp" !=3D "xyes"],
> > ++      [
> > ++              AC_LINK_IFELSE(
> > ++                      [AC_LANG_PROGRAM(
> > ++                              [#include <argp.h>],
> > ++                              [int argc=3D1; char *argv[]=3D{"test"};=
 argp_parse(0,argc,argv,0,0,0); return 0;]
> > ++                              )],
> > ++                      [need_libargp=3Dno],
> > ++                      [need_libargp=3Dyes
> > ++                       if test "x$with_libargp" =3D "xno"; then
> > ++                              AC_MSG_FAILURE([libargp disabled and li=
bc does not have argp])
> > ++                       fi]
> > ++              )
> > ++      ],
> > ++      [need_libargp=3Dyes],
> > ++)
> > ++
> > ++dnl Check for libargp
> > ++AS_IF(
> > ++      [test "x$need_libargp" =3D "xyes"],
> > ++      [
> > ++              AC_CHECK_LIB(
> > ++                      [argp],
> > ++                      [argp_parse],
> > ++                      [LIBS=3D"$LIBS -largp"],
> > ++                      [AC_MSG_FAILURE([libargp not found])]
> > ++              )
> > ++      ]
> > ++)
> > ++
> > + dnl -----------------
> > + dnl Configure options
> > + dnl -----------------
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-t=
extrels-on-PIC-x86.patch b/meta/recipes-support/rng-tools/rng-tools/0009-Fi=
x-assemby-textrels-on-rdrand_asm.S-on-PIC-x86.patch
> > similarity index 94%
> > rename from meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-te=
xtrels-on-PIC-x86.patch
> > rename to meta/recipes-support/rng-tools/rng-tools/0009-Fix-assemby-tex=
trels-on-rdrand_asm.S-on-PIC-x86.patch
> > index 614adab27f..132736d75a 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels=
-on-PIC-x86.patch
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0009-Fix-assemby-textrel=
s-on-rdrand_asm.S-on-PIC-x86.patch
> > @@ -1,7 +1,7 @@
> > -From d8b1bb8edd99b2898720b4f10d292a67d532db48 Mon Sep 17 00:00:00 2001
> > +From ea266db777f52bfd3611bacb0dedca81437adb2b Mon Sep 17 00:00:00 2001
> >  From: "Francisco Blas Izquierdo Riera (klondike)" <klondike@gentoo.org=
>
> >  Date: Mon, 22 Oct 2018 15:29:36 +0800
> > -Subject: [PATCH 4/4] Fix assemby textrels on rdrand_asm.S on PIC x86
> > +Subject: [PATCH 09/10] Fix assemby textrels on rdrand_asm.S on PIC x86
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> > @@ -23,7 +23,7 @@ Reported-by: cilly <cilly@cilly.mine.nu>
> >  Reported-by: Manuel R=C3=BCger <mrueg@gentoo.org>
> >  Tested-by: Anthony Basile <blueness@gentoo.org>
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Submitted
> >  ---
> >   rdrand_asm.S | 27 +++++++++++++++++++++++++++
> >   1 file changed, 27 insertions(+)
> > @@ -110,5 +110,5 @@ index b5d260a..7811cf2 100644
> >         .balign 64
> >   aes_round_keys:
> >  --
> > -2.7.4
> > +2.20.1
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch =
b/meta/recipes-support/rng-tools/rng-tools/0010-Fix-underquoted-m4-entry.-T=
his-causes-a-failure-if-g.patch
> > similarity index 77%
> > rename from meta/recipes-support/rng-tools/rng-tools/underquote.patch
> > rename to meta/recipes-support/rng-tools/rng-tools/0010-Fix-underquoted=
-m4-entry.-This-causes-a-failure-if-g.patch
> > index aa4bbcb346..fc4de8b6e2 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools/underquote.patch
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0010-Fix-underquoted-m4-=
entry.-This-causes-a-failure-if-g.patch
> > @@ -1,8 +1,8 @@
> > -From 03fe7efa1bc04a83fb9b6787998e7baa7ee90646 Mon Sep 17 00:00:00 2001
> > +From f7c2422be181d5f858712da9e63b14b602d82fac Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Mon, 22 Oct 2018 15:27:41 +0800
> > -Subject: [PATCH 3/4] Fix underquoted m4 entry. This causes a failure i=
f gcrypt
> > - isn't present:
> > +Subject: [PATCH 10/10] Fix underquoted m4 entry. This causes a failure=
 if
> > + gcrypt isn't present:
> >
> >  | configure: libgcrypt support disabled
> >  | ../rng-tools-5/configure: line 4345: ac_fn_c_try_link: command not f=
ound
> > @@ -11,7 +11,7 @@ Subject: [PATCH 3/4] Fix underquoted m4 entry. This c=
auses a failure if gcrypt
> >  RP
> >  2016/2/16
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Submitted
> >
> >  Rebase to 6.6
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > @@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com=
>
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index dd1c30f..88d2be3 100644
> > +index 671c174..81959f3 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -124,7 +124,7 @@ AS_IF(
> > +@@ -142,7 +142,7 @@ AS_IF(
> >         [test "x$with_libgcrypt" !=3D "xno"],
> >         [
> >                 AC_CHECK_HEADER([gcrypt.h],
> > @@ -32,7 +32,7 @@ index dd1c30f..88d2be3 100644
> >                                 [gcrypt],
> >                                 [gcry_check_version], ,
> >                                 [
> > -@@ -133,7 +133,7 @@ AS_IF(
> > +@@ -151,7 +151,7 @@ AS_IF(
> >                                                 AC_MSG_NOTICE([libgcryp=
t support disabled])
> >                                         fi
> >                                 ]
> > @@ -42,5 +42,5 @@ index dd1c30f..88d2be3 100644
> >                                 AC_MSG_FAILURE([libgcrypt headers not f=
ound]); else
> >                                 AC_MSG_NOTICE([libgcrypt support disabl=
ed])
> >  --
> > -2.7.4
> > +2.20.1
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/rec=
ipes-support/rng-tools/rng-tools_6.7.bb
> > similarity index 72%
> > rename from meta/recipes-support/rng-tools/rng-tools_6.6.bb
> > rename to meta/recipes-support/rng-tools/rng-tools_6.7.bb
> > index 41959a2695..9cc5951345 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
> > @@ -10,16 +10,21 @@ DEPENDS =3D "sysfsutils"
> >
> >  SRC_URI =3D "\
> >      git://github.com/nhorman/rng-tools.git \
> > -    file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
> > -    file://0002-Add-argument-to-control-the-libargp-dependency.patch \
> > -    file://underquote.patch \
> > -    file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
> > -    file://0001-configure.ac-fix-typo.patch \
> > +    file://0001-Remove-superfluous-variables.patch \
> > +    file://0002-Fix-a-few-typos-in-log-messages.patch \
> > +    file://0003-Fix-up-some-compile-warnings.patch \
> > +    file://0004-Fix-a-race-condition-on-shutdown.patch \
> > +    file://0005-rngd-prioritize-faster-sources-of-entropy.patch \
> > +    file://0006-rngd_jitter-replace-non-standard-pthread_yield-with-.p=
atch \
> > +    file://0007-Make-rngd_pkcs11.c-explicitly-link-against-libcrypto.p=
atch \
> > +    file://0008-configure-If-the-libc-is-lacking-argp-use-libargp.patc=
h \
> > +    file://0009-Fix-assemby-textrels-on-rdrand_asm.S-on-PIC-x86.patch =
\
> > +    file://0010-Fix-underquoted-m4-entry.-This-causes-a-failure-if-g.p=
atch \
> >      file://init \
> >      file://default \
> >      file://rngd.service \
> >  "
> > -SRCREV =3D "4ebc21d6f387bb7b4b3f6badc429e27b21c0a6ee"
> > +SRCREV =3D "7435d1243d73525206ab476c02abf2dcea0a3fa1"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -31,6 +36,7 @@ PACKAGECONFIG_libc-musl =3D "libargp libjitterentropy=
"
> >  PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp-stan=
dalone,"
> >  PACKAGECONFIG[libgcrypt] =3D "--with-libgcrypt,--without-libgcrypt,lib=
gcrypt,"
> >  PACKAGECONFIG[libjitterentropy] =3D "--enable-jitterentropy,--disable-=
jitterentropy,libjitterentropy"
> > +PACKAGECONFIG[libpkcs11] =3D "--with-pkcs11,--without-pkcs11,libp11"
> >  PACKAGECONFIG[nistbeacon] =3D "--with-nistbeacon,--without-nistbeacon,=
curl libxml2 openssl"
> >
> >  INITSCRIPT_NAME =3D "rng-tools"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

