Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8F12C794EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 10:10:21 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a108-v6so5134319wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/6XcMF+Pi2APUkKxZ05e9zS1laftz6s9lMWRONYka28=;
	b=CopWNEujZvSTE1//eti3Y4NmiAQZSNxYDelK6FAClqMZXFyZyK4hY3iePT3W3Uip3e
	Gn9IPYcpgPOvmurB62Kd8efesY5jxfKDyxJm1LioT2RmILoPsV1cywi/BGPgzhVgrIVo
	eUfowvne0y3eoim3KIesz2GwnS/6jGXvvYZ61UyAFVGMTANSPuROoLlrma81czIXcAI0
	Aja/pSoYr0smZoo39Rp54j/W5DwUxNrFGkh5LIkFVdYBjEEvo0y1Wt4sPsO1CyU7ETLC
	bWpHwS1h/2WP1Lm1LNVMyVBtCGlVgGEIqMUEE5G5QQMMuRpp6kgeGcD22UoexfqS6VWj
	DJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/6XcMF+Pi2APUkKxZ05e9zS1laftz6s9lMWRONYka28=;
	b=mPnX0UigVHuqCq85G9JYSbLfxZgUaVnt57WijLUX5U1yVrnS9b959LAAlud94UEJBM
	ibMj3HKUPlliD8y7mnF1lLb/203otGuW+wVVJpTfYH0n2vMfqiYN2HGSOuMlI9xxvWaB
	NwGjPH9Ui+JDoFfrTtdQH2r2Sl9JpwsGGixD0VKwS2EpEDN2vnOOqleLvxVaCJtr99sm
	o6CJeLN1Vx35FMeeFG2lN/Ms4exNreFNjwrnA2Ze1/+Iju0gB2kwfBVLmmfkgOBuVZrq
	G2khBV7OR3QBh8M/EZYmnQFv3dwTgA8Q9WAdEibRYYjlc5c/jwwJ4AhD92eBBGTLj7W7
	8GDA==
X-Gm-Message-State: APzg51BlOmkuoyQBbQzHPB9Ptmc8Ke/24GJAdJ8uXlnVYo+eZ4So3suh
	biZH5tPCSBYTlbIA9fqmZ5kPmCQCndgWMhgqN/4=
X-Google-Smtp-Source: ANB0VdYrOYCIGJPcTHrdB3K/hj1viy4x+JJmYtf9XiDKPij2b9pGuNd70ZpHDiN9rjq5JkoUuKolrmBvcIqtqLEPTd0=
X-Received: by 2002:adf:e505:: with SMTP id
	j5-v6mr27508083wrm.111.1537351822021; 
	Wed, 19 Sep 2018 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180917054844.12934-1-Martin.Jansa@gmail.com>
	<20180917054844.12934-3-Martin.Jansa@gmail.com>
	<CAMKF1sqDFe3-Ye28Tg3nL8=1iij70Jfx85-SCdYWX4e_7WbtKQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqDFe3-Ye28Tg3nL8=1iij70Jfx85-SCdYWX4e_7WbtKQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Sep 2018 12:10:11 +0200
Message-ID: <CA+chaQdF1WoUTRuNeLuj8Bna8Jj8TmTEg4makNcOeL0i3=NLCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glibc: fix build with -O
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
X-List-Received-Date: Wed, 19 Sep 2018 10:10:22 -0000
Content-Type: multipart/alternative; boundary="0000000000003f182b0576369d44"

--0000000000003f182b0576369d44
Content-Type: text/plain; charset="UTF-8"

I've submitted them now:

https://www.sourceware.org/ml/libc-alpha/2018-09/msg00299.html
https://www.sourceware.org/ml/libc-alpha/2018-09/msg00300.html

I didn't update the Upstream-Status, because it would cause whole world to
rebuild again.

On Wed, Sep 19, 2018 at 6:13 AM Khem Raj <raj.khem@gmail.com> wrote:

> please submit upstream as well
> On Sun, Sep 16, 2018 at 10:49 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > * tested for qemuarm, qemux86 with -O, -O0, -Os, with gcc
> > * to build with -O0 I had to remove restriction from systemtap first
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc.inc             | 12 ---
> >  ...4-prevent-maybe-uninitialized-errors.patch | 95 +++++++++++++++++++
> >  ...2-soft-fp-ignore-maybe-uninitialized.patch | 72 ++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.28.bb         |  2 +
> >  4 files changed, 169 insertions(+), 12 deletions(-)
> >  create mode 100644
> meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
> >  create mode 100644
> meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc.inc
> b/meta/recipes-core/glibc/glibc.inc
> > index 91491a35f0..e673707369 100644
> > --- a/meta/recipes-core/glibc/glibc.inc
> > +++ b/meta/recipes-core/glibc/glibc.inc
> > @@ -6,18 +6,6 @@ STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
> >  STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
> >  PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
> >
> > -python () {
> > -    opt_effective = "-O"
> > -    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
> > -        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
> > -            opt_effective = opt
> > -    if opt_effective == "-O0":
> > -        bb.fatal("%s can't be built with %s, try -O1 instead" %
> (d.getVar('PN'), opt_effective))
> > -    if opt_effective in ("-O", "-O1", "-Os"):
> > -        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to
> SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
> > -        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
> > -}
> > -
> >  # siteconfig.bbclass runs configure which needs a working compiler
> >  # For the compiler to work we need a working libc yet libc isn't
> >  # in the sysroots directory at this point. This means the libc.so
> > diff --git
> a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
> b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
> > new file mode 100644
> > index 0000000000..d9d36b8244
> > --- /dev/null
> > +++
> b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
> > @@ -0,0 +1,95 @@
> > +From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Fri, 14 Sep 2018 23:23:03 +0000
> > +Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors
> > +
> > +* with -O included in BUILD_OPTIMIZATION when DEBUG_BUILD
> > +  is used, nativesdk-glibc fails with:
> > +../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
> > +../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
> > +      b = invsqrtpi * temp / sqrtl (x);
> > +          ~~~~~~~~~~^~~~~~
> > +../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_ynl':
> > +../sysdeps/ieee754/ldbl-96/e_jnl.c:375:16: error: 'temp' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
> > +  b = invsqrtpi * temp / sqrtl (x);
> > +      ~~~~~~~~~~^~~~~~
> > +
> > +* work around the issue instead of removing -O like we do with
> > +  SELECTED_OPTIMIZATION
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + sysdeps/ieee754/dbl-64/e_jn.c    | 2 ++
> > + sysdeps/ieee754/ldbl-128/e_jnl.c | 4 ++++
> > + sysdeps/ieee754/ldbl-96/e_jnl.c  | 4 ++++
> > + 3 files changed, 10 insertions(+)
> > +
> > +diff --git a/sysdeps/ieee754/dbl-64/e_jn.c
> b/sysdeps/ieee754/dbl-64/e_jn.c
> > +index 9181b22bb8..74a6b5f149 100644
> > +--- a/sysdeps/ieee754/dbl-64/e_jn.c
> > ++++ b/sysdeps/ieee754/dbl-64/e_jn.c
> > +@@ -108,6 +108,7 @@ __ieee754_jn (int n, double x)
> > +             case 1: temp = -c + s; break;
> > +             case 2: temp = -c - s; break;
> > +             case 3: temp = c - s; break;
> > ++            default: temp = 0; // just to prevent error: 'temp' may be
> used uninitialized in this function [-Werror=maybe-uninitialized]
> > +             }
> > +           b = invsqrtpi * temp / sqrt (x);
> > +         }
> > +@@ -315,6 +316,7 @@ __ieee754_yn (int n, double x)
> > +         case 1: temp = -s - c; break;
> > +         case 2: temp = -s + c; break;
> > +         case 3: temp = s + c; break;
> > ++        default: temp = 0; // just to prevent error: 'temp' may be
> used uninitialized in this function [-Werror=maybe-uninitialized]
> > +         }
> > +       b = invsqrtpi * temp / sqrt (x);
> > +       }
> > +diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c
> b/sysdeps/ieee754/ldbl-128/e_jnl.c
> > +index 7739eec291..b6a1275464 100644
> > +--- a/sysdeps/ieee754/ldbl-128/e_jnl.c
> > ++++ b/sysdeps/ieee754/ldbl-128/e_jnl.c
> > +@@ -149,6 +149,8 @@ __ieee754_jnl (int n, _Float128 x)
> > +             case 3:
> > +               temp = c - s;
> > +               break;
> > ++            default:
> > ++              temp = 0; // just to prevent error: 'temp' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
> > +             }
> > +           b = invsqrtpi * temp / sqrtl (x);
> > +         }
> > +@@ -385,6 +387,8 @@ __ieee754_ynl (int n, _Float128 x)
> > +         case 3:
> > +           temp = s + c;
> > +           break;
> > ++        default:
> > ++          temp = 0; // just to prevent error: 'temp' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
> > +         }
> > +       b = invsqrtpi * temp / sqrtl (x);
> > +       }
> > +diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c
> b/sysdeps/ieee754/ldbl-96/e_jnl.c
> > +index 394921f564..2263b02203 100644
> > +--- a/sysdeps/ieee754/ldbl-96/e_jnl.c
> > ++++ b/sysdeps/ieee754/ldbl-96/e_jnl.c
> > +@@ -142,6 +142,8 @@ __ieee754_jnl (int n, long double x)
> > +             case 3:
> > +               temp = c - s;
> > +               break;
> > ++            default:
> > ++              temp = 0; // just to prevent error: 'temp' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
> > +             }
> > +           b = invsqrtpi * temp / sqrtl (x);
> > +         }
> > +@@ -371,6 +373,8 @@ __ieee754_ynl (int n, long double x)
> > +         case 3:
> > +           temp = s + c;
> > +           break;
> > ++        default:
> > ++          temp = 0; // just to prevent error: 'temp' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
> > +         }
> > +       b = invsqrtpi * temp / sqrtl (x);
> > +       }
> > +--
> > +2.17.1
> > +
> > diff --git
> a/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
> b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
> > new file mode 100644
> > index 0000000000..d3c9902fbc
> > --- /dev/null
> > +++
> b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
> > @@ -0,0 +1,72 @@
> > +From 0efa7fd1c800277d5323d05cb245c0536fe9ce22 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Sun, 16 Sep 2018 12:39:22 +0000
> > +Subject: [PATCH] soft-fp: ignore maybe-uninitialized
> > +
> > +* with -O it fails with:
> > +
> > +In file included from ../soft-fp/soft-fp.h:318,
> > +                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
> > +../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
> > +../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in
> this function [-Werror=maybe-uninitialized]
> > +        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
> > +                         ^~
> > +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared
> here
> > +   FP_DECL_D (R);
> > +              ^
> > +../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
> > +   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
> > +                                    ^
> > +../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
> > + # define FP_DECL_D(X)  _FP_DECL (2, X)
> > +                        ^~~~~~~~
> > +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro
> 'FP_DECL_D'
> > +   FP_DECL_D (R);
> > +   ^~~~~~~~~
> > +../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in
> this function [-Werror=maybe-uninitialized]
> > +       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
> > +                 ^~
> > +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared
> here
> > +   FP_DECL_D (R);
> > +              ^
> > +../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
> > +   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
> > +              ^
> > +../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
> > + # define FP_DECL_D(X)  _FP_DECL (2, X)
> > +                        ^~~~~~~~
> > +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro
> 'FP_DECL_D'
> > +   FP_DECL_D (R);
> > +   ^~~~~~~~~
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + soft-fp/op-2.h | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/soft-fp/op-2.h b/soft-fp/op-2.h
> > +index 6020d663d4..6672337949 100644
> > +--- a/soft-fp/op-2.h
> > ++++ b/soft-fp/op-2.h
> > +@@ -92,6 +92,8 @@
> > +             X##_f1 = 0;                                               \
> > +           }))
> > +
> > ++#pragma GCC diagnostic push
> > ++#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
> > + #define _FP_FRAC_SRS_2(X, N, sz)                                      \
> > +   (void) (((N) < _FP_W_TYPE_SIZE)                                     \
> > +         ? ({                                                          \
> > +@@ -109,6 +111,7 @@
> > +                           | X##_f0) != 0));                           \
> > +             X##_f1 = 0;                                               \
> > +           }))
> > ++#pragma GCC diagnostic pop
> > +
> > + #define _FP_FRAC_ADDI_2(X, I) \
> > +   __FP_FRAC_ADDI_2 (X##_f1, X##_f0, I)
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.28.bb
> b/meta/recipes-core/glibc/glibc_2.28.bb
> > index 0ebbaf9610..df60ba8445 100644
> > --- a/meta/recipes-core/glibc/glibc_2.28.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> > @@ -45,6 +45,8 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >
>  file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
> >
>  file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
> >
>  file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
> > +
>  file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch \
> > +           file://0032-soft-fp-ignore-maybe-uninitialized.patch \
> >  "
> >
> >  NATIVESDKFIXES ?= ""
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003f182b0576369d44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I&#39;ve submitted them now:</div><d=
iv><br></div><div dir=3D"ltr"><a href=3D"https://www.sourceware.org/ml/libc=
-alpha/2018-09/msg00299.html">https://www.sourceware.org/ml/libc-alpha/2018=
-09/msg00299.html</a><br></div><div dir=3D"ltr"><a href=3D"https://www.sour=
ceware.org/ml/libc-alpha/2018-09/msg00300.html">https://www.sourceware.org/=
ml/libc-alpha/2018-09/msg00300.html</a><br></div><div dir=3D"ltr"><br></div=
><div>I didn&#39;t update the Upstream-Status, because it would cause whole=
 world to rebuild again.</div></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Wed, Sep 19, 2018 at 6:13 AM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">please submit upstream as well<br>
On Sun, Sep 16, 2018 at 10:49 PM Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; * tested for qemuarm, qemux86 with -O, -O0, -Os, with gcc<br>
&gt; * to build with -O0 I had to remove restriction from systemtap first<b=
r>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/glibc/glibc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 12 ---<br>
&gt;=C2=A0 ...4-prevent-maybe-uninitialized-errors.patch | 95 +++++++++++++=
++++++<br>
&gt;=C2=A0 ...2-soft-fp-ignore-maybe-uninitialized.patch | 72 +++++++++++++=
+<br>
&gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 4 files changed, 169 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/0031-sysdeps-ie=
ee754-prevent-maybe-uninitialized-errors.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/0032-soft-fp-ig=
nore-maybe-uninitialized.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/gli=
bc/glibc.inc<br>
&gt; index 91491a35f0..e673707369 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc.inc<br>
&gt; +++ b/meta/recipes-core/glibc/glibc.inc<br>
&gt; @@ -6,18 +6,6 @@ STAGINGCC =3D &quot;gcc-cross-initial-${TARGET_ARCH}&=
quot;<br>
&gt;=C2=A0 STAGINGCC_class-nativesdk =3D &quot;gcc-crosssdk-initial-${SDK_S=
YS}&quot;<br>
&gt;=C2=A0 PATH_prepend =3D &quot;${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:=
&quot;<br>
&gt;<br>
&gt; -python () {<br>
&gt; -=C2=A0 =C2=A0 opt_effective =3D &quot;-O&quot;<br>
&gt; -=C2=A0 =C2=A0 for opt in d.getVar(&#39;SELECTED_OPTIMIZATION&#39;).sp=
lit():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt in (&quot;-O0&quot;, &quot;-O&quot=
;, &quot;-O1&quot;, &quot;-O2&quot;, &quot;-O3&quot;, &quot;-Os&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt_effective =3D opt<br>
&gt; -=C2=A0 =C2=A0 if opt_effective =3D=3D &quot;-O0&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;%s can&#39;t be built with=
 %s, try -O1 instead&quot; % (d.getVar(&#39;PN&#39;), opt_effective))<br>
&gt; -=C2=A0 =C2=A0 if opt_effective in (&quot;-O&quot;, &quot;-O1&quot;, &=
quot;-Os&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s doesn&#39;t build cleanl=
y with %s, adding -Wno-error to SELECTED_OPTIMIZATION&quot; % (d.getVar(&#3=
9;PN&#39;), opt_effective))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&quot;SELECTED_OPTIMIZATION&q=
uot;, &quot; -Wno-error&quot;)<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 # siteconfig.bbclass runs configure which needs a working compil=
er<br>
&gt;=C2=A0 # For the compiler to work we need a working libc yet libc isn&#=
39;t<br>
&gt;=C2=A0 # in the sysroots directory at this point. This means the libc.s=
o<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-preven=
t-maybe-uninitialized-errors.patch b/meta/recipes-core/glibc/glibc/0031-sys=
deps-ieee754-prevent-maybe-uninitialized-errors.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d9d36b8244<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe=
-uninitialized-errors.patch<br>
&gt; @@ -0,0 +1,95 @@<br>
&gt; +From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 14 Sep 2018 23:23:03 +0000<br>
&gt; +Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors<=
br>
&gt; +<br>
&gt; +* with -O included in BUILD_OPTIMIZATION when DEBUG_BUILD<br>
&gt; +=C2=A0 is used, nativesdk-glibc fails with:<br>
&gt; +../sysdeps/ieee754/ldbl-96/e_jnl.c: In function &#39;__ieee754_jnl&#3=
9;:<br>
&gt; +../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: &#39;temp&#39; may =
be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 b =3D invsqrtpi * temp / sqrtl (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~^~~~~~<br>
&gt; +../sysdeps/ieee754/ldbl-96/e_jnl.c: In function &#39;__ieee754_ynl&#3=
9;:<br>
&gt; +../sysdeps/ieee754/ldbl-96/e_jnl.c:375:16: error: &#39;temp&#39; may =
be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 b =3D invsqrtpi * temp / sqrtl (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~^~~~~~<br>
&gt; +<br>
&gt; +* work around the issue instead of removing -O like we do with<br>
&gt; +=C2=A0 SELECTED_OPTIMIZATION<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + sysdeps/ieee754/dbl-64/e_jn.c=C2=A0 =C2=A0 | 2 ++<br>
&gt; + sysdeps/ieee754/ldbl-128/e_jnl.c | 4 ++++<br>
&gt; + sysdeps/ieee754/ldbl-96/e_jnl.c=C2=A0 | 4 ++++<br>
&gt; + 3 files changed, 10 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/sysdeps/ieee754/dbl-64/e_jn.c b/sysdeps/ieee754/dbl-64/e=
_jn.c<br>
&gt; +index 9181b22bb8..74a6b5f149 100644<br>
&gt; +--- a/sysdeps/ieee754/dbl-64/e_jn.c<br>
&gt; ++++ b/sysdeps/ieee754/dbl-64/e_jn.c<br>
&gt; +@@ -108,6 +108,7 @@ __ieee754_jn (int n, double x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 1: temp =3D -c +=
 s; break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 2: temp =3D -c -=
 s; break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3: temp =3D c - =
s; break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default: temp =3D 0; // ju=
st to prevent error: &#39;temp&#39; may be used uninitialized in this funct=
ion [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D invsqrtpi * temp / sqr=
t (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -315,6 +316,7 @@ __ieee754_yn (int n, double x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 1: temp =3D -s - c; break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 2: temp =3D -s + c; break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3: temp =3D s + c; break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 default: temp =3D 0; // just to prevent =
error: &#39;temp&#39; may be used uninitialized in this function [-Werror=
=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D invsqrtpi * temp / sqrt (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c b/sysdeps/ieee754/ldbl-=
128/e_jnl.c<br>
&gt; +index 7739eec291..b6a1275464 100644<br>
&gt; +--- a/sysdeps/ieee754/ldbl-128/e_jnl.c<br>
&gt; ++++ b/sysdeps/ieee754/ldbl-128/e_jnl.c<br>
&gt; +@@ -149,6 +149,8 @@ __ieee754_jnl (int n, _Float128 x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D c - s=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temp =3D 0; // just=
 to prevent error: &#39;temp&#39; may be used uninitialized in this functio=
n [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D invsqrtpi * temp / sqr=
tl (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -385,6 +387,8 @@ __ieee754_ynl (int n, _Float128 x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D s + c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temp =3D 0; // just to prevent er=
ror: &#39;temp&#39; may be used uninitialized in this function [-Werror=3Dm=
aybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D invsqrtpi * temp / sqrtl (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c b/sysdeps/ieee754/ldbl-9=
6/e_jnl.c<br>
&gt; +index 394921f564..2263b02203 100644<br>
&gt; +--- a/sysdeps/ieee754/ldbl-96/e_jnl.c<br>
&gt; ++++ b/sysdeps/ieee754/ldbl-96/e_jnl.c<br>
&gt; +@@ -142,6 +142,8 @@ __ieee754_jnl (int n, long double x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D c - s=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temp =3D 0; // just=
 to prevent error: &#39;temp&#39; may be used uninitialized in this functio=
n [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D invsqrtpi * temp / sqr=
tl (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -371,6 +373,8 @@ __ieee754_ynl (int n, long double x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D s + c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temp =3D 0; // just to prevent er=
ror: &#39;temp&#39; may be used uninitialized in this function [-Werror=3Dm=
aybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D invsqrtpi * temp / sqrtl (x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-u=
ninitialized.patch b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-mayb=
e-uninitialized.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d3c9902fbc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitia=
lized.patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +From 0efa7fd1c800277d5323d05cb245c0536fe9ce22 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 16 Sep 2018 12:39:22 +0000<br>
&gt; +Subject: [PATCH] soft-fp: ignore maybe-uninitialized<br>
&gt; +<br>
&gt; +* with -O it fails with:<br>
&gt; +<br>
&gt; +In file included from ../soft-fp/soft-fp.h:318,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ..=
/sysdeps/ieee754/soft-fp/s_fdiv.c:28:<br>
&gt; +../sysdeps/ieee754/soft-fp/s_fdiv.c: In function &#39;__fdiv&#39;:<br=
>
&gt; +../soft-fp/op-2.h:98:25: error: &#39;R_f1&#39; may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 X##_f0 =3D (X##_f1 &lt;&lt; (_FP_W_TYPE_S=
IZE - (N)) | X##_f0 &gt;&gt; (N) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^~<br>
&gt; +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: &#39;R_f1&#39; was d=
eclared here<br>
&gt; +=C2=A0 =C2=A0FP_DECL_D (R);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; +../soft-fp/op-2.h:37:36: note: in definition of macro &#39;_FP_FRAC_D=
ECL_2&#39;<br>
&gt; +=C2=A0 =C2=A0_FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; +../soft-fp/double.h:95:24: note: in expansion of macro &#39;_FP_DECL&=
#39;<br>
&gt; + # define FP_DECL_D(X)=C2=A0 _FP_DECL (2, X)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ^~~~~~~~<br>
&gt; +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro=
 &#39;FP_DECL_D&#39;<br>
&gt; +=C2=A0 =C2=A0FP_DECL_D (R);<br>
&gt; +=C2=A0 =C2=A0^~~~~~~~~<br>
&gt; +../soft-fp/op-2.h:101:17: error: &#39;R_f0&#39; may be used uninitial=
ized in this function [-Werror=3Dmaybe-uninitialized]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0: (X##_f0 &lt;&lt; (_FP_W_TYPE_SIZE - (N))=
) !=3D 0)); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
&gt; +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: &#39;R_f0&#39; was d=
eclared here<br>
&gt; +=C2=A0 =C2=A0FP_DECL_D (R);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; +../soft-fp/op-2.h:37:14: note: in definition of macro &#39;_FP_FRAC_D=
ECL_2&#39;<br>
&gt; +=C2=A0 =C2=A0_FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; +../soft-fp/double.h:95:24: note: in expansion of macro &#39;_FP_DECL&=
#39;<br>
&gt; + # define FP_DECL_D(X)=C2=A0 _FP_DECL (2, X)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ^~~~~~~~<br>
&gt; +../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro=
 &#39;FP_DECL_D&#39;<br>
&gt; +=C2=A0 =C2=A0FP_DECL_D (R);<br>
&gt; +=C2=A0 =C2=A0^~~~~~~~~<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + soft-fp/op-2.h | 3 +++<br>
&gt; + 1 file changed, 3 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/soft-fp/op-2.h b/soft-fp/op-2.h<br>
&gt; +index 6020d663d4..6672337949 100644<br>
&gt; +--- a/soft-fp/op-2.h<br>
&gt; ++++ b/soft-fp/op-2.h<br>
&gt; +@@ -92,6 +92,8 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X##_f1 =3D 0;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}))<br>
&gt; +<br>
&gt; ++#pragma GCC diagnostic push<br>
&gt; ++#pragma GCC diagnostic ignored &quot;-Wmaybe-uninitialized&quot;<br>
&gt; + #define _FP_FRAC_SRS_2(X, N, sz)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0(void) (((N) &lt; _FP_W_TYPE_SIZE)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +@@ -109,6 +111,7 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| X##_f0) !=3D 0));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X##_f1 =3D 0;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}))<br>
&gt; ++#pragma GCC diagnostic pop<br>
&gt; +<br>
&gt; + #define _FP_FRAC_ADDI_2(X, I) \<br>
&gt; +=C2=A0 =C2=A0__FP_FRAC_ADDI_2 (X##_f1, X##_f0, I)<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" =
rel=3D"noreferrer" target=3D"_blank">glibc_2.28.bb</a> b/meta/recipes-core/=
glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"noreferrer" target=3D"_blank"=
>glibc_2.28.bb</a><br>
&gt; index 0ebbaf9610..df60ba8445 100644<br>
&gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.28.bb</a><br>
&gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.28.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.28.bb</a><br>
&gt; @@ -45,6 +45,8 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRA=
NCH};name=3Dglibc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-bits-siginf=
o-consts.h-enum-definition-for-TRAP_HWBKP.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-localedef-a=
dd-to-archive-uses-a-hard-coded-locale-pa.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0030-intl-Emit-n=
o-lines-in-bison-generated-files.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-sysdeps-ieee754-=
prevent-maybe-uninitialized-errors.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-soft-fp-ignore-m=
aybe-uninitialized.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 NATIVESDKFIXES ?=3D &quot;&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003f182b0576369d44--
