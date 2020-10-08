Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web12.7675.1602146831234358176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 01:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=cIl6S+bj;
 spf=pass (domain: blade-group.com, ip: 209.85.210.65, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f65.google.com with SMTP id f10so4814016otb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ul21ywoUld5lQsqEZun/c+SzvcOqECgV7sCm508guMM=;
        b=cIl6S+bjHczFpfTnOPJoJy9X6e+4CeSZmeje15ZN/iIi03JaT3FPHQcUWbsO+13Am1
         iu+x6KbqQp5x74uDkMZxrb4Bs4aEJW6gJkmayxu/J5GGQW4uU/cHttfldDh58sGCpyo1
         6/S0GzDVgMmOIW99to5GUnImA363hJMdy6WcJz6+dtETa9SAFjFwNgZjEU/Oos5cZaNq
         Sp1r7tv+ZNPwgIHtK0krq87Re/Jg/F3IhbQF+Z80tmVTsrr9C1pSRGJuPbTTJg0IZQeN
         v3QqYkNSHRPlfNYdAf2ZPu0ON9XwOO40ZJs9YALsSK11HcY4JxkK02kbLy1e3gbr9BYt
         EX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ul21ywoUld5lQsqEZun/c+SzvcOqECgV7sCm508guMM=;
        b=qKWdIoBF3639jXX/LtvdJ9xmLD5T+SVUkVP2e/wWyPF6hltNMx/VLdg9eaQs1cWFhO
         AOIOPaNLdyKAKTGlDxI/bvwNg2znypzhBNqm/ZHPZ8J6pHg7gz52HV6ngGvRsvs2Eyhb
         XFsqCuireaM1SD5ASYjGO7QFtzMAxBZo34UDfJ4e9VxclufDcUsRjzh6i4NIMrOEA01r
         3mE2HVuQKOVQhFy3UaZdQjg0+4NtZYx3oiv5NiUOX5LPwi3w087H71/ICs5R78i+yTDT
         YIm2CnxYpgsVUjZLdFkSdqnzhfmnL1kwiUjgYZ2BUR7Bzt/qdLmep1Hq+r3or6uyL1ti
         2f4Q==
X-Gm-Message-State: AOAM532qPA3ljNkrsCmmaJWR4bEWNPbDGNphKsfoj9FoSNfyWZEnG+zb
	cKF8QjthTwEQV+KmSRnPgLMkpV7sd+9pzFijUl5fkg==
X-Google-Smtp-Source: ABdhPJyKfYXJWUhH8j8zpG9lebGQ8uxxUqnEc0AZCypv5CmP//bpcc0eirAxgbq+vUIhOvKol6BQZVtyQ6zdQBsvn3I=
X-Received: by 2002:a9d:da7:: with SMTP id 36mr4571229ots.288.1602146830480;
 Thu, 08 Oct 2020 01:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201006104034.800021-1-yann@blade-group.com> <CAMKF1soZ3kKOaj0C8iOgjApCC6ijNwMSYJCXixxksK2hrEnNuQ@mail.gmail.com>
 <CA+4=imZDrrZ_SmiSYm4RetV7smrAKmrBO=nGfKmCe6nfqCnxEQ@mail.gmail.com> <CAMKF1srHFR+NFhigYvLkUVHfgG=e1hXnewzcy7=S_wtyD0pRsQ@mail.gmail.com>
In-Reply-To: <CAMKF1srHFR+NFhigYvLkUVHfgG=e1hXnewzcy7=S_wtyD0pRsQ@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Thu, 8 Oct 2020 10:46:59 +0200
Message-ID: <CA+4=imYcBmgUiZ==MUB4Mo-Qr0wFqUnrZ16aqv+DUfcTb26c8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix llvm-config to work again with multilib
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000b58dde05b124e0f7"

--000000000000b58dde05b124e0f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, it doesn't. That's the one we have already in poky.

Just reproduced with this in local.conf:

PACKAGECONFIG_append_pn-mesa +=3D " gallium-llvm"
require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"


meta-amd does not have a patch for mesa10, I'm updating this

Le mar. 6 oct. 2020 =C3=A0 20:25, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> does something like this not work fully ?
>
>
> https://github.com/kraj/meta-clang/blob/master/recipes-devtools/clang/cl=
ang/0007-llvm-allow-env-override-of-exe-path.patch
>
> On Tue, Oct 6, 2020 at 11:16 AM Yann Dirson <yann.dirson@blade-group.com=
>
> wrote:
> >
> > Oh right that one is targeting dunfell and I did not check, will rerol=
l
> >
> > Le mar. 6 oct. 2020 =C3=A0 18:07, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
> >>
> >> in master we have llvm 10 but the patch seems to be accessing
> >> llvm9.0.1 dir, that seems incorrect to me.
> >>
> >> On Tue, Oct 6, 2020 at 3:41 AM Yann Dirson <yann.dirson@blade-group.c=
om>
> wrote:
> >> >
> >> > From: Yann Dirson <yann@blade-group.com>
> >> >
> >> > Newer llvm versions have changed the logic for finding libraries,
> >> > which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:
> >> >
> >> > See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13937
> >> >
> >> > This patch comes from meta-amd, which exhibits one such situation.
> >> >
> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> >> > ---
> >> >  ...-llvm-allow-env-override-of-exe-path.patch | 96
> +++++++++++++++++--
> >> >  1 file changed, 87 insertions(+), 9 deletions(-)
> >> >
> >> >
> >> > Note that I took the updated patch from meta-amd without a change, =
and
> >> > I'm dubious about the [OE-Specific] tag in patch metadata.
> >> >
> >> >
> >> > diff --git
> a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> >> > index b01b8647c9..417eaf0aa1 100644
> >> > ---
> a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> >> > +++
> b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> >> > @@ -1,27 +1,30 @@
> >> > -Upstream-Status: Pending
> >> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > -
> >> > -From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00
> 2001
> >> > +From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00
> 2001
> >> >  From: Martin Kelly <mkelly@xevo.com>
> >> >  Date: Fri, 19 May 2017 00:22:57 -0700
> >> > -Subject: [PATCH] llvm: allow env override of exe path
> >> > +Subject: [PATCH 2/2] llvm: allow env override of exe path
> >> >
> >> >  When using a native llvm-config from inside a sysroot, we need
> llvm-config to
> >> >  return the libraries, include directories, etc. from inside the
> sysroot rather
> >> >  than from the native sysroot. Thus provide an env override for
> calling
> >> >  llvm-config from a target sysroot.
> >> >
> >> > +To let it work in multilib environment, we need to provide a knob =
to
> supply
> >> > +multilib dirname as well
> >> > +
> >> > +Upstream-Status: Inappropriate [OE-Specific]
> >> > +
> >> >  Signed-off-by: Martin Kelly <mkelly@xevo.com>
> >> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > +Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
> >> >  ---
> >> > - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
> >> > - 1 file changed, 7 insertions(+)
> >> > + llvm/tools/llvm-config/llvm-config.cpp | 35
> ++++++++++++++++++++++---------
> >> > + 1 file changed, 25 insertions(+), 10 deletions(-)
> >> >
> >> >  diff --git a/llvm/tools/llvm-config/llvm-config.cpp
> b/llvm/tools/llvm-config/llvm-config.cpp
> >> > -index 7ef7c46a262..a4f7ed82c7b 100644
> >> > +index bec89fef98c..91b4d6e4c43 100644
> >> >  --- a/llvm/tools/llvm-config/llvm-config.cpp
> >> >  +++ b/llvm/tools/llvm-config/llvm-config.cpp
> >> > -@@ -225,6 +225,13 @@ Typical components:\n\
> >> > +@@ -226,6 +226,13 @@ Typical components:\n\
> >> >
> >> >   /// Compute the path to the main executable.
> >> >   std::string GetExecutablePath(const char *Argv0) {
> >> > @@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644
> >> >     // This just needs to be some symbol in the binary; C++ doesn't
> >> >     // allow taking the address of ::main however.
> >> >     void *P =3D (void *)(intptr_t)GetExecutablePath;
> >> > +@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
> >> > +   // bin dir).
> >> > +   sys::fs::make_absolute(CurrentPath);
> >> > +   CurrentExecPrefix =3D
> >> > +-
> sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
> >> > ++
> sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(Cur=
rentPath))).str();
> >> > +
> >> > +   // Check to see if we are inside a development tree by comparin=
g
> to possible
> >> > +   // locations (prefix style or CMake style).
> >> > +@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
> >> > +     DevelopmentTreeLayout =3D CMakeStyle;
> >> > +     ActiveObjRoot =3D LLVM_OBJ_ROOT;
> >> > +   } else if (sys::fs::equivalent(CurrentExecPrefix,
> >> > +-                                 Twine(LLVM_OBJ_ROOT) + "/bin")) =
{
> >> > ++                                 Twine(LLVM_OBJ_ROOT) +
> "/bin/llvm9.0.1")) {
> >> > +     IsInDevelopmentTree =3D true;
> >> > +     DevelopmentTreeLayout =3D CMakeBuildModeStyle;
> >> > +     ActiveObjRoot =3D LLVM_OBJ_ROOT;
> >> > +@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
> >> > +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir,
> ActiveLibDir,
> >> > +               ActiveCMakeDir;
> >> > +   std::string ActiveIncludeOption;
> >> > ++  // Hack for Yocto: we need to override the multilib path when w=
e
> are using
> >> > ++  // llvm-config from within a target sysroot.
> >> > ++  std::string Multilibdir =3D
> std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
> >> > ++  if (Multilibdir.empty()) {
> >> > ++    Multilibdir =3D "/lib/llvm9.0.1" LLVM_LIBDIR_SUFFIX;
> >> > ++  }
> >> > ++
> >> > +   if (IsInDevelopmentTree) {
> >> > +-    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
> >> > ++    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) +
> "/include/llvm9.0.1";
> >> > +     ActivePrefix =3D CurrentExecPrefix;
> >> > +
> >> > +     // CMake organizes the products differently than a normal
> prefix style
> >> > +     // layout.
> >> > ++
> >> > +     switch (DevelopmentTreeLayout) {
> >> > +     case CMakeStyle:
> >> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin";
> >> > +-      ActiveLibDir =3D ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFI=
X;
> >> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm9.0.1";
> >> > ++      ActiveLibDir =3D ActiveObjRoot + "/lib/llvm9.0.1" +
> LLVM_LIBDIR_SUFFIX;
> >> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> >> > +       break;
> >> > +     case CMakeBuildModeStyle:
> >> > +       ActivePrefix =3D ActiveObjRoot;
> >> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin/" + build_mode;
> >> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm9.0.1/" + build_=
mode;
> >> > +       ActiveLibDir =3D
> >> > +-          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" +
> build_mode;
> >> > ++          ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX +
> "/" + build_mode;
> >> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> >> > +       break;
> >> > +     }
> >> > +
> >> > +     // We need to include files from both the source and object
> trees.
> >> > +     ActiveIncludeOption =3D
> >> > +-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot +
> "/include");
> >> > ++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot +
> "/include/llvm9.0.1");
> >> > +   } else {
> >> > +     ActivePrefix =3D CurrentExecPrefix;
> >> > +-    ActiveIncludeDir =3D ActivePrefix + "/include";
> >> > ++    ActiveIncludeDir =3D ActivePrefix + "/include/llvm9.0.1";
> >> > +     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
> >> > +     sys::fs::make_absolute(ActivePrefix, path);
> >> > +     ActiveBinDir =3D path.str();
> >> > +-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> >> > ++    ActiveLibDir =3D ActivePrefix + Multilibdir;
> >> > +     ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> >> > +     ActiveIncludeOption =3D "-I" + ActiveIncludeDir;
> >> > +   }
> >> > +--
> >> > +2.20.1
> >> > +
> >> > --
> >> > 2.28.0
> >> >
> >> >
> >> >=20
> >> >
> >
> >
> >
> > --
> > Yann Dirson <yann@blade-group.com>
> > Blade / Shadow -- http://shadow.tech
> >
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000b58dde05b124e0f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No, it doesn&#39;t. That&#39;s the one we have alread=
y in poky.</div><div><br></div><div>Just reproduced with this in local.conf=
:</div><div><br></div><div>PACKAGECONFIG_append_pn-mesa +=3D &quot; gallium=
-llvm&quot;<br>require conf/multilib.conf<br>MULTILIBS =3D &quot;multilib:l=
ib32&quot;<br>DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;x86&quot;</div=
><div><br></div><div><br></div><div>meta-amd does not have a patch for mesa=
10, I&#39;m updating this<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 6 oct. 2020 =C3=A0=C2=A020:=
25, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">does something like this not work fully ?<br>
<br>
<a href=3D"https://github.com/kraj/meta-clang/blob/master/recipes-devtools=
/clang/clang/0007-llvm-allow-env-override-of-exe-path.patch" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/kraj/meta-clang/blob/master/recip=
es-devtools/clang/clang/0007-llvm-allow-env-override-of-exe-path.patch</a><=
br>
<br>
On Tue, Oct 6, 2020 at 11:16 AM Yann Dirson &lt;<a href=3D"mailto:yann.dir=
son@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; Oh right that one is targeting dunfell and I did not check, will rero=
ll<br>
&gt;<br>
&gt; Le mar. 6 oct. 2020 =C3=A0 18:07, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit :=
<br>
&gt;&gt;<br>
&gt;&gt; in master we have llvm 10 but the patch seems to be accessing<br>
&gt;&gt; llvm9.0.1 dir, that seems incorrect to me.<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Oct 6, 2020 at 3:41 AM Yann Dirson &lt;<a href=3D"mailto:=
yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Newer llvm versions have changed the logic for finding libra=
ries,<br>
&gt;&gt; &gt; which prevents Mesa from building with PACKAGECONFIG[gallium=
-llvm]:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D13937" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D13937</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This patch comes from meta-amd, which exhibits one such situ=
ation.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-=
group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 ...-llvm-allow-env-override-of-exe-path.patch | 96 +++=
++++++++++++++--<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 87 insertions(+), 9 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Note that I took the updated patch from meta-amd without a c=
hange, and<br>
&gt;&gt; &gt; I&#39;m dubious about the [OE-Specific] tag in patch metadat=
a.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow=
-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm=
-allow-env-override-of-exe-path.patch<br>
&gt;&gt; &gt; index b01b8647c9..417eaf0aa1 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-ov=
erride-of-exe-path.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-ov=
erride-of-exe-path.patch<br>
&gt;&gt; &gt; @@ -1,27 +1,30 @@<br>
&gt;&gt; &gt; -Upstream-Status: Pending<br>
&gt;&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00=
:00:00 2001<br>
&gt;&gt; &gt; +From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00=
:00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.c=
om" target=3D"_blank">mkelly@xevo.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Fri, 19 May 2017 00:22:57 -0700<br>
&gt;&gt; &gt; -Subject: [PATCH] llvm: allow env override of exe path<br>
&gt;&gt; &gt; +Subject: [PATCH 2/2] llvm: allow env override of exe path<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 When using a native llvm-config from inside a sysroot,=
 we need llvm-config to<br>
&gt;&gt; &gt;=C2=A0 return the libraries, include directories, etc. from i=
nside the sysroot rather<br>
&gt;&gt; &gt;=C2=A0 than from the native sysroot. Thus provide an env over=
ride for calling<br>
&gt;&gt; &gt;=C2=A0 llvm-config from a target sysroot.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +To let it work in multilib environment, we need to provide =
a knob to supply<br>
&gt;&gt; &gt; +multilib dirname as well<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Inappropriate [OE-Specific]<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkel=
ly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; +Signed-off-by: Arsalan H. Awan &lt;<a href=3D"mailto:Arsala=
n_Awan@mentor.com" target=3D"_blank">Arsalan_Awan@mentor.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 ---<br>
&gt;&gt; &gt; - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++<br>
&gt;&gt; &gt; - 1 file changed, 7 insertions(+)<br>
&gt;&gt; &gt; + llvm/tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++=
++++++++---------<br>
&gt;&gt; &gt; + 1 file changed, 25 insertions(+), 10 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/=
llvm/tools/llvm-config/llvm-config.cpp<br>
&gt;&gt; &gt; -index 7ef7c46a262..a4f7ed82c7b 100644<br>
&gt;&gt; &gt; +index bec89fef98c..91b4d6e4c43 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/llvm/tools/llvm-config/llvm-config.cpp<br>
&gt;&gt; &gt;=C2=A0 +++ b/llvm/tools/llvm-config/llvm-config.cpp<br>
&gt;&gt; &gt; -@@ -225,6 +225,13 @@ Typical components:\n\<br>
&gt;&gt; &gt; +@@ -226,6 +226,13 @@ Typical components:\n\<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/// Compute the path to the main executable.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0std::string GetExecutablePath(const char *Argv0)=
 {<br>
&gt;&gt; &gt; @@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0// This just needs to be some symbol in t=
he binary; C++ doesn&#39;t<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0// allow taking the address of ::main how=
ever.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0void *P =3D (void *)(intptr_t)GetExecutab=
lePath;<br>
&gt;&gt; &gt; +@@ -284,7 +291,7 @@ int main(int argc, char **argv) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0// bin dir).<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0sys::fs::make_absolute(CurrentPath);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0CurrentExecPrefix =3D<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 sys::path::parent_path(sys::path::par=
ent_path(CurrentPath)).str();<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 sys::path::parent_path(sys::path::par=
ent_path(sys::path::parent_path(CurrentPath))).str();<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0// Check to see if we are inside a development=
 tree by comparing to possible<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0// locations (prefix style or CMake style).<br=
>
&gt;&gt; &gt; +@@ -293,7 +300,7 @@ int main(int argc, char **argv) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0DevelopmentTreeLayout =3D CMakeStyle;<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActiveObjRoot =3D LLVM_OBJ_ROOT;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0} else if (sys::fs::equivalent(CurrentExecPref=
ix,<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Twine(LLVM_O=
BJ_ROOT) + &quot;/bin&quot;)) {<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Twine(LLVM_O=
BJ_ROOT) + &quot;/bin/llvm9.0.1&quot;)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0IsInDevelopmentTree =3D true;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0DevelopmentTreeLayout =3D CMakeBuildMod=
eStyle;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActiveObjRoot =3D LLVM_OBJ_ROOT;<br>
&gt;&gt; &gt; +@@ -307,37 +314,45 @@ int main(int argc, char **argv) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0std::string ActivePrefix, ActiveBinDir, Active=
IncludeDir, ActiveLibDir,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acti=
veCMakeDir;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0std::string ActiveIncludeOption;<br>
&gt;&gt; &gt; ++=C2=A0 // Hack for Yocto: we need to override the multilib=
 path when we are using<br>
&gt;&gt; &gt; ++=C2=A0 // llvm-config from within a target sysroot.<br>
&gt;&gt; &gt; ++=C2=A0 std::string Multilibdir =3D std::getenv(&quot;YOCTO=
_ALTERNATE_MULTILIB_NAME&quot;);<br>
&gt;&gt; &gt; ++=C2=A0 if (Multilibdir.empty()) {<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 Multilibdir =3D &quot;/lib/llvm9.0.1&quot; L=
LVM_LIBDIR_SUFFIX;<br>
&gt;&gt; &gt; ++=C2=A0 }<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0if (IsInDevelopmentTree) {<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 ActiveIncludeDir =3D std::string(LLVM_SRC_RO=
OT) + &quot;/include&quot;;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 ActiveIncludeDir =3D std::string(LLVM_SRC_RO=
OT) + &quot;/include/llvm9.0.1&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActivePrefix =3D CurrentExecPrefix;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0// CMake organizes the products differe=
ntly than a normal prefix style<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0// layout.<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0switch (DevelopmentTreeLayout) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case CMakeStyle:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quo=
t;/bin&quot;;<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveLibDir =3D ActiveObjRoot + &quo=
t;/lib&quot; + LLVM_LIBDIR_SUFFIX;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quo=
t;/bin/llvm9.0.1&quot;;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveLibDir =3D ActiveObjRoot + &quo=
t;/lib/llvm9.0.1&quot; + LLVM_LIBDIR_SUFFIX;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir =
+ &quot;/cmake/llvm&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case CMakeBuildModeStyle:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActivePrefix =3D ActiveObjRoot;<=
br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quo=
t;/bin/&quot; + build_mode;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quo=
t;/bin/llvm9.0.1/&quot; + build_mode;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveLibDir =3D<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveObjRoot + &quot;/=
lib&quot; + LLVM_LIBDIR_SUFFIX + &quot;/&quot; + build_mode;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveObjRoot + &quot;/=
lib/llvm9.0.1&quot; + LLVM_LIBDIR_SUFFIX + &quot;/&quot; + build_mode;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir =
+ &quot;/cmake/llvm&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0// We need to include files from both t=
he source and object trees.<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeOption =3D<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;-I&quot; + ActiveInclud=
eDir + &quot; &quot; + &quot;-I&quot; + ActiveObjRoot + &quot;/include&quot=
;);<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;-I&quot; + ActiveInclud=
eDir + &quot; &quot; + &quot;-I&quot; + ActiveObjRoot + &quot;/include/llvm=
9.0.1&quot;);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0} else {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActivePrefix =3D CurrentExecPrefix;<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 ActiveIncludeDir =3D ActivePrefix + &quot;/i=
nclude&quot;;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 ActiveIncludeDir =3D ActivePrefix + &quot;/i=
nclude/llvm9.0.1&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0SmallString&lt;256&gt; path(StringRef(L=
LVM_TOOLS_INSTALL_DIR));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sys::fs::make_absolute(ActivePrefix, pa=
th);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActiveBinDir =3D path.str();<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 ActiveLibDir =3D ActivePrefix + &quot;/lib&q=
uot; + LLVM_LIBDIR_SUFFIX;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 ActiveLibDir =3D ActivePrefix + Multilibdir;=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir + &quot=
;/cmake/llvm&quot;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeOption =3D &quot;-I&quot; =
+ ActiveIncludeDir;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.20.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.28.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_bl=
ank">yann@blade-group.com</a>&gt;<br>
&gt; Blade / Shadow -- <a href=3D"http://shadow.tech" rel=3D"noreferrer" t=
arget=3D"_blank">http://shadow.tech</a><br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div>

--000000000000b58dde05b124e0f7--
