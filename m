Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.8465.1606319155794987402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 07:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSlU5wZc;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id l2so1896927qtq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 07:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3qBBrkYEOsmtG085QkxEINooExZfm7+1PD+RIObzezg=;
        b=nSlU5wZcNR/gK6cwvnGaeAh2cWu4JWUpvBvEOfgw7UTd/1p8HCgdiiE4sVNjHVEiVw
         d2oHlxwW1CHY0WB5NgeE0H2uHIn+kTwlSX4/Yd9EpUkw3DPTQbf6WHtvS+rOdluhhWSX
         PY3Sl03Ik+HLTLPEmq+0wFBjWDDDJZxfUhHhkA412rTONNTztIb1N4dXiZpH0j9MlYO3
         docYv+jh3xh52RILFiD3w1rb8IouKBcukm9njr45cTiUe1JUiOgc418KVz8U8ZdHXHwG
         mXlQYwZ8gmhZPca0ecmsOesnxzL6uZ8Zpj+J5S6vFTK0qLp7XmnPgM2zxwCxeAJBCjXk
         tnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3qBBrkYEOsmtG085QkxEINooExZfm7+1PD+RIObzezg=;
        b=sNwSFWWgtrCMQJLqaSZhGu/mTLBC+H14zBCaKYR5Yl/WPaQgd6aMjIzgh09XAuH8fR
         z9oirDm4mDgSjSiQ7mpqVjN3FBE2QnGUk2JzL1gQ0MI8t0t7polF2er5DbW90RsEXhET
         3JRKCD83xv+bleJ1idtewECphtNCNLZUfQrejTXp0B9j243edpCMgNr5iiNlQLHPN6eC
         Ulipd30+Y2EP0Xq+NgrnCDsjEsOJS0RyaX/2GqV6QYH6PNFRwtYITYXekFkN2axf+vY3
         KlU2vyLIXDvDrJnSPxu2cpABjeBfvqVCABZWc+Pz+aqJJHrqa8MV+fnMUJIedFomIHjt
         FD/w==
X-Gm-Message-State: AOAM533AsoiHPyc2wjZT2Y6hOI6Akr6n0A6VK+b5CEX2aRbKvLwQFsbk
	MqYDdZHVUuWZja5drC3Z0zffacUyHxddo26EoTk=
X-Google-Smtp-Source: ABdhPJyiqlnnLYnDEjaja2PMQWrbAko5WiDRwE8P17LBgvUoeIMHS10Pi3x2RUFQbjqN9TjHItGnEnILmfORiDf/eUQ=
X-Received: by 2002:ac8:2ff6:: with SMTP id m51mr3665121qta.194.1606319154837;
 Wed, 25 Nov 2020 07:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20201122124853.30262-1-andrej.valek@siemens.com>
 <20201123190029.13811-1-andrej.valek@siemens.com> <20201123190029.13811-2-andrej.valek@siemens.com>
 <CAMKF1srWhM8ja4Q_tEUzsAh-oEDepm=FrwQptGbwcjbS0NVC7w@mail.gmail.com> <DB8PR10MB3977CB0EC9B940D6FC87A05B92FA0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB3977CB0EC9B940D6FC87A05B92FA0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 25 Nov 2020 07:45:28 -0800
Message-ID: <CAMKF1sq=Fqo5YUNWQPW9CkrdvqXSyrmxvz+dCLAUzNfbRGOS=Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] cmake: split release and debug flags
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Bach, Pascal" <pascal.bach@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 2:23 AM Valek, Andrej <andrej.valek@siemens.com> wr=
ote:
>
> What does it mean? Should I also "remove" the ${lcl_maybe_fortify} From =
C/CXXFLAGS?
> Because I would like to keep them only in _RELEASE case.
>

I think that will mean cmake will ignore security flags. Aside from
this I really don't encourage the concept of
release vs debug. one should debug what is shipped. This catches maximum b=
ugs.

> Regards,
> Andrej
>
> >
> >>> Keep only flags related to release in particular part _RELEASE (same
> >> for debug). This option allows to really use the Release/Debug build
> >> type in cmake. The corresponding build type will have corresponding
> >> flags set with/without optimization. Flags are respecting selected
> >> optimization from the whole build.
> >>
> >> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> >> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> >> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> >> ---
> >>  meta/classes/cmake.bbclass | 36 ++++++++++++++++++++++++++++--------
> >>  1 file changed, 28 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> >> index 7c055e8a3d..1305b40bf9 100644
> >> --- a/meta/classes/cmake.bbclass
> >> +++ b/meta/classes/cmake.bbclass
> >> @@ -25,14 +25,25 @@ python() {
> >>  OECMAKE_AR ?=3D "${AR}"
> >>
> >>  # Compiler flags
> >> -OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}=
"
> >> -OECMAKE_CXX_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFL=
AGS}"
> >> -OECMAKE_C_FLAGS_RELEASE ?=3D "-DNDEBUG"
> >> -OECMAKE_CXX_FLAGS_RELEASE ?=3D "-DNDEBUG"
> >> -OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CP=
PFLAGS} ${LDFLAGS}"
> >> -OECMAKE_CXX_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${=
CXXFLAGS} ${LDFLAGS}"
> >> -CXXFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> >> -CFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> >> +OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${=
CFLAGS_COMMON}"
> >
> > CMAKE_<LANG>_FLAGS are seeded with CFLAGS/CXXFLAGS etc from the enviro=
nment and used during configure steps when cmake is invoking compiler to co=
mpile small sample to determine functionality and these tests will start to=
 fail. especially cases where we use security flags which should accompany =
some -On or else compile will warn and if warnings are being treated as err=
ors then it will fail the test.
> >
> >> +OECMAKE_CXX_FLAGS ?=3D "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} =
${CXXFLAGS_COMMON}"
> >> +OECMAKE_C_FLAGS_RELEASE ?=3D "${SELECTED_OPTIMIZATION} ${lcl_maybe_f=
ortify} -DNDEBUG"
> >> +OECMAKE_CXX_FLAGS_RELEASE ?=3D "${SELECTED_OPTIMIZATION} ${lcl_maybe=
_fortify} -DNDEBUG"
> >> +OECMAKE_C_FLAGS_DEBUG ?=3D "${DEBUG_OPTIMIZATION}"
> >> +OECMAKE_CXX_FLAGS_DEBUG ?=3D "${DEBUG_OPTIMIZATION}"
> >> +OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTION=
S} ${CPPFLAGS} ${LDFLAGS}"
> >> +OECMAKE_CXX_LINK_FLAGS ?=3D "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTI=
ONS} ${CXXFLAGS_COMMON} ${LDFLAGS}"
> >> +OECMAKE_LINKER_FLAGS_RELEASE ?=3D "${SELECTED_OPTIMIZATION} ${lcl_ma=
ybe_fortify}"
> >> +OECMAKE_LINKER_FLAGS_DEBUG ?=3D "${DEBUG_OPTIMIZATION}"
> >> +CXXFLAGS +=3D "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS}"
> >> +CFLAGS +=3D "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS}"
> >> +
> >> +# Common compiler flags
> >> +# CFLAGS/CXXFLAGS without optimization # HOST_CC_ARCH without fortif=
y
> >> +CFLAGS_COMMON =3D "${@d.getVar('CFLAGS').replace(d.getVar('SELECTED_=
OPTIMIZATION'),'')}"
> >> +CXXFLAGS_COMMON =3D "${@d.getVar('CXXFLAGS').replace(d.getVar('SELEC=
TED_OPTIMIZATION'),'')}"
> >> +HOST_CC_ARCH_COMMON =3D "${@d.getVar('HOST_CC_ARCH').replace(d.getVa=
r('lcl_maybe_fortify'),'')}"
> >>
> >>  def oecmake_map_compiler(compiler, d):
> >>      args =3D d.getVar(compiler).split() @@ -107,8 +118,17 @@ set(
> >> CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )  set(
> >> CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING
> >> "Additional CFLAGS for release" )  set( CMAKE_CXX_FLAGS_RELEASE
> >> "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for
> >> release" )  set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}"
> >> CACHE STRING "Additional ASM FLAGS for release" )
> >> +set( CMAKE_C_FLAGS_DEBUG "${OECMAKE_C_FLAGS_DEBUG}" CACHE STRING
> >> +"Additional CFLAGS for debug" ) set( CMAKE_CXX_FLAGS_DEBUG
> >> +"${OECMAKE_CXX_FLAGS_DEBUG}" CACHE STRING "Additional CXXFLAGS for
> >> +debug" ) set( CMAKE_ASM_FLAGS_DEBUG "${OECMAKE_C_FLAGS_DEBUG}" CACHE
> >> +STRING "Additional ASM FLAGS for debug" )
> >>  set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING
> >> "LDFLAGS" )  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"
> >> CACHE STRING "LDFLAGS" )
> >> +set( CMAKE_SHARED_LINKER_FLAGS_RELEASE
> >> +"${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional SHARED
> >> +LINKER FLAGS for release" ) set( CMAKE_SHARED_LINKER_FLAGS_DEBUG
> >> +"${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional SHARED
> >> +LINKER FLAGS for debug" ) set( CMAKE_MODULE_LINKER_FLAGS_RELEASE
> >> +"${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional MODULE
> >> +LINKER FLAGS for release" ) set( CMAKE_MODULE_LINKER_FLAGS_DEBUG
> >> +"${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional MODULE
> >> +LINKER FLAGS for debug" ) set( CMAKE_EXE_LINKER_FLAGS_RELEASE
> >> +"${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional EXE LINKE=
R
> >> +FLAGS for release" ) set( CMAKE_EXE_LINKER_FLAGS_DEBUG
> >> +"${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional EXE LINKER
> >> +FLAGS for debug" )
> >>
> >>  # only search in the paths provided so cmake doesnt pick  # up
> >> libraries and tools from the native build machine
> >> --
> >> 2.11.0
> >>
> >>
> >>=20
> >>
