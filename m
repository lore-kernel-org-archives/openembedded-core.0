Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D0FCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 20:15:04 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.7299.1757621697608876839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 13:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJgOcXRg;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d71bcac45so8437337b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757621697; x=1758226497; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E1IQoiCML1Cb9EfrM2sB6DeiuquoXWleHj4mncHxQ0=;
        b=lJgOcXRgp798LO7fHOlipmE1SuL2TteZ6EkoBnw3RKS2oYPE0RauDW//LWxqfAZ9/Q
         WpLJ4caqqA89fGp8JwNnLvn4A4k+SQmd1e2tHj5Zj8rsKqv60a43IWDQqU884fyx29P2
         CPAbwmybGQhrwSroB667uYEbEEJcCahUG7l5IhOLcub9f3ko+WcV8wYiiNAty5t+eZ/z
         E5CPji0q9EkYTg3WLeizGiklMi+MvarWANgQSwgvE/5mCY48IsGBEPLxX1RUq4lq4X+O
         H0uPoxJtHOjMbbIgGQKtr3Z3FPdQsToFtn3c3rt1ZhUermVUiS10DYkvEDYf2K3af8Fk
         OsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757621697; x=1758226497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E1IQoiCML1Cb9EfrM2sB6DeiuquoXWleHj4mncHxQ0=;
        b=XWmAGsioCw4lDMICi5YIfoyWZ0TCOo0g0vMQWOAhnPAJ0W7uxKErZClLdjZwXkYMyb
         G4gh0ymOucwZ1jiCEvOR886e+7AULlkv7WeqLbA+50OPPqc2J79QHmoaJYCNFvAECRZt
         25073PXSOwYqnp5PlojXGhf92D4VxnYbtXqV06wvHKqr3UhDMuOddsfmFZDWjDT4rLjY
         M/Ql5awF9hhvqGeA/AbF0L9+LXNsH59tasWEMhEA7OLPalPltvPHnVymJK7GvIQL/1X3
         3tFqex2GiBSEl/bk9GZRvHQEu2Ld3HZwa1wTJ8qxkT7RL0HrtfG8rTAGqQQfMWxh0M4m
         wxUQ==
X-Gm-Message-State: AOJu0YyE/qxT3mu16qxaJfOD6eRj63hyM6qtDiefNW4wLgUJMClk7OGm
	kNpg0DBp9Aon3NAX0IQEs2Vh1X0na9Zkl1lYEQlOVAWgBQmJbnMFtY/sFv4AoSU+FgNgT+9eDRU
	DUTr+9Kuu/fYA5NiZQEojeur33k20TXeD53/U
X-Gm-Gg: ASbGncuL2sK6u+7OWm16o25poWIoSP5z6q6IpoXZp5Mfdcjfa3D4OMWqPjuRhah5vYX
	eLkY7uVnkC/XmukaEoihVY9hwiao+xeqktjO2YwOwAjTVSf/vmSwixv6heCACro4m0mwYYeds/N
	dfjukpW77SKjOSHTTgj0Hp8zbcC/tKNIeqVEmNydJqBHsW569V7cY3aajEcTiZVDILXOCQI+lDw
	T08gKFO4KF9LtV9CXdRMBI5PS5Qj4icUa0VJvdMio/zVMehgBTAQbS27QHpoGnl3tl9P5cq+Ctm
	FMkVV92yHm7NHbzO92k3Se8t+q1bFH+TnC+K53tNdvYiWhRIJd3MUw==
X-Google-Smtp-Source: AGHT+IHKs/8LsTcJkEJ4ivnQl76QYpc00bsMUDEfqFcNdon6A9i4qRELf1MowSFHa4Tn4sOdu4+g0GblPjYad2ir6bs=
X-Received: by 2002:a05:690c:3688:b0:729:a1ee:9bd8 with SMTP id
 00721157ae682-730656d07e0mr7890117b3.36.1757621696170; Thu, 11 Sep 2025
 13:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250903180343.1222627-1-skandigraun@gmail.com>
 <CAMKF1soW4AOSfwaHkzoMsE2Son=zqh5Bjcnj31H+Dr6SnAuJPg@mail.gmail.com>
 <82cfc411-a71f-443e-b9a5-d8fcb1d3122b@gmail.com> <CAMKF1sq=uwrn_KC0+pzwRBi0K-Fpb4Ac40cwPKEVdKf+ZbVNtQ@mail.gmail.com>
 <fabf6e5f-ad7f-415d-9cc0-9b5eadaf9dea@gmail.com> <a3f04178-b707-45b2-ad38-b45c6f4875ad@gmail.com>
In-Reply-To: <a3f04178-b707-45b2-ad38-b45c6f4875ad@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Sep 2025 13:14:28 -0700
X-Gm-Features: Ac12FXxDUL2CP_Z4IoAeWSbiivpfo7UcrCr4ovtj7DUR6K6KiVLcaaBSmnJxkoA
Message-ID: <CAMKF1soEvZsOzt1jF1uMaky2eWaoRGDUrPbLeG_vt9D5qm6uEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] apt: upgrade 2.6.1 -> 3.0.3
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 20:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223294

Thanks, I'll check it out!

On Thu, Sep 11, 2025 at 11:10=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 9/11/25 18:22, Gyorgy Sarvari wrote:
> > On 9/11/25 17:55, Khem Raj wrote:
> >> On Tue, Sep 9, 2025 at 8:17=E2=80=AFAM Gyorgy Sarvari <skandigraun@gma=
il.com> wrote:
> >>> On 9/9/25 17:14, Khem Raj wrote:
> >>>> Gyorgy
> >>>>
> >>>> there is a build failure with clang and libc++
> >>>> https://errors.yoctoproject.org/Errors/Details/882066/
> >>> Hmmm... thanks for the heads up, going to take a look at it.
> >>>
> >> Once I see the libc++ issue fixed it reveals the next problem python3-=
apt needs
> >> to be looked into as well see, its not particular to clang or libc++
> >>
> >> https://errors.yoctoproject.org/Errors/Details/882544/
> > Updating python3-apt to 3.0.0 seems to compile at least. Let me see if
> > it can be imported at least... if yes, will send an update.
>
> Sent a patch to oe-dev list. I was able compile and use it in qemu with
> both clang/libc++ and gnu suites.
>
> Could you pls give it a go also?
>
> >>>> Thanks
> >>>> -Khem
> >>>>
> >>>> On Wed, Sep 3, 2025 at 11:03=E2=80=AFAM Gyorgy Sarvari via
> >>>> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.o=
rg>
> >>>> wrote:
> >>>>> Changelog:
> >>>>> https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.=
0.3_changelog
> >>>>>
> >>>>> Dropped patches which are included in this release, or became obsol=
ete:
> >>>>> 0001-Fix-compilation-error-with-clang-libc-18.patch - included in t=
his release
> >>>>> 0001-Fix-musl-build.patch - included in this release
> >>>>> 0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch - i=
ncluded in this release
> >>>>> 0001-Remove-using-std-binary_function.patch - became obsolete, fixe=
d upstream
> >>>>> 0001-aptwebserver.cc-Include-array.patch - became obsolete, fixed u=
pstream
> >>>>> 0001-strutl-Add-missing-include-cstdint-gcc-15.patch - included in =
this release
> >>>>>
> >>>>> Added a new patch to avoid compilation error with musl:
> >>>>> error: 'basename' was not declared in this scope; did you mean 'ren=
ame'?
> >>>>>
> >>>>> Adapted DEPENDS list - gnutls and gcrypt dependencies were dropped =
in favor of openssl
> >>>>> in version 2.9.19.
> >>>>>
> >>>>> Added a new PACKAGECONFIG, 'usrmerge', which displays a gentle warn=
ing if the system
> >>>>> isn't a usrmerge system during package installation.
> >>>>>
> >>>>> Added new COMMON_ARCH CMake argument - if it is not defined, CMake =
is trying to
> >>>>> determine the value of this variable by running dpkg, which is usua=
lly a futile
> >>>>> endeavour. It is used in config creation, and to print some system =
info.
> >>>>>
> >>>>> Also adapt a self test: the apt-key command has been deprecated sin=
ce a while,
> >>>>> and in this release it was completely removed. Instead sources.list=
 file
> >>>>> contains the signature data, on a per-repository basis.
> >>>>>
> >>>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >>>>> ---
> >>>>> v6: remove unnecessary quote escaping from self-test
> >>>>> v5: copy the keyring with the correct extension (.asc) in self test
> >>>>> v4: remove a debug "cat" from the test
> >>>>> v3: adapt self-test. apt-key has been removed from this version, so=
 make the test
> >>>>>     use an alternative method to indicate the signature location
> >>>>> v2: changed the status 0001-fix-compilation-with-musl.patch from Pe=
nding to Submitted
> >>>>>
> >>>>>  meta/lib/oeqa/runtime/cases/apt.py            |  9 +-
> >>>>>  ...void-changing-install-paths-based-on.patch |  2 +-
> >>>>>  ...e-documentation-directory-altogether.patch |  2 +-
> >>>>>  ...-init-tables-from-dpkg-configuration.patch |  2 +-
> >>>>>  ...compilation-error-with-clang-libc-18.patch | 29 -------
> >>>>>  .../apt/apt/0001-Fix-musl-build.patch         | 28 ------
> >>>>>  ...mum_required-to-3.13-to-avoid-warnin.patch | 47 ----------
> >>>>>  ...001-Remove-using-std-binary_function.patch | 87 ---------------=
----
> >>>>>  ...n-dpkg-configure-a-at-the-end-of-our.patch |  4 +-
> >>>>>  .../0001-aptwebserver.cc-Include-array.patch  | 30 -------
> >>>>>  .../0001-cmake-Do-not-build-po-files.patch    |  6 +-
> >>>>>  .../apt/0001-fix-compilation-with-musl.patch  | 49 +++++++++++
> >>>>>  ...l-Add-missing-include-cstdint-gcc-15.patch | 26 ------
> >>>>>  .../apt/{apt_2.6.1.bb =3D> apt_3.0.3.bb}        | 17 ++--
> >>>>>  14 files changed, 74 insertions(+), 264 deletions(-)
> >>>>>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-compilat=
ion-error-with-clang-libc-18.patch
> >>>>>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-musl-bui=
ld.patch
> >>>>>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_=
minimum_required-to-3.13-to-avoid-warnin.patch
> >>>>>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-Remove-using=
-std-binary_function.patch
> >>>>>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-aptwebserver=
.cc-Include-array.patch
> >>>>>  create mode 100644 meta/recipes-devtools/apt/apt/0001-fix-compilat=
ion-with-musl.patch
> >>>>>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-m=
issing-include-cstdint-gcc-15.patch
> >>>>>  rename meta/recipes-devtools/apt/{apt_2.6.1.bb =3D> apt_3.0.3.bb} =
(88%)
> >>>>>
> >>>>> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/run=
time/cases/apt.py
> >>>>> index 8000645843..c6b62987f1 100644
> >>>>> --- a/meta/lib/oeqa/runtime/cases/apt.py
> >>>>> +++ b/meta/lib/oeqa/runtime/cases/apt.py
> >>>>> @@ -54,7 +54,14 @@ class AptRepoTest(AptTest):
> >>>>>      def setup_key(self):
> >>>>>          # the key is found on the target /etc/pki/packagefeed-gpg/
> >>>>>          # named PACKAGEFEED-GPG-KEY-poky-branch
> >>>>> -        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packa=
gefeed-gpg'))
> >>>>> +        # copy it to /etc/apt/keyrings/PACKAGEFEED-GPG-KEY-poky-br=
anch.asc, and
> >>>>> +        # set it as the signing key for the repos
> >>>>> +        cmd =3D  "KEY_FILE_PATH=3D`realpath /etc/pki/packagefeed-g=
pg/P*`; "
> >>>>> +        cmd +=3D "KEY_FILE_NAME=3D`basename $KEY_FILE_PATH`; "
> >>>>> +        cmd +=3D "mkdir -p /etc/apt/keyrings; "
> >>>>> +        cmd +=3D "cp $KEY_FILE_PATH /etc/apt/keyrings/${KEY_FILE_N=
AME}.asc; "
> >>>>> +        cmd +=3D 'sed -i "s|^deb |deb \[signed-by=3D/etc/apt/keyri=
ngs/${KEY_FILE_NAME}.asc\] |g" /etc/apt/sources.list'
> >>>>> +        self.target.run(cmd)
> >>>>>
> >>>>>      @skipIfNotFeature('package-management',
> >>>>>                        'Test requires package-management to be in I=
MAGE_FEATURES')
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoi=
d-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/000=
1-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
> >>>>> index 199f11bf20..d37aa811cd 100644
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-chang=
ing-install-paths-based-on.patch
> >>>>> +++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-chang=
ing-install-paths-based-on.patch
> >>>>> @@ -14,7 +14,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>>>>  index 2cd4f8e..4759812 100644
> >>>>>  --- a/CMakeLists.txt
> >>>>>  +++ b/CMakeLists.txt
> >>>>> -@@ -21,9 +21,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
> >>>>> +@@ -28,9 +28,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
> >>>>>   set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "-lgcov")
> >>>>>
> >>>>>   # Work around bug in GNUInstallDirs
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentati=
on-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-=
documentation-directory-altogether.patch
> >>>>> index 5443ff6caa..4bc6dce760 100644
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-dire=
ctory-altogether.patch
> >>>>> +++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-dire=
ctory-altogether.patch
> >>>>> @@ -16,7 +16,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>>>>  index 668e2d762..62f441bfa 100644
> >>>>>  --- a/CMakeLists.txt
> >>>>>  +++ b/CMakeLists.txt
> >>>>> -@@ -246,7 +246,7 @@ add_subdirectory(apt-private)
> >>>>> +@@ -251,7 +251,7 @@ add_subdirectory(apt-private)
> >>>>>   endif()
> >>>>>   add_subdirectory(cmdline)
> >>>>>   add_subdirectory(completions)
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-=
from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-i=
nit-tables-from-dpkg-configuration.patch
> >>>>> index 37a3133010..d21f5a49c5 100644
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dp=
kg-configuration.patch
> >>>>> +++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dp=
kg-configuration.patch
> >>>>> @@ -16,7 +16,7 @@ diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
> >>>>>  index b9d9b15d2..1725c5966 100644
> >>>>>  --- a/apt-pkg/init.cc
> >>>>>  +++ b/apt-pkg/init.cc
> >>>>> -@@ -281,8 +281,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSyste=
m *&Sys)
> >>>>> +@@ -295,8 +295,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSyste=
m *&Sys)
> >>>>>          return _error->Error(_("Unable to determine a suitable pac=
kaging system type"));
> >>>>>      }
> >>>>>
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-err=
or-with-clang-libc-18.patch b/meta/recipes-devtools/apt/apt/0001-Fix-compil=
ation-error-with-clang-libc-18.patch
> >>>>> deleted file mode 100644
> >>>>> index e55205ca3f..0000000000
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with=
-clang-libc-18.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,29 +0,0 @@
> >>>>> -From b4488583424b33f51cb031562a9e8df820ffda23 Mon Sep 17 00:00:00 =
2001
> >>>>> -From: Chongyun Lee <licy183@termux.dev>
> >>>>> -Date: Thu, 15 Aug 2024 21:31:24 +0800
> >>>>> -Subject: [PATCH] Fix compilation error with clang/libc++ 18
> >>>>> -
> >>>>> -Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-=
/commit/b4488583424b33f51cb031562a9e8df820ffda23]
> >>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>> ----
> >>>>> - apt-pkg/cacheset.h | 4 ++--
> >>>>> - 1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>> -
> >>>>> -diff --git a/apt-pkg/cacheset.h b/apt-pkg/cacheset.h
> >>>>> -index 5dbb9bf08..1c67a65d6 100644
> >>>>> ---- a/apt-pkg/cacheset.h
> >>>>> -+++ b/apt-pkg/cacheset.h
> >>>>> -@@ -218,11 +218,11 @@ public:
> >>>>> -       operator container_iterator(void) const { return _iter; }
> >>>>> -       inline iterator_type& operator++() { ++_iter; return static=
_cast<iterator_type&>(*this); }
> >>>>> -       inline iterator_type operator++(int) { iterator_type tmp(*t=
his); operator++(); return tmp; }
> >>>>> --      inline iterator_type operator+(typename container_iterator:=
:difference_type const &n) { return iterator_type(_iter + n); }
> >>>>> -+      inline iterator_type operator+(typename container_iterator:=
:difference_type const &n) const { return iterator_type(_iter + n); }
> >>>>> -       inline iterator_type operator+=3D(typename container_iterat=
or::difference_type const &n) { _iter +=3D n; return static_cast<iterator_t=
ype&>(*this); }
> >>>>> -       inline iterator_type& operator--() { --_iter;; return stati=
c_cast<iterator_type&>(*this); }
> >>>>> -       inline iterator_type operator--(int) { iterator_type tmp(*t=
his); operator--(); return tmp; }
> >>>>> --      inline iterator_type operator-(typename container_iterator:=
:difference_type const &n) { return iterator_type(_iter - n); }
> >>>>> -+      inline iterator_type operator-(typename container_iterator:=
:difference_type const &n) const { return iterator_type(_iter - n); }
> >>>>> -       inline typename container_iterator::difference_type operato=
r-(iterator_type const &b) { return (_iter - b._iter); }
> >>>>> -       inline iterator_type operator-=3D(typename container_iterat=
or::difference_type const &n) { _iter -=3D n; return static_cast<iterator_t=
ype&>(*this); }
> >>>>> -       inline bool operator!=3D(iterator_type const &i) const { re=
turn _iter !=3D i._iter; }
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patc=
h b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
> >>>>> deleted file mode 100644
> >>>>> index 0cefbedd6d..0000000000
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,28 +0,0 @@
> >>>>> -From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 =
2001
> >>>>> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >>>>> -Date: Fri, 22 May 2020 15:29:23 +0000
> >>>>> -Subject: [PATCH] apt-pkg/contrib/srvrec.h: Explicitly include sys/=
types.h
> >>>>> -
> >>>>> -This avoids type errors with musl C library.
> >>>>> -
> >>>>> -Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/=
-/merge_requests/200]
> >>>>> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >>>>> ----
> >>>>> - apt-pkg/contrib/srvrec.h | 1 +
> >>>>> - 1 file changed, 1 insertion(+)
> >>>>> -
> >>>>> -diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
> >>>>> -index e5d0f43..2010184 100644
> >>>>> ---- a/apt-pkg/contrib/srvrec.h
> >>>>> -+++ b/apt-pkg/contrib/srvrec.h
> >>>>> -@@ -9,6 +9,7 @@
> >>>>> - #ifndef SRVREC_H
> >>>>> - #define SRVREC_H
> >>>>> -
> >>>>> -+#include <sys/types.h>
> >>>>> - #include <string>
> >>>>> - #include <vector>
> >>>>> - #include <arpa/nameser.h>
> >>>>> ---
> >>>>> -2.20.1
> >>>>> -
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum=
_required-to-3.13-to-avoid-warnin.patch b/meta/recipes-devtools/apt/apt/000=
1-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
> >>>>> deleted file mode 100644
> >>>>> index c3a5ded494..0000000000
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_requir=
ed-to-3.13-to-avoid-warnin.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,47 +0,0 @@
> >>>>> -From dc7a8b3050a2a43f49515a03ae19713dfced75dc Mon Sep 17 00:00:00 =
2001
> >>>>> -From: David Kalnischkies <david@kalnischkies.de>
> >>>>> -Date: Sat, 18 Nov 2023 13:10:05 +0000
> >>>>> -Subject: [PATCH] Raise cmake_minimum_required to 3.13 to avoid war=
nings
> >>>>> -
> >>>>> -CMake Deprecation Warning at CMakeLists.txt:6 (cmake_minimum_requi=
red):
> >>>>> -  Compatibility with CMake < 3.5 will be removed from a future ver=
sion of
> >>>>> -  CMake.
> >>>>> -
> >>>>> -  Update the VERSION argument <min> value or use a ...<max> suffix=
 to tell
> >>>>> -  CMake that the project does not need compatibility with older ve=
rsions.
> >>>>> -
> >>>>> -Picking 3.13 here is a semi-random choice to avoid raising the req=
uirement
> >>>>> -too much needlessly while also hopefully avoiding needing to raise=
 it
> >>>>> -soon again based on the referenced mail.
> >>>>> -
> >>>>> -While we are at it, lets also fix the other spewed warning:
> >>>>> -
> >>>>> -CMake Warning (dev) at CMakeLists.txt:5 (project):
> >>>>> -  cmake_minimum_required() should be called prior to this top-leve=
l project()
> >>>>> -  call.  Please see the cmake-commands(7) manual for usage documen=
tation of
> >>>>> -  both commands.
> >>>>> -
> >>>>> -References: https://lists.debian.org/msgid-search/20230617162957.6=
pklb6632zf4nijc@mail.gaussglocke.de
> >>>>> -
> >>>>> -Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-=
/commit/dc7a8b3050a2a43f49515a03ae19713dfced75dc]
> >>>>> -Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> >>>>> ----
> >>>>> - CMakeLists.txt | 2 +-
> >>>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>> -
> >>>>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>>>> -index 62182cddf..dae12e7c3 100644
> >>>>> ---- a/CMakeLists.txt
> >>>>> -+++ b/CMakeLists.txt
> >>>>> -@@ -2,8 +2,8 @@
> >>>>> - # Licensed under the same terms as APT; i.e. GPL 2 or later.
> >>>>> -
> >>>>> - # set minimum version
> >>>>> -+cmake_minimum_required(VERSION 3.13)
> >>>>> - project(apt)
> >>>>> --cmake_minimum_required(VERSION 3.4.0)
> >>>>> - # Generic header locations
> >>>>> - include_directories(${PROJECT_BINARY_DIR}/include)
> >>>>> -
> >>>>> ---
> >>>>> -GitLab
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-bi=
nary_function.patch b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-b=
inary_function.patch
> >>>>> deleted file mode 100644
> >>>>> index 15b036b90d..0000000000
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_fu=
nction.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,87 +0,0 @@
> >>>>> -From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 =
2001
> >>>>> -From: Khem Raj <raj.khem@gmail.com>
> >>>>> -Date: Tue, 16 Aug 2022 08:44:18 -0700
> >>>>> -Subject: [PATCH] Remove using std::binary_function
> >>>>> -
> >>>>> -std::binary_function and std::unary_function are deprecated since =
c++11
> >>>>> -and removed in c++17, therefore remove it and use lambda functions=
 to get same
> >>>>> -functionality implemented.
> >>>>> -
> >>>>> -Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/=
-/merge_requests/253]
> >>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>> ----
> >>>>> - ftparchive/apt-ftparchive.cc | 33 ++++++++++---------------------=
--
> >>>>> - 1 file changed, 10 insertions(+), 23 deletions(-)
> >>>>> -
> >>>>> -diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparch=
ive.cc
> >>>>> -index 0f6587281..0a253b12b 100644
> >>>>> ---- a/ftparchive/apt-ftparchive.cc
> >>>>> -+++ b/ftparchive/apt-ftparchive.cc
> >>>>> -@@ -48,6 +48,11 @@
> >>>>> - using namespace std;
> >>>>> - unsigned Quiet =3D 0;
> >>>>> -
> >>>>> -+auto ContentsCompare =3D [](const auto &a, const auto &b) { retur=
n a.ContentsMTime < b.ContentsMTime; };
> >>>>> -+auto DBCompare =3D [](const auto &a, const auto &b) { return a.Bi=
nCacheDB < b.BinCacheDB; };
> >>>>> -+auto SrcDBCompare =3D [](const auto &a, const auto &b) { return a=
.SrcCacheDB < b.SrcCacheDB; };
> >>>>> -+
> >>>>> -+
> >>>>> - static struct timeval GetTimevalFromSteadyClock()                =
     /*{{{*/
> >>>>> - {
> >>>>> -    auto const Time =3D std::chrono::steady_clock::now().time_sinc=
e_epoch();
> >>>>> -@@ -116,24 +121,6 @@ struct PackageMap
> >>>>> -    bool SrcDone;
> >>>>> -    time_t ContentsMTime;
> >>>>> -
> >>>>> --   struct ContentsCompare
> >>>>> --   {
> >>>>> --      inline bool operator() (const PackageMap &x,const PackageMa=
p &y)
> >>>>> --      {return x.ContentsMTime < y.ContentsMTime;};
> >>>>> --   };
> >>>>> --
> >>>>> --   struct DBCompare
> >>>>> --   {
> >>>>> --      inline bool operator() (const PackageMap &x,const PackageMa=
p &y)
> >>>>> --      {return x.BinCacheDB < y.BinCacheDB;};
> >>>>> --   };
> >>>>> --
> >>>>> --   struct SrcDBCompare
> >>>>> --   {
> >>>>> --      inline bool operator() (const PackageMap &x,const PackageMa=
p &y)
> >>>>> --      {return x.SrcCacheDB < y.SrcCacheDB;};
> >>>>> --   };
> >>>>> --
> >>>>> -    void GetGeneral(Configuration &Setup,Configuration &Block);
> >>>>> -    bool GenPackages(Configuration &Setup,struct CacheDB::Stats &S=
tats);
> >>>>> -    bool GenSources(Configuration &Setup,struct CacheDB::Stats &St=
ats);
> >>>>> -@@ -869,7 +856,7 @@ static bool DoGenerateContents(Configuration &=
Setup,
> >>>>> -       else
> >>>>> -        I->ContentsMTime =3D A.st_mtime;
> >>>>> -    }
> >>>>> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::Contents=
Compare());
> >>>>> -+   stable_sort(PkgList.begin(),PkgList.end(),ContentsCompare);
> >>>>> -
> >>>>> -    /* Now for Contents.. The process here is to do a make-like de=
pendency
> >>>>> -       check. Each contents file is verified to be newer than the =
package files
> >>>>> -@@ -941,8 +928,8 @@ static bool Generate(CommandLine &CmdL)
> >>>>> -    LoadBinDir(PkgList,Setup);
> >>>>> -
> >>>>> -    // Sort by cache DB to improve IO locality.
> >>>>> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompar=
e());
> >>>>> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCom=
pare());
> >>>>> -+   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
> >>>>> -+   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
> >>>>> -
> >>>>> -    // Generate packages
> >>>>> -    if (_config->FindB("APT::FTPArchive::ContentsOnly", false) =3D=
=3D false)
> >>>>> -@@ -993,8 +980,8 @@ static bool Clean(CommandLine &CmdL)
> >>>>> -    LoadBinDir(PkgList,Setup);
> >>>>> -
> >>>>> -    // Sort by cache DB to improve IO locality.
> >>>>> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompar=
e());
> >>>>> --   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCom=
pare());
> >>>>> -+   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
> >>>>> -+   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
> >>>>> -
> >>>>> -    string CacheDir =3D Setup.FindDir("Dir::CacheDir");
> >>>>> -
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-d=
pkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/000=
1-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
> >>>>> index 6f4d5b6e72..43ab6a4cd8 100644
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-con=
figure-a-at-the-end-of-our.patch
> >>>>> +++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-con=
figure-a-at-the-end-of-our.patch
> >>>>> @@ -23,7 +23,7 @@ diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/=
dpkgpm.cc
> >>>>>  index 93effa959..4375781d1 100644
> >>>>>  --- a/apt-pkg/deb/dpkgpm.cc
> >>>>>  +++ b/apt-pkg/deb/dpkgpm.cc
> >>>>> -@@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
> >>>>> +@@ -1210,12 +1210,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
> >>>>>          }
> >>>>>         }
> >>>>>      }
> >>>>> @@ -36,7 +36,7 @@ index 93effa959..4375781d1 100644
> >>>>>   }
> >>>>>                                                                    =
       /*}}}*/
> >>>>>   void pkgDPkgPM::StartPtyMagic()                                  =
             /*{{{*/
> >>>>> -@@ -1741,7 +1735,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageMan=
ager *progress)
> >>>>> +@@ -1752,7 +1746,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageMan=
ager *progress)
> >>>>>
> >>>>>         // support subpressing of triggers processing for special
> >>>>>         // cases like d-i that runs the triggers handling manually
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Inc=
lude-array.patch b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Inclu=
de-array.patch
> >>>>> deleted file mode 100644
> >>>>> index 2c1e617e55..0000000000
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-ar=
ray.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,30 +0,0 @@
> >>>>> -From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 =
2001
> >>>>> -From: Khem Raj <raj.khem@gmail.com>
> >>>>> -Date: Wed, 26 May 2021 22:12:46 -0700
> >>>>> -Subject: [PATCH] aptwebserver.cc: Include <array>
> >>>>> -
> >>>>> -This helps getting std::array definition
> >>>>> -
> >>>>> -Fixes
> >>>>> -test/interactive-helper/aptwebserver.cc:36:55: error: constexpr va=
riable cannot have non-literal type 'const std::array<std::array<const char=
 *, 2>, 6>'
> >>>>> -   constexpr std::array<std::array<char const *,2>,6> htmlencode =
=3D {{
> >>>>> -
> >>>>> -Upstream-Status: Submitted [https://github.com/Debian/apt/pull/133=
]
> >>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>> -
> >>>>> ----
> >>>>> - test/interactive-helper/aptwebserver.cc | 1 +
> >>>>> - 1 file changed, 1 insertion(+)
> >>>>> -
> >>>>> -diff --git a/test/interactive-helper/aptwebserver.cc b/test/intera=
ctive-helper/aptwebserver.cc
> >>>>> -index f4f8d95..361c7a9 100644
> >>>>> ---- a/test/interactive-helper/aptwebserver.cc
> >>>>> -+++ b/test/interactive-helper/aptwebserver.cc
> >>>>> -@@ -23,6 +23,7 @@
> >>>>> -
> >>>>> - #include <array>
> >>>>> - #include <algorithm>
> >>>>> -+#include <array>
> >>>>> - #include <fstream>
> >>>>> - #include <iostream>
> >>>>> - #include <list>
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-=
po-files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-f=
iles.patch
> >>>>> index 036ce35963..08815a3ec4 100644
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-file=
s.patch
> >>>>> +++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-file=
s.patch
> >>>>> @@ -11,14 +11,14 @@ Fixes
> >>>>>  Upstream-Status: Inappropriate [Cross-compile specific]
> >>>>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>>  ---
> >>>>> - CMakeLists.txt | 7 -------
> >>>>> - 1 file changed, 7 deletions(-)
> >>>>> + CMakeLists.txt | 9 ---------
> >>>>> + 1 file changed, 9 deletions(-)
> >>>>>
> >>>>>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>>>>  index be157a55f..54163ae6c 100644
> >>>>>  --- a/CMakeLists.txt
> >>>>>  +++ b/CMakeLists.txt
> >>>>> -@@ -252,15 +252,6 @@ add_subdirectory(ftparchive)
> >>>>> +@@ -257,15 +257,6 @@ add_subdirectory(ftparchive)
> >>>>>   add_subdirectory(methods)
> >>>>>   add_subdirectory(test)
> >>>>>
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-fix-compilation-wit=
h-musl.patch b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl=
.patch
> >>>>> new file mode 100644
> >>>>> index 0000000000..d3c5fe658e
> >>>>> --- /dev/null
> >>>>> +++ b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.=
patch
> >>>>> @@ -0,0 +1,49 @@
> >>>>> +From a6b024ceb71c43977838d625f5ac64b7e4815a56 Mon Sep 17 00:00:00 =
2001
> >>>>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> >>>>> +Date: Thu, 28 Aug 2025 08:11:58 +0200
> >>>>> +Subject: [PATCH] fix compilation with musl
> >>>>> +
> >>>>> +The basename() function requires the libgen.h header when
> >>>>> +compiling with musl-libc, otherwise it complains:
> >>>>> +
> >>>>> +error: 'basename' was not declared in this scope; did you mean 're=
name'?
> >>>>> +
> >>>>> +Also, musl's basename requires char* instead of const char* argume=
nt:
> >>>>> +
> >>>>> +error: invalid conversion from 'const char*' to 'char*' [-fpermiss=
ive]
> >>>>> +
> >>>>> +The musl implementation of basename modifies the argument only in =
case
> >>>>> +it is a folder path (it cuts off the trailing slashes). In our cas=
e,
> >>>>> +when argv[0] is passed, it is always a filename without a trailing
> >>>>> +slash, so just cast the argument.
> >>>>> +
> >>>>> +Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/=
-/merge_requests/508]
> >>>>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >>>>> +---
> >>>>> + cmdline/apt-internal-solver.cc | 3 ++-
> >>>>> + 1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>> +
> >>>>> +diff --git a/cmdline/apt-internal-solver.cc b/cmdline/apt-internal=
-solver.cc
> >>>>> +index ceedd96c7..74ed38c50 100644
> >>>>> +--- a/cmdline/apt-internal-solver.cc
> >>>>> ++++ b/cmdline/apt-internal-solver.cc
> >>>>> +@@ -35,6 +35,7 @@
> >>>>> + #include <list>
> >>>>> + #include <sstream>
> >>>>> + #include <string>
> >>>>> ++#include <libgen.h>
> >>>>> + #include <unistd.h>
> >>>>> +
> >>>>> + #include <apti18n.h>
> >>>>> +@@ -119,7 +120,7 @@ int main(int argc,const char *argv[])         =
                             /*{{{*/
> >>>>> +               _config->Set("Debug::EDSP::WriteSolution", true);
> >>>>> +
> >>>>> +       _config->Set("APT::System", "Debian APT solver interface");
> >>>>> +-      if (strcmp(basename(argv[0]), "solver3") =3D=3D 0)
> >>>>> ++      if (strcmp(basename((char*)argv[0]), "solver3") =3D=3D 0)
> >>>>> +          _config->Set("APT::Solver", "3.0");
> >>>>> +       else if (_config->Find("APT::Solver") !=3D "3.0")
> >>>>> +          _config->Set("APT::Solver", "internal");
> >>>>> +--
> >>>>> +2.39.5
> >>>>> +
> >>>>> diff --git a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-=
include-cstdint-gcc-15.patch b/meta/recipes-devtools/apt/apt/0001-strutl-Ad=
d-missing-include-cstdint-gcc-15.patch
> >>>>> deleted file mode 100644
> >>>>> index b86ed8bb92..0000000000
> >>>>> --- a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include=
-cstdint-gcc-15.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,26 +0,0 @@
> >>>>> -From 9da1b0dbdcc90455bc9de49f73a96e7d18f83493 Mon Sep 17 00:00:00 =
2001
> >>>>> -From: Julian Andres Klode <julian.klode@canonical.com>
> >>>>> -Date: Tue, 18 Feb 2025 10:29:40 +0100
> >>>>> -Subject: [PATCH] strutl: Add missing #include <cstdint> [gcc 15]
> >>>>> -
> >>>>> -Closes: #1096322
> >>>>> -
> >>>>> -Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-=
/commit/f82dcd7e4ebb3f70d28e9feb3621676f8c0cc024]
> >>>>> -
> >>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>> ----
> >>>>> - apt-pkg/contrib/strutl.cc | 1 +
> >>>>> - 1 file changed, 1 insertion(+)
> >>>>> -
> >>>>> -diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
> >>>>> -index 67100f1..c0a1cbc 100644
> >>>>> ---- a/apt-pkg/contrib/strutl.cc
> >>>>> -+++ b/apt-pkg/contrib/strutl.cc
> >>>>> -@@ -26,6 +26,7 @@
> >>>>> -
> >>>>> - #include <algorithm>
> >>>>> - #include <array>
> >>>>> -+#include <cstdint>
> >>>>> - #include <iomanip>
> >>>>> - #include <limits>
> >>>>> - #include <locale>
> >>>>> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-=
devtools/apt/apt_3.0.3.bb
> >>>>> similarity index 88%
> >>>>> rename from meta/recipes-devtools/apt/apt_2.6.1.bb
> >>>>> rename to meta/recipes-devtools/apt/apt_3.0.3.bb
> >>>>> index b039599395..03a6869393 100644
> >>>>> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
> >>>>> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> >>>>> @@ -8,14 +8,9 @@ SECTION =3D "base"
> >>>>>  SRC_URI =3D "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
> >>>>>             file://triehash \
> >>>>>             file://0001-Disable-documentation-directory-altogether.=
patch \
> >>>>> -           file://0001-Fix-musl-build.patch \
> >>>>>             file://0001-CMakeLists.txt-avoid-changing-install-paths=
-based-on.patch \
> >>>>>             file://0001-cmake-Do-not-build-po-files.patch \
> >>>>> -           file://0001-aptwebserver.cc-Include-array.patch \
> >>>>> -           file://0001-Remove-using-std-binary_function.patch \
> >>>>> -           file://0001-strutl-Add-missing-include-cstdint-gcc-15.p=
atch \
> >>>>> -           file://0001-Raise-cmake_minimum_required-to-3.13-to-avo=
id-warnin.patch \
> >>>>> -           file://0001-Fix-compilation-error-with-clang-libc-18.pa=
tch \
> >>>>> +           file://0001-fix-compilation-with-musl.patch \
> >>>>>             "
> >>>>>
> >>>>>  SRC_URI:append:class-native =3D " \
> >>>>> @@ -28,7 +23,7 @@ SRC_URI:append:class-nativesdk =3D " \
> >>>>>             file://0001-Revert-always-run-dpkg-configure-a-at-the-e=
nd-of-our.patch \
> >>>>>             "
> >>>>>
> >>>>> -SRC_URI[sha256sum] =3D "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b9=
4ff0ac6631939ee68fa6fd"
> >>>>> +SRC_URI[sha256sum] =3D "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259=
518db412edefd95760e4ef"
> >>>>>  LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3Db234ee4d69f5fce4486=
a80fdaf4a4263"
> >>>>>
> >>>>>  # the package is taken from snapshots.debian.org; that source is s=
tatic and goes stale
> >>>>> @@ -47,7 +42,7 @@ USERADD_PARAM:${PN} =3D "--system --home /nonexis=
tent --no-create-home _apt"
> >>>>>
> >>>>>  BBCLASSEXTEND =3D "native nativesdk"
> >>>>>
> >>>>> -DEPENDS +=3D "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
> >>>>> +DEPENDS +=3D "db lz4 zlib bzip2 xz xxhash openssl"
> >>>>>
> >>>>>  EXTRA_OECMAKE:append =3D " -DCURRENT_VENDOR=3Ddebian -DWITH_DOC=3D=
False \
> >>>>>      -DDPKG_DATADIR=3D${datadir}/dpkg \
> >>>>> @@ -55,8 +50,14 @@ EXTRA_OECMAKE:append =3D " -DCURRENT_VENDOR=3Dde=
bian -DWITH_DOC=3DFalse \
> >>>>>      -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=3DTrue \
> >>>>>      -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=3DTrue \
> >>>>>      -DWITH_TESTS=3DFalse \
> >>>>> +    -DCOMMON_ARCH=3D${DPKG_ARCH} \
> >>>>>  "
> >>>>>
> >>>>> +PACKAGECONFIG ??=3D ""
> >>>>> +# usrmerge displays a runtime warning during package installation =
in case
> >>>>> +# the system doesn't have merged /usr folders.
> >>>>> +PACKAGECONFIG[usrmerge] =3D "-DREQUIRE_MERGED_USR=3DON,-DREQUIRE_M=
ERGED_USR=3DOFF"
> >>>>> +
> >>>>>  do_configure:prepend() {
> >>>>>         echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${=
WORKDIR}/toolchain.cmake
> >>>>>  }
> >>>>>
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>> Links: You receive all messages sent to this group.
> >>>>> View/Reply Online (#222880): https://lists.openembedded.org/g/opene=
mbedded-core/message/222880
> >>>>> Mute This Topic: https://lists.openembedded.org/mt/115050106/199791=
4
> >>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [raj.khem@gmail.com]
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>
>

