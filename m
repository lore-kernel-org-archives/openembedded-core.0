Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.896.1602008713562762024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 11:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YomQWB+9;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id a9so1775698qto.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FsXQQKupFHlqsiPK4slHlEOhYmAFqSV14150Z9MR49I=;
        b=YomQWB+9BUT7prmMoHD7JPMYNPOrVzp6vEqsLUUeJl/8Nd2FHRN+Dmoe+RMt3Ujuoa
         Oax45CUJNnO/vZ8m3F7zO0EV3Bou0lEczpgS4gdF6Q6kAjcV17LO8bvW7UgP52yakfsv
         NDbZXmjKYozUoa/STqgsvGsTzIcEG9mzPotloXdVncLOTcH1y9rG4PJIr4uhyNdSUR/2
         0VbbXGh3bNL/05TsQGOMnzAzNhIFXPmH1GYeKJtu4TWqjFodbeyExrQKUd8Efg13EzVq
         80D3g6zVjjPjy2hQdCWezYr6FKKl3Pk2yZrICaX+SoLodorCOIH6ShhLkE4Ni0vlcQ4C
         Uuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FsXQQKupFHlqsiPK4slHlEOhYmAFqSV14150Z9MR49I=;
        b=lS5FR2bN11J1FgBzXIW5WvCNolH7WUbFzWIpPKDSLtyogB5/wJ0eB34RZM/3tDWL/9
         HyGy3CizhObLT0E6CGTj00xz4Us4CWMS1aBygvVMv38PDpN5GzdaJLoMoWTXqTxaslsc
         nr9ga1x592kTo7INK/h03+65QLoFF+m+nvDwRWkao7C5cJ6PoqGOOK+dJev50pChL1yl
         qI5/YbkokBybSeDMqN/tYufqCtA7lcBfyLdzwdRp0yr4HKoXobZPzuK4qzzRwJUOFPQ6
         5p4f8cw8rNBKjdOxJO2twl8wDfwzJrA1NNLi1LwnECKPPBKwQURxh66AKZfSJf7W8cUB
         4uzw==
X-Gm-Message-State: AOAM532EJJUc3+u6HwH30x6ppy8Dy04DTga8XTdiCzQD18l1eG9At/MX
	4t5fNJouNxOySSqcguIq3KnCXDizVxKBPGiO6DQ=
X-Google-Smtp-Source: ABdhPJwGsLVPGJQ+H4zUlbSj8OIm2yXHqL9coHV7T3k60V+oP8NG5N1M5c3OejjZ89dryTnYp6247674iCF7WNcbHh4=
X-Received: by 2002:aed:22d4:: with SMTP id q20mr6521267qtc.194.1602008712368;
 Tue, 06 Oct 2020 11:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201006104034.800021-1-yann@blade-group.com> <CAMKF1soZ3kKOaj0C8iOgjApCC6ijNwMSYJCXixxksK2hrEnNuQ@mail.gmail.com>
 <CA+4=imZDrrZ_SmiSYm4RetV7smrAKmrBO=nGfKmCe6nfqCnxEQ@mail.gmail.com>
In-Reply-To: <CA+4=imZDrrZ_SmiSYm4RetV7smrAKmrBO=nGfKmCe6nfqCnxEQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Oct 2020 11:24:46 -0700
Message-ID: <CAMKF1srHFR+NFhigYvLkUVHfgG=e1hXnewzcy7=S_wtyD0pRsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix llvm-config to work again with multilib
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

does something like this not work fully ?

https://github.com/kraj/meta-clang/blob/master/recipes-devtools/clang/clan=
g/0007-llvm-allow-env-override-of-exe-path.patch

On Tue, Oct 6, 2020 at 11:16 AM Yann Dirson <yann.dirson@blade-group.com> =
wrote:
>
> Oh right that one is targeting dunfell and I did not check, will reroll
>
> Le mar. 6 oct. 2020 =C3=A0 18:07, Khem Raj <raj.khem@gmail.com> a =C3=A9=
crit :
>>
>> in master we have llvm 10 but the patch seems to be accessing
>> llvm9.0.1 dir, that seems incorrect to me.
>>
>> On Tue, Oct 6, 2020 at 3:41 AM Yann Dirson <yann.dirson@blade-group.com=
> wrote:
>> >
>> > From: Yann Dirson <yann@blade-group.com>
>> >
>> > Newer llvm versions have changed the logic for finding libraries,
>> > which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:
>> >
>> > See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13937
>> >
>> > This patch comes from meta-amd, which exhibits one such situation.
>> >
>> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> > ---
>> >  ...-llvm-allow-env-override-of-exe-path.patch | 96 +++++++++++++++++=
--
>> >  1 file changed, 87 insertions(+), 9 deletions(-)
>> >
>> >
>> > Note that I took the updated patch from meta-amd without a change, an=
d
>> > I'm dubious about the [OE-Specific] tag in patch metadata.
>> >
>> >
>> > diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-over=
ride-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-en=
v-override-of-exe-path.patch
>> > index b01b8647c9..417eaf0aa1 100644
>> > --- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of=
-exe-path.patch
>> > +++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of=
-exe-path.patch
>> > @@ -1,27 +1,30 @@
>> > -Upstream-Status: Pending
>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > -
>> > -From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 20=
01
>> > +From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 20=
01
>> >  From: Martin Kelly <mkelly@xevo.com>
>> >  Date: Fri, 19 May 2017 00:22:57 -0700
>> > -Subject: [PATCH] llvm: allow env override of exe path
>> > +Subject: [PATCH 2/2] llvm: allow env override of exe path
>> >
>> >  When using a native llvm-config from inside a sysroot, we need llvm-=
config to
>> >  return the libraries, include directories, etc. from inside the sysr=
oot rather
>> >  than from the native sysroot. Thus provide an env override for calli=
ng
>> >  llvm-config from a target sysroot.
>> >
>> > +To let it work in multilib environment, we need to provide a knob to=
 supply
>> > +multilib dirname as well
>> > +
>> > +Upstream-Status: Inappropriate [OE-Specific]
>> > +
>> >  Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
>> >  ---
>> > - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
>> > - 1 file changed, 7 insertions(+)
>> > + llvm/tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++++++++++-=
--------
>> > + 1 file changed, 25 insertions(+), 10 deletions(-)
>> >
>> >  diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llv=
m-config/llvm-config.cpp
>> > -index 7ef7c46a262..a4f7ed82c7b 100644
>> > +index bec89fef98c..91b4d6e4c43 100644
>> >  --- a/llvm/tools/llvm-config/llvm-config.cpp
>> >  +++ b/llvm/tools/llvm-config/llvm-config.cpp
>> > -@@ -225,6 +225,13 @@ Typical components:\n\
>> > +@@ -226,6 +226,13 @@ Typical components:\n\
>> >
>> >   /// Compute the path to the main executable.
>> >   std::string GetExecutablePath(const char *Argv0) {
>> > @@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644
>> >     // This just needs to be some symbol in the binary; C++ doesn't
>> >     // allow taking the address of ::main however.
>> >     void *P =3D (void *)(intptr_t)GetExecutablePath;
>> > +@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
>> > +   // bin dir).
>> > +   sys::fs::make_absolute(CurrentPath);
>> > +   CurrentExecPrefix =3D
>> > +-      sys::path::parent_path(sys::path::parent_path(CurrentPath)).s=
tr();
>> > ++      sys::path::parent_path(sys::path::parent_path(sys::path::pare=
nt_path(CurrentPath))).str();
>> > +
>> > +   // Check to see if we are inside a development tree by comparing =
to possible
>> > +   // locations (prefix style or CMake style).
>> > +@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
>> > +     DevelopmentTreeLayout =3D CMakeStyle;
>> > +     ActiveObjRoot =3D LLVM_OBJ_ROOT;
>> > +   } else if (sys::fs::equivalent(CurrentExecPrefix,
>> > +-                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
>> > ++                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm9=
.0.1")) {
>> > +     IsInDevelopmentTree =3D true;
>> > +     DevelopmentTreeLayout =3D CMakeBuildModeStyle;
>> > +     ActiveObjRoot =3D LLVM_OBJ_ROOT;
>> > +@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
>> > +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveL=
ibDir,
>> > +               ActiveCMakeDir;
>> > +   std::string ActiveIncludeOption;
>> > ++  // Hack for Yocto: we need to override the multilib path when we =
are using
>> > ++  // llvm-config from within a target sysroot.
>> > ++  std::string Multilibdir =3D std::getenv("YOCTO_ALTERNATE_MULTILIB=
_NAME");
>> > ++  if (Multilibdir.empty()) {
>> > ++    Multilibdir =3D "/lib/llvm9.0.1" LLVM_LIBDIR_SUFFIX;
>> > ++  }
>> > ++
>> > +   if (IsInDevelopmentTree) {
>> > +-    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
>> > ++    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include/llv=
m9.0.1";
>> > +     ActivePrefix =3D CurrentExecPrefix;
>> > +
>> > +     // CMake organizes the products differently than a normal prefi=
x style
>> > +     // layout.
>> > ++
>> > +     switch (DevelopmentTreeLayout) {
>> > +     case CMakeStyle:
>> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin";
>> > +-      ActiveLibDir =3D ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
>> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm9.0.1";
>> > ++      ActiveLibDir =3D ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBD=
IR_SUFFIX;
>> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
>> > +       break;
>> > +     case CMakeBuildModeStyle:
>> > +       ActivePrefix =3D ActiveObjRoot;
>> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin/" + build_mode;
>> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm9.0.1/" + build_mo=
de;
>> > +       ActiveLibDir =3D
>> > +-          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" + build=
_mode;
>> > ++          ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX + "=
/" + build_mode;
>> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
>> > +       break;
>> > +     }
>> > +
>> > +     // We need to include files from both the source and object tre=
es.
>> > +     ActiveIncludeOption =3D
>> > +-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/i=
nclude");
>> > ++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/i=
nclude/llvm9.0.1");
>> > +   } else {
>> > +     ActivePrefix =3D CurrentExecPrefix;
>> > +-    ActiveIncludeDir =3D ActivePrefix + "/include";
>> > ++    ActiveIncludeDir =3D ActivePrefix + "/include/llvm9.0.1";
>> > +     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
>> > +     sys::fs::make_absolute(ActivePrefix, path);
>> > +     ActiveBinDir =3D path.str();
>> > +-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
>> > ++    ActiveLibDir =3D ActivePrefix + Multilibdir;
>> > +     ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
>> > +     ActiveIncludeOption =3D "-I" + ActiveIncludeDir;
>> > +   }
>> > +--
>> > +2.20.1
>> > +
>> > --
>> > 2.28.0
>> >
>> >
>> >=20
>> >
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
