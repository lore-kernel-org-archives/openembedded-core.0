Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.7929.1611033389512211090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 21:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EzA1YZHg;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id bd6so8608215qvb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 21:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOsYbp3qMypb8UnQL0QnM5D98nhu6JxaXZiiY+e25SQ=;
        b=EzA1YZHg+2dGV+lt3bhW2I6IowaU8+a+T9g7vnZMPALHrwKM3aTREBmf+N1Xb3gS0u
         gmXcot/LoiImY6LpvuUv7IIEtzdL15/AR4QWirZSwEi/wV6TbHJ0zhW6PyP/aNuUoq1n
         yjtb85cmAO4Wla2nz4M3xTThUF+1TaXwpjFUpxEhgQckZ6jk5XTg7xjN7xLIDXkLx2g1
         G6wpopNys+E1rKvCC967N0Zipq09TrPmQJkKQg7Stmi4Q3V6CWtYZNzz7FCPGHKfwFXH
         RHFvQO3xq7txnhIEJzUalS4FzYdP9xp+oyfcmtpHpb6vcElK8IeGehlTPnxSn+xXU2tS
         OvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOsYbp3qMypb8UnQL0QnM5D98nhu6JxaXZiiY+e25SQ=;
        b=iBZbWXEAxmlpzIQEYJlzSkyqxQyHh2nCub1YjlnH2fyAUXKAhUhxSvS8WR2hTl75/J
         HLLOrruUXKRfYzXQAEPmfvi1xN3LSTtGJ464lZo/cnarHlxlXSIM1wG6eL45y6ebKaXh
         eFDP1esiXoAfrS7SAu42hUBkeOqBh73GVR/WWHGKJAEtEO4O6WejRtTTTDw3ZTFRJ+qw
         87mU8KD/s02PoriP+YFUxFk8bHDMNHvnKUTI5nee86wuNcbkk+ZkcBdiWhi6gKjZNIOM
         zXppOTvQHkcm9IjpHLf/FrPbWhQTeSR6bTTtkEgfFHnj0pBGWrJb65uBAThHX8YlhsR2
         rpGg==
X-Gm-Message-State: AOAM5327Avqotz354KhV/8WR/Aq2sqBNHQfUiiqS0faqi7oF2n8Ss172
	BL13fFvjsnAqZlkueel2F4jKeRlFNo+tnexKOi0=
X-Google-Smtp-Source: ABdhPJwFmCP1dz/q+UOY7aUTh7oxkN8uyI4Q7JZDT4ctrsyHGU1i05Xlz5Iin9O227xsdkthSmpGEKnUrf/dQeirwS0=
X-Received: by 2002:a0c:ea34:: with SMTP id t20mr2661906qvp.5.1611033388535;
 Mon, 18 Jan 2021 21:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20201215083458.1360882-1-nathan@nathanrossi.com>
 <CAMKF1sqxHgujjbZ+D0u15gtu4Pqae+9LCpjgvaanV3ts1vvCig@mail.gmail.com> <CA+aJhH07k50aF3v6XxO56HTJWTkaw=6o+0o2apUz1XaYEynsFg@mail.gmail.com>
In-Reply-To: <CA+aJhH07k50aF3v6XxO56HTJWTkaw=6o+0o2apUz1XaYEynsFg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 18 Jan 2021 21:16:17 -0800
Message-ID: <CAMKF1srXnV-=LADcOQNQAkmVPun6yj85ewcf5PyaS6eBrquOQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Add patch to resolve i*86 tune configuration overrides
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d853f605b939f002"

--000000000000d853f605b939f002
Content-Type: text/plain; charset="UTF-8"

I think it will be good to do so

On Mon, Jan 18, 2021 at 5:40 PM Nathan Rossi <nathan@nathanrossi.com> wrote:

> On Sat, 16 Jan 2021 at 03:40, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Nathan
> >
> > Can you check if your patch is still needed after
> >
> >
> https://github.com/kraj/gcc/commit/0411ae7f08e0f5a8b02ff313d26d27a0f6d1bb34
>
> Hi Khem,
>
> I tested this change and it resolves the configuration issue. Did you
> want the above change backported to replace the oe specific patch?
> Since that oe specific patch has already been backported to a number
> of releases.
>
> Thanks,
> Nathan
>
> >
> > On Tue, Dec 15, 2020 at 12:35 AM Nathan Rossi <nathan@nathanrossi.com>
> wrote:
> > >
> > > When compiling gcc-runtime for i686 libatomic, libgomp and libitm are
> > > compiled with additional '-march' and '-mtune' overrides. This
> typically
> > > does not cause build errors (e.g. core2-32 tune), and results in less
> > > optimally tuned outputs. However with specific TUNE_CCARGS (e.g. has
> > > '-mfpmath=sse' but not '-msse*'), the build errors with conflicting
> > > '-mfpmath' options.
> > >
> > > This is caused by gcc-runtime specific configure scripts and Makefile
> > > options that override by adding additional '-march'/'-mtune' args. OE
> > > builds gcc-runtime differently to other build systems, and provides
> > > target specific arch/tune options directly. As such, this change adds a
> > > patch for gcc to remove the specific cases where the args are added.
> > >
> > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-10.2.inc             |   1 +
> > >  .../gcc/0001-lib-Remove-i-86-march-overrides.patch | 113
> +++++++++++++++++++++
> > >  2 files changed, 114 insertions(+)
> > >  create mode 100644
> meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc
> b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > > index e88f2ade6d..1e69c91311 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > > @@ -69,6 +69,7 @@ SRC_URI = "\
> > >
>  file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
> > >             file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
> \
> > >
>  file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
> > > +           file://0001-lib-Remove-i-86-march-overrides.patch \
> > >  "
> > >  SRC_URI[sha256sum] =
> "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
> > >
> > > diff --git
> a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> > > new file mode 100644
> > > index 0000000000..3f04e121ba
> > > --- /dev/null
> > > +++
> b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> > > @@ -0,0 +1,113 @@
> > > +From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
> > > +From: Nathan Rossi <nathan@nathanrossi.com>
> > > +Date: Tue, 15 Dec 2020 11:43:36 +1000
> > > +Subject: [PATCH] lib*: Remove i*86 march overrides
> > > +
> > > +OE does not pass the '--with-arch' option to gccs configure, as such
> > > +some gcc-runtime libraries try to override the value of '-march' and
> > > +'-mtune' which OE already provides. This causes conflicts with other
> > > +i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
> > > +Additionally this caused the following libraries to be built with less
> > > +optimized tune configurations.
> > > +
> > > +Upstream suggests that this should be detecting or otherwise checking
> if
> > > +the target supports the desired functionality before overriding.
> > > +
> > > +    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
> > > +
> > > +libatomic also overrides the '-march' specifically for IFUNC objects.
> > > +OE already supplies the correct march flag, so remove setting.
> > > +
> > > +Upstream-Status: Inappropriate [OE Specific]
> > > +Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > +---
> > > + libatomic/Makefile.am   | 1 -
> > > + libatomic/Makefile.in   | 1 -
> > > + libatomic/configure.tgt | 9 ---------
> > > + libgomp/configure.tgt   | 8 --------
> > > + libitm/configure.tgt    | 9 ---------
> > > + 5 files changed, 28 deletions(-)
> > > +
> > > +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > > +index ac1ca64587..5aa16e0699 100644
> > > +--- a/libatomic/Makefile.am
> > > ++++ b/libatomic/Makefile.am
> > > +@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach
> s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
> > > + libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
> > > + endif
> > > + if ARCH_I386
> > > +-IFUNC_OPTIONS      = -march=i586
> > > + libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
> > > + endif
> > > + if ARCH_X86_64
> > > +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > > +index 97df2d7ff0..82c511d420 100644
> > > +--- a/libatomic/Makefile.in
> > > ++++ b/libatomic/Makefile.in
> > > +@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach
> s,$(SIZES),$(addsuffix \
> > > +       _$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
> > > +       $(am__append_3) $(am__append_4)
> > > + @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =
> -march=armv7-a+fp -DHAVE_KERNEL64
> > > +-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
> > > + @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
> > > + libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
> > > + libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
> > > +diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
> > > +index 5dd0926d20..3cc41773c3 100644
> > > +--- a/libatomic/configure.tgt
> > > ++++ b/libatomic/configure.tgt
> > > +@@ -82,15 +82,6 @@ case "${target_cpu}" in
> > > +       ;;
> > > +
> > > +   i[3456]86)
> > > +-      case " ${CC} ${CFLAGS} " in
> > > +-        *" -m64 "*|*" -mx32 "*)
> > > +-          ;;
> > > +-        *)
> > > +-          if test -z "$with_arch"; then
> > > +-            XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> > > +-            XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
> > > +-          fi
> > > +-      esac
> > > +       ARCH=x86
> > > +       # ??? Detect when -march=i686 is already enabled.
> > > +       try_ifunc=yes
> > > +diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
> > > +index 4790a31e39..46c4c958e6 100644
> > > +--- a/libgomp/configure.tgt
> > > ++++ b/libgomp/configure.tgt
> > > +@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
> > > +     # Note that bare i386 is not included here.  We need cmpxchg.
> > > +     i[456]86-*-linux*)
> > > +       config_path="linux/x86 linux posix"
> > > +-      case " ${CC} ${CFLAGS} " in
> > > +-        *" -m64 "*|*" -mx32 "*)
> > > +-          ;;
> > > +-        *)
> > > +-          if test -z "$with_arch"; then
> > > +-            XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> > > +-          fi
> > > +-      esac
> > > +       ;;
> > > +
> > > +     # Similar jiggery-pokery for x86_64 multilibs, except here we
> > > +diff --git a/libitm/configure.tgt b/libitm/configure.tgt
> > > +index 04109160e9..3d78ea609d 100644
> > > +--- a/libitm/configure.tgt
> > > ++++ b/libitm/configure.tgt
> > > +@@ -59,15 +59,6 @@ case "${target_cpu}" in
> > > +   arm*)               ARCH=arm ;;
> > > +
> > > +   i[3456]86)
> > > +-      case " ${CC} ${CFLAGS} " in
> > > +-        *" -m64 "*|*" -mx32 "*)
> > > +-          ;;
> > > +-        *)
> > > +-          if test -z "$with_arch"; then
> > > +-            XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> > > +-            XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
> > > +-          fi
> > > +-      esac
> > > +       XCFLAGS="${XCFLAGS} -mrtm"
> > > +       ARCH=x86
> > > +       ;;
> > > ---
> > > 2.29.2
> > >
> > > 
> > >
>

--000000000000d853f605b939f002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think it will be good to do so=C2=A0</div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 18=
, 2021 at 5:40 PM Nathan Rossi &lt;<a href=3D"mailto:nathan@nathanrossi.com=
">nathan@nathanrossi.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sat, 1=
6 Jan 2021 at 03:40, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Nathan<br>
&gt;<br>
&gt; Can you check if your patch is still needed after<br>
&gt;<br>
&gt; <a href=3D"https://github.com/kraj/gcc/commit/0411ae7f08e0f5a8b02ff31=
3d26d27a0f6d1bb34" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
kraj/gcc/commit/0411ae7f08e0f5a8b02ff313d26d27a0f6d1bb34</a><br>
<br>
Hi Khem,<br>
<br>
I tested this change and it resolves the configuration issue. Did you<br>
want the above change backported to replace the oe specific patch?<br>
Since that oe specific patch has already been backported to a number<br>
of releases.<br>
<br>
Thanks,<br>
Nathan<br>
<br>
&gt;<br>
&gt; On Tue, Dec 15, 2020 at 12:35 AM Nathan Rossi &lt;<a href=3D"mailto:n=
athan@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.com</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt; When compiling gcc-runtime for i686 libatomic, libgomp and libit=
m are<br>
&gt; &gt; compiled with additional &#39;-march&#39; and &#39;-mtune&#39; o=
verrides. This typically<br>
&gt; &gt; does not cause build errors (e.g. core2-32 tune), and results in=
 less<br>
&gt; &gt; optimally tuned outputs. However with specific TUNE_CCARGS (e.g.=
 has<br>
&gt; &gt; &#39;-mfpmath=3Dsse&#39; but not &#39;-msse*&#39;), the build er=
rors with conflicting<br>
&gt; &gt; &#39;-mfpmath&#39; options.<br>
&gt; &gt;<br>
&gt; &gt; This is caused by gcc-runtime specific configure scripts and Mak=
efile<br>
&gt; &gt; options that override by adding additional &#39;-march&#39;/&#39=
;-mtune&#39; args. OE<br>
&gt; &gt; builds gcc-runtime differently to other build systems, and provi=
des<br>
&gt; &gt; target specific arch/tune options directly. As such, this change=
 adds a<br>
&gt; &gt; patch for gcc to remove the specific cases where the args are ad=
ded.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:nathan@nathanr=
ossi.com" target=3D"_blank">nathan@nathanrossi.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/gcc/gcc-10.2.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 .../gcc/0001-lib-Remove-i-86-march-overrides.patch | 113 +=
++++++++++++++++++++<br>
&gt; &gt;=C2=A0 2 files changed, 114 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-=
Remove-i-86-march-overrides.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recip=
es-devtools/gcc/gcc-10.2.inc<br>
&gt; &gt; index e88f2ade6d..1e69c91311 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-10.2.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc<br>
&gt; &gt; @@ -69,6 +69,7 @@ SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-aarch=
64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-aarch=
64-Mitigate-SLS-for-BLR-instruction.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-aarch=
64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lib-Remove=
-i-86-march-overrides.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;b8dd4368bb9c7f0b98188317ee025=
4dd8cc99d1e3a18d0ff146c855fe16c1d8c&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-=
march-overrides.patch b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-=
march-overrides.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..3f04e121ba<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-o=
verrides.patch<br>
&gt; &gt; @@ -0,0 +1,113 @@<br>
&gt; &gt; +From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From: Nathan Rossi &lt;<a href=3D"mailto:nathan@nathanrossi.com=
" target=3D"_blank">nathan@nathanrossi.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 15 Dec 2020 11:43:36 +1000<br>
&gt; &gt; +Subject: [PATCH] lib*: Remove i*86 march overrides<br>
&gt; &gt; +<br>
&gt; &gt; +OE does not pass the &#39;--with-arch&#39; option to gccs confi=
gure, as such<br>
&gt; &gt; +some gcc-runtime libraries try to override the value of &#39;-m=
arch&#39; and<br>
&gt; &gt; +&#39;-mtune&#39; which OE already provides. This causes conflic=
ts with other<br>
&gt; &gt; +i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=
=3D*).<br>
&gt; &gt; +Additionally this caused the following libraries to be built wi=
th less<br>
&gt; &gt; +optimized tune configurations.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream suggests that this should be detecting or otherwise ch=
ecking if<br>
&gt; &gt; +the target supports the desired functionality before overriding=
.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 <a href=3D"https://gcc.gnu.org/legacy-ml/gcc-patc=
hes/2016-04/msg01344.html" rel=3D"noreferrer" target=3D"_blank">https://gcc=
.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html</a><br>
&gt; &gt; +<br>
&gt; &gt; +libatomic also overrides the &#39;-march&#39; specifically for =
IFUNC objects.<br>
&gt; &gt; +OE already supplies the correct march flag, so remove setting.<=
br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Inappropriate [OE Specific]<br>
&gt; &gt; +Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:nathan@nathan=
rossi.com" target=3D"_blank">nathan@nathanrossi.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + libatomic/Makefile.am=C2=A0 =C2=A0| 1 -<br>
&gt; &gt; + libatomic/Makefile.in=C2=A0 =C2=A0| 1 -<br>
&gt; &gt; + libatomic/configure.tgt | 9 ---------<br>
&gt; &gt; + libgomp/configure.tgt=C2=A0 =C2=A0| 8 --------<br>
&gt; &gt; + libitm/configure.tgt=C2=A0 =C2=A0 | 9 ---------<br>
&gt; &gt; + 5 files changed, 28 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am<br>
&gt; &gt; +index ac1ca64587..5aa16e0699 100644<br>
&gt; &gt; +--- a/libatomic/Makefile.am<br>
&gt; &gt; ++++ b/libatomic/Makefile.am<br>
&gt; &gt; +@@ -133,7 +133,6 @@ libatomic_la_LIBADD +=3D $(foreach s,$(SIZE=
S),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))<br>
&gt; &gt; + libatomic_la_LIBADD +=3D $(addsuffix _8_2_.lo,$(SIZEOBJS))<br>
&gt; &gt; + endif<br>
&gt; &gt; + if ARCH_I386<br>
&gt; &gt; +-IFUNC_OPTIONS=C2=A0 =C2=A0 =C2=A0 =3D -march=3Di586<br>
&gt; &gt; + libatomic_la_LIBADD +=3D $(addsuffix _8_1_.lo,$(SIZEOBJS))<br>
&gt; &gt; + endif<br>
&gt; &gt; + if ARCH_X86_64<br>
&gt; &gt; +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in<br>
&gt; &gt; +index 97df2d7ff0..82c511d420 100644<br>
&gt; &gt; +--- a/libatomic/Makefile.in<br>
&gt; &gt; ++++ b/libatomic/Makefile.in<br>
&gt; &gt; +@@ -432,7 +432,6 @@ libatomic_la_LIBADD =3D $(foreach s,$(SIZES=
),$(addsuffix \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_$(s)_.lo,$(SIZEOBJS))) $(am__append=
_1) $(am__append_2) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__append_3) $(am__append_4)<br>
&gt; &gt; + @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=
=
=3Darmv7-a+fp -DHAVE_KERNEL64<br>
&gt; &gt; +-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Di5=
86<br>
&gt; &gt; + @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16<br=
>
&gt; &gt; + libatomic_convenience_la_SOURCES =3D $(libatomic_la_SOURCES)<b=
r>
&gt; &gt; + libatomic_convenience_la_LIBADD =3D $(libatomic_la_LIBADD)<br>
&gt; &gt; +diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt<=
br>
&gt; &gt; +index 5dd0926d20..3cc41773c3 100644<br>
&gt; &gt; +--- a/libatomic/configure.tgt<br>
&gt; &gt; ++++ b/libatomic/configure.tgt<br>
&gt; &gt; +@@ -82,15 +82,6 @@ case &quot;${target_cpu}&quot; in<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0i[3456]86)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 case &quot; ${CC} ${CFLAGS} &quot; in<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; -m64 &quot;*|*&quot; -mx32=
 &quot;*)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$with_arch=
&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XCFLAGS=3D&quot;${XC=
FLAGS} -march=3Di486 -mtune=3D${target_cpu}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XCFLAGS=3D&quot;${XC=
FLAGS} -fomit-frame-pointer&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3Dx86<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# ??? Detect when -march=3Di686 is a=
lready enabled.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0try_ifunc=3Dyes<br>
&gt; &gt; +diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt<br>
&gt; &gt; +index 4790a31e39..46c4c958e6 100644<br>
&gt; &gt; +--- a/libgomp/configure.tgt<br>
&gt; &gt; ++++ b/libgomp/configure.tgt<br>
&gt; &gt; +@@ -72,14 +72,6 @@ if test x$enable_linux_futex =3D xyes; then<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Note that bare i386 is not included here.=
=
=C2=A0 We need cmpxchg.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0i[456]86-*-linux*)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0config_path=3D&quot;linux/x86 linux =
posix&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 case &quot; ${CC} ${CFLAGS} &quot; in<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; -m64 &quot;*|*&quot; -mx32=
 &quot;*)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$with_arch=
&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XCFLAGS=3D&quot;${XC=
FLAGS} -march=3Di486 -mtune=3D${target_cpu}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Similar jiggery-pokery for x86_64 multili=
bs, except here we<br>
&gt; &gt; +diff --git a/libitm/configure.tgt b/libitm/configure.tgt<br>
&gt; &gt; +index 04109160e9..3d78ea609d 100644<br>
&gt; &gt; +--- a/libitm/configure.tgt<br>
&gt; &gt; ++++ b/libitm/configure.tgt<br>
&gt; &gt; +@@ -59,15 +59,6 @@ case &quot;${target_cpu}&quot; in<br>
&gt; &gt; +=C2=A0 =C2=A0arm*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0ARCH=3Darm ;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0i[3456]86)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 case &quot; ${CC} ${CFLAGS} &quot; in<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; -m64 &quot;*|*&quot; -mx32=
 &quot;*)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$with_arch=
&quot;; then<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XCFLAGS=3D&quot;${XC=
FLAGS} -march=3Di486 -mtune=3D${target_cpu}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XCFLAGS=3D&quot;${XC=
FLAGS} -fomit-frame-pointer&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0XCFLAGS=3D&quot;${XCFLAGS} -mrtm&quo=
t;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3Dx86<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; &gt; ---<br>
&gt; &gt; 2.29.2<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000d853f605b939f002--
