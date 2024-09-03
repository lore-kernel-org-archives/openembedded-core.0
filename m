Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDF5CD3420
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 11:50:20 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.21294.1725364211914574963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 04:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BOHNny0K;
 spf=pass (domain: mvista.com, ip: 209.85.128.181, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6d6a3ab427aso18192077b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725364211; x=1725969011; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kK5o9zc1YNmNT4AWNtEn+6vbqV2VADyslIRIw1lNWGI=;
        b=BOHNny0Ko89kJISxwmpb14RmNDH44rx0GumV0NJlkLuA7LsMf6xi4oRKEG3E6m8CNQ
         udGvmhVEbK5aGQw3YoN3MM6rkULAfUe/SBaio3yPF5Kowq8EYXkktdismkYivGk2ygMK
         59NI1JUUW+jLuykDbr6bGWakhz9EFMwvYJE3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364211; x=1725969011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK5o9zc1YNmNT4AWNtEn+6vbqV2VADyslIRIw1lNWGI=;
        b=KXRRiH+jSkNCiiDUVoJ0jpD02kFuekGxOlkc4fv5xrmCDSrPaBi3hEX/DKnzMn0yNT
         44FLB/ngKXbVTkvwbXJt869vVmAE0W5FAEY9MxPTr4TfYZ7vZdprb8y2HbKvhEVSczfq
         rpXGnB8uE8tfZ1IYgpfefcFRiy6bvCCnKlTseilZHb4nXxxY5Pzn25f9OUjPwjgFCEoz
         Pzd055fJ6qipfvV8oXbjOTO5a56LOVqLu2Vlsf8zv74r6gA08n8nmibXXNcjSz2Y95ra
         EnBZXJ/tt6S48US3E/qedvbdSiGqZ/+HvD4ppXr4QrCiI8+jNznlDwZMTx4tBpLU5VD+
         /qpQ==
X-Gm-Message-State: AOJu0YyX8LbqbCGvzMyUnoAsje7Mt6Le0ia3tpu1NqJbM3TcjHxD8/Uj
	nVQ5YpjDV/tVPUnCoX39IN0NbCVZhL4pddlz7SzM+tYq3qAUTCDF3ETFMTYlfmr1htllwMKp3gQ
	Zczgz0uhvCrQKaFsrsEHskkkUlMcUhMtQV8cHgwwHQTabbNqO
X-Google-Smtp-Source: AGHT+IEIi2YeFkcTsiJHOyUjmMoUhVRVFkIJz3NRyOmA08i4LxuWaYOViIrC8S3FFrF1N1RYlARmrfuN7FW1HIMRPLo=
X-Received: by 2002:a05:690c:3412:b0:6b5:916d:597 with SMTP id
 00721157ae682-6d40e287027mr109492787b3.22.1725364210673; Tue, 03 Sep 2024
 04:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240903084610.283818-1-hprajapati@mvista.com> <CANNYZj8FNUTbTkGc7Y7VVxw4yq6N3wmyNm-8XbHL-nZ9OX7jsw@mail.gmail.com>
In-Reply-To: <CANNYZj8FNUTbTkGc7Y7VVxw4yq6N3wmyNm-8XbHL-nZ9OX7jsw@mail.gmail.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Tue, 3 Sep 2024 17:19:58 +0530
Message-ID: <CACVbggH+FzrdubsFCyL+=05pUxkj4G_nm6YFEhFjsVaF6tq6Ew@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCHv2] rpm: Upgrade 4.17.1 -> 4.18rc1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e2c726062135a8f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 11:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204158

--000000000000e2c726062135a8f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thank you for feedback.

*meta-lts-mixins layer don't have any file or recipe for rpm. *
*How to summit change there ? *

If rpm 4.18.0 is already released 2 years ago,the anyone upgraded it
for kirkstone branch ? or How can i do that ??

Regards,
Hitendra


On Tue, 3 Sept, 2024, 2:25=E2=80=AFpm Alexander Kanavin, <alex.kanavin@gmai=
l.com>
wrote:

> I'm afraid this is a major upgrade, and it is not eligible for
> kirkstone proper, and has to go to meta-lts-mixins.
>
> Also, 4.18.0 final has been released two years ago, and there was also
> 4.18.1 and 4.18.2 with additional bugfixes.
>
> Alex
>
> On Tue, 3 Sept 2024 at 10:46, Hitendra Prajapati via
> lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > Includes fixes for CVE-2021-35937, CVE-2021-35938 and CVE-2021-35939
> > which can't be easily backported.
> >
> > Add a PACKAGECONFIG option for a new readline dependency and disable
> > it by default since it pulls in GPLv3 and that breaks a number of
> > our test configurations as things stand.
> >
> > Refresh patches and drop the error.h patch as error() no longer used.
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
> >  ...olor-setting-for-mips64_n32-binaries.patch | 22 +++---
> >  ...satisfiable-dependency-when-building.patch | 10 +--
> >  ...lib-rpm-as-the-installation-path-for.patch | 26 +++----
> >  ...1-Do-not-read-config-files-from-HOME.patch | 11 ++-
> >  ...-PATH-environment-variable-before-ru.patch | 10 +--
> >  ...lling-execute-package-scriptlets-wit.patch | 20 +++---
> >  ...not-insert-payloadflags-into-.rpm-me.patch |  8 +--
> >  ...-linux-gnux32-variant-to-triplet-han.patch | 17 ++---
> >  ...o-not-build-manpages-requires-pandoc.patch | 11 ++-
> >  ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++--
> >  ...tools-Add-error.h-for-non-glibc-case.patch | 71 -------------------
> >  ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 17 ++---
> >  ...ge-logging-level-around-scriptlets-t.patch | 16 ++---
> >  meta/recipes-devtools/rpm/files/fifofix.patch | 22 ++++++
> >  meta/recipes-devtools/rpm/rpm_4.17.1.bb       | 10 ++-
> >  15 files changed, 113 insertions(+), 171 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case=
.patch
> >  create mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch
> >
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> > index 331ea849e6..9f5dde0720 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> > @@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   rpmrc.in      | 2 ++
> >   2 files changed, 6 insertions(+)
> >
> > -diff --git a/build/rpmfc.c b/build/rpmfc.c
> > -index 10c380ee9..b7655aa93 100644
> > ---- a/build/rpmfc.c
> > -+++ b/build/rpmfc.c
> > -@@ -639,6 +639,7 @@ exit:
> > +Index: git/build/rpmfc.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/build/rpmfc.c
> > ++++ git/build/rpmfc.c
> > +@@ -645,6 +645,7 @@ exit:
> >   static const struct rpmfcTokens_s rpmfcTokens[] =3D {
> >     { "directory",              RPMFC_INCLUDE },
> >
> > @@ -23,7 +23,7 @@ index 10c380ee9..b7655aa93 100644
> >     { "ELF 32-bit",             RPMFC_ELF32|RPMFC_INCLUDE },
> >     { "ELF 64-bit",             RPMFC_ELF64|RPMFC_INCLUDE },
> >
> > -@@ -1149,6 +1150,9 @@ static uint32_t getElfColor(const char *fn)
> > +@@ -1150,6 +1151,9 @@ static uint32_t getElfColor(const char *
> >                 color =3D RPMFC_ELF32;
> >                 break;
> >             }
> > @@ -33,11 +33,11 @@ index 10c380ee9..b7655aa93 100644
> >             elf_end(elf);
> >         }
> >         close(fd);
> > -diff --git a/rpmrc.in b/rpmrc.in
> > -index 5bd9ba3e5..f15bb8dad 100644
> > ---- a/rpmrc.in
> > -+++ b/rpmrc.in
> > -@@ -137,6 +137,8 @@ archcolor: mipsr6el 1
> > +Index: git/rpmrc.in
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/rpmrc.in
> > ++++ git/rpmrc.in
> > +@@ -139,6 +139,8 @@ archcolor: mipsr6el 1
> >   archcolor: mips64r6 2
> >   archcolor: mips64r6el 2
> >
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> > index 4029233fb7..8440c3516d 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> > @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   build/pack.c | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > -diff --git a/build/pack.c b/build/pack.c
> > -index e6cec1816..810cd7351 100644
> > ---- a/build/pack.c
> > -+++ b/build/pack.c
> > -@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec, Package
> pkg, const char *cookie, int ch
> > +Index: git/build/pack.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/build/pack.c
> > ++++ git/build/pack.c
> > +@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spec,
> >         headerPutBin(pkg->header, RPMTAG_SOURCEPKGID,
> spec->sourcePkgId,16);
> >       }
> >
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> > index c6cf9d4c88..6f613d0a7d 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> > @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   rpm.am       | 4 ++--
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > -diff --git a/configure.ac b/configure.ac
> > -index 372875fc4..1b7add9ee 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -884,7 +884,7 @@ else
> > +Index: git/configure.ac
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/configure.ac
> > ++++ git/configure.ac
> > +@@ -942,7 +942,7 @@ else
> >       usrprefix=3D$prefix
> >   fi
> >
> > @@ -26,10 +26,10 @@ index 372875fc4..1b7add9ee 100644
> >   AC_SUBST(RPMCONFIGDIR)
> >
> >   AC_SUBST(OBJDUMP)
> > -diff --git a/macros.in b/macros.in
> > -index d53ab5ed5..9d10441c8 100644
> > ---- a/macros.in
> > -+++ b/macros.in
> > +Index: git/macros.in
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/macros.in
> > ++++ git/macros.in
> >  @@ -911,7 +911,7 @@ package or when debugging this package.\
> >   %_sharedstatedir      %{_prefix}/com
> >   %_localstatedir               %{_prefix}/var
> > @@ -39,10 +39,10 @@ index d53ab5ed5..9d10441c8 100644
> >   %_includedir          %{_prefix}/include
> >   %_infodir             %{_datadir}/info
> >   %_mandir              %{_datadir}/man
> > -diff --git a/rpm.am b/rpm.am
> > -index ebe4e40d1..e6920e258 100644
> > ---- a/rpm.am
> > -+++ b/rpm.am
> > +Index: git/rpm.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/rpm.am
> > ++++ git/rpm.am
> >  @@ -1,10 +1,10 @@
> >   # Internal binaries
> >   ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> > index 96eb418952..fda64eefe0 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> > @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   lib/rpmrc.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > -diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> > -index 4ed991321..19fe80f98 100644
> > ---- a/lib/rpmrc.c
> > -+++ b/lib/rpmrc.c
> > +Index: git/lib/rpmrc.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/rpmrc.c
> > ++++ git/lib/rpmrc.c
> >  @@ -458,8 +458,7 @@ static void setDefaults(void)
> >       if (!defrcfiles) {
> >         defrcfiles =3D rstrscat(NULL, confdir, "/rpmrc", ":",
> > @@ -33,6 +33,3 @@ index 4ed991321..19fe80f98 100644
> >       }
> >   #else
> >       macrofiles =3D MACROFILES;
> > ---
> > -2.11.0
> > -
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> > index 41cdf6ed77..ae24b663aa 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> > @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   lib/rpmscript.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> > -index 6a31e0d..2b0e438 100644
> > ---- a/lib/rpmscript.c
> > -+++ b/lib/rpmscript.c
> > -@@ -184,7 +184,7 @@ static void doScriptExec(ARGV_const_t argv,
> ARGV_const_t prefixes,
> > +Index: git/lib/rpmscript.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/rpmscript.c
> > ++++ git/lib/rpmscript.c
> > +@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t ar
> >         if (ipath && ipath[5] !=3D '%')
> >             path =3D ipath;
> >
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > index 2a0069cafe..bd3314a90f 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > @@ -28,9 +28,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   lib/rpmscript.c | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > ---- a/lib/rpmscript.c
> > -+++ b/lib/rpmscript.c
> > -@@ -17,7 +17,7 @@
> > +Index: git/lib/rpmscript.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/rpmscript.c
> > ++++ git/lib/rpmscript.c
> > +@@ -18,7 +18,7 @@
> >   #include "rpmio/rpmio_internal.h"
> >
> >   #include "lib/rpmplugins.h"     /* rpm plugins hooks */
> > @@ -39,7 +41,7 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   #include "debug.h"
> >
> >   struct scriptNextFileFunc_s {
> > -@@ -391,8 +391,7 @@ exit:
> > +@@ -427,8 +427,7 @@ exit:
> >         Fclose(out);    /* XXX dup'd STDOUT_FILENO */
> >
> >       if (fn) {
> > @@ -49,18 +51,18 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >         free(fn);
> >       }
> >       free(mline);
> > -@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
> > +@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, int
> >
> >       if (rc !=3D RPMRC_FAIL) {
> >         if (script_type & RPMSCRIPTLET_EXEC) {
> > --          rc =3D runExtScript(plugins, prefixes, script->descr, lvl,
> scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> > +-          rc =3D runExtScript(plugins, prefixes, script->descr, lvl,
> scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
> >  +          if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") !=3D NULL) {
> >  +              rpmChrootOut();
> > -+              rc =3D runExtScript(plugins, prefixes, script->descr, l=
vl,
> scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> > ++              rc =3D runExtScript(plugins, prefixes, script->descr, l=
vl,
> scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
> >  +              rpmChrootIn();
> >  +          } else {
> > -+              rc =3D runExtScript(plugins, prefixes, script->descr, l=
vl,
> scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> > ++              rc =3D runExtScript(plugins, prefixes, script->descr, l=
vl,
> scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
> >  +          }
> >         } else {
> > -           rc =3D runLuaScript(plugins, prefixes, script->descr, lvl,
> scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> > +           rc =3D runLuaScript(plugins, prefixes, script->descr, lvl,
> scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
> >         }
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> > index 79b168257e..64433abb6a 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> > @@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.d=
e
> >
> >   build/pack.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/build/pack.c b/build/pack.c
> > -index 932cb213e..b45d0726f 100644
> > ---- a/build/pack.c
> > -+++ b/build/pack.c
> > +Index: git/build/pack.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/build/pack.c
> > ++++ git/build/pack.c
> >  @@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
> >             headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR,
> compr);
> >         buf =3D xstrdup(rpmio_flags);
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> > index 2174a79e75..29b6686a94 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> > @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.d=
e
> >
> >   configure.ac | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > -diff --git a/configure.ac b/configure.ac
> > -index 372875fc49..7d6a3d274e 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -845,6 +845,10 @@ if echo "$host_os" | grep '.*-gnuabi64$' >
> /dev/null ; then
> > -       host_os=3D`echo "${host_os}" | sed 's/-gnuabi64$//'`
> > -       host_os_gnu=3D-gnuabi64
> > +Index: git/configure.ac
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/configure.ac
> > ++++ git/configure.ac
> > +@@ -903,6 +903,10 @@ if echo "$host_os" | grep '.*-gnux32$' >
> > +       host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> > +       host_os_gnu=3D-gnux32
> >   fi
> >  +if echo "$host_os" | grep '.*-gnux32$' > /dev/null ; then
> >  +      host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> > @@ -26,6 +26,3 @@ index 372875fc49..7d6a3d274e 100644
> >   if echo "$host_os" | grep '.*-gnu$' > /dev/null ; then
> >         host_os=3D`echo "${host_os}" | sed 's/-gnu$//'`
> >   fi
> > ---
> > -2.30.2
> > -
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-require=
s-pandoc.patch
> b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-require=
s-pandoc.patch
> > index ced52d1007..d7137f1d10 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-require=
s-pandoc.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-require=
s-pandoc.patch
> > @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   docs/Makefile.am | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > -diff --git a/docs/Makefile.am b/docs/Makefile.am
> > -index 5a6bd203a..6257767fd 100644
> > ---- a/docs/Makefile.am
> > -+++ b/docs/Makefile.am
> > +Index: git/docs/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/docs/Makefile.am
> > ++++ git/docs/Makefile.am
> >  @@ -1,7 +1,5 @@
> >   ## Process this file with automake to produce Makefile.in
> >
> > @@ -21,6 +21,3 @@ index 5a6bd203a..6257767fd 100644
> >   EXTRA_DIST =3D
> >
> >   EXTRA_DIST +=3D \
> > ---
> > -2.32.0
> > -
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> > index 6678c105cd..82e6567dc7 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> > @@ -31,11 +31,11 @@ Signed-off-by: Changqing Li <
> changqing.li@windriver.com>
> >   lib/transaction.c | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > -diff --git a/lib/transaction.c b/lib/transaction.c
> > -index 67b9db5..82386b8 100644
> > ---- a/lib/transaction.c
> > -+++ b/lib/transaction.c
> > -@@ -391,7 +391,18 @@ static int handleColorConflict(rpmts ts,
> > +Index: git/lib/transaction.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/transaction.c
> > ++++ git/lib/transaction.c
> > +@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts ts,
> >                     rpmfsSetAction(ofs, ofx, FA_CREATE);
> >                 rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
> >                 rConflicts =3D 0;
> > @@ -55,6 +55,3 @@ index 67b9db5..82386b8 100644
> >         }
> >       }
> >
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> > deleted file mode 100644
> > index 9783396639..0000000000
> > ---
> a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> > +++ /dev/null
> > @@ -1,71 +0,0 @@
> > -From 9b9d717f484ec913cdd3804e43489b3dc18bd77c Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 31 Oct 2020 22:14:05 -0700
> > -Subject: [PATCH] tools: Add error.h for non-glibc case
> > -
> > -error is glibc specific API, so this patch will mostly not accepted
> > -upstream given that elfutils has been closely tied to glibc
> > -
> > -Upstream-Status: Inappropriate [workaround for musl]
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > ----
> > - tools/elfdeps.c |  6 +++++-
> > - tools/error.h   | 27 +++++++++++++++++++++++++++
> > - 2 files changed, 32 insertions(+), 1 deletion(-)
> > - create mode 100644 tools/error.h
> > -
> > -diff --git a/tools/elfdeps.c b/tools/elfdeps.c
> > -index d205935bb..3a8945b33 100644
> > ---- a/tools/elfdeps.c
> > -+++ b/tools/elfdeps.c
> > -@@ -5,10 +5,14 @@
> > - #include <unistd.h>
> > - #include <stdlib.h>
> > - #include <fcntl.h>
> > --#include <error.h>
> > - #include <errno.h>
> > - #include <popt.h>
> > - #include <gelf.h>
> > -+#ifdef __GLIBC__
> > -+#include <error.h>
> > -+#else
> > -+#include "error.h"
> > -+#endif
> > -
> > - #include <rpm/rpmstring.h>
> > - #include <rpm/argv.h>
> > -diff --git a/tools/error.h b/tools/error.h
> > -new file mode 100644
> > -index 000000000..ef06827a0
> > ---- /dev/null
> > -+++ b/tools/error.h
> > -@@ -0,0 +1,27 @@
> > -+#ifndef _ERROR_H_
> > -+#define _ERROR_H_
> > -+
> > -+#include <stdarg.h>
> > -+#include <stdio.h>
> > -+#include <stdlib.h>
> > -+#include <string.h>
> > -+#include <errno.h>
> > -+
> > -+static unsigned int error_message_count =3D 0;
> > -+
> > -+static inline void error(int status, int errnum, const char* format,
> ...)
> > -+{
> > -+      va_list ap;
> > -+      fprintf(stderr, "%s: ", program_invocation_name);
> > -+      va_start(ap, format);
> > -+      vfprintf(stderr, format, ap);
> > -+      va_end(ap);
> > -+      if (errnum)
> > -+              fprintf(stderr, ": %s", strerror(errnum));
> > -+      fprintf(stderr, "\n");
> > -+      error_message_count++;
> > -+      if (status)
> > -+              exit(status);
> > -+}
> > -+
> > -+#endif        /* _ERROR_H_ */
> > diff --git
> a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> > index b3dbc319b6..2fe96a839c 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> > @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   lib/rpmrc.c | 19 ++++++++++++++-----
> >   1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > -diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> > -index 19fe80f98..6b27b3941 100644
> > ---- a/lib/rpmrc.c
> > -+++ b/lib/rpmrc.c
> > -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char *
> name,
> > +Index: git/lib/rpmrc.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/rpmrc.c
> > ++++ git/lib/rpmrc.c
> > +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const
> >   static void setDefaults(void)
> >   {
> >       const char *confdir =3D rpmConfigDir();
> > @@ -46,7 +46,7 @@ index 19fe80f98..6b27b3941 100644
> >       }
> >   #else
> >       macrofiles =3D MACROFILES;
> > -@@ -989,7 +993,11 @@ static void read_auxv(void)
> > +@@ -997,7 +1001,11 @@ static void read_auxv(void)
> >    */
> >   static void defaultMachine(rpmrcCtx ctx, const char ** arch, const
> char ** os)
> >   {
> > @@ -59,7 +59,7 @@ index 19fe80f98..6b27b3941 100644
> >       static struct utsname un;
> >       char * chptr;
> >       canonEntry canon;
> > -@@ -1286,6 +1294,7 @@ static void defaultMachine(rpmrcCtx ctx, const
> char ** arch, const char ** os)
> > +@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx ctx,
> >
> >       if (arch) *arch =3D un.machine;
> >       if (os) *os =3D un.sysname;
> > @@ -67,6 +67,3 @@ index 19fe80f98..6b27b3941 100644
> >   }
> >
> >   static
> > ---
> > -2.11.0
> > -
> > diff --git
> a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> > index 43e9859ef3..9dbe7125de 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> > @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   lib/rpmscript.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> > -index 2b0e43862..e319673f1 100644
> > ---- a/lib/rpmscript.c
> > -+++ b/lib/rpmscript.c
> > -@@ -226,7 +226,7 @@ static char * writeScript(const char *cmd, const
> char *script)
> > +Index: git/lib/rpmscript.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/rpmscript.c
> > ++++ git/lib/rpmscript.c
> > +@@ -270,7 +270,7 @@ static char * writeScript(const char *cm
> >       if (Ferror(fd))
> >         goto exit;
> >
> > @@ -26,7 +26,7 @@ index 2b0e43862..e319673f1 100644
> >         static const char set_x[] =3D "set -x\n";
> >         /* Assume failures will be caught by the write below */
> >         Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> > -@@ -258,7 +258,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> > +@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins plu
> >       char *mline =3D NULL;
> >       rpmRC rc =3D RPMRC_FAIL;
> >
> > @@ -35,7 +35,7 @@ index 2b0e43862..e319673f1 100644
> >
> >       if (script) {
> >         fn =3D writeScript(*argvp[0], script);
> > -@@ -310,7 +310,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> > +@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins plu
> >                 sname, strerror(errno));
> >         goto exit;
> >       } else if (pid =3D=3D 0) {/* Child */
> > @@ -44,7 +44,7 @@ index 2b0e43862..e319673f1 100644
> >                sname, *argvp[0], (unsigned)getpid());
> >
> >         fclose(in);
> > -@@ -353,7 +353,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> > +@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins plu
> >         reaped =3D waitpid(pid, &status, 0);
> >       } while (reaped =3D=3D -1 && errno =3D=3D EINTR);
> >
> > diff --git a/meta/recipes-devtools/rpm/files/fifofix.patch
> b/meta/recipes-devtools/rpm/files/fifofix.patch
> > new file mode 100644
> > index 0000000000..71703d7f0c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rpm/files/fifofix.patch
> > @@ -0,0 +1,22 @@
> > +Calling openat() on a fifo causes a pseudo hang for us (e.g. the fifo
> in psplash).
> > +Avoid calling openat for fifos.
> > +
> > +Introduced upstream with:
> > +
> > +
> https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e13=
7a2d5eb23b83a6377d556
> > +
> > +Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/issues/2195]
> > +
> > +Index: git/lib/fsm.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/lib/fsm.c
> > ++++ git/lib/fsm.c
> > +@@ -1010,7 +1010,7 @@ int rpmPackageFilesInstall(rpmts ts, rpm
> > +                     rc =3D RPMERR_UNKNOWN_FILETYPE;
> > +             }
> > +
> > +-          if (!rc && fd =3D=3D -1 && !S_ISLNK(fp->sb.st_mode)) {
> > ++          if (!rc && fd =3D=3D -1 && !S_ISLNK(fp->sb.st_mode) &&
> !S_ISFIFO(fp->sb.st_mode)) {
> > +               /* Only follow safe symlinks, and never on temporary
> files */
> > +               fd =3D fsmOpenat(di.dirfd, fp->fpath,
> > +                               fp->suffix ? AT_SYMLINK_NOFOLLOW : 0, 0=
);
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > index 9b6446f265..36ab90d91e 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > @@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc4eec0c20c6034b9407a09945b4=
8a43f"
> >
> > -SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.17.x;protocol=3Dhtt=
ps \
> > +SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;protocol=3Dhtt=
ps \
> >             file://environment.d-rpm.sh \
> >
>  file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
> >             file://0001-Do-not-read-config-files-from-HOME.patch \
> > @@ -36,14 +36,17 @@ SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.17.x;protoc
> >             file://0001-perl-disable-auto-reqs.patch \
> >
>  file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> >
>  file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
> > -           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
> >             file://0001-docs-do-not-build-manpages-requires-pandoc.patc=
h
> \
> >
>  file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
> >
>  file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
> > +           file://fifofix.patch \
> >             "
> >
> >  PE =3D "1"
> > -SRCREV =3D "5bef402da334595ed9302b8bca1acdf5e88bfe11"
> > +SRCREV =3D "07a6cca98489106b93467ecfaf5700368983a9b4"
> > +PV =3D "4.17.1+4.18-rc1"
> > +# can be removed in 4.18
> > +CVE_CHECK_IGNORE +=3D "CVE-2021-35937 CVE-2021-35938 CVE-2021-35939"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -80,6 +83,7 @@ PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-uti=
ls"
> >  PACKAGECONFIG[inhibit] =3D
> "--enable-inhibit-plugin,--disable-inhibit-plugin,dbus"
> >  PACKAGECONFIG[rpm2archive] =3D
> "--with-archive,--without-archive,libarchive"
> >  PACKAGECONFIG[sqlite] =3D "--enable-sqlite=3Dyes,--enable-sqlite=3Dno,=
sqlite3"
> > +PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readli=
ne"
> >  PACKAGECONFIG[ndb] =3D "--enable-ndb,--disable-ndb"
> >  PACKAGECONFIG[bdb-ro] =3D "--enable-bdb-ro,--disable-bdb-ro"
> >  PACKAGECONFIG[zstd] =3D "--enable-zstd=3Dyes,--enable-zstd=3Dno,zstd"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204152):
> https://lists.openembedded.org/g/openembedded-core/message/204152
> > Mute This Topic: https://lists.openembedded.org/mt/108241734/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000e2c726062135a8f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p style=3D"font-size:12.8px">Hi Alex,</p><p style=3D"fon=
t-size:12.8px">Thank you for feedback.</p><pre style=3D"text-wrap: wrap;"><=
b>meta-lts-mixins layer don&#39;t have any file or recipe for rpm. </b>

<b>How to summit change there ? </b>

If rpm 4.18.0 is already released 2 years ago,the anyone upgraded it for ki=
rkstone branch ? or How can i do that ??

Regards,
Hitendra</pre></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 3 Sept, 2024, 2:25=E2=80=AFpm Alexander Kanavin, &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">I&#39;m afraid this is a maj=
or upgrade, and it is not eligible for<br>
kirkstone proper, and has to go to meta-lts-mixins.<br>
<br>
Also, 4.18.0 final has been released two years ago, and there was also<br>
4.18.1 and 4.18.2 with additional bugfixes.<br>
<br>
Alex<br>
<br>
On Tue, 3 Sept 2024 at 10:46, Hitendra Prajapati via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;hprajapati=3D<a href=3D"mailt=
o:mvista.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">m=
vista.com@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Includes fixes for CVE-2021-35937, CVE-2021-35938 and CVE-2021-35939<b=
r>
&gt; which can&#39;t be easily backported.<br>
&gt;<br>
&gt; Add a PACKAGECONFIG option for a new readline dependency and disable<b=
r>
&gt; it by default since it pulls in GPLv3 and that breaks a number of<br>
&gt; our test configurations as things stand.<br>
&gt;<br>
&gt; Refresh patches and drop the error.h patch as error() no longer used.<=
br>
&gt;<br>
&gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvi=
sta.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 ...olor-setting-for-mips64_n32-binaries.patch | 22 +++---<br>
&gt;=C2=A0 ...satisfiable-dependency-when-building.patch | 10 +--<br>
&gt;=C2=A0 ...lib-rpm-as-the-installation-path-for.patch | 26 +++----<br>
&gt;=C2=A0 ...1-Do-not-read-config-files-from-HOME.patch | 11 ++-<br>
&gt;=C2=A0 ...-PATH-environment-variable-before-ru.patch | 10 +--<br>
&gt;=C2=A0 ...lling-execute-package-scriptlets-wit.patch | 20 +++---<br>
&gt;=C2=A0 ...not-insert-payloadflags-into-.rpm-me.patch |=C2=A0 8 +--<br>
&gt;=C2=A0 ...-linux-gnux32-variant-to-triplet-han.patch | 17 ++---<br>
&gt;=C2=A0 ...o-not-build-manpages-requires-pandoc.patch | 11 ++-<br>
&gt;=C2=A0 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++--<br>
&gt;=C2=A0 ...tools-Add-error.h-for-non-glibc-case.patch | 71 -------------=
------<br>
&gt;=C2=A0 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 17 ++---<br>
&gt;=C2=A0 ...ge-logging-level-around-scriptlets-t.patch | 16 ++---<br>
&gt;=C2=A0 meta/recipes-devtools/rpm/files/fifofix.patch | 22 ++++++<br>
&gt;=C2=A0 meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">rpm_4.17.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 10 ++-<br>
&gt;=C2=A0 15 files changed, 113 insertions(+), 171 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/0001-tools-Ad=
d-error.h-for-non-glibc-case.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch=
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-=
for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-=
color-setting-for-mips64_n32-binaries.patch<br>
&gt; index 331ea849e6..9f5dde0720 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mip=
s64_n32-binaries.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mip=
s64_n32-binaries.patch<br>
&gt; @@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer" =
target=3D"_blank">rpmrc.in</a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+)<br>
&gt;<br>
&gt; -diff --git a/build/rpmfc.c b/build/rpmfc.c<br>
&gt; -index 10c380ee9..b7655aa93 100644<br>
&gt; ---- a/build/rpmfc.c<br>
&gt; -+++ b/build/rpmfc.c<br>
&gt; -@@ -639,6 +639,7 @@ exit:<br>
&gt; +Index: git/build/rpmfc.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/build/rpmfc.c<br>
&gt; ++++ git/build/rpmfc.c<br>
&gt; +@@ -645,6 +645,7 @@ exit:<br>
&gt;=C2=A0 =C2=A0static const struct rpmfcTokens_s rpmfcTokens[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;directory&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 RPMFC_INCLUDE },<br>
&gt;<br>
&gt; @@ -23,7 +23,7 @@ index 10c380ee9..b7655aa93 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;ELF 32-bit&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0RPMFC_ELF32|RPMFC_INCLUDE },<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;ELF 64-bit&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0RPMFC_ELF64|RPMFC_INCLUDE },<br>
&gt;<br>
&gt; -@@ -1149,6 +1150,9 @@ static uint32_t getElfColor(const char *fn)<br>
&gt; +@@ -1150,6 +1151,9 @@ static uint32_t getElfColor(const char *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0color =3D=
 RPMFC_ELF32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -33,11 +33,11 @@ index 10c380ee9..b7655aa93 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_end(elf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt; -diff --git a/<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer=
" target=3D"_blank">rpmrc.in</a> b/<a href=3D"http://rpmrc.in" rel=3D"noref=
errer noreferrer" target=3D"_blank">rpmrc.in</a><br>
&gt; -index 5bd9ba3e5..f15bb8dad 100644<br>
&gt; ---- a/<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">rpmrc.in</a><br>
&gt; -+++ b/<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">rpmrc.in</a><br>
&gt; -@@ -137,6 +137,8 @@ archcolor: mipsr6el 1<br>
&gt; +Index: git/<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer" =
target=3D"_blank">rpmrc.in</a><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer=
" target=3D"_blank">rpmrc.in</a><br>
&gt; ++++ git/<a href=3D"http://rpmrc.in" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">rpmrc.in</a><br>
&gt; +@@ -139,6 +139,8 @@ archcolor: mipsr6el 1<br>
&gt;=C2=A0 =C2=A0archcolor: mips64r6 2<br>
&gt;=C2=A0 =C2=A0archcolor: mips64r6el 2<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsati=
sfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/00=
01-Do-not-add-an-unsatisfiable-dependency-when-building.patch<br>
&gt; index 4029233fb7..8440c3516d 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable=
-dependency-when-building.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable=
-dependency-when-building.patch<br>
&gt; @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0build/pack.c | 4 ----<br>
&gt;=C2=A0 =C2=A01 file changed, 4 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/build/pack.c b/build/pack.c<br>
&gt; -index e6cec1816..810cd7351 100644<br>
&gt; ---- a/build/pack.c<br>
&gt; -+++ b/build/pack.c<br>
&gt; -@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec, Package=
 pkg, const char *cookie, int ch<br>
&gt; +Index: git/build/pack.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/build/pack.c<br>
&gt; ++++ git/build/pack.c<br>
&gt; +@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spec,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutBin(pkg-&gt;header, RPMTAG_S=
OURCEPKGID, spec-&gt;sourcePkgId,16);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-=
rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/00=
01-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch<br>
&gt; index c6cf9d4c88..6f613d0a7d 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-=
the-installation-path-for.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-=
the-installation-path-for.patch<br>
&gt; @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">rpm.am</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 =C2=A03 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" =
rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 372875fc4..1b7add9ee 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
&gt; -@@ -884,7 +884,7 @@ else<br>
&gt; +Index: git/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">configure.ac</a><br>
&gt; ++++ git/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">configure.ac</a><br>
&gt; +@@ -942,7 +942,7 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0usrprefix=3D$prefix<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;<br>
&gt; @@ -26,10 +26,10 @@ index 372875fc4..1b7add9ee 100644<br>
&gt;=C2=A0 =C2=A0AC_SUBST(RPMCONFIGDIR)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0AC_SUBST(OBJDUMP)<br>
&gt; -diff --git a/<a href=3D"http://macros.in" rel=3D"noreferrer noreferre=
r" target=3D"_blank">macros.in</a> b/<a href=3D"http://macros.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">macros.in</a><br>
&gt; -index d53ab5ed5..9d10441c8 100644<br>
&gt; ---- a/<a href=3D"http://macros.in" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">macros.in</a><br>
&gt; -+++ b/<a href=3D"http://macros.in" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">macros.in</a><br>
&gt; +Index: git/<a href=3D"http://macros.in" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">macros.in</a><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/<a href=3D"http://macros.in" rel=3D"noreferrer noreferre=
r" target=3D"_blank">macros.in</a><br>
&gt; ++++ git/<a href=3D"http://macros.in" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">macros.in</a><br>
&gt;=C2=A0 @@ -911,7 +911,7 @@ package or when debugging this package.\<br>
&gt;=C2=A0 =C2=A0%_sharedstatedir=C2=A0 =C2=A0 =C2=A0 %{_prefix}/com<br>
&gt;=C2=A0 =C2=A0%_localstatedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0%{_prefix}/var<br>
&gt; @@ -39,10 +39,10 @@ index d53ab5ed5..9d10441c8 100644<br>
&gt;=C2=A0 =C2=A0%_includedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %{_prefix}/=
include<br>
&gt;=C2=A0 =C2=A0%_infodir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%=
{_datadir}/info<br>
&gt;=C2=A0 =C2=A0%_mandir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
{_datadir}/man<br>
&gt; -diff --git a/<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" =
target=3D"_blank">rpm.am</a> b/<a href=3D"http://rpm.am" rel=3D"noreferrer =
noreferrer" target=3D"_blank">rpm.am</a><br>
&gt; -index ebe4e40d1..e6920e258 100644<br>
&gt; ---- a/<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" target=
=3D"_blank">rpm.am</a><br>
&gt; -+++ b/<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" target=
=3D"_blank">rpm.am</a><br>
&gt; +Index: git/<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">rpm.am</a><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" =
target=3D"_blank">rpm.am</a><br>
&gt; ++++ git/<a href=3D"http://rpm.am" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">rpm.am</a><br>
&gt;=C2=A0 @@ -1,10 +1,10 @@<br>
&gt;=C2=A0 =C2=A0# Internal binaries<br>
&gt;=C2=A0 =C2=A0## HACK: It probably should be $(libexecdir)/rpm or $(libd=
ir)/rpm<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-f=
iles-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-con=
fig-files-from-HOME.patch<br>
&gt; index 96eb418952..fda64eefe0 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-fr=
om-HOME.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-fr=
om-HOME.patch<br>
&gt; @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavi=
n@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0lib/rpmrc.c | 6 ++----<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/lib/rpmrc.c b/lib/rpmrc.c<br>
&gt; -index 4ed991321..19fe80f98 100644<br>
&gt; ---- a/lib/rpmrc.c<br>
&gt; -+++ b/lib/rpmrc.c<br>
&gt; +Index: git/lib/rpmrc.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/rpmrc.c<br>
&gt; ++++ git/lib/rpmrc.c<br>
&gt;=C2=A0 @@ -458,8 +458,7 @@ static void setDefaults(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!defrcfiles) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defrcfiles =3D rstrscat(NULL, confdir=
, &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; @@ -33,6 +33,3 @@ index 4ed991321..19fe80f98 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0macrofiles =3D MACROFILES;<br>
&gt; ---<br>
&gt; -2.11.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PAT=
H-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/00=
01-Do-not-reset-the-PATH-environment-variable-before-ru.patch<br>
&gt; index 41cdf6ed77..ae24b663aa 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-envir=
onment-variable-before-ru.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-envir=
onment-variable-before-ru.patch<br>
&gt; @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0lib/rpmscript.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; -diff --git a/lib/rpmscript.c b/lib/rpmscript.c<br>
&gt; -index 6a31e0d..2b0e438 100644<br>
&gt; ---- a/lib/rpmscript.c<br>
&gt; -+++ b/lib/rpmscript.c<br>
&gt; -@@ -184,7 +184,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_=
const_t prefixes,<br>
&gt; +Index: git/lib/rpmscript.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/rpmscript.c<br>
&gt; ++++ git/lib/rpmscript.c<br>
&gt; +@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t ar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ipath &amp;&amp; ipath[5] !=3D &#=
39;%&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D ipath;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installin=
g-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/00=
01-When-cross-installing-execute-package-scriptlets-wit.patch<br>
&gt; index 2a0069cafe..bd3314a90f 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execu=
te-package-scriptlets-wit.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execu=
te-package-scriptlets-wit.patch<br>
&gt; @@ -28,9 +28,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanav=
in@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0lib/rpmscript.c | 11 ++++++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; ---- a/lib/rpmscript.c<br>
&gt; -+++ b/lib/rpmscript.c<br>
&gt; -@@ -17,7 +17,7 @@<br>
&gt; +Index: git/lib/rpmscript.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/rpmscript.c<br>
&gt; ++++ git/lib/rpmscript.c<br>
&gt; +@@ -18,7 +18,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;rpmio/rpmio_internal.h&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#include &quot;lib/rpmplugins.h&quot;=C2=A0 =C2=A0 =C2=A0/=
* rpm plugins hooks */<br>
&gt; @@ -39,7 +41,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavi=
n@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0#include &quot;debug.h&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0struct scriptNextFileFunc_s {<br>
&gt; -@@ -391,8 +391,7 @@ exit:<br>
&gt; +@@ -427,8 +427,7 @@ exit:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fclose(out);=C2=A0 =C2=A0 /* XXX dup&=
#39;d STDOUT_FILENO */<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fn) {<br>
&gt; @@ -49,18 +51,18 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(fn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0free(mline);<br>
&gt; -@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int<br>
&gt; +@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, int<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D RPMRC_FAIL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (script_type &amp; RPMSCRIPTLET_EX=
EC) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript(plugins, pref=
ixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;body, arg1, ar=
g2, &amp;script-&gt;nextFileFunc);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript(plugins, pref=
ixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;body, arg1, ar=
g2, script-&gt;nextFileFunc);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (getenv(&quot;RPM_NO_CHRO=
OT_FOR_SCRIPTS&quot;) !=3D NULL) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmChrootOut()=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript=
(plugins, prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;=
body, arg1, arg2, &amp;script-&gt;nextFileFunc);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript=
(plugins, prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;=
body, arg1, arg2, script-&gt;nextFileFunc);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmChrootIn();=
<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript=
(plugins, prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;=
body, arg1, arg2, &amp;script-&gt;nextFileFunc);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript=
(plugins, prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;=
body, arg1, arg2, script-&gt;nextFileFunc);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D runLuaScript(plugins,=
 prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;body, arg=
1, arg2, &amp;script-&gt;nextFileFunc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D runLuaScript(plugins,=
 prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;body, arg=
1, arg2, script-&gt;nextFileFunc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-=
insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/00=
01-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch<br>
&gt; index 79b168257e..64433abb6a 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-=
payloadflags-into-.rpm-me.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-=
payloadflags-into-.rpm-me.patch<br>
&gt; @@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex@linutronix.de" target=3D"_blank" rel=3D"noreferrer">alex@linutron=
ix.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0build/pack.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; -diff --git a/build/pack.c b/build/pack.c<br>
&gt; -index 932cb213e..b45d0726f 100644<br>
&gt; ---- a/build/pack.c<br>
&gt; -+++ b/build/pack.c<br>
&gt; +Index: git/build/pack.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/build/pack.c<br>
&gt; ++++ git/build/pack.c<br>
&gt;=C2=A0 @@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutString(pkg-&gt=
;header, RPMTAG_PAYLOADCOMPRESSOR, compr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D xstrdup(rpmio_flags);<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-lin=
ux-gnux32-variant-to-triplet-han.patch b/meta/recipes-devtools/rpm/files/00=
01-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch<br>
&gt; index 2174a79e75..29b6686a94 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux=
32-variant-to-triplet-han.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux=
32-variant-to-triplet-han.patch<br>
&gt; @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex@linutronix.de" target=3D"_blank" rel=3D"noreferrer">alex@linutron=
ix.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer noreferr=
er" target=3D"_blank">configure.ac</a> | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" =
rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 372875fc49..7d6a3d274e 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
&gt; -@@ -845,6 +845,10 @@ if echo &quot;$host_os&quot; | grep &#39;.*-gnua=
bi64$&#39; &gt; /dev/null ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os=3D`echo &quot;${host_os}&quot; | s=
ed &#39;s/-gnuabi64$//&#39;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os_gnu=3D-gnuabi64<br>
&gt; +Index: git/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">configure.ac</a><br>
&gt; ++++ git/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">configure.ac</a><br>
&gt; +@@ -903,6 +903,10 @@ if echo &quot;$host_os&quot; | grep &#39;.*-gnux=
32$&#39; &gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os=3D`echo &quot;${host_os}&quot; | s=
ed &#39;s/-gnux32$//&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os_gnu=3D-gnux32<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 +if echo &quot;$host_os&quot; | grep &#39;.*-gnux32$&#39; &gt; /=
dev/null ; then<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 host_os=3D`echo &quot;${host_os}&quot; | s=
ed &#39;s/-gnux32$//&#39;`<br>
&gt; @@ -26,6 +26,3 @@ index 372875fc49..7d6a3d274e 100644<br>
&gt;=C2=A0 =C2=A0if echo &quot;$host_os&quot; | grep &#39;.*-gnu$&#39; &gt;=
 /dev/null ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_os=3D`echo &quot;${host_os}&quot=
; | sed &#39;s/-gnu$//&#39;`<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt; ---<br>
&gt; -2.30.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-ma=
npages-requires-pandoc.patch b/meta/recipes-devtools/rpm/files/0001-docs-do=
-not-build-manpages-requires-pandoc.patch<br>
&gt; index ced52d1007..d7137f1d10 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-=
requires-pandoc.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-=
requires-pandoc.patch<br>
&gt; @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavi=
n@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0docs/Makefile.am | 2 --<br>
&gt;=C2=A0 =C2=A01 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/docs/Makefile.am b/docs/Makefile.am<br>
&gt; -index 5a6bd203a..6257767fd 100644<br>
&gt; ---- a/docs/Makefile.am<br>
&gt; -+++ b/docs/Makefile.am<br>
&gt; +Index: git/docs/Makefile.am<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/docs/Makefile.am<br>
&gt; ++++ git/docs/Makefile.am<br>
&gt;=C2=A0 @@ -1,7 +1,5 @@<br>
&gt;=C2=A0 =C2=A0## Process this file with automake to produce Makefile.in<=
br>
&gt;<br>
&gt; @@ -21,6 +21,3 @@ index 5a6bd203a..6257767fd 100644<br>
&gt;=C2=A0 =C2=A0EXTRA_DIST =3D<br>
&gt;<br>
&gt;=C2=A0 =C2=A0EXTRA_DIST +=3D \<br>
&gt; ---<br>
&gt; -2.32.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fi=
x-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/000=
1-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch<br>
&gt; index 6678c105cd..82e6567dc7 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-=
conflicts-for-MIPS64-N32.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-=
conflicts-for-MIPS64-N32.patch<br>
&gt; @@ -31,11 +31,11 @@ Signed-off-by: Changqing Li &lt;<a href=3D"mailto:=
changqing.li@windriver.com" target=3D"_blank" rel=3D"noreferrer">changqing.=
li@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0lib/transaction.c | 13 ++++++++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; -diff --git a/lib/transaction.c b/lib/transaction.c<br>
&gt; -index 67b9db5..82386b8 100644<br>
&gt; ---- a/lib/transaction.c<br>
&gt; -+++ b/lib/transaction.c<br>
&gt; -@@ -391,7 +391,18 @@ static int handleColorConflict(rpmts ts,<br>
&gt; +Index: git/lib/transaction.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/transaction.c<br>
&gt; ++++ git/lib/transaction.c<br>
&gt; +@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts ts,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rpmfsSetAction(ofs, ofx, FA_CREATE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpmfsSetA=
ction(fs, fx, FA_SKIPCOLOR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rConflict=
s =3D 0;<br>
&gt; @@ -55,6 +55,3 @@ index 67b9db5..82386b8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-fo=
r-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-err=
or.h-for-non-glibc-case.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9783396639..0000000000<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-g=
libc-case.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,71 +0,0 @@<br>
&gt; -From 9b9d717f484ec913cdd3804e43489b3dc18bd77c Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 31 Oct 2020 22:14:05 -0700<br>
&gt; -Subject: [PATCH] tools: Add error.h for non-glibc case<br>
&gt; -<br>
&gt; -error is glibc specific API, so this patch will mostly not accepted<b=
r>
&gt; -upstream given that elfutils has been closely tied to glibc<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [workaround for musl]<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - tools/elfdeps.c |=C2=A0 6 +++++-<br>
&gt; - tools/error.h=C2=A0 =C2=A0| 27 +++++++++++++++++++++++++++<br>
&gt; - 2 files changed, 32 insertions(+), 1 deletion(-)<br>
&gt; - create mode 100644 tools/error.h<br>
&gt; -<br>
&gt; -diff --git a/tools/elfdeps.c b/tools/elfdeps.c<br>
&gt; -index d205935bb..3a8945b33 100644<br>
&gt; ---- a/tools/elfdeps.c<br>
&gt; -+++ b/tools/elfdeps.c<br>
&gt; -@@ -5,10 +5,14 @@<br>
&gt; - #include &lt;unistd.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; - #include &lt;fcntl.h&gt;<br>
&gt; --#include &lt;error.h&gt;<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; - #include &lt;popt.h&gt;<br>
&gt; - #include &lt;gelf.h&gt;<br>
&gt; -+#ifdef __GLIBC__<br>
&gt; -+#include &lt;error.h&gt;<br>
&gt; -+#else<br>
&gt; -+#include &quot;error.h&quot;<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - #include &lt;rpm/rpmstring.h&gt;<br>
&gt; - #include &lt;rpm/argv.h&gt;<br>
&gt; -diff --git a/tools/error.h b/tools/error.h<br>
&gt; -new file mode 100644<br>
&gt; -index 000000000..ef06827a0<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/tools/error.h<br>
&gt; -@@ -0,0 +1,27 @@<br>
&gt; -+#ifndef _ERROR_H_<br>
&gt; -+#define _ERROR_H_<br>
&gt; -+<br>
&gt; -+#include &lt;stdarg.h&gt;<br>
&gt; -+#include &lt;stdio.h&gt;<br>
&gt; -+#include &lt;stdlib.h&gt;<br>
&gt; -+#include &lt;string.h&gt;<br>
&gt; -+#include &lt;errno.h&gt;<br>
&gt; -+<br>
&gt; -+static unsigned int error_message_count =3D 0;<br>
&gt; -+<br>
&gt; -+static inline void error(int status, int errnum, const char* format,=
 ...)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s: &quot;, program_invoc=
ation_name);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 va_start(ap, format);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 vfprintf(stderr, format, ap);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (errnum)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;: %s&quot;, strerror(errnum));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 error_message_count++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (status)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(status);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+#endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* _ERROR_H_ */<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-pref=
ixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/00=
02-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch<br>
&gt; index b3dbc319b6..2fe96a839c 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-e=
tc-from-RPM_ETCCONFIGDIR-.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-e=
tc-from-RPM_ETCCONFIGDIR-.patch<br>
&gt; @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0lib/rpmrc.c | 19 ++++++++++++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 14 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/lib/rpmrc.c b/lib/rpmrc.c<br>
&gt; -index 19fe80f98..6b27b3941 100644<br>
&gt; ---- a/lib/rpmrc.c<br>
&gt; -+++ b/lib/rpmrc.c<br>
&gt; -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char * =
name,<br>
&gt; +Index: git/lib/rpmrc.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/rpmrc.c<br>
&gt; ++++ git/lib/rpmrc.c<br>
&gt; +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const<br>
&gt;=C2=A0 =C2=A0static void setDefaults(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *confdir =3D rpmConfigDir();<br>
&gt; @@ -46,7 +46,7 @@ index 19fe80f98..6b27b3941 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0macrofiles =3D MACROFILES;<br>
&gt; -@@ -989,7 +993,11 @@ static void read_auxv(void)<br>
&gt; +@@ -997,7 +1001,11 @@ static void read_auxv(void)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0static void defaultMachine(rpmrcCtx ctx, const char ** arc=
h, const char ** os)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -59,7 +59,7 @@ index 19fe80f98..6b27b3941 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0static struct utsname un;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char * chptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0canonEntry canon;<br>
&gt; -@@ -1286,6 +1294,7 @@ static void defaultMachine(rpmrcCtx ctx, const =
char ** arch, const char ** os)<br>
&gt; +@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx ctx,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (arch) *arch =3D un.machine;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (os) *os =3D un.sysname;<br>
&gt; @@ -67,6 +67,3 @@ index 19fe80f98..6b27b3941 100644<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0static<br>
&gt; ---<br>
&gt; -2.11.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-l=
ogging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/00=
16-rpmscript.c-change-logging-level-around-scriptlets-t.patch<br>
&gt; index 43e9859ef3..9dbe7125de 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-=
level-around-scriptlets-t.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-=
level-around-scriptlets-t.patch<br>
&gt; @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0lib/rpmscript.c | 8 ++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/lib/rpmscript.c b/lib/rpmscript.c<br>
&gt; -index 2b0e43862..e319673f1 100644<br>
&gt; ---- a/lib/rpmscript.c<br>
&gt; -+++ b/lib/rpmscript.c<br>
&gt; -@@ -226,7 +226,7 @@ static char * writeScript(const char *cmd, const =
char *script)<br>
&gt; +Index: git/lib/rpmscript.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/rpmscript.c<br>
&gt; ++++ git/lib/rpmscript.c<br>
&gt; +@@ -270,7 +270,7 @@ static char * writeScript(const char *cm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (Ferror(fd))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt;<br>
&gt; @@ -26,7 +26,7 @@ index 2b0e43862..e319673f1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const char set_x[] =3D &quot;s=
et -x\n&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Assume failures will be caught by =
the write below */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fwrite(set_x, sizeof(set_x[0]), sizeo=
f(set_x)-1, fd);<br>
&gt; -@@ -258,7 +258,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARG=
V_const_t prefixes,<br>
&gt; +@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins plu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *mline =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rpmRC rc =3D RPMRC_FAIL;<br>
&gt;<br>
&gt; @@ -35,7 +35,7 @@ index 2b0e43862..e319673f1 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (script) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D writeScript(*argvp[0], script)=
;<br>
&gt; -@@ -310,7 +310,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARG=
V_const_t prefixes,<br>
&gt; +@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins plu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sname, st=
rerror(errno));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (pid =3D=3D 0) {/* Child */<br>
&gt; @@ -44,7 +44,7 @@ index 2b0e43862..e319673f1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sname, *argvp[0=
], (unsigned)getpid());<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(in);<br>
&gt; -@@ -353,7 +353,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARG=
V_const_t prefixes,<br>
&gt; +@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins plu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reaped =3D waitpid(pid, &amp;status, =
0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (reaped =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/fifofix.patch b/meta/reci=
pes-devtools/rpm/files/fifofix.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..71703d7f0c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/fifofix.patch<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +Calling openat() on a fifo causes a pseudo hang for us (e.g. the fifo=
 in psplash).<br>
&gt; +Avoid calling openat for fifos.<br>
&gt; +<br>
&gt; +Introduced upstream with:<br>
&gt; +<br>
&gt; +<a href=3D"https://github.com/rpm-software-management/rpm/commit/96ec=
957e281220f8e137a2d5eb23b83a6377d556" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/rpm-software-management/rpm/commit/96ec957e2=
81220f8e137a2d5eb23b83a6377d556</a><br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/rpm-softwar=
e-management/rpm/issues/2195" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://github.com/rpm-software-management/rpm/issues/2195</a>]<br>
&gt; +<br>
&gt; +Index: git/lib/fsm.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/lib/fsm.c<br>
&gt; ++++ git/lib/fsm.c<br>
&gt; +@@ -1010,7 +1010,7 @@ int rpmPackageFilesInstall(rpmts ts, rpm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rc =3D RPMERR_UNKNOWN_FILETYPE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rc &amp;&amp; fd =3D=3D -1 &=
amp;&amp; !S_ISLNK(fp-&gt;sb.st_mode)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rc &amp;&amp; fd =3D=3D -1 &=
amp;&amp; !S_ISLNK(fp-&gt;sb.st_mode) &amp;&amp; !S_ISFIFO(fp-&gt;sb.st_mod=
e)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only follow=
 safe symlinks, and never on temporary files */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D fsmOpen=
at(di.dirfd, fp-&gt;fpath,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp-&gt;suffix ? AT_SYMLINK_NOFOLL=
OW : 0, 0);<br>
&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">rpm_4.17.1.bb</a> b/meta/=
recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; index 9b6446f265..36ab90d91e 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; @@ -24,7 +24,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.rpm.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://www.rpm.org</a>&quot;<=
br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc4eec0c20c6034b9=
407a09945b48a43f&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-man=
agement/rpm;branch=3Drpm-4.17.x;protocol=3Dhttps" rel=3D"noreferrer norefer=
rer" target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-=
4.17.x;protocol=3Dhttps</a> \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-man=
agement/rpm;branch=3Drpm-4.18.x;protocol=3Dhttps" rel=3D"noreferrer norefer=
rer" target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-=
4.18.x;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http:=
//environment.d-rpm.sh" rel=3D"noreferrer noreferrer" target=3D"_blank">env=
ironment.d-rpm.sh</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-add-=
an-unsatisfiable-dependency-when-building.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-read=
-config-files-from-HOME.patch \<br>
&gt; @@ -36,14 +36,17 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.c=
om/rpm-software-management/rpm;branch=3Drpm-4.17.x;protoc" rel=3D"noreferre=
r noreferrer" target=3D"_blank">github.com/rpm-software-management/rpm;bran=
ch=3Drpm-4.17.x;protoc</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-perl-disabl=
e-auto-reqs.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-rpmscript.c=
-change-logging-level-around-scriptlets-t.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lib-transac=
tion.c-fix-file-conflicts-for-MIPS64-N32.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tools-Add-error.=
h-for-non-glibc-case.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-docs-do-not=
-build-manpages-requires-pandoc.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-pack.=
c-do-not-insert-payloadflags-into-.rpm-me.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.a=
c-add-linux-gnux32-variant-to-triplet-han.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fifofix.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt; -SRCREV =3D &quot;5bef402da334595ed9302b8bca1acdf5e88bfe11&quot;<br>
&gt; +SRCREV =3D &quot;07a6cca98489106b93467ecfaf5700368983a9b4&quot;<br>
&gt; +PV =3D &quot;4.17.1+4.18-rc1&quot;<br>
&gt; +# can be removed in 4.18<br>
&gt; +CVE_CHECK_IGNORE +=3D &quot;CVE-2021-35937 CVE-2021-35938 CVE-2021-35=
939&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; @@ -80,6 +83,7 @@ PACKAGECONFIG[imaevm] =3D &quot;--with-imaevm,,ima-e=
vm-utils&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[inhibit] =3D &quot;--enable-inhibit-plugin,--disab=
le-inhibit-plugin,dbus&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[rpm2archive] =3D &quot;--with-archive,--without-ar=
chive,libarchive&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[sqlite] =3D &quot;--enable-sqlite=3Dyes,--enable-s=
qlite=3Dno,sqlite3&quot;<br>
&gt; +PACKAGECONFIG[readline] =3D &quot;--with-readline,--without-readline,=
readline&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[ndb] =3D &quot;--enable-ndb,--disable-ndb&quot;<br=
>
&gt;=C2=A0 PACKAGECONFIG[bdb-ro] =3D &quot;--enable-bdb-ro,--disable-bdb-ro=
&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[zstd] =3D &quot;--enable-zstd=3Dyes,--enable-zstd=
=3Dno,zstd&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#204152): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/204152" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2041=
52</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10824173=
4/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/108241734/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000e2c726062135a8f5--

