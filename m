Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E206DCAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 15:56:22 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web10.1159.1757606175827164306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 08:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJdpAJv8;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-60170e15cf6so622563d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606175; x=1758210975; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+12dsC8JNHLXRyy833r+ZgEDSe7qmrJpVyCv7ZT12A=;
        b=XJdpAJv8h7Bw6OGATl/8TV0nXZ6E+T7KhTXTP/VjsfOjh0XN6iUtbktFyR6HWBBL/s
         pj4Xi23bLknkrQL/2Gphn7JLS9nomh3eVRGSb+5Fti+WZ5HnMe40UFn42CMPI8ZQCTVt
         t+aPzXZYREms37n0qnUuvnegKXRFM07R+FW4YzldzYXqv483IvGFLA42BzKVvifLtCTw
         5ix5/hRQRB0IxiyV26y+Ky45iisv/xmHxzyUsGMt0ZV/9W9k8q9QDgZiKKOXxbZPlqf5
         I38bv8FdTQL9uURBlhyz9hxvyHPRHTxqd0wXmxPBdq3kRN0IWqvzxxc5S/ngvr6Y5ORj
         Pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606175; x=1758210975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+12dsC8JNHLXRyy833r+ZgEDSe7qmrJpVyCv7ZT12A=;
        b=Sz7/xft2biTYnCuTYDoxozGnUMH3YBU2sXfGIceyIiUeP+uisgxFUg+Z1iuIc5kVln
         rhry+9A8ahUMPWNBmapbo8KA7KYXofnS2U1VwvQm98ax38XbRGidf6n+NmUSEXjiogbo
         oziJTCZGwV/Fcl2U6Ko/TLUDrhCKnQg0vOqpUdj4DCMk4cbVlfv3m19yZdMpPyIzAAp0
         RYKGDGTyCwgEEC4eK8ODsPoIr7qR0Jkdwa6Qt//yDYkqIYyDP/kpsGChbVO9BWhnRz6/
         R9bFLjvaR8XdJ5F+SXeDhXGnraleMh4fImAuvi1ogiVFwj0dvQlXEvpmbh59RNq/F6xg
         dmiQ==
X-Gm-Message-State: AOJu0YwYr9YOKznNcDcavS5YlCdjEYiINmGN+WNMu1RzIB2Yba/x06QD
	cZ8E1ZvIHmCzQmlJa5aBwTSxMjUKD2fXdRPttYwxZpXMva7xgK6qEU/4tHPWgXuLU11kgBiyD/G
	bUR3bbK6QtlUrJi3sFYa0i8MMCH2GDH8=
X-Gm-Gg: ASbGncvMeemQ74eJyQkSfKyQssskZ5B/OqteJhMNRZMwOgT5d3rLIB7dNfnNO91Eab7
	/gbgy2Zel3J7lld+xOihhwCJbPZV6Se4CtKO5ce/xOCmNBGRv92D83OimcbubA+vMc1HEYO4zMp
	M7CdmGFVKcxQiQHj36ZukwJ2xnyfWWv03Nd1s4LtFFcfW4qPquG8cJkNOcSN6jx6DgBYRxD41D7
	IwOKi5CORLZi/mQpebvQkb6TALFXzng9I77Lj8X7Od2qSoueC0FiUUPKchQm78ICpneupHB9bCh
	KJaBvdZ1L3lkwR9g9lsqCUaVErhq0BJWe/OAIfGV9fl9JZQdnwnJuFXUNg==
X-Google-Smtp-Source: AGHT+IFIMaLAc2Jn6FAH+zOfzEtnzIsRKsvKHJMRvZwEm5B5uuvN440przqntvNVqsKHopF1VimHVNHpYFTtYoctZW4=
X-Received: by 2002:a53:ad52:0:b0:600:4a6c:bed3 with SMTP id
 956f58d0204a3-627239bcd73mr47167d50.26.1757606174264; Thu, 11 Sep 2025
 08:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250903180343.1222627-1-skandigraun@gmail.com>
 <CAMKF1soW4AOSfwaHkzoMsE2Son=zqh5Bjcnj31H+Dr6SnAuJPg@mail.gmail.com> <82cfc411-a71f-443e-b9a5-d8fcb1d3122b@gmail.com>
In-Reply-To: <82cfc411-a71f-443e-b9a5-d8fcb1d3122b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Sep 2025 08:55:48 -0700
X-Gm-Features: Ac12FXwXT6ytLG4b6aJm4b3yvOGETcUfUdTpH4DjIqak6uK_es8iX-yRMrOIJZI
Message-ID: <CAMKF1sq=uwrn_KC0+pzwRBi0K-Fpb4Ac40cwPKEVdKf+ZbVNtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] apt: upgrade 2.6.1 -> 3.0.3
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 15:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223285

On Tue, Sep 9, 2025 at 8:17=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> On 9/9/25 17:14, Khem Raj wrote:
> > Gyorgy
> >
> > there is a build failure with clang and libc++
> > https://errors.yoctoproject.org/Errors/Details/882066/
>
> Hmmm... thanks for the heads up, going to take a look at it.
>

Once I see the libc++ issue fixed it reveals the next problem python3-apt n=
eeds
to be looked into as well see, its not particular to clang or libc++

https://errors.yoctoproject.org/Errors/Details/882544/


> > Thanks
> > -Khem
> >
> > On Wed, Sep 3, 2025 at 11:03=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> Changelog:
> >> https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.3=
_changelog
> >>
> >> Dropped patches which are included in this release, or became obsolete=
:
> >> 0001-Fix-compilation-error-with-clang-libc-18.patch - included in this=
 release
> >> 0001-Fix-musl-build.patch - included in this release
> >> 0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch - incl=
uded in this release
> >> 0001-Remove-using-std-binary_function.patch - became obsolete, fixed u=
pstream
> >> 0001-aptwebserver.cc-Include-array.patch - became obsolete, fixed upst=
ream
> >> 0001-strutl-Add-missing-include-cstdint-gcc-15.patch - included in thi=
s release
> >>
> >> Added a new patch to avoid compilation error with musl:
> >> error: 'basename' was not declared in this scope; did you mean 'rename=
'?
> >>
> >> Adapted DEPENDS list - gnutls and gcrypt dependencies were dropped in =
favor of openssl
> >> in version 2.9.19.
> >>
> >> Added a new PACKAGECONFIG, 'usrmerge', which displays a gentle warning=
 if the system
> >> isn't a usrmerge system during package installation.
> >>
> >> Added new COMMON_ARCH CMake argument - if it is not defined, CMake is =
trying to
> >> determine the value of this variable by running dpkg, which is usually=
 a futile
> >> endeavour. It is used in config creation, and to print some system inf=
o.
> >>
> >> Also adapt a self test: the apt-key command has been deprecated since =
a while,
> >> and in this release it was completely removed. Instead sources.list fi=
le
> >> contains the signature data, on a per-repository basis.
> >>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >> v6: remove unnecessary quote escaping from self-test
> >> v5: copy the keyring with the correct extension (.asc) in self test
> >> v4: remove a debug "cat" from the test
> >> v3: adapt self-test. apt-key has been removed from this version, so ma=
ke the test
> >>     use an alternative method to indicate the signature location
> >> v2: changed the status 0001-fix-compilation-with-musl.patch from Pendi=
ng to Submitted
> >>
> >>  meta/lib/oeqa/runtime/cases/apt.py            |  9 +-
> >>  ...void-changing-install-paths-based-on.patch |  2 +-
> >>  ...e-documentation-directory-altogether.patch |  2 +-
> >>  ...-init-tables-from-dpkg-configuration.patch |  2 +-
> >>  ...compilation-error-with-clang-libc-18.patch | 29 -------
> >>  .../apt/apt/0001-Fix-musl-build.patch         | 28 ------
> >>  ...mum_required-to-3.13-to-avoid-warnin.patch | 47 ----------
> >>  ...001-Remove-using-std-binary_function.patch | 87 ------------------=
-
> >>  ...n-dpkg-configure-a-at-the-end-of-our.patch |  4 +-
> >>  .../0001-aptwebserver.cc-Include-array.patch  | 30 -------
> >>  .../0001-cmake-Do-not-build-po-files.patch    |  6 +-
> >>  .../apt/0001-fix-compilation-with-musl.patch  | 49 +++++++++++
> >>  ...l-Add-missing-include-cstdint-gcc-15.patch | 26 ------
> >>  .../apt/{apt_2.6.1.bb =3D> apt_3.0.3.bb}        | 17 ++--
> >>  14 files changed, 74 insertions(+), 264 deletions(-)
> >>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-compilation=
-error-with-clang-libc-18.patch
> >>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-musl-build.=
patch
> >>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_min=
imum_required-to-3.13-to-avoid-warnin.patch
> >>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Remove-using-st=
d-binary_function.patch
> >>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-aptwebserver.cc=
-Include-array.patch
> >>  create mode 100644 meta/recipes-devtools/apt/apt/0001-fix-compilation=
-with-musl.patch
> >>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-miss=
ing-include-cstdint-gcc-15.patch
> >>  rename meta/recipes-devtools/apt/{apt_2.6.1.bb =3D> apt_3.0.3.bb} (88=
%)
> >>
> >> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtim=
e/cases/apt.py
> >> index 8000645843..c6b62987f1 100644
> >> --- a/meta/lib/oeqa/runtime/cases/apt.py
> >> +++ b/meta/lib/oeqa/runtime/cases/apt.py
> >> @@ -54,7 +54,14 @@ class AptRepoTest(AptTest):
> >>      def setup_key(self):
> >>          # the key is found on the target /etc/pki/packagefeed-gpg/
> >>          # named PACKAGEFEED-GPG-KEY-poky-branch
> >> -        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagef=
eed-gpg'))
> >> +        # copy it to /etc/apt/keyrings/PACKAGEFEED-GPG-KEY-poky-branc=
h.asc, and
> >> +        # set it as the signing key for the repos
> >> +        cmd =3D  "KEY_FILE_PATH=3D`realpath /etc/pki/packagefeed-gpg/=
P*`; "
> >> +        cmd +=3D "KEY_FILE_NAME=3D`basename $KEY_FILE_PATH`; "
> >> +        cmd +=3D "mkdir -p /etc/apt/keyrings; "
> >> +        cmd +=3D "cp $KEY_FILE_PATH /etc/apt/keyrings/${KEY_FILE_NAME=
}.asc; "
> >> +        cmd +=3D 'sed -i "s|^deb |deb \[signed-by=3D/etc/apt/keyrings=
/${KEY_FILE_NAME}.asc\] |g" /etc/apt/sources.list'
> >> +        self.target.run(cmd)
> >>
> >>      @skipIfNotFeature('package-management',
> >>                        'Test requires package-management to be in IMAG=
E_FEATURES')
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-c=
hanging-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-C=
MakeLists.txt-avoid-changing-install-paths-based-on.patch
> >> index 199f11bf20..d37aa811cd 100644
> >> --- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing=
-install-paths-based-on.patch
> >> +++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing=
-install-paths-based-on.patch
> >> @@ -14,7 +14,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>  index 2cd4f8e..4759812 100644
> >>  --- a/CMakeLists.txt
> >>  +++ b/CMakeLists.txt
> >> -@@ -21,9 +21,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
> >> +@@ -28,9 +28,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
> >>   set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "-lgcov")
> >>
> >>   # Work around bug in GNUInstallDirs
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-=
directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-doc=
umentation-directory-altogether.patch
> >> index 5443ff6caa..4bc6dce760 100644
> >> --- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directo=
ry-altogether.patch
> >> +++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directo=
ry-altogether.patch
> >> @@ -16,7 +16,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>  index 668e2d762..62f441bfa 100644
> >>  --- a/CMakeLists.txt
> >>  +++ b/CMakeLists.txt
> >> -@@ -246,7 +246,7 @@ add_subdirectory(apt-private)
> >> +@@ -251,7 +251,7 @@ add_subdirectory(apt-private)
> >>   endif()
> >>   add_subdirectory(cmdline)
> >>   add_subdirectory(completions)
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-fro=
m-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init=
-tables-from-dpkg-configuration.patch
> >> index 37a3133010..d21f5a49c5 100644
> >> --- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-=
configuration.patch
> >> +++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-=
configuration.patch
> >> @@ -16,7 +16,7 @@ diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
> >>  index b9d9b15d2..1725c5966 100644
> >>  --- a/apt-pkg/init.cc
> >>  +++ b/apt-pkg/init.cc
> >> -@@ -281,8 +281,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *=
&Sys)
> >> +@@ -295,8 +295,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *=
&Sys)
> >>          return _error->Error(_("Unable to determine a suitable packag=
ing system type"));
> >>      }
> >>
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-=
with-clang-libc-18.patch b/meta/recipes-devtools/apt/apt/0001-Fix-compilati=
on-error-with-clang-libc-18.patch
> >> deleted file mode 100644
> >> index e55205ca3f..0000000000
> >> --- a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-cl=
ang-libc-18.patch
> >> +++ /dev/null
> >> @@ -1,29 +0,0 @@
> >> -From b4488583424b33f51cb031562a9e8df820ffda23 Mon Sep 17 00:00:00 200=
1
> >> -From: Chongyun Lee <licy183@termux.dev>
> >> -Date: Thu, 15 Aug 2024 21:31:24 +0800
> >> -Subject: [PATCH] Fix compilation error with clang/libc++ 18
> >> -
> >> -Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/co=
mmit/b4488583424b33f51cb031562a9e8df820ffda23]
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - apt-pkg/cacheset.h | 4 ++--
> >> - 1 file changed, 2 insertions(+), 2 deletions(-)
> >> -
> >> -diff --git a/apt-pkg/cacheset.h b/apt-pkg/cacheset.h
> >> -index 5dbb9bf08..1c67a65d6 100644
> >> ---- a/apt-pkg/cacheset.h
> >> -+++ b/apt-pkg/cacheset.h
> >> -@@ -218,11 +218,11 @@ public:
> >> -       operator container_iterator(void) const { return _iter; }
> >> -       inline iterator_type& operator++() { ++_iter; return static_ca=
st<iterator_type&>(*this); }
> >> -       inline iterator_type operator++(int) { iterator_type tmp(*this=
); operator++(); return tmp; }
> >> --      inline iterator_type operator+(typename container_iterator::di=
fference_type const &n) { return iterator_type(_iter + n); }
> >> -+      inline iterator_type operator+(typename container_iterator::di=
fference_type const &n) const { return iterator_type(_iter + n); }
> >> -       inline iterator_type operator+=3D(typename container_iterator:=
:difference_type const &n) { _iter +=3D n; return static_cast<iterator_type=
&>(*this); }
> >> -       inline iterator_type& operator--() { --_iter;; return static_c=
ast<iterator_type&>(*this); }
> >> -       inline iterator_type operator--(int) { iterator_type tmp(*this=
); operator--(); return tmp; }
> >> --      inline iterator_type operator-(typename container_iterator::di=
fference_type const &n) { return iterator_type(_iter - n); }
> >> -+      inline iterator_type operator-(typename container_iterator::di=
fference_type const &n) const { return iterator_type(_iter - n); }
> >> -       inline typename container_iterator::difference_type operator-(=
iterator_type const &b) { return (_iter - b._iter); }
> >> -       inline iterator_type operator-=3D(typename container_iterator:=
:difference_type const &n) { _iter -=3D n; return static_cast<iterator_type=
&>(*this); }
> >> -       inline bool operator!=3D(iterator_type const &i) const { retur=
n _iter !=3D i._iter; }
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch b=
/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
> >> deleted file mode 100644
> >> index 0cefbedd6d..0000000000
> >> --- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
> >> +++ /dev/null
> >> @@ -1,28 +0,0 @@
> >> -From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 200=
1
> >> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> -Date: Fri, 22 May 2020 15:29:23 +0000
> >> -Subject: [PATCH] apt-pkg/contrib/srvrec.h: Explicitly include sys/typ=
es.h
> >> -
> >> -This avoids type errors with musl C library.
> >> -
> >> -Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/m=
erge_requests/200]
> >> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> ----
> >> - apt-pkg/contrib/srvrec.h | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
> >> -index e5d0f43..2010184 100644
> >> ---- a/apt-pkg/contrib/srvrec.h
> >> -+++ b/apt-pkg/contrib/srvrec.h
> >> -@@ -9,6 +9,7 @@
> >> - #ifndef SRVREC_H
> >> - #define SRVREC_H
> >> -
> >> -+#include <sys/types.h>
> >> - #include <string>
> >> - #include <vector>
> >> - #include <arpa/nameser.h>
> >> ---
> >> -2.20.1
> >> -
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_re=
quired-to-3.13-to-avoid-warnin.patch b/meta/recipes-devtools/apt/apt/0001-R=
aise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
> >> deleted file mode 100644
> >> index c3a5ded494..0000000000
> >> --- a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-=
to-3.13-to-avoid-warnin.patch
> >> +++ /dev/null
> >> @@ -1,47 +0,0 @@
> >> -From dc7a8b3050a2a43f49515a03ae19713dfced75dc Mon Sep 17 00:00:00 200=
1
> >> -From: David Kalnischkies <david@kalnischkies.de>
> >> -Date: Sat, 18 Nov 2023 13:10:05 +0000
> >> -Subject: [PATCH] Raise cmake_minimum_required to 3.13 to avoid warnin=
gs
> >> -
> >> -CMake Deprecation Warning at CMakeLists.txt:6 (cmake_minimum_required=
):
> >> -  Compatibility with CMake < 3.5 will be removed from a future versio=
n of
> >> -  CMake.
> >> -
> >> -  Update the VERSION argument <min> value or use a ...<max> suffix to=
 tell
> >> -  CMake that the project does not need compatibility with older versi=
ons.
> >> -
> >> -Picking 3.13 here is a semi-random choice to avoid raising the requir=
ement
> >> -too much needlessly while also hopefully avoiding needing to raise it
> >> -soon again based on the referenced mail.
> >> -
> >> -While we are at it, lets also fix the other spewed warning:
> >> -
> >> -CMake Warning (dev) at CMakeLists.txt:5 (project):
> >> -  cmake_minimum_required() should be called prior to this top-level p=
roject()
> >> -  call.  Please see the cmake-commands(7) manual for usage documentat=
ion of
> >> -  both commands.
> >> -
> >> -References: https://lists.debian.org/msgid-search/20230617162957.6pkl=
b6632zf4nijc@mail.gaussglocke.de
> >> -
> >> -Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/co=
mmit/dc7a8b3050a2a43f49515a03ae19713dfced75dc]
> >> -Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> >> ----
> >> - CMakeLists.txt | 2 +-
> >> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >> -
> >> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> -index 62182cddf..dae12e7c3 100644
> >> ---- a/CMakeLists.txt
> >> -+++ b/CMakeLists.txt
> >> -@@ -2,8 +2,8 @@
> >> - # Licensed under the same terms as APT; i.e. GPL 2 or later.
> >> -
> >> - # set minimum version
> >> -+cmake_minimum_required(VERSION 3.13)
> >> - project(apt)
> >> --cmake_minimum_required(VERSION 3.4.0)
> >> - # Generic header locations
> >> - include_directories(${PROJECT_BINARY_DIR}/include)
> >> -
> >> ---
> >> -GitLab
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binar=
y_function.patch b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-bina=
ry_function.patch
> >> deleted file mode 100644
> >> index 15b036b90d..0000000000
> >> --- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_funct=
ion.patch
> >> +++ /dev/null
> >> @@ -1,87 +0,0 @@
> >> -From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Tue, 16 Aug 2022 08:44:18 -0700
> >> -Subject: [PATCH] Remove using std::binary_function
> >> -
> >> -std::binary_function and std::unary_function are deprecated since c++=
11
> >> -and removed in c++17, therefore remove it and use lambda functions to=
 get same
> >> -functionality implemented.
> >> -
> >> -Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/m=
erge_requests/253]
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - ftparchive/apt-ftparchive.cc | 33 ++++++++++-----------------------
> >> - 1 file changed, 10 insertions(+), 23 deletions(-)
> >> -
> >> -diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive=
.cc
> >> -index 0f6587281..0a253b12b 100644
> >> ---- a/ftparchive/apt-ftparchive.cc
> >> -+++ b/ftparchive/apt-ftparchive.cc
> >> -@@ -48,6 +48,11 @@
> >> - using namespace std;
> >> - unsigned Quiet =3D 0;
> >> -
> >> -+auto ContentsCompare =3D [](const auto &a, const auto &b) { return a=
.ContentsMTime < b.ContentsMTime; };
> >> -+auto DBCompare =3D [](const auto &a, const auto &b) { return a.BinCa=
cheDB < b.BinCacheDB; };
> >> -+auto SrcDBCompare =3D [](const auto &a, const auto &b) { return a.Sr=
cCacheDB < b.SrcCacheDB; };
> >> -+
> >> -+
> >> - static struct timeval GetTimevalFromSteadyClock()                   =
  /*{{{*/
> >> - {
> >> -    auto const Time =3D std::chrono::steady_clock::now().time_since_e=
poch();
> >> -@@ -116,24 +121,6 @@ struct PackageMap
> >> -    bool SrcDone;
> >> -    time_t ContentsMTime;
> >> -
> >> --   struct ContentsCompare
> >> --   {
> >> --      inline bool operator() (const PackageMap &x,const PackageMap &=
y)
> >> --      {return x.ContentsMTime < y.ContentsMTime;};
> >> --   };
> >> --
> >> --   struct DBCompare
> >> --   {
> >> --      inline bool operator() (const PackageMap &x,const PackageMap &=
y)
> >> --      {return x.BinCacheDB < y.BinCacheDB;};
> >> --   };
> >> --
> >> --   struct SrcDBCompare
> >> --   {
> >> --      inline bool operator() (const PackageMap &x,const PackageMap &=
y)
> >> --      {return x.SrcCacheDB < y.SrcCacheDB;};
> >> --   };
> >> --
> >> -    void GetGeneral(Configuration &Setup,Configuration &Block);
> >> -    bool GenPackages(Configuration &Setup,struct CacheDB::Stats &Stat=
s);
> >> -    bool GenSources(Configuration &Setup,struct CacheDB::Stats &Stats=
);
> >> -@@ -869,7 +856,7 @@ static bool DoGenerateContents(Configuration &Set=
up,
> >> -       else
> >> -        I->ContentsMTime =3D A.st_mtime;
> >> -    }
> >> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::ContentsCom=
pare());
> >> -+   stable_sort(PkgList.begin(),PkgList.end(),ContentsCompare);
> >> -
> >> -    /* Now for Contents.. The process here is to do a make-like depen=
dency
> >> -       check. Each contents file is verified to be newer than the pac=
kage files
> >> -@@ -941,8 +928,8 @@ static bool Generate(CommandLine &CmdL)
> >> -    LoadBinDir(PkgList,Setup);
> >> -
> >> -    // Sort by cache DB to improve IO locality.
> >> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompare()=
);
> >> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCompar=
e());
> >> -+   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
> >> -+   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
> >> -
> >> -    // Generate packages
> >> -    if (_config->FindB("APT::FTPArchive::ContentsOnly", false) =3D=3D=
 false)
> >> -@@ -993,8 +980,8 @@ static bool Clean(CommandLine &CmdL)
> >> -    LoadBinDir(PkgList,Setup);
> >> -
> >> -    // Sort by cache DB to improve IO locality.
> >> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompare()=
);
> >> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCompar=
e());
> >> -+   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
> >> -+   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
> >> -
> >> -    string CacheDir =3D Setup.FindDir("Dir::CacheDir");
> >> -
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg=
-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-R=
evert-always-run-dpkg-configure-a-at-the-end-of-our.patch
> >> index 6f4d5b6e72..43ab6a4cd8 100644
> >> --- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-config=
ure-a-at-the-end-of-our.patch
> >> +++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-config=
ure-a-at-the-end-of-our.patch
> >> @@ -23,7 +23,7 @@ diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpk=
gpm.cc
> >>  index 93effa959..4375781d1 100644
> >>  --- a/apt-pkg/deb/dpkgpm.cc
> >>  +++ b/apt-pkg/deb/dpkgpm.cc
> >> -@@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
> >> +@@ -1210,12 +1210,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
> >>          }
> >>         }
> >>      }
> >> @@ -36,7 +36,7 @@ index 93effa959..4375781d1 100644
> >>   }
> >>                                                                       =
    /*}}}*/
> >>   void pkgDPkgPM::StartPtyMagic()                                     =
          /*{{{*/
> >> -@@ -1741,7 +1735,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManage=
r *progress)
> >> +@@ -1752,7 +1746,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManage=
r *progress)
> >>
> >>         // support subpressing of triggers processing for special
> >>         // cases like d-i that runs the triggers handling manually
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Includ=
e-array.patch b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-=
array.patch
> >> deleted file mode 100644
> >> index 2c1e617e55..0000000000
> >> --- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array=
.patch
> >> +++ /dev/null
> >> @@ -1,30 +0,0 @@
> >> -From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Wed, 26 May 2021 22:12:46 -0700
> >> -Subject: [PATCH] aptwebserver.cc: Include <array>
> >> -
> >> -This helps getting std::array definition
> >> -
> >> -Fixes
> >> -test/interactive-helper/aptwebserver.cc:36:55: error: constexpr varia=
ble cannot have non-literal type 'const std::array<std::array<const char *,=
 2>, 6>'
> >> -   constexpr std::array<std::array<char const *,2>,6> htmlencode =3D =
{{
> >> -
> >> -Upstream-Status: Submitted [https://github.com/Debian/apt/pull/133]
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -
> >> ----
> >> - test/interactive-helper/aptwebserver.cc | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/test/interactive-helper/aptwebserver.cc b/test/interacti=
ve-helper/aptwebserver.cc
> >> -index f4f8d95..361c7a9 100644
> >> ---- a/test/interactive-helper/aptwebserver.cc
> >> -+++ b/test/interactive-helper/aptwebserver.cc
> >> -@@ -23,6 +23,7 @@
> >> -
> >> - #include <array>
> >> - #include <algorithm>
> >> -+#include <array>
> >> - #include <fstream>
> >> - #include <iostream>
> >> - #include <list>
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-=
files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-file=
s.patch
> >> index 036ce35963..08815a3ec4 100644
> >> --- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.p=
atch
> >> +++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.p=
atch
> >> @@ -11,14 +11,14 @@ Fixes
> >>  Upstream-Status: Inappropriate [Cross-compile specific]
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>  ---
> >> - CMakeLists.txt | 7 -------
> >> - 1 file changed, 7 deletions(-)
> >> + CMakeLists.txt | 9 ---------
> >> + 1 file changed, 9 deletions(-)
> >>
> >>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>  index be157a55f..54163ae6c 100644
> >>  --- a/CMakeLists.txt
> >>  +++ b/CMakeLists.txt
> >> -@@ -252,15 +252,6 @@ add_subdirectory(ftparchive)
> >> +@@ -257,15 +257,6 @@ add_subdirectory(ftparchive)
> >>   add_subdirectory(methods)
> >>   add_subdirectory(test)
> >>
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-m=
usl.patch b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.pa=
tch
> >> new file mode 100644
> >> index 0000000000..d3c5fe658e
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.pat=
ch
> >> @@ -0,0 +1,49 @@
> >> +From a6b024ceb71c43977838d625f5ac64b7e4815a56 Mon Sep 17 00:00:00 200=
1
> >> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> >> +Date: Thu, 28 Aug 2025 08:11:58 +0200
> >> +Subject: [PATCH] fix compilation with musl
> >> +
> >> +The basename() function requires the libgen.h header when
> >> +compiling with musl-libc, otherwise it complains:
> >> +
> >> +error: 'basename' was not declared in this scope; did you mean 'renam=
e'?
> >> +
> >> +Also, musl's basename requires char* instead of const char* argument:
> >> +
> >> +error: invalid conversion from 'const char*' to 'char*' [-fpermissive=
]
> >> +
> >> +The musl implementation of basename modifies the argument only in cas=
e
> >> +it is a folder path (it cuts off the trailing slashes). In our case,
> >> +when argv[0] is passed, it is always a filename without a trailing
> >> +slash, so just cast the argument.
> >> +
> >> +Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/m=
erge_requests/508]
> >> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> +---
> >> + cmdline/apt-internal-solver.cc | 3 ++-
> >> + 1 file changed, 2 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/cmdline/apt-internal-solver.cc b/cmdline/apt-internal-so=
lver.cc
> >> +index ceedd96c7..74ed38c50 100644
> >> +--- a/cmdline/apt-internal-solver.cc
> >> ++++ b/cmdline/apt-internal-solver.cc
> >> +@@ -35,6 +35,7 @@
> >> + #include <list>
> >> + #include <sstream>
> >> + #include <string>
> >> ++#include <libgen.h>
> >> + #include <unistd.h>
> >> +
> >> + #include <apti18n.h>
> >> +@@ -119,7 +120,7 @@ int main(int argc,const char *argv[])            =
                          /*{{{*/
> >> +               _config->Set("Debug::EDSP::WriteSolution", true);
> >> +
> >> +       _config->Set("APT::System", "Debian APT solver interface");
> >> +-      if (strcmp(basename(argv[0]), "solver3") =3D=3D 0)
> >> ++      if (strcmp(basename((char*)argv[0]), "solver3") =3D=3D 0)
> >> +          _config->Set("APT::Solver", "3.0");
> >> +       else if (_config->Find("APT::Solver") !=3D "3.0")
> >> +          _config->Set("APT::Solver", "internal");
> >> +--
> >> +2.39.5
> >> +
> >> diff --git a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-inc=
lude-cstdint-gcc-15.patch b/meta/recipes-devtools/apt/apt/0001-strutl-Add-m=
issing-include-cstdint-gcc-15.patch
> >> deleted file mode 100644
> >> index b86ed8bb92..0000000000
> >> --- a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cs=
tdint-gcc-15.patch
> >> +++ /dev/null
> >> @@ -1,26 +0,0 @@
> >> -From 9da1b0dbdcc90455bc9de49f73a96e7d18f83493 Mon Sep 17 00:00:00 200=
1
> >> -From: Julian Andres Klode <julian.klode@canonical.com>
> >> -Date: Tue, 18 Feb 2025 10:29:40 +0100
> >> -Subject: [PATCH] strutl: Add missing #include <cstdint> [gcc 15]
> >> -
> >> -Closes: #1096322
> >> -
> >> -Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/co=
mmit/f82dcd7e4ebb3f70d28e9feb3621676f8c0cc024]
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - apt-pkg/contrib/strutl.cc | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
> >> -index 67100f1..c0a1cbc 100644
> >> ---- a/apt-pkg/contrib/strutl.cc
> >> -+++ b/apt-pkg/contrib/strutl.cc
> >> -@@ -26,6 +26,7 @@
> >> -
> >> - #include <algorithm>
> >> - #include <array>
> >> -+#include <cstdint>
> >> - #include <iomanip>
> >> - #include <limits>
> >> - #include <locale>
> >> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-dev=
tools/apt/apt_3.0.3.bb
> >> similarity index 88%
> >> rename from meta/recipes-devtools/apt/apt_2.6.1.bb
> >> rename to meta/recipes-devtools/apt/apt_3.0.3.bb
> >> index b039599395..03a6869393 100644
> >> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
> >> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> >> @@ -8,14 +8,9 @@ SECTION =3D "base"
> >>  SRC_URI =3D "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
> >>             file://triehash \
> >>             file://0001-Disable-documentation-directory-altogether.pat=
ch \
> >> -           file://0001-Fix-musl-build.patch \
> >>             file://0001-CMakeLists.txt-avoid-changing-install-paths-ba=
sed-on.patch \
> >>             file://0001-cmake-Do-not-build-po-files.patch \
> >> -           file://0001-aptwebserver.cc-Include-array.patch \
> >> -           file://0001-Remove-using-std-binary_function.patch \
> >> -           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patc=
h \
> >> -           file://0001-Raise-cmake_minimum_required-to-3.13-to-avoid-=
warnin.patch \
> >> -           file://0001-Fix-compilation-error-with-clang-libc-18.patch=
 \
> >> +           file://0001-fix-compilation-with-musl.patch \
> >>             "
> >>
> >>  SRC_URI:append:class-native =3D " \
> >> @@ -28,7 +23,7 @@ SRC_URI:append:class-nativesdk =3D " \
> >>             file://0001-Revert-always-run-dpkg-configure-a-at-the-end-=
of-our.patch \
> >>             "
> >>
> >> -SRC_URI[sha256sum] =3D "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff=
0ac6631939ee68fa6fd"
> >> +SRC_URI[sha256sum] =3D "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518=
db412edefd95760e4ef"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263"
> >>
> >>  # the package is taken from snapshots.debian.org; that source is stat=
ic and goes stale
> >> @@ -47,7 +42,7 @@ USERADD_PARAM:${PN} =3D "--system --home /nonexisten=
t --no-create-home _apt"
> >>
> >>  BBCLASSEXTEND =3D "native nativesdk"
> >>
> >> -DEPENDS +=3D "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
> >> +DEPENDS +=3D "db lz4 zlib bzip2 xz xxhash openssl"
> >>
> >>  EXTRA_OECMAKE:append =3D " -DCURRENT_VENDOR=3Ddebian -DWITH_DOC=3DFal=
se \
> >>      -DDPKG_DATADIR=3D${datadir}/dpkg \
> >> @@ -55,8 +50,14 @@ EXTRA_OECMAKE:append =3D " -DCURRENT_VENDOR=3Ddebia=
n -DWITH_DOC=3DFalse \
> >>      -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=3DTrue \
> >>      -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=3DTrue \
> >>      -DWITH_TESTS=3DFalse \
> >> +    -DCOMMON_ARCH=3D${DPKG_ARCH} \
> >>  "
> >>
> >> +PACKAGECONFIG ??=3D ""
> >> +# usrmerge displays a runtime warning during package installation in =
case
> >> +# the system doesn't have merged /usr folders.
> >> +PACKAGECONFIG[usrmerge] =3D "-DREQUIRE_MERGED_USR=3DON,-DREQUIRE_MERG=
ED_USR=3DOFF"
> >> +
> >>  do_configure:prepend() {
> >>         echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WOR=
KDIR}/toolchain.cmake
> >>  }
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#222880): https://lists.openembedded.org/g/openembe=
dded-core/message/222880
> >> Mute This Topic: https://lists.openembedded.org/mt/115050106/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

