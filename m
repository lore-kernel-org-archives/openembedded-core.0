Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.2723.1617655524488206695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 13:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CJKghJwV;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id i9so12857129qka.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5cuC2KIT66iIxqd8XKd8Ya+Y9GeRSzES/QdJ0MHvlOQ=;
        b=CJKghJwVNiZ4XuRgglcVzqQ4B/I5VKcgeaQjSx+yFVAks/ZAEkm8Q6JuIgtJwn6tMu
         rQKFhDK9seTRecYdmExlBm6HWyS2HL4lWGa+PZkMQDGoLsk7PaM9l+7Z8B8pfaXEmxgf
         2NhgYXDcm0yjMI0rDZeUzStjBlDbNooWKcmqk1YK3krDRFOe00jF5Q1WQMU6edE/5Vce
         2av3Y63prE4m7i893wfF9eHFQBCmA9bN86dSNTxoJC9FE775/TORm00Z7G5AlTLwdM2O
         dAfBRsyb+n6NjY1LkN6SK9Wpfw62kG45zty/lRwKnOl2Myhvp/+t/sWrTyfzbIVKFXF7
         bb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5cuC2KIT66iIxqd8XKd8Ya+Y9GeRSzES/QdJ0MHvlOQ=;
        b=gBl9BA680djy55tp9TsfsWbf615Iol/2XNTD7Z32xjIkeRxtJ+mdlt66utywdREUcs
         MEyBDQpqxcamzBwxD5XDFpIcv7JgN6Mm4Aaf0XDBYEtfaR5YPo/kjfSwjWjQro9QO163
         7Pc0M2ohXE1eZJOJNG2SH1zz2ZgvLGOz1QJbDjOYKjtRC+NaXWjyFKRwTVajeqzMpEfk
         s6ahENQS2w0cA00t3rFgjQZKr06rxALqVRMnyG1o5gb85r0ydQ5zZrrWYtHPf7CxHy+v
         gi8dbakjwau5/Zm9nSl/C4imPiqKJNk1anctjuTzPNT6J0pBe5F/Y6t0GwCHfEMiC7mf
         EGWQ==
X-Gm-Message-State: AOAM533LxHh592HMxW7TWbGM6476ATEObAdJa6oFvGqxDpwymDnCFmzy
	uIxRkXPG4bkHCsQBSQ+8NqAFiXIOzZge/aftJaA=
X-Google-Smtp-Source: ABdhPJxEslKwasucbAVcW1a0esMHd581DzGGz3VGHwRjMYwqLpWX7OlaJHRoAPeJdgTryr3lgXrnErIKyzGFAjBRXQE=
X-Received: by 2002:a37:a350:: with SMTP id m77mr25555071qke.146.1617655522785;
 Mon, 05 Apr 2021 13:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <1617200881-62212-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sr2S7Jkxp09Tnjzhbcy__rrsjDcrzrpM_O2BQ4o+roJdQ@mail.gmail.com> <CAMKF1sp0Zf4wB8NGiu41nSoR2VweaLUKYD7R8CvA172Wgu1aWg@mail.gmail.com>
In-Reply-To: <CAMKF1sp0Zf4wB8NGiu41nSoR2VweaLUKYD7R8CvA172Wgu1aWg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 5 Apr 2021 13:44:56 -0700
Message-ID: <CAMKF1sqs=dp3xKc7fc_VoobyO4SL+OOpi_DAb0s5R7P=kzg=jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: upgrade 2.66.7 -> 2.68.0
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have send patches to fix the packages it was breaking with gcc11. So
we should be good here at least from meta-openembedded and oe-core
point of view.

On Mon, Apr 5, 2021 at 11:44 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Apr 4, 2021 at 8:47 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This patch is causing some build regression in meta-openembedded
> >
> > https://errors.yoctoproject.org/Errors/Build/119542/
> >
> > Leave aside the iwd one which is due to ell update.
> >
> I think I should have also mentioned that this only shows up with gcc11
> that was fixed by those long list of backports in existing versions
>
> > On Wed, Mar 31, 2021 at 7:28 AM wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > the following patches are refreshed:
> > > 0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> > > 0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
> > > 0001-tests-codegen.py-removing-unecessary-print-statement.patch
> > > relocate-modules.patch
> > >
> > > the following patches are removed since they are included
> > > in 2.68.0:
> > > 0001-gobject-Drop-use-of-volatile-from-get_type-macros.patch
> > > 0002-tests-Fix-non-atomic-access-to-a-shared-variable.patch
> > > 0003-tests-Fix-non-atomic-access-to-a-shared-variable.patch
> > > 0004-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > 0005-tests-Fix-non-atomic-access-to-some-shared-variables.patch
> > > 0006-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > 0007-gdbusconnection-Drop-unnecessary-volatile-qualifiers.patch
> > > 0008-gdbuserror-Drop-unnecessary-volatile-qualifiers-from.patch
> > > 0009-gio-Drop-unnecessary-volatile-qualifiers-from-intern.patch
> > > 0010-kqueue-Fix-unlocked-access-to-shared-variable.patch
> > > 0011-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > 0012-tests-Fix-non-atomic-access-to-some-shared-variables.patch
> > > 0013-gatomic-Drop-unnecessary-volatile-qualifiers-from-in.patch
> > > 0014-gatomic-Drop-unnecessary-volatile-qualifiers-from-ma.patch
> > > 0015-glib-Drop-unnecessary-volatile-qualifiers-from-inter.patch
> > > 0016-gobject-Drop-unnecessary-volatile-qualifiers-from-in.patch
> > > 0017-gmessages-Drop-unnecessary-volatile-qualifiers-from-.patch
> > > 0018-gtypes-Drop-volatile-qualifier-from-gatomicrefcount.patch
> > > 0019-gatomicarray-Drop-volatile-qualifier-from-GAtomicArr.patch
> > > 0020-gobject-Drop-volatile-qualifier-from-GObject.ref_cou.patch
> > > 0021-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > 0022-build-Drop-unnecessary-volatile-qualifiers-from-conf.patch
> > > 0023-gdbusprivate-Avoid-a-warning-about-a-statement-with-.patch
> > > 0024-tests-Add-comment-to-volatile-atomic-tests.patch
> > > 0025-gthread-Use-g_atomic-primitives-correctly-in-destruc.patch
> > > 0026-gtype-Fix-some-typos-in-comments.patch
> > > 0027-gtype-Add-some-missing-atomic-accesses-to-init_state.patch
> > > 0028-gresource-Fix-a-pointer-mismatch-with-an-atomic-load.patch
> > > 0029-docs-Document-not-to-use-volatile-qualifiers.patch
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...-correctly-when-building-with-mingw3.patch |  14 +-
> > >  ...degen.py-bump-timeout-to-100-seconds.patch |   4 +-
> > >  ...use-of-volatile-from-get_type-macros.patch | 403 ----------
> > >  ...-removing-unecessary-print-statement.patch |  10 +-
> > >  ...n-atomic-access-to-a-shared-variable.patch |  44 --
> > >  ...n-atomic-access-to-a-shared-variable.patch |  90 ---
> > >  ...essary-volatile-qualifiers-from-test.patch |  93 ---
> > >  ...omic-access-to-some-shared-variables.patch | 702 ---------------=
---
> > >  ...essary-volatile-qualifiers-from-test.patch |  35 -
> > >  ...Drop-unnecessary-volatile-qualifiers.patch | 111 ---
> > >  ...unnecessary-volatile-qualifiers-from.patch |  95 ---
> > >  ...sary-volatile-qualifiers-from-intern.patch | 207 ------
> > >  ...x-unlocked-access-to-shared-variable.patch |  51 --
> > >  ...essary-volatile-qualifiers-from-test.patch | 126 ----
> > >  ...omic-access-to-some-shared-variables.patch | 103 ---
> > >  ...ecessary-volatile-qualifiers-from-in.patch | 180 -----
> > >  ...ecessary-volatile-qualifiers-from-ma.patch |  56 --
> > >  ...ssary-volatile-qualifiers-from-inter.patch | 169 -----
> > >  ...ecessary-volatile-qualifiers-from-in.patch | 126 ----
> > >  ...nnecessary-volatile-qualifiers-from-.patch |  44 --
> > >  ...atile-qualifier-from-gatomicrefcount.patch |  35 -
> > >  ...p-volatile-qualifier-from-GAtomicArr.patch |  44 --
> > >  ...atile-qualifier-from-GObject.ref_cou.patch |  33 -
> > >  ...essary-volatile-qualifiers-from-test.patch |  51 --
> > >  ...essary-volatile-qualifiers-from-conf.patch |  38 -
> > >  ...id-a-warning-about-a-statement-with-.patch |  33 -
> > >  ...Add-comment-to-volatile-atomic-tests.patch |  49 --
> > >  ...omic-primitives-correctly-in-destruc.patch |  77 --
> > >  ...026-gtype-Fix-some-typos-in-comments.patch |  47 --
> > >  ...issing-atomic-accesses-to-init_state.patch |  76 --
> > >  ...pointer-mismatch-with-an-atomic-load.patch |  29 -
> > >  ...ument-not-to-use-volatile-qualifiers.patch | 258 -------
> > >  .../glib-2.0/glib-2.0/relocate-modules.patch  |  12 +-
> > >  ...{glib-2.0_2.66.7.bb =3D> glib-2.0_2.68.0.bb} |  33 +-
> > >  34 files changed, 21 insertions(+), 3457 deletions(-)
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gobject=
-Drop-use-of-volatile-from-get_type-macros.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-F=
ix-non-atomic-access-to-a-shared-variable.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-tests-F=
ix-non-atomic-access-to-a-shared-variable.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0004-tests-D=
rop-unnecessary-volatile-qualifiers-from-test.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-tests-F=
ix-non-atomic-access-to-some-shared-variables.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0006-tests-D=
rop-unnecessary-volatile-qualifiers-from-test.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0007-gdbusco=
nnection-Drop-unnecessary-volatile-qualifiers.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0008-gdbuser=
ror-Drop-unnecessary-volatile-qualifiers-from.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0009-gio-Dro=
p-unnecessary-volatile-qualifiers-from-intern.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0010-kqueue-=
Fix-unlocked-access-to-shared-variable.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-tests-D=
rop-unnecessary-volatile-qualifiers-from-test.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0012-tests-F=
ix-non-atomic-access-to-some-shared-variables.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0013-gatomic=
-Drop-unnecessary-volatile-qualifiers-from-in.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0014-gatomic=
-Drop-unnecessary-volatile-qualifiers-from-ma.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0015-glib-Dr=
op-unnecessary-volatile-qualifiers-from-inter.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0016-gobject=
-Drop-unnecessary-volatile-qualifiers-from-in.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0017-gmessag=
es-Drop-unnecessary-volatile-qualifiers-from-.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0018-gtypes-=
Drop-volatile-qualifier-from-gatomicrefcount.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0019-gatomic=
array-Drop-volatile-qualifier-from-GAtomicArr.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-gobject=
-Drop-volatile-qualifier-from-GObject.ref_cou.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0021-tests-D=
rop-unnecessary-volatile-qualifiers-from-test.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0022-build-D=
rop-unnecessary-volatile-qualifiers-from-conf.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0023-gdbuspr=
ivate-Avoid-a-warning-about-a-statement-with-.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0024-tests-A=
dd-comment-to-volatile-atomic-tests.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0025-gthread=
-Use-g_atomic-primitives-correctly-in-destruc.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0026-gtype-F=
ix-some-typos-in-comments.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0027-gtype-A=
dd-some-missing-atomic-accesses-to-init_state.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0028-gresour=
ce-Fix-a-pointer-mismatch-with-an-atomic-load.patch
> > >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0029-docs-Do=
cument-not-to-use-volatile-qualifiers.patch
> > >  rename meta/recipes-core/glib-2.0/{glib-2.0_2.66.7.bb =3D> glib-2.0=
_2.68.0.bb} (50%)
> > >
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machi=
ne-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> > > index d6765b163b..8a6d46df79 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-corr=
ectly-when-building-with-mingw3.patch
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-corr=
ectly-when-building-with-mingw3.patch
> > > @@ -17,16 +17,16 @@ diff --git a/gio/tests/meson.build b/gio/tests/m=
eson.build
> > >  index 3a19c82..b762835 100644
> > >  --- a/gio/tests/meson.build
> > >  +++ b/gio/tests/meson.build
> > > -@@ -12,7 +12,7 @@ test_c_args =3D [
> > > -   '-UG_DISABLE_ASSERT',
> > > - ]
> > > +@@ -27,7 +27,7 @@ test_c_args =3D [
> > > +   endif # libutil.length() > 0
> > > + endif # build_machine.system() =3D=3D 'linux'
> > >
> > >  -if host_machine.system() =3D=3D 'windows'
> > >  +if host_system =3D=3D 'windows'
> > >     common_gio_tests_deps +=3D [iphlpapi_dep, winsock2, cc.find_libr=
ary ('secur32')]
> > >   endif
> > >
> > > -@@ -133,7 +133,7 @@ else
> > > +@@ -148,7 +148,7 @@ else
> > >   endif
> > >
> > >   #  Test programs buildable on UNIX only
> > > @@ -35,7 +35,7 @@ index 3a19c82..b762835 100644
> > >     gio_tests +=3D {
> > >       'file' : {},
> > >       'gdbus-peer' : {
> > > -@@ -385,7 +385,7 @@ if host_machine.system() !=3D 'windows'
> > > +@@ -402,7 +402,7 @@ if host_machine.system() !=3D 'windows'
> > >   endif # unix
> > >
> > >   #  Test programs buildable on Windows only
> > > @@ -44,7 +44,7 @@ index 3a19c82..b762835 100644
> > >     gio_tests +=3D {'win32-streams' : {}}
> > >   endif
> > >
> > > -@@ -455,7 +455,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D=
 'clang-cl'
> > > +@@ -472,7 +472,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D=
 'clang-cl'
> > >     }
> > >   endif
> > >
> > > @@ -57,7 +57,7 @@ diff --git a/glib/tests/meson.build b/glib/tests/m=
eson.build
> > >  index 6eb23e8..36eb919 100644
> > >  --- a/glib/tests/meson.build
> > >  +++ b/glib/tests/meson.build
> > > -@@ -137,7 +137,7 @@ if glib_conf.has('HAVE_EVENTFD')
> > > +@@ -142,7 +142,7 @@ if glib_conf.has('HAVE_EVENTFD')
> > >     }
> > >   endif
> > >
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-code=
gen.py-bump-timeout-to-100-seconds.patch b/meta/recipes-core/glib-2.0/glib-=
2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
> > > index 508c8c3bad..fbdd4c2660 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-=
bump-timeout-to-100-seconds.patch
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-=
bump-timeout-to-100-seconds.patch
> > > @@ -15,8 +15,8 @@ diff --git a/gio/tests/codegen.py b/gio/tests/code=
gen.py
> > >  index 51de0ed..ca98c9d 100644
> > >  --- a/gio/tests/codegen.py
> > >  +++ b/gio/tests/codegen.py
> > > -@@ -51,7 +51,7 @@ class TestCodegen(unittest.TestCase):
> > > -     cwd =3D ''
> > > +@@ -55,7 +55,7 @@ class TestCodegen(unittest.TestCase):
> > > +     cwd =3D ""
> > >
> > >       def setUp(self):
> > >  -        self.timeout_seconds =3D 10  # seconds per test
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gobject-Drop-u=
se-of-volatile-from-get_type-macros.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-gobject-Drop-use-of-volatile-from-get_type-macros.patch
> > > deleted file mode 100644
> > > index 4852186520..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gobject-Drop-use-of-v=
olatile-from-get_type-macros.patch
> > > +++ /dev/null
> > > @@ -1,403 +0,0 @@
> > > -From fab561f8d05794329184cd81f9ab9d9d77dcc22a Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:12:22 +0000
> > > -Subject: [PATCH 01/29] gobject: Drop use of volatile from get_type(=
) macros
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -http://isvolatileusefulwiththreads.in/c/
> > > -
> > > -It=E2=80=99s possible that the variables here are only marked as vo=
latile
> > > -because they=E2=80=99re arguments to `g_once_*()`. Those arguments =
will be
> > > -modified in a subsequent commit.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - docs/reference/gobject/glib-mkenums.xml |  8 ++---
> > > - docs/reference/gobject/tut_gtype.xml    |  2 +-
> > > - gio/gioenumtypes.c.template             |  8 ++---
> > > - gio/tests/gsettings.c                   |  4 +--
> > > - gobject/gbinding.c                      |  8 ++---
> > > - gobject/gboxed.c                        |  8 ++---
> > > - gobject/glib-enumtypes.c.template       |  8 ++---
> > > - gobject/gsourceclosure.c                |  2 +-
> > > - gobject/gtype.h                         | 48 ++++++++++++---------=
----
> > > - gobject/tests/signals.c                 | 16 ++++-----
> > > - 10 files changed, 56 insertions(+), 56 deletions(-)
> > > -
> > > -diff --git a/docs/reference/gobject/glib-mkenums.xml b/docs/referen=
ce/gobject/glib-mkenums.xml
> > > -index 2200328ed..ce250a3ff 100644
> > > ---- a/docs/reference/gobject/glib-mkenums.xml
> > > -+++ b/docs/reference/gobject/glib-mkenums.xml
> > > -@@ -480,9 +480,9 @@ A C source template file will typically look li=
ke this:
> > > - GType
> > > - @enum_name@_get_type (void)
> > > - {
> > > --  static volatile gsize g_@type@_type_id__volatile;
> > > -+  static gsize static_g_@type@_type_id;
> > > -
> > > --  if (g_once_init_enter (&amp;g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&amp;static_g_@type@_type_id))
> > > -     {
> > > -       static const G@Type@Value values[] =3D {
> > > - /*** END value-header ***/
> > > -@@ -498,9 +498,9 @@ GType
> > > -       GType g_@type@_type_id =3D
> > > -         g_@type@_register_static (g_intern_static_string ("@EnumNa=
me@"), values);
> > > -
> > > --      g_once_init_leave (&amp;g_@type@_type_id__volatile, g_@type@=
_type_id);
> > > -+      g_once_init_leave (&amp;static_g_@type@_type_id, g_@type@_ty=
pe_id);
> > > -     }
> > > --  return g_@type@_type_id__volatile;
> > > -+  return static_g_@type@_type_id;
> > > - }
> > > -
> > > - /*** END value-tail ***/
> > > -diff --git a/docs/reference/gobject/tut_gtype.xml b/docs/reference/=
gobject/tut_gtype.xml
> > > -index 25e37dc48..ee042889d 100644
> > > ---- a/docs/reference/gobject/tut_gtype.xml
> > > -+++ b/docs/reference/gobject/tut_gtype.xml
> > > -@@ -852,7 +852,7 @@ viewer_editable_default_init (ViewerEditableInt=
erface *iface)
> > > - GType
> > > - viewer_editable_get_type (void)
> > > - {
> > > --  static volatile gsize type_id =3D 0;
> > > -+  static gsize type_id =3D 0;
> > > -   if (g_once_init_enter (&amp;type_id)) {
> > > -     const GTypeInfo info =3D {
> > > -       sizeof (ViewerEditableInterface),
> > > -diff --git a/gio/gioenumtypes.c.template b/gio/gioenumtypes.c.templ=
ate
> > > -index e9adc4a38..948a01201 100644
> > > ---- a/gio/gioenumtypes.c.template
> > > -+++ b/gio/gioenumtypes.c.template
> > > -@@ -13,9 +13,9 @@
> > > - GType
> > > - @enum_name@_get_type (void)
> > > - {
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&static_g_define_type_id))
> > > -     {
> > > -       static const G@Type@Value values[] =3D {
> > > - /*** END value-header ***/
> > > -@@ -29,10 +29,10 @@ GType
> > > -       };
> > > -       GType g_define_type_id =3D
> > > -         g_@type@_register_static (g_intern_static_string ("@EnumNa=
me@"), values);
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id);
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d);
> > > -     }
> > > -
> > > --  return g_define_type_id__volatile;
> > > -+  return static_g_define_type_id;
> > > - }
> > > -
> > > - /*** END value-tail ***/
> > > -diff --git a/gio/tests/gsettings.c b/gio/tests/gsettings.c
> > > -index 2f81ae6c3..179d0fd2f 100644
> > > ---- a/gio/tests/gsettings.c
> > > -+++ b/gio/tests/gsettings.c
> > > -@@ -1060,7 +1060,7 @@ test_object_set_property (GObject      *objec=
t,
> > > - static GType
> > > - test_enum_get_type (void)
> > > - {
> > > --  static volatile gsize define_type_id =3D 0;
> > > -+  static gsize define_type_id =3D 0;
> > > -
> > > -   if (g_once_init_enter (&define_type_id))
> > > -     {
> > > -@@ -1082,7 +1082,7 @@ test_enum_get_type (void)
> > > - static GType
> > > - test_flags_get_type (void)
> > > - {
> > > --  static volatile gsize define_type_id =3D 0;
> > > -+  static gsize define_type_id =3D 0;
> > > -
> > > -   if (g_once_init_enter (&define_type_id))
> > > -     {
> > > -diff --git a/gobject/gbinding.c b/gobject/gbinding.c
> > > -index 78a883075..662d76b3c 100644
> > > ---- a/gobject/gbinding.c
> > > -+++ b/gobject/gbinding.c
> > > -@@ -120,9 +120,9 @@
> > > - GType
> > > - g_binding_flags_get_type (void)
> > > - {
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&static_g_define_type_id))
> > > -     {
> > > -       static const GFlagsValue values[] =3D {
> > > -         { G_BINDING_DEFAULT, "G_BINDING_DEFAULT", "default" },
> > > -@@ -133,10 +133,10 @@ g_binding_flags_get_type (void)
> > > -       };
> > > -       GType g_define_type_id =3D
> > > -         g_flags_register_static (g_intern_static_string ("GBinding=
Flags"), values);
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id);
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d);
> > > -     }
> > > -
> > > --  return g_define_type_id__volatile;
> > > -+  return static_g_define_type_id;
> > > - }
> > > -
> > > - #define G_BINDING_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST (=
(klass), G_TYPE_BINDING, GBindingClass))
> > > -diff --git a/gobject/gboxed.c b/gobject/gboxed.c
> > > -index 30ba4e775..194251383 100644
> > > ---- a/gobject/gboxed.c
> > > -+++ b/gobject/gboxed.c
> > > -@@ -180,19 +180,19 @@ G_DEFINE_BOXED_TYPE (GOptionGroup, g_option_g=
roup, g_option_group_ref, g_option_
> > > - GType
> > > - g_strv_get_type (void)
> > > - {
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&static_g_define_type_id))
> > > -     {
> > > -       GType g_define_type_id =3D
> > > -         g_boxed_type_register_static (g_intern_static_string ("GSt=
rv"),
> > > -                                       (GBoxedCopyFunc) g_strdupv,
> > > -                                       (GBoxedFreeFunc) g_strfreev)=
;
> > > -
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id);
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d);
> > > -     }
> > > -
> > > --  return g_define_type_id__volatile;
> > > -+  return static_g_define_type_id;
> > > - }
> > > -
> > > - GType
> > > -diff --git a/gobject/glib-enumtypes.c.template b/gobject/glib-enumt=
ypes.c.template
> > > -index b7d36728f..1800ca8af 100644
> > > ---- a/gobject/glib-enumtypes.c.template
> > > -+++ b/gobject/glib-enumtypes.c.template
> > > -@@ -13,9 +13,9 @@
> > > - GType
> > > - @enum_name@_get_type (void)
> > > - {
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&static_g_define_type_id))
> > > -     {
> > > -       static const G@Type@Value values[] =3D {
> > > - /*** END value-header ***/
> > > -@@ -29,10 +29,10 @@ GType
> > > -       };
> > > -       GType g_define_type_id =3D
> > > -         g_@type@_register_static (g_intern_static_string ("@EnumNa=
me@"), values);
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id);
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d);
> > > -     }
> > > -
> > > --  return g_define_type_id__volatile;
> > > -+  return static_g_define_type_id;
> > > - }
> > > -
> > > - /*** END value-tail ***/
> > > -diff --git a/gobject/gsourceclosure.c b/gobject/gsourceclosure.c
> > > -index 0d0d2e87c..d1b1ee4b3 100644
> > > ---- a/gobject/gsourceclosure.c
> > > -+++ b/gobject/gsourceclosure.c
> > > -@@ -32,7 +32,7 @@ G_DEFINE_BOXED_TYPE (GIOChannel, g_io_channel, g_=
io_channel_ref, g_io_channel_un
> > > - GType
> > > - g_io_condition_get_type (void)
> > > - {
> > > --  static volatile GType etype =3D 0;
> > > -+  static GType etype =3D 0;
> > > -
> > > -   if (g_once_init_enter (&etype))
> > > -     {
> > > -diff --git a/gobject/gtype.h b/gobject/gtype.h
> > > -index 9de46ac60..666fadb0c 100644
> > > ---- a/gobject/gtype.h
> > > -+++ b/gobject/gtype.h
> > > -@@ -1727,8 +1727,8 @@ guint     g_type_get_type_registration_serial=
 (void);
> > > -  * GType
> > > -  * gtk_gadget_get_type (void)
> > > -  * {
> > > -- *   static volatile gsize g_define_type_id__volatile =3D 0;
> > > -- *   if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+ *   static gsize static_g_define_type_id =3D 0;
> > > -+ *   if (g_once_init_enter (&static_g_define_type_id))
> > > -  *     {
> > > -  *       GType g_define_type_id =3D
> > > -  *         g_type_register_static_simple (GTK_TYPE_WIDGET,
> > > -@@ -1748,9 +1748,9 @@ guint     g_type_get_type_registration_serial=
 (void);
> > > -  *         };
> > > -  *         g_type_add_interface_static (g_define_type_id, TYPE_GIZ=
MO, &g_implement_interface_info);
> > > -  *       }
> > > -- *       g_once_init_leave (&g_define_type_id__volatile, g_define_=
type_id);
> > > -+ *       g_once_init_leave (&static_g_define_type_id, g_define_typ=
e_id);
> > > -  *     }
> > > -- *   return g_define_type_id__volatile;
> > > -+ *   return static_g_define_type_id;
> > > -  * }
> > > -  * ]|
> > > -  * The only pieces which have to be manually provided are the defi=
nitions of
> > > -@@ -1995,17 +1995,17 @@ type_name##_get_instance_private (TypeName =
*self) \
> > > - GType \
> > > - type_name##_get_type (void) \
> > > - { \
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -   /* Prelude goes here */
> > > -
> > > - /* Added for _G_DEFINE_TYPE_EXTENDED_WITH_PRELUDE */
> > > - #define _G_DEFINE_TYPE_EXTENDED_BEGIN_REGISTER(TypeName, type_name=
, TYPE_PARENT, flags) \
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))  \
> > > -+  if (g_once_init_enter (&static_g_define_type_id)) \
> > > -     { \
> > > -       GType g_define_type_id =3D type_name##_get_type_once (); \
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id); \
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d); \
> > > -     }                                 \
> > > --  return g_define_type_id__volatile;  \
> > > -+  return static_g_define_type_id; \
> > > - } /* closes type_name##_get_type() */ \
> > > - \
> > > - G_GNUC_NO_INLINE \
> > > -@@ -2041,8 +2041,8 @@ static void     type_name##_default_init     =
   (TypeName##Interface *klass); \
> > > - GType \
> > > - type_name##_get_type (void) \
> > > - { \
> > > --  static volatile gsize g_define_type_id__volatile =3D 0; \
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))  \
> > > -+  static gsize static_g_define_type_id =3D 0; \
> > > -+  if (g_once_init_enter (&static_g_define_type_id)) \
> > > -     { \
> > > -       GType g_define_type_id =3D \
> > > -         g_type_register_static_simple (G_TYPE_INTERFACE, \
> > > -@@ -2058,9 +2058,9 @@ type_name##_get_type (void) \
> > > - #define _G_DEFINE_INTERFACE_EXTENDED_END()    \
> > > -         /* following custom code */           \
> > > -       }                                               \
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id); \
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d); \
> > > -     }                                         \
> > > --  return g_define_type_id__volatile;                  \
> > > -+  return static_g_define_type_id; \
> > > - } /* closes type_name##_get_type() */
> > > -
> > > - /**
> > > -@@ -2115,13 +2115,13 @@ static GType type_name##_get_type_once (voi=
d); \
> > > - GType \
> > > - type_name##_get_type (void) \
> > > - { \
> > > --  static volatile gsize g_define_type_id__volatile =3D 0; \
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))  \
> > > -+  static gsize static_g_define_type_id =3D 0; \
> > > -+  if (g_once_init_enter (&static_g_define_type_id)) \
> > > -     { \
> > > -       GType g_define_type_id =3D type_name##_get_type_once (); \
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id); \
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d); \
> > > -     } \
> > > --  return g_define_type_id__volatile; \
> > > -+  return static_g_define_type_id; \
> > > - } \
> > > - \
> > > - G_GNUC_NO_INLINE \
> > > -@@ -2152,13 +2152,13 @@ static GType type_name##_get_type_once (voi=
d); \
> > > - GType \
> > > - type_name##_get_type (void) \
> > > - { \
> > > --  static volatile gsize g_define_type_id__volatile =3D 0; \
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))  \
> > > -+  static gsize static_g_define_type_id =3D 0; \
> > > -+  if (g_once_init_enter (&static_g_define_type_id)) \
> > > -     { \
> > > -       GType g_define_type_id =3D type_name##_get_type_once (); \
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id); \
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d); \
> > > -     } \
> > > --  return g_define_type_id__volatile; \
> > > -+  return static_g_define_type_id; \
> > > - } \
> > > - \
> > > - G_GNUC_NO_INLINE \
> > > -@@ -2205,13 +2205,13 @@ static GType type_name##_get_type_once (voi=
d); \
> > > - GType \
> > > - type_name##_get_type (void) \
> > > - { \
> > > --  static volatile gsize g_define_type_id__volatile =3D 0; \
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))  \
> > > -+  static gsize static_g_define_type_id =3D 0; \
> > > -+  if (g_once_init_enter (&static_g_define_type_id)) \
> > > -     { \
> > > -       GType g_define_type_id =3D type_name##_get_type_once (); \
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id); \
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d); \
> > > -     } \
> > > --  return g_define_type_id__volatile; \
> > > -+  return static_g_define_type_id; \
> > > - } \
> > > - \
> > > - G_GNUC_NO_INLINE \
> > > -diff --git a/gobject/tests/signals.c b/gobject/tests/signals.c
> > > -index 120f90b5c..ac0ce5102 100644
> > > ---- a/gobject/tests/signals.c
> > > -+++ b/gobject/tests/signals.c
> > > -@@ -66,9 +66,9 @@ custom_marshal_VOID__INVOCATIONHINT (GClosure    =
 *closure,
> > > - static GType
> > > - test_enum_get_type (void)
> > > - {
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&static_g_define_type_id))
> > > -     {
> > > -       static const GEnumValue values[] =3D {
> > > -         { TEST_ENUM_NEGATIVE, "TEST_ENUM_NEGATIVE", "negative" },
> > > -@@ -79,18 +79,18 @@ test_enum_get_type (void)
> > > -       };
> > > -       GType g_define_type_id =3D
> > > -         g_enum_register_static (g_intern_static_string ("TestEnum"=
), values);
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id);
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d);
> > > -     }
> > > -
> > > --  return g_define_type_id__volatile;
> > > -+  return static_g_define_type_id;
> > > - }
> > > -
> > > - static GType
> > > - test_unsigned_enum_get_type (void)
> > > - {
> > > --  static volatile gsize g_define_type_id__volatile =3D 0;
> > > -+  static gsize static_g_define_type_id =3D 0;
> > > -
> > > --  if (g_once_init_enter (&g_define_type_id__volatile))
> > > -+  if (g_once_init_enter (&static_g_define_type_id))
> > > -     {
> > > -       static const GEnumValue values[] =3D {
> > > -         { TEST_UNSIGNED_ENUM_FOO, "TEST_UNSIGNED_ENUM_FOO", "foo" =
},
> > > -@@ -99,10 +99,10 @@ test_unsigned_enum_get_type (void)
> > > -       };
> > > -       GType g_define_type_id =3D
> > > -         g_enum_register_static (g_intern_static_string ("TestUnsig=
nedEnum"), values);
> > > --      g_once_init_leave (&g_define_type_id__volatile, g_define_typ=
e_id);
> > > -+      g_once_init_leave (&static_g_define_type_id, g_define_type_i=
d);
> > > -     }
> > > -
> > > --  return g_define_type_id__volatile;
> > > -+  return static_g_define_type_id;
> > > - }
> > > -
> > > - typedef enum {
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.=
py-removing-unecessary-print-statement.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0001-tests-codegen.py-removing-unecessary-print-statement.patch
> > > index 40427e0e67..1f19afc0cf 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.py-remo=
ving-unecessary-print-statement.patch
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.py-remo=
ving-unecessary-print-statement.patch
> > > @@ -14,25 +14,23 @@ Root cause is in ptest-runner, This is a workaro=
und
> > >
> > >  Uptream-Status: Inappropriate [other]
> > >
> > > -
> > > -
> > >  Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> > >  ---
> > >   gio/tests/codegen.py | 1 -
> > >   1 file changed, 1 deletion(-)
> > >
> > >  diff --git a/gio/tests/codegen.py b/gio/tests/codegen.py
> > > -index 51de0ede4..cfa4db42e 100644
> > > +index 0317765..f66b806 100644
> > >  --- a/gio/tests/codegen.py
> > >  +++ b/gio/tests/codegen.py
> > > -@@ -250,7 +250,6 @@ class TestCodegen(unittest.TestCase):
> > > +@@ -257,7 +257,6 @@ class TestCodegen(unittest.TestCase):
> > >
> > >           result =3D Result(info, out, err, subs)
> > >
> > > --        print('Output:', result.out)
> > > +-        print("Output:", result.out)
> > >           return result
> > >
> > >       def runCodegenWithInterface(self, interface_contents, *args):
> > >  --
> > > -2.29.2
> > > +2.25.1
> > >
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Fix-non-=
atomic-access-to-a-shared-variable.patch b/meta/recipes-core/glib-2.0/glib-=
2.0/0002-tests-Fix-non-atomic-access-to-a-shared-variable.patch
> > > deleted file mode 100644
> > > index fada7cc38e..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Fix-non-atomic-=
access-to-a-shared-variable.patch
> > > +++ /dev/null
> > > @@ -1,44 +0,0 @@
> > > -From a6ce0e742a5c75c53a7c702ebb1af1084065160a Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:14:29 +0000
> > > -Subject: [PATCH 02/29] tests: Fix non-atomic access to a shared var=
iable
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -And drop the `volatile` qualifier from the variable, as that doesn=
=E2=80=99t
> > > -help with thread safety.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/tests/642026.c | 4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/glib/tests/642026.c b/glib/tests/642026.c
> > > -index ef54f14bb..26ab2ed06 100644
> > > ---- a/glib/tests/642026.c
> > > -+++ b/glib/tests/642026.c
> > > -@@ -25,7 +25,7 @@ static GMutex *mutex;
> > > - static GCond *cond;
> > > - static guint i;
> > > -
> > > --static volatile gint freed =3D 0;
> > > -+static gint freed =3D 0;  /* (atomic) */
> > > -
> > > - static void
> > > - notify (gpointer p)
> > > -@@ -63,7 +63,7 @@ testcase (void)
> > > -       GThread *t1;
> > > -
> > > -       g_static_private_init (&sp);
> > > --      freed =3D 0;
> > > -+      g_atomic_int_set (&freed, 0);
> > > -
> > > -       t1 =3D g_thread_create (thread_func, NULL, TRUE, NULL);
> > > -       g_assert (t1 !=3D NULL);
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0003-tests-Fix-non-=
atomic-access-to-a-shared-variable.patch b/meta/recipes-core/glib-2.0/glib-=
2.0/0003-tests-Fix-non-atomic-access-to-a-shared-variable.patch
> > > deleted file mode 100644
> > > index 8bc71a698d..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0003-tests-Fix-non-atomic-=
access-to-a-shared-variable.patch
> > > +++ /dev/null
> > > @@ -1,90 +0,0 @@
> > > -From ea746c79faf554d980c21b0e4381753e003d2dc6 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:17:23 +0000
> > > -Subject: [PATCH 03/29] tests: Fix non-atomic access to a shared var=
iable
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -And drop the `volatile` qualifier from the variable, as that doesn=
=E2=80=99t
> > > -help with thread safety.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/tests/mainloop.c | 20 ++++++++++----------
> > > - 1 file changed, 10 insertions(+), 10 deletions(-)
> > > -
> > > -diff --git a/glib/tests/mainloop.c b/glib/tests/mainloop.c
> > > -index 16763a0ea..563a951de 100644
> > > ---- a/glib/tests/mainloop.c
> > > -+++ b/glib/tests/mainloop.c
> > > -@@ -918,7 +918,7 @@ test_mainloop_overflow (void)
> > > -   g_main_context_unref (ctx);
> > > - }
> > > -
> > > --static volatile gint ready_time_dispatched;
> > > -+static gint ready_time_dispatched;  /* (atomic) */
> > > -
> > > - static gboolean
> > > - ready_time_dispatch (GSource     *source,
> > > -@@ -964,7 +964,7 @@ test_ready_time (void)
> > > -   /* A source with no ready time set should not fire */
> > > -   g_assert_cmpint (g_source_get_ready_time (source), =3D=3D, -1);
> > > -   while (g_main_context_iteration (NULL, FALSE));
> > > --  g_assert_false (ready_time_dispatched);
> > > -+  g_assert_false (g_atomic_int_get (&ready_time_dispatched));
> > > -
> > > -   /* The ready time should not have been changed */
> > > -   g_assert_cmpint (g_source_get_ready_time (source), =3D=3D, -1);
> > > -@@ -978,37 +978,37 @@ test_ready_time (void)
> > > -    */
> > > -   g_source_set_ready_time (source, g_get_monotonic_time () + G_TIM=
E_SPAN_DAY);
> > > -   while (g_main_context_iteration (NULL, FALSE));
> > > --  g_assert_false (ready_time_dispatched);
> > > -+  g_assert_false (g_atomic_int_get (&ready_time_dispatched));
> > > -   /* Make sure it didn't get reset */
> > > -   g_assert_cmpint (g_source_get_ready_time (source), !=3D, -1);
> > > -
> > > -   /* Ready time of -1 -> don't fire */
> > > -   g_source_set_ready_time (source, -1);
> > > -   while (g_main_context_iteration (NULL, FALSE));
> > > --  g_assert_false (ready_time_dispatched);
> > > -+  g_assert_false (g_atomic_int_get (&ready_time_dispatched));
> > > -   /* Not reset, but should still be -1 from above */
> > > -   g_assert_cmpint (g_source_get_ready_time (source), =3D=3D, -1);
> > > -
> > > -   /* A ready time of the current time should fire immediately */
> > > -   g_source_set_ready_time (source, g_get_monotonic_time ());
> > > -   while (g_main_context_iteration (NULL, FALSE));
> > > --  g_assert_true (ready_time_dispatched);
> > > --  ready_time_dispatched =3D FALSE;
> > > -+  g_assert_true (g_atomic_int_get (&ready_time_dispatched));
> > > -+  g_atomic_int_set (&ready_time_dispatched, FALSE);
> > > -   /* Should have gotten reset by the handler function */
> > > -   g_assert_cmpint (g_source_get_ready_time (source), =3D=3D, -1);
> > > -
> > > -   /* As well as one in the recent past... */
> > > -   g_source_set_ready_time (source, g_get_monotonic_time () - G_TIM=
E_SPAN_SECOND);
> > > -   while (g_main_context_iteration (NULL, FALSE));
> > > --  g_assert_true (ready_time_dispatched);
> > > --  ready_time_dispatched =3D FALSE;
> > > -+  g_assert_true (g_atomic_int_get (&ready_time_dispatched));
> > > -+  g_atomic_int_set (&ready_time_dispatched, FALSE);
> > > -   g_assert_cmpint (g_source_get_ready_time (source), =3D=3D, -1);
> > > -
> > > -   /* Zero is the 'official' way to get a source to fire immediatel=
y */
> > > -   g_source_set_ready_time (source, 0);
> > > -   while (g_main_context_iteration (NULL, FALSE));
> > > --  g_assert_true (ready_time_dispatched);
> > > --  ready_time_dispatched =3D FALSE;
> > > -+  g_assert_true (g_atomic_int_get (&ready_time_dispatched));
> > > -+  g_atomic_int_set (&ready_time_dispatched, FALSE);
> > > -   g_assert_cmpint (g_source_get_ready_time (source), =3D=3D, -1);
> > > -
> > > -   /* Now do some tests of cross-thread wakeups.
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0004-tests-Drop-unn=
ecessary-volatile-qualifiers-from-test.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0004-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > deleted file mode 100644
> > > index 4b7b6f463a..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0004-tests-Drop-unnecessar=
y-volatile-qualifiers-from-test.patch
> > > +++ /dev/null
> > > @@ -1,93 +0,0 @@
> > > -From 3dda662bebb81666d009635df1055ba5c1e17b52 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:16:17 +0000
> > > -Subject: [PATCH 04/29] tests: Drop unnecessary volatile qualifiers =
from tests
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/tests/atomic.c      | 4 ++--
> > > - glib/tests/cond.c        | 2 +-
> > > - glib/tests/gwakeuptest.c | 2 +-
> > > - glib/tests/hash.c        | 2 +-
> > > - glib/tests/slice.c       | 2 +-
> > > - 5 files changed, 6 insertions(+), 6 deletions(-)
> > > -
> > > -diff --git a/glib/tests/atomic.c b/glib/tests/atomic.c
> > > -index 6b6cc7f3e..7d2459f3a 100644
> > > ---- a/glib/tests/atomic.c
> > > -+++ b/glib/tests/atomic.c
> > > -@@ -248,8 +248,8 @@ G_GNUC_END_IGNORE_DEPRECATIONS
> > > - #define THREADS 10
> > > - #define ROUNDS 10000
> > > -
> > > --volatile gint bucket[THREADS];
> > > --volatile gint atomic;
> > > -+gint bucket[THREADS];  /* never contested by threads, not accessed=
 atomically */
> > > -+gint atomic;  /* (atomic) */
> > > -
> > > - static gpointer
> > > - thread_func (gpointer data)
> > > -diff --git a/glib/tests/cond.c b/glib/tests/cond.c
> > > -index 0f0b3d249..ed338cce3 100644
> > > ---- a/glib/tests/cond.c
> > > -+++ b/glib/tests/cond.c
> > > -@@ -29,7 +29,7 @@
> > > -
> > > - static GCond cond;
> > > - static GMutex mutex;
> > > --static volatile gint next;
> > > -+static gint next;  /* locked by @mutex */
> > > -
> > > - static void
> > > - push_value (gint value)
> > > -diff --git a/glib/tests/gwakeuptest.c b/glib/tests/gwakeuptest.c
> > > -index 461a7d3de..b37fb43fc 100644
> > > ---- a/glib/tests/gwakeuptest.c
> > > -+++ b/glib/tests/gwakeuptest.c
> > > -@@ -92,7 +92,7 @@ struct context
> > > - static struct context contexts[NUM_THREADS];
> > > - static GThread *threads[NUM_THREADS];
> > > - static GWakeup *last_token_wakeup;
> > > --static volatile gint tokens_alive;
> > > -+static gint tokens_alive;  /* (atomic) */
> > > -
> > > - static void
> > > - context_init (struct context *ctx)
> > > -diff --git a/glib/tests/hash.c b/glib/tests/hash.c
> > > -index 4623d18d1..f4ff55ce1 100644
> > > ---- a/glib/tests/hash.c
> > > -+++ b/glib/tests/hash.c
> > > -@@ -1362,7 +1362,7 @@ struct _GHashTable
> > > -
> > > -   GHashFunc        hash_func;
> > > -   GEqualFunc       key_equal_func;
> > > --  volatile gint    ref_count;
> > > -+  gint             ref_count;  /* (atomic) */
> > > -
> > > - #ifndef G_DISABLE_ASSERT
> > > -   int              version;
> > > -diff --git a/glib/tests/slice.c b/glib/tests/slice.c
> > > -index f37826f3a..a566280db 100644
> > > ---- a/glib/tests/slice.c
> > > -+++ b/glib/tests/slice.c
> > > -@@ -107,7 +107,7 @@ thread_allocate (gpointer data)
> > > -   gint b;
> > > -   gint size;
> > > -   gpointer p;
> > > --  volatile gpointer *loc;
> > > -+  gpointer *loc;  /* (atomic) */
> > > -
> > > -   for (i =3D 0; i < 10000; i++)
> > > -     {
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0005-tests-Fix-non-=
atomic-access-to-some-shared-variables.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0005-tests-Fix-non-atomic-access-to-some-shared-variables.patch
> > > deleted file mode 100644
> > > index 3aecf4582b..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0005-tests-Fix-non-atomic-=
access-to-some-shared-variables.patch
> > > +++ /dev/null
> > > @@ -1,702 +0,0 @@
> > > -From 7f905ff1faf0acbe0d2ce69937e031fcacce9294 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:21:00 +0000
> > > -Subject: [PATCH 05/29] tests: Fix non-atomic access to some shared =
variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -And drop the `volatile` qualifier from the variables, as that doesn=
=
=E2=80=99t
> > > -help with thread safety.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/tests/gdbus-connection-flush.c |   6 +-
> > > - gio/tests/gdbus-connection.c       |  40 ++++----
> > > - gio/tests/gdbus-overflow.c         |  20 ++--
> > > - gio/tests/socket-service.c         |   6 +-
> > > - gio/tests/task.c                   | 150 ++++++++++++++-----------=
----
> > > - 5 files changed, 111 insertions(+), 111 deletions(-)
> > > -
> > > ---- a/gio/tests/gdbus-connection-flush.c
> > > -+++ b/gio/tests/gdbus-connection-flush.c
> > > -@@ -43,9 +43,9 @@ G_LOCK_DEFINE_STATIC (write);
> > > - typedef struct {
> > > -     GFilterOutputStream parent;
> > > -
> > > --    volatile gint started;
> > > --    volatile gint finished;
> > > --    volatile gint flushed;
> > > -+    gint started;  /* (atomic) */
> > > -+    gint finished;  /* (atomic) */
> > > -+    gint flushed;  /* (atomic) */
> > > -
> > > -     GOutputStream *real_output;
> > > - } MyOutputStream;
> > > ---- a/gio/tests/gdbus-connection.c
> > > -+++ b/gio/tests/gdbus-connection.c
> > > -@@ -61,9 +61,9 @@ _log (const gchar *format, ...)
> > > - static gboolean
> > > - test_connection_quit_mainloop (gpointer user_data)
> > > - {
> > > --  volatile gboolean *quit_mainloop_fired =3D user_data;
> > > -+  gboolean *quit_mainloop_fired =3D user_data;  /* (atomic) */
> > > -   _log ("quit_mainloop_fired");
> > > --  *quit_mainloop_fired =3D TRUE;
> > > -+  g_atomic_int_set (quit_mainloop_fired, TRUE);
> > > -   g_main_loop_quit (loop);
> > > -   return TRUE;
> > > - }
> > > -@@ -113,8 +113,8 @@ on_name_owner_changed (GDBusConnection *
> > > - static void
> > > - a_gdestroynotify_that_sets_a_gboolean_to_true_and_quits_loop (gpoi=
nter user_data)
> > > - {
> > > --  volatile gboolean *val =3D user_data;
> > > --  *val =3D TRUE;
> > > -+  gboolean *val =3D user_data;  /* (atomic) */
> > > -+  g_atomic_int_set (val, TRUE);
> > > -   _log ("destroynotify fired for %p", val);
> > > -   g_main_loop_quit (loop);
> > > - }
> > > -@@ -143,10 +143,10 @@ test_connection_life_cycle (void)
> > > -   GDBusConnection *c;
> > > -   GDBusConnection *c2;
> > > -   GError *error;
> > > --  volatile gboolean on_signal_registration_freed_called;
> > > --  volatile gboolean on_filter_freed_called;
> > > --  volatile gboolean on_register_object_freed_called;
> > > --  volatile gboolean quit_mainloop_fired;
> > > -+  gboolean on_signal_registration_freed_called;  /* (atomic) */
> > > -+  gboolean on_filter_freed_called;  /* (atomic) */
> > > -+  gboolean on_register_object_freed_called;  /* (atomic) */
> > > -+  gboolean quit_mainloop_fired;  /* (atomic) */
> > > -   guint quit_mainloop_id;
> > > -   guint registration_id;
> > > -
> > > -@@ -208,7 +208,7 @@ test_connection_life_cycle (void)
> > > -   g_assert_no_error (error);
> > > -   g_assert_nonnull (c2);
> > > -   /* signal registration */
> > > --  on_signal_registration_freed_called =3D FALSE;
> > > -+  g_atomic_int_set (&on_signal_registration_freed_called, FALSE);
> > > -   g_dbus_connection_signal_subscribe (c2,
> > > -                                       "org.freedesktop.DBus", /* b=
us name */
> > > -                                       "org.freedesktop.DBus", /* i=
nterface */
> > > -@@ -220,13 +220,13 @@ test_connection_life_cycle (void)
> > > -                                       (gpointer) &on_signal_regist=
ration_freed_called,
> > > -                                       a_gdestroynotify_that_sets_a=
_gboolean_to_true_and_quits_loop);
> > > -   /* filter func */
> > > --  on_filter_freed_called =3D FALSE;
> > > -+  g_atomic_int_set (&on_filter_freed_called, FALSE);
> > > -   g_dbus_connection_add_filter (c2,
> > > -                                 some_filter_func,
> > > -                                 (gpointer) &on_filter_freed_called=
,
> > > -                                 a_gdestroynotify_that_sets_a_gbool=
ean_to_true_and_quits_loop);
> > > -   /* object registration */
> > > --  on_register_object_freed_called =3D FALSE;
> > > -+  g_atomic_int_set (&on_register_object_freed_called, FALSE);
> > > -   error =3D NULL;
> > > -   registration_id =3D g_dbus_connection_register_object (c2,
> > > -                                                        "/foo",
> > > -@@ -239,7 +239,7 @@ test_connection_life_cycle (void)
> > > -   g_assert_cmpuint (registration_id, >, 0);
> > > -   /* ok, finalize the connection and check that all the GDestroyNo=
tify functions are invoked as expected */
> > > -   g_object_unref (c2);
> > > --  quit_mainloop_fired =3D FALSE;
> > > -+  g_atomic_int_set (&quit_mainloop_fired, FALSE);
> > > -   quit_mainloop_id =3D g_timeout_add (30000, test_connection_quit_=
mainloop, (gpointer) &quit_mainloop_fired);
> > > -   _log ("destroynotifies for\n"
> > > -         " register_object %p\n"
> > > -@@ -250,21 +250,21 @@ test_connection_life_cycle (void)
> > > -         &on_signal_registration_freed_called);
> > > -   while (TRUE)
> > > -     {
> > > --      if (on_signal_registration_freed_called &&
> > > --          on_filter_freed_called &&
> > > --          on_register_object_freed_called)
> > > -+      if (g_atomic_int_get (&on_signal_registration_freed_called) =
&&
> > > -+          g_atomic_int_get (&on_filter_freed_called) &&
> > > -+          g_atomic_int_get (&on_register_object_freed_called))
> > > -         break;
> > > --      if (quit_mainloop_fired)
> > > -+      if (g_atomic_int_get (&quit_mainloop_fired))
> > > -         break;
> > > -       _log ("entering loop");
> > > -       g_main_loop_run (loop);
> > > -       _log ("exiting loop");
> > > -     }
> > > -   g_source_remove (quit_mainloop_id);
> > > --  g_assert_true (on_signal_registration_freed_called);
> > > --  g_assert_true (on_filter_freed_called);
> > > --  g_assert_true (on_register_object_freed_called);
> > > --  g_assert_false (quit_mainloop_fired);
> > > -+  g_assert_true (g_atomic_int_get (&on_signal_registration_freed_c=
alled));
> > > -+  g_assert_true (g_atomic_int_get (&on_filter_freed_called));
> > > -+  g_assert_true (g_atomic_int_get (&on_register_object_freed_calle=
d));
> > > -+  g_assert_false (g_atomic_int_get (&quit_mainloop_fired));
> > > -
> > > -   /*
> > > -    *  Check for correct behavior when the bus goes away
> > > ---- a/gio/tests/gdbus-overflow.c
> > > -+++ b/gio/tests/gdbus-overflow.c
> > > -@@ -86,8 +86,8 @@ overflow_filter_func (GDBusConnection *c
> > > -                       gboolean         incoming,
> > > -                       gpointer         user_data)
> > > - {
> > > --  volatile gint *counter =3D user_data;
> > > --  *counter +=3D 1;
> > > -+  gint *counter =3D user_data;  /* (atomic) */
> > > -+  g_atomic_int_inc (counter);
> > > -   return message;
> > > - }
> > > -
> > > -@@ -108,8 +108,8 @@ test_overflow (void)
> > > -   GDBusConnection *producer, *consumer;
> > > -   GError *error;
> > > -   GTimer *timer;
> > > --  volatile gint n_messages_received;
> > > --  volatile gint n_messages_sent;
> > > -+  gint n_messages_received;  /* (atomic) */
> > > -+  gint n_messages_sent;  /* (atomic) */
> > > -
> > > -   g_assert_cmpint (socketpair (AF_UNIX, SOCK_STREAM, 0, sv), =3D=
=3D, 0);
> > > -
> > > -@@ -129,7 +129,7 @@ test_overflow (void)
> > > -   g_dbus_connection_set_exit_on_close (producer, TRUE);
> > > -   g_assert_no_error (error);
> > > -   g_object_unref (socket_connection);
> > > --  n_messages_sent =3D 0;
> > > -+  g_atomic_int_set (&n_messages_sent, 0);
> > > -   g_dbus_connection_add_filter (producer, overflow_filter_func, (g=
pointer) &n_messages_sent, NULL);
> > > -
> > > -   /* send enough data that we get an EAGAIN */
> > > -@@ -155,7 +155,7 @@ test_overflow (void)
> > > -    */
> > > -   g_timeout_add (500, overflow_on_500ms_later_func, NULL);
> > > -   g_main_loop_run (loop);
> > > --  g_assert_cmpint (n_messages_sent, <, OVERFLOW_NUM_SIGNALS);
> > > -+  g_assert_cmpint (g_atomic_int_get (&n_messages_sent), <, OVERFLO=
W_NUM_SIGNALS);
> > > -
> > > -   /* now suck it all out as a client, and add it up */
> > > -   socket =3D g_socket_new_from_fd (sv[1], &error);
> > > -@@ -171,18 +171,18 @@ test_overflow (void)
> > > -                                        &error);
> > > -   g_assert_no_error (error);
> > > -   g_object_unref (socket_connection);
> > > --  n_messages_received =3D 0;
> > > -+  g_atomic_int_set (&n_messages_received, 0);
> > > -   g_dbus_connection_add_filter (consumer, overflow_filter_func, (g=
pointer) &n_messages_received, NULL);
> > > -   g_dbus_connection_start_message_processing (consumer);
> > > -
> > > -   timer =3D g_timer_new ();
> > > -   g_timer_start (timer);
> > > -
> > > --  while (n_messages_received < OVERFLOW_NUM_SIGNALS && g_timer_ela=
psed (timer, NULL) < OVERFLOW_TIMEOUT_SEC)
> > > -+  while (g_atomic_int_get (&n_messages_received) < OVERFLOW_NUM_SI=
GNALS && g_timer_elapsed (timer, NULL) < OVERFLOW_TIMEOUT_SEC)
> > > -       g_main_context_iteration (NULL, FALSE);
> > > -
> > > --  g_assert_cmpint (n_messages_sent, =3D=3D, OVERFLOW_NUM_SIGNALS);
> > > --  g_assert_cmpint (n_messages_received, =3D=3D, OVERFLOW_NUM_SIGNA=
LS);
> > > -+  g_assert_cmpint (g_atomic_int_get (&n_messages_sent), =3D=3D, OV=
ERFLOW_NUM_SIGNALS);
> > > -+  g_assert_cmpint (g_atomic_int_get (&n_messages_received), =3D=3D=
, OVERFLOW_NUM_SIGNALS);
> > > -
> > > -   g_timer_destroy (timer);
> > > -   g_object_unref (consumer);
> > > ---- a/gio/tests/socket-service.c
> > > -+++ b/gio/tests/socket-service.c
> > > -@@ -99,7 +99,7 @@ test_start_stop (void)
> > > -
> > > - GMutex mutex_712570;
> > > - GCond cond_712570;
> > > --volatile gboolean finalized;
> > > -+gboolean finalized;  /* (atomic) */
> > > -
> > > - GType test_threaded_socket_service_get_type (void);
> > > - typedef GThreadedSocketService TestThreadedSocketService;
> > > -@@ -120,7 +120,7 @@ test_threaded_socket_service_finalize (G
> > > -   /* Signal the main thread that finalization completed successful=
ly
> > > -    * rather than hanging.
> > > -    */
> > > --  finalized =3D TRUE;
> > > -+  g_atomic_int_set (&finalized, TRUE);
> > > -   g_cond_signal (&cond_712570);
> > > -   g_mutex_unlock (&mutex_712570);
> > > - }
> > > -@@ -235,7 +235,7 @@ test_threaded_712570 (void)
> > > -    */
> > > -   g_object_unref (service);
> > > -
> > > --  while (!finalized)
> > > -+  while (!g_atomic_int_get (&finalized))
> > > -     g_cond_wait (&cond_712570, &mutex_712570);
> > > -   g_mutex_unlock (&mutex_712570);
> > > - }
> > > ---- a/gio/tests/task.c
> > > -+++ b/gio/tests/task.c
> > > -@@ -957,7 +957,7 @@ task_weak_notify (gpointer  user_data,
> > > -   gboolean *weak_notify_ran =3D user_data;
> > > -
> > > -   g_mutex_lock (&run_in_thread_mutex);
> > > --  *weak_notify_ran =3D TRUE;
> > > -+  g_atomic_int_set (weak_notify_ran, TRUE);
> > > -   g_cond_signal (&run_in_thread_cond);
> > > -   g_mutex_unlock (&run_in_thread_mutex);
> > > - }
> > > -@@ -1007,7 +1007,7 @@ run_in_thread_thread (GTask        *task
> > > -   g_assert (g_thread_self () !=3D main_thread);
> > > -
> > > -   g_mutex_lock (&run_in_thread_mutex);
> > > --  *thread_ran =3D TRUE;
> > > -+  g_atomic_int_set (thread_ran, TRUE);
> > > -   g_cond_signal (&run_in_thread_cond);
> > > -   g_mutex_unlock (&run_in_thread_mutex);
> > > -
> > > -@@ -1018,8 +1018,8 @@ static void
> > > - test_run_in_thread (void)
> > > - {
> > > -   GTask *task;
> > > --  volatile gboolean thread_ran =3D FALSE;
> > > --  volatile gboolean weak_notify_ran =3D FALSE;
> > > -+  gboolean thread_ran =3D FALSE;  /* (atomic) */
> > > -+  gboolean weak_notify_ran =3D FALSE;  /* (atomic) */
> > > -   gboolean notification_emitted =3D FALSE;
> > > -   gboolean done =3D FALSE;
> > > -
> > > -@@ -1033,12 +1033,12 @@ test_run_in_thread (void)
> > > -   g_task_run_in_thread (task, run_in_thread_thread);
> > > -
> > > -   g_mutex_lock (&run_in_thread_mutex);
> > > --  while (!thread_ran)
> > > -+  while (!g_atomic_int_get (&thread_ran))
> > > -     g_cond_wait (&run_in_thread_cond, &run_in_thread_mutex);
> > > -   g_mutex_unlock (&run_in_thread_mutex);
> > > -
> > > -   g_assert (done =3D=3D FALSE);
> > > --  g_assert (weak_notify_ran =3D=3D FALSE);
> > > -+  g_assert_false (g_atomic_int_get (&weak_notify_ran));
> > > -
> > > -   g_main_loop_run (loop);
> > > -
> > > -@@ -1050,7 +1050,7 @@ test_run_in_thread (void)
> > > -   g_object_unref (task);
> > > -
> > > -   g_mutex_lock (&run_in_thread_mutex);
> > > --  while (!weak_notify_ran)
> > > -+  while (!g_atomic_int_get (&weak_notify_ran))
> > > -     g_cond_wait (&run_in_thread_cond, &run_in_thread_mutex);
> > > -   g_mutex_unlock (&run_in_thread_mutex);
> > > - }
> > > -@@ -1081,7 +1081,7 @@ run_in_thread_sync_thread (GTask
> > > -
> > > -   g_assert (g_thread_self () !=3D main_thread);
> > > -
> > > --  *thread_ran =3D TRUE;
> > > -+  g_atomic_int_set (thread_ran, TRUE);
> > > -   g_task_return_int (task, magic);
> > > - }
> > > -
> > > -@@ -1102,7 +1102,7 @@ test_run_in_thread_sync (void)
> > > -   g_task_set_task_data (task, &thread_ran, NULL);
> > > -   g_task_run_in_thread_sync (task, run_in_thread_sync_thread);
> > > -
> > > --  g_assert (thread_ran =3D=3D TRUE);
> > > -+  g_assert_true (g_atomic_int_get (&thread_ran));
> > > -   g_assert (task !=3D NULL);
> > > -   g_assert (!g_task_had_error (task));
> > > -   g_assert_true (g_task_get_completed (task));
> > > -@@ -1487,8 +1487,8 @@ test_return_on_cancel (void)
> > > - {
> > > -   GTask *task;
> > > -   GCancellable *cancellable;
> > > --  volatile ThreadState thread_state;
> > > --  volatile gboolean weak_notify_ran =3D FALSE;
> > > -+  ThreadState thread_state;  /* (atomic) */
> > > -+  gboolean weak_notify_ran =3D FALSE;  /* (atomic) */
> > > -   gboolean callback_ran;
> > > -   gboolean notification_emitted =3D FALSE;
> > > -
> > > -@@ -1498,7 +1498,7 @@ test_return_on_cancel (void)
> > > -    * early.
> > > -    */
> > > -   callback_ran =3D FALSE;
> > > --  thread_state =3D THREAD_STARTING;
> > > -+  g_atomic_int_set (&thread_state, THREAD_STARTING);
> > > -   task =3D g_task_new (NULL, cancellable, return_on_cancel_callbac=
k, &callback_ran);
> > > -   g_signal_connect (task, "notify::completed",
> > > -                     (GCallback) completed_cb, &notification_emitte=
d);
> > > -@@ -1509,18 +1509,18 @@ test_return_on_cancel (void)
> > > -   g_task_run_in_thread (task, return_on_cancel_thread);
> > > -   g_object_unref (task);
> > > -
> > > --  while (thread_state =3D=3D THREAD_STARTING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_STARTING)
> > > -     g_cond_wait (&roc_init_cond, &roc_init_mutex);
> > > -   g_mutex_unlock (&roc_init_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -   g_assert (callback_ran =3D=3D FALSE);
> > > -
> > > -   g_cancellable_cancel (cancellable);
> > > -   g_mutex_unlock (&roc_finish_mutex);
> > > -   g_main_loop_run (loop);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_COMPLETED);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_COMPLETED);
> > > -   g_assert (callback_ran =3D=3D TRUE);
> > > -   g_assert_true (notification_emitted);
> > > -
> > > -@@ -1529,7 +1529,7 @@ test_return_on_cancel (void)
> > > -   /* If return-on-cancel is TRUE, it does return early */
> > > -   callback_ran =3D FALSE;
> > > -   notification_emitted =3D FALSE;
> > > --  thread_state =3D THREAD_STARTING;
> > > -+  g_atomic_int_set (&thread_state, THREAD_STARTING);
> > > -   task =3D g_task_new (NULL, cancellable, return_on_cancel_callbac=
k, &callback_ran);
> > > -   g_object_weak_ref (G_OBJECT (task), task_weak_notify, (gpointer)=
&weak_notify_ran);
> > > -   g_signal_connect (task, "notify::completed",
> > > -@@ -1542,27 +1542,27 @@ test_return_on_cancel (void)
> > > -   g_task_run_in_thread (task, return_on_cancel_thread);
> > > -   g_object_unref (task);
> > > -
> > > --  while (thread_state =3D=3D THREAD_STARTING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_STARTING)
> > > -     g_cond_wait (&roc_init_cond, &roc_init_mutex);
> > > -   g_mutex_unlock (&roc_init_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -   g_assert (callback_ran =3D=3D FALSE);
> > > -
> > > -   g_cancellable_cancel (cancellable);
> > > -   g_main_loop_run (loop);
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -   g_assert (callback_ran =3D=3D TRUE);
> > > -
> > > --  g_assert (weak_notify_ran =3D=3D FALSE);
> > > -+  g_assert_false (g_atomic_int_get (&weak_notify_ran));
> > > -
> > > --  while (thread_state =3D=3D THREAD_RUNNING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_RUNNING)
> > > -     g_cond_wait (&roc_finish_cond, &roc_finish_mutex);
> > > -   g_mutex_unlock (&roc_finish_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_CANCELLED);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_CANCELLED);
> > > -   g_mutex_lock (&run_in_thread_mutex);
> > > --  while (!weak_notify_ran)
> > > -+  while (!g_atomic_int_get (&weak_notify_ran))
> > > -     g_cond_wait (&run_in_thread_cond, &run_in_thread_mutex);
> > > -   g_mutex_unlock (&run_in_thread_mutex);
> > > -
> > > -@@ -1574,7 +1574,7 @@ test_return_on_cancel (void)
> > > -    */
> > > -   callback_ran =3D FALSE;
> > > -   notification_emitted =3D FALSE;
> > > --  thread_state =3D THREAD_STARTING;
> > > -+  g_atomic_int_set (&thread_state, THREAD_STARTING);
> > > -   task =3D g_task_new (NULL, cancellable, return_on_cancel_callbac=
k, &callback_ran);
> > > -   g_signal_connect (task, "notify::completed",
> > > -                     (GCallback) completed_cb, &notification_emitte=
d);
> > > -@@ -1591,17 +1591,17 @@ test_return_on_cancel (void)
> > > -   g_main_loop_run (loop);
> > > -   g_assert (callback_ran =3D=3D TRUE);
> > > -
> > > --  while (thread_state =3D=3D THREAD_STARTING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_STARTING)
> > > -     g_cond_wait (&roc_init_cond, &roc_init_mutex);
> > > -   g_mutex_unlock (&roc_init_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -
> > > --  while (thread_state =3D=3D THREAD_RUNNING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_RUNNING)
> > > -     g_cond_wait (&roc_finish_cond, &roc_finish_mutex);
> > > -   g_mutex_unlock (&roc_finish_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_CANCELLED);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_CANCELLED);
> > > -   g_assert_true (notification_emitted);
> > > -
> > > -   g_object_unref (cancellable);
> > > -@@ -1621,7 +1621,7 @@ test_return_on_cancel_sync (void)
> > > - {
> > > -   GTask *task;
> > > -   GCancellable *cancellable;
> > > --  volatile ThreadState thread_state;
> > > -+  ThreadState thread_state;  /* (atomic) */
> > > -   GThread *runner_thread;
> > > -   gssize ret;
> > > -   GError *error =3D NULL;
> > > -@@ -1630,7 +1630,7 @@ test_return_on_cancel_sync (void)
> > > -
> > > -   /* If return-on-cancel is FALSE, the task does not return early.
> > > -    */
> > > --  thread_state =3D THREAD_STARTING;
> > > -+  g_atomic_int_set (&thread_state, THREAD_STARTING);
> > > -   task =3D g_task_new (NULL, cancellable, run_in_thread_sync_callb=
ack, NULL);
> > > -
> > > -   g_task_set_task_data (task, (gpointer)&thread_state, NULL);
> > > -@@ -1639,16 +1639,16 @@ test_return_on_cancel_sync (void)
> > > -   runner_thread =3D g_thread_new ("return-on-cancel-sync runner th=
read",
> > > -                                 cancel_sync_runner_thread, task);
> > > -
> > > --  while (thread_state =3D=3D THREAD_STARTING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_STARTING)
> > > -     g_cond_wait (&roc_init_cond, &roc_init_mutex);
> > > -   g_mutex_unlock (&roc_init_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -
> > > -   g_cancellable_cancel (cancellable);
> > > -   g_mutex_unlock (&roc_finish_mutex);
> > > -   g_thread_join (runner_thread);
> > > --  g_assert (thread_state =3D=3D THREAD_COMPLETED);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_COMPLETED);
> > > -
> > > -   ret =3D g_task_propagate_int (task, &error);
> > > -   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CANCELLED);
> > > -@@ -1660,7 +1660,7 @@ test_return_on_cancel_sync (void)
> > > -   g_cancellable_reset (cancellable);
> > > -
> > > -   /* If return-on-cancel is TRUE, it does return early */
> > > --  thread_state =3D THREAD_STARTING;
> > > -+  g_atomic_int_set (&thread_state, THREAD_STARTING);
> > > -   task =3D g_task_new (NULL, cancellable, run_in_thread_sync_callb=
ack, NULL);
> > > -   g_task_set_return_on_cancel (task, TRUE);
> > > -
> > > -@@ -1670,15 +1670,15 @@ test_return_on_cancel_sync (void)
> > > -   runner_thread =3D g_thread_new ("return-on-cancel-sync runner th=
read",
> > > -                                 cancel_sync_runner_thread, task);
> > > -
> > > --  while (thread_state =3D=3D THREAD_STARTING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_STARTING)
> > > -     g_cond_wait (&roc_init_cond, &roc_init_mutex);
> > > -   g_mutex_unlock (&roc_init_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -
> > > -   g_cancellable_cancel (cancellable);
> > > -   g_thread_join (runner_thread);
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -
> > > -   ret =3D g_task_propagate_int (task, &error);
> > > -   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CANCELLED);
> > > -@@ -1687,18 +1687,18 @@ test_return_on_cancel_sync (void)
> > > -
> > > -   g_object_unref (task);
> > > -
> > > --  while (thread_state =3D=3D THREAD_RUNNING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_RUNNING)
> > > -     g_cond_wait (&roc_finish_cond, &roc_finish_mutex);
> > > -   g_mutex_unlock (&roc_finish_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_CANCELLED);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_CANCELLED);
> > > -
> > > -   g_cancellable_reset (cancellable);
> > > -
> > > -   /* If the task is already cancelled before it starts, it returns
> > > -    * immediately, but the thread func still runs.
> > > -    */
> > > --  thread_state =3D THREAD_STARTING;
> > > -+  g_atomic_int_set (&thread_state, THREAD_STARTING);
> > > -   task =3D g_task_new (NULL, cancellable, run_in_thread_sync_callb=
ack, NULL);
> > > -   g_task_set_return_on_cancel (task, TRUE);
> > > -
> > > -@@ -1711,7 +1711,7 @@ test_return_on_cancel_sync (void)
> > > -                                 cancel_sync_runner_thread, task);
> > > -
> > > -   g_thread_join (runner_thread);
> > > --  g_assert (thread_state =3D=3D THREAD_STARTING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_STARTING);
> > > -
> > > -   ret =3D g_task_propagate_int (task, &error);
> > > -   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CANCELLED);
> > > -@@ -1720,17 +1720,17 @@ test_return_on_cancel_sync (void)
> > > -
> > > -   g_object_unref (task);
> > > -
> > > --  while (thread_state =3D=3D THREAD_STARTING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_STARTING)
> > > -     g_cond_wait (&roc_init_cond, &roc_init_mutex);
> > > -   g_mutex_unlock (&roc_init_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_RUNNING);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_RUNNING);
> > > -
> > > --  while (thread_state =3D=3D THREAD_RUNNING)
> > > -+  while (g_atomic_int_get (&thread_state) =3D=3D THREAD_RUNNING)
> > > -     g_cond_wait (&roc_finish_cond, &roc_finish_mutex);
> > > -   g_mutex_unlock (&roc_finish_mutex);
> > > -
> > > --  g_assert (thread_state =3D=3D THREAD_CANCELLED);
> > > -+  g_assert_cmpint (g_atomic_int_get (&thread_state), =3D=3D, THREA=
D_CANCELLED);
> > > -
> > > -   g_object_unref (cancellable);
> > > - }
> > > -@@ -1776,7 +1776,7 @@ return_on_cancel_atomic_thread (GTask
> > > -                                 gpointer      task_data,
> > > -                                 GCancellable *cancellable)
> > > - {
> > > --  gint *state =3D task_data;
> > > -+  gint *state =3D task_data;  /* (atomic) */
> > > -
> > > -   g_assert (source_object =3D=3D g_task_get_source_object (task));
> > > -   g_assert (task_data =3D=3D g_task_get_task_data (task));
> > > -@@ -1784,34 +1784,34 @@ return_on_cancel_atomic_thread (GTask
> > > -   g_assert_false (g_task_get_completed (task));
> > > -
> > > -   g_assert (g_thread_self () !=3D main_thread);
> > > --  g_assert_cmpint (*state, =3D=3D, 0);
> > > -+  g_assert_cmpint (g_atomic_int_get (state), =3D=3D, 0);
> > > -
> > > -   g_mutex_lock (&roca_mutex_1);
> > > --  *state =3D 1;
> > > -+  g_atomic_int_set (state, 1);
> > > -   g_cond_signal (&roca_cond_1);
> > > -   g_mutex_unlock (&roca_mutex_1);
> > > -
> > > -   g_mutex_lock (&roca_mutex_2);
> > > -   if (g_task_set_return_on_cancel (task, FALSE))
> > > --    *state =3D 2;
> > > -+    g_atomic_int_set (state, 2);
> > > -   else
> > > --    *state =3D 3;
> > > -+    g_atomic_int_set (state, 3);
> > > -   g_cond_signal (&roca_cond_2);
> > > -   g_mutex_unlock (&roca_mutex_2);
> > > -
> > > -   g_mutex_lock (&roca_mutex_1);
> > > -   if (g_task_set_return_on_cancel (task, TRUE))
> > > --    *state =3D 4;
> > > -+    g_atomic_int_set (state, 4);
> > > -   else
> > > --    *state =3D 5;
> > > -+    g_atomic_int_set (state, 5);
> > > -   g_cond_signal (&roca_cond_1);
> > > -   g_mutex_unlock (&roca_mutex_1);
> > > -
> > > -   g_mutex_lock (&roca_mutex_2);
> > > -   if (g_task_set_return_on_cancel (task, TRUE))
> > > --    *state =3D 6;
> > > -+    g_atomic_int_set (state, 6);
> > > -   else
> > > --    *state =3D 7;
> > > -+    g_atomic_int_set (state, 7);
> > > -   g_cond_signal (&roca_cond_2);
> > > -   g_mutex_unlock (&roca_mutex_2);
> > > -
> > > -@@ -1823,7 +1823,7 @@ test_return_on_cancel_atomic (void)
> > > - {
> > > -   GTask *task;
> > > -   GCancellable *cancellable;
> > > --  volatile gint state;
> > > -+  gint state;  /* (atomic) */
> > > -   gboolean notification_emitted =3D FALSE;
> > > -   gboolean callback_ran;
> > > -
> > > -@@ -1832,7 +1832,7 @@ test_return_on_cancel_atomic (void)
> > > -   g_mutex_lock (&roca_mutex_2);
> > > -
> > > -   /* If we don't cancel it, each set_return_on_cancel() call will =
succeed */
> > > --  state =3D 0;
> > > -+  g_atomic_int_set (&state, 0);
> > > -   callback_ran =3D FALSE;
> > > -   task =3D g_task_new (NULL, cancellable, return_on_cancel_atomic_=
callback, &callback_ran);
> > > -   g_task_set_return_on_cancel (task, TRUE);
> > > -@@ -1843,23 +1843,23 @@ test_return_on_cancel_atomic (void)
> > > -   g_task_run_in_thread (task, return_on_cancel_atomic_thread);
> > > -   g_object_unref (task);
> > > -
> > > --  g_assert_cmpint (state, =3D=3D, 0);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 0);
> > > -
> > > --  while (state =3D=3D 0)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 0)
> > > -     g_cond_wait (&roca_cond_1, &roca_mutex_1);
> > > --  g_assert (state =3D=3D 1);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 1);
> > > -
> > > --  while (state =3D=3D 1)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 1)
> > > -     g_cond_wait (&roca_cond_2, &roca_mutex_2);
> > > --  g_assert (state =3D=3D 2);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 2);
> > > -
> > > --  while (state =3D=3D 2)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 2)
> > > -     g_cond_wait (&roca_cond_1, &roca_mutex_1);
> > > --  g_assert (state =3D=3D 4);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 4);
> > > -
> > > --  while (state =3D=3D 4)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 4)
> > > -     g_cond_wait (&roca_cond_2, &roca_mutex_2);
> > > --  g_assert (state =3D=3D 6);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 6);
> > > -
> > > -   /* callback assumes there'll be a cancelled error */
> > > -   g_cancellable_cancel (cancellable);
> > > -@@ -1876,7 +1876,7 @@ test_return_on_cancel_atomic (void)
> > > -    * task won't complete right away, and further
> > > -    * g_task_set_return_on_cancel() calls will return FALSE.
> > > -    */
> > > --  state =3D 0;
> > > -+  g_atomic_int_set (&state, 0);
> > > -   callback_ran =3D FALSE;
> > > -   notification_emitted =3D FALSE;
> > > -   task =3D g_task_new (NULL, cancellable, return_on_cancel_atomic_=
callback, &callback_ran);
> > > -@@ -1887,16 +1887,16 @@ test_return_on_cancel_atomic (void)
> > > -   g_task_set_task_data (task, (gpointer)&state, NULL);
> > > -   g_task_run_in_thread (task, return_on_cancel_atomic_thread);
> > > -
> > > --  g_assert_cmpint (state, =3D=3D, 0);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 0);
> > > -
> > > --  while (state =3D=3D 0)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 0)
> > > -     g_cond_wait (&roca_cond_1, &roca_mutex_1);
> > > --  g_assert (state =3D=3D 1);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 1);
> > > -   g_assert (g_task_get_return_on_cancel (task));
> > > -
> > > --  while (state =3D=3D 1)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 1)
> > > -     g_cond_wait (&roca_cond_2, &roca_mutex_2);
> > > --  g_assert (state =3D=3D 2);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 2);
> > > -   g_assert (!g_task_get_return_on_cancel (task));
> > > -
> > > -   g_cancellable_cancel (cancellable);
> > > -@@ -1904,18 +1904,18 @@ test_return_on_cancel_atomic (void)
> > > -   g_main_loop_run (loop);
> > > -   g_assert (callback_ran =3D=3D FALSE);
> > > -
> > > --  while (state =3D=3D 2)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 2)
> > > -     g_cond_wait (&roca_cond_1, &roca_mutex_1);
> > > --  g_assert (state =3D=3D 5);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 5);
> > > -   g_assert (!g_task_get_return_on_cancel (task));
> > > -
> > > -   g_main_loop_run (loop);
> > > -   g_assert (callback_ran =3D=3D TRUE);
> > > -   g_assert_true (notification_emitted);
> > > -
> > > --  while (state =3D=3D 5)
> > > -+  while (g_atomic_int_get (&state) =3D=3D 5)
> > > -     g_cond_wait (&roca_cond_2, &roca_mutex_2);
> > > --  g_assert (state =3D=3D 7);
> > > -+  g_assert_cmpint (g_atomic_int_get (&state), =3D=3D, 7);
> > > -
> > > -   g_object_unref (cancellable);
> > > -   g_mutex_unlock (&roca_mutex_1);
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0006-tests-Drop-unn=
ecessary-volatile-qualifiers-from-test.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0006-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > deleted file mode 100644
> > > index 7f22b4d46b..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0006-tests-Drop-unnecessar=
y-volatile-qualifiers-from-test.patch
> > > +++ /dev/null
> > > @@ -1,35 +0,0 @@
> > > -From f4607def1695efb50eb49e0586eed0f5557935f2 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:20:37 +0000
> > > -Subject: [PATCH 06/29] tests: Drop unnecessary volatile qualifiers =
from tests
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/tests/g-file-info.c | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
> > > -index 809b0ec79..1a02b5e0e 100644
> > > ---- a/gio/tests/g-file-info.c
> > > -+++ b/gio/tests/g-file-info.c
> > > -@@ -221,7 +221,7 @@ test_internal_enhanced_stdio (void)
> > > -   guint64 size_p0, alsize_p0, size_ps, alsize_ps;
> > > -   const gchar *id_p0;
> > > -   const gchar *id_p1;
> > > --  volatile guint64 time_p0;
> > > -+  guint64 time_p0;
> > > -   gchar *tmp_dir;
> > > -   wchar_t *programdata_dir_w;
> > > -   wchar_t *users_dir_w;
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0007-gdbusconnectio=
n-Drop-unnecessary-volatile-qualifiers.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0007-gdbusconnection-Drop-unnecessary-volatile-qualifiers.patch
> > > deleted file mode 100644
> > > index 78753f821a..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0007-gdbusconnection-Drop-=
unnecessary-volatile-qualifiers.patch
> > > +++ /dev/null
> > > @@ -1,111 +0,0 @@
> > > -From 33612404397f87f0cd45da90d3aa9ab60df895ee Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:24:28 +0000
> > > -Subject: [PATCH 07/29] gdbusconnection: Drop unnecessary volatile q=
ualifiers
> > > - from variables
> > > -
> > > -This should introduce no API changes; there are public functions
> > > -exported by `GDBusConnection` which still have some (incorrectly)
> > > -`volatile` arguments, but dropping those qualifiers would be an API
> > > -break.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/gdbusconnection.c | 22 +++++++++++-----------
> > > - 1 file changed, 11 insertions(+), 11 deletions(-)
> > > -
> > > -diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
> > > -index ed8cf6219..91c365e80 100644
> > > ---- a/gio/gdbusconnection.c
> > > -+++ b/gio/gdbusconnection.c
> > > -@@ -393,7 +393,7 @@ struct _GDBusConnection
> > > -    * FLAG_CLOSED is the closed property. It may be read at any tim=
e, but
> > > -    * may only be written while holding @lock.
> > > -    */
> > > --  volatile gint atomic_flags;
> > > -+  gint atomic_flags;  /* (atomic) */
> > > -
> > > -   /* If the connection could not be established during initable_in=
it(),
> > > -    * this GError will be set.
> > > -@@ -1596,7 +1596,7 @@ static gboolean
> > > - g_dbus_connection_send_message_unlocked (GDBusConnection   *connec=
tion,
> > > -                                          GDBusMessage      *messag=
e,
> > > -                                          GDBusSendMessageFlags fla=
gs,
> > > --                                         volatile guint32  *out_se=
rial,
> > > -+                                         guint32           *out_se=
rial,
> > > -                                          GError           **error)
> > > - {
> > > -   guchar *blob;
> > > -@@ -1741,7 +1741,7 @@ g_dbus_connection_send_message (GDBusConnecti=
on        *connection,
> > > -   g_return_val_if_fail (error =3D=3D NULL || *error =3D=3D NULL, F=
ALSE);
> > > -
> > > -   CONNECTION_LOCK (connection);
> > > --  ret =3D g_dbus_connection_send_message_unlocked (connection, mes=
sage, flags, out_serial, error);
> > > -+  ret =3D g_dbus_connection_send_message_unlocked (connection, mes=
sage, flags, (guint32 *) out_serial, error);
> > > -   CONNECTION_UNLOCK (connection);
> > > -   return ret;
> > > - }
> > > -@@ -1901,7 +1901,7 @@ g_dbus_connection_send_message_with_reply_unl=
ocked (GDBusConnection     *connect
> > > -                                                     GDBusMessage  =
      *message,
> > > -                                                     GDBusSendMessa=
geFlags flags,
> > > -                                                     gint          =
       timeout_msec,
> > > --                                                    volatile guint=
32    *out_serial,
> > > -+                                                    guint32       =
      *out_serial,
> > > -                                                     GCancellable  =
      *cancellable,
> > > -                                                     GAsyncReadyCal=
lback  callback,
> > > -                                                     gpointer      =
       user_data)
> > > -@@ -1909,7 +1909,7 @@ g_dbus_connection_send_message_with_reply_unl=
ocked (GDBusConnection     *connect
> > > -   GTask *task;
> > > -   SendMessageData *data;
> > > -   GError *error =3D NULL;
> > > --  volatile guint32 serial;
> > > -+  guint32 serial;
> > > -
> > > -   if (out_serial =3D=3D NULL)
> > > -     out_serial =3D &serial;
> > > -@@ -2022,7 +2022,7 @@ g_dbus_connection_send_message_with_reply (GD=
BusConnection       *connection,
> > > -                                                       message,
> > > -                                                       flags,
> > > -                                                       timeout_msec=
,
> > > --                                                      out_serial,
> > > -+                                                      (guint32 *) =
out_serial,
> > > -                                                       cancellable,
> > > -                                                       callback,
> > > -                                                       user_data);
> > > -@@ -3082,7 +3082,7 @@ g_dbus_connection_get_peer_credentials (GDBus=
Connection *connection)
> > > -
> > > - /* ---------------------------------------------------------------=
------------------------------------- */
> > > -
> > > --static volatile guint _global_filter_id =3D 1;
> > > -+static guint _global_filter_id =3D 1;  /* (atomic) */
> > > -
> > > - /**
> > > -  * g_dbus_connection_add_filter:
> > > -@@ -3327,9 +3327,9 @@ args_to_rule (const gchar      *sender,
> > > -   return g_string_free (rule, FALSE);
> > > - }
> > > -
> > > --static volatile guint _global_subscriber_id =3D 1;
> > > --static volatile guint _global_registration_id =3D 1;
> > > --static volatile guint _global_subtree_registration_id =3D 1;
> > > -+static guint _global_subscriber_id =3D 1;  /* (atomic) */
> > > -+static guint _global_registration_id =3D 1;  /* (atomic) */
> > > -+static guint _global_subtree_registration_id =3D 1;  /* (atomic) *=
/
> > > -
> > > - /* ---------------------------------------------------------------=
------------------------------------- */
> > > -
> > > -@@ -5992,7 +5992,7 @@ g_dbus_connection_call_sync_internal (GDBusCo=
nnection         *connection,
> > > -                                                           message,
> > > -                                                           send_fla=
gs,
> > > -                                                           timeout_=
msec,
> > > --                                                          NULL, /*=
 volatile guint32 *out_serial */
> > > -+                                                          NULL, /*=
 guint32 *out_serial */
> > > -                                                           cancella=
ble,
> > > -                                                           &local_e=
rror);
> > > -
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0008-gdbuserror-Dro=
p-unnecessary-volatile-qualifiers-from.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0008-gdbuserror-Drop-unnecessary-volatile-qualifiers-from.patch
> > > deleted file mode 100644
> > > index e947a264c5..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0008-gdbuserror-Drop-unnec=
essary-volatile-qualifiers-from.patch
> > > +++ /dev/null
> > > @@ -1,95 +0,0 @@
> > > -From 7c7623c4a31fb0f2a7176c43acc728093818b58c Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:26:19 +0000
> > > -Subject: [PATCH 08/29] gdbuserror: Drop unnecessary volatile qualif=
iers from
> > > - variables
> > > -
> > > -This should introduce no API changes. The
> > > -`g_dbus_error_register_error_domain()` function still (incorrectly)=
 has
> > > -a `volatile` argument, but dropping that qualifier would be an API
> > > -break.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/gdbuserror.c | 28 +++++++++++++++++-----------
> > > - 1 file changed, 17 insertions(+), 11 deletions(-)
> > > -
> > > -diff --git a/gio/gdbuserror.c b/gio/gdbuserror.c
> > > -index 682677354..b03a33f27 100644
> > > ---- a/gio/gdbuserror.c
> > > -+++ b/gio/gdbuserror.c
> > > -@@ -84,12 +84,12 @@
> > > -  * GQuark
> > > -  * foo_bar_error_quark (void)
> > > -  * {
> > > -- *   static volatile gsize quark_volatile =3D 0;
> > > -+ *   static gsize quark =3D 0;
> > > -  *   g_dbus_error_register_error_domain ("foo-bar-error-quark",
> > > -- *                                       &quark_volatile,
> > > -+ *                                       &quark,
> > > -  *                                       foo_bar_error_entries,
> > > -  *                                       G_N_ELEMENTS (foo_bar_err=
or_entries));
> > > -- *   return (GQuark) quark_volatile;
> > > -+ *   return (GQuark) quark;
> > > -  * }
> > > -  * ]|
> > > -  * With this setup, a D-Bus peer can transparently pass e.g. %FOO_=
BAR_ERROR_ANOTHER_ERROR and
> > > -@@ -160,12 +160,12 @@ GQuark
> > > - g_dbus_error_quark (void)
> > > - {
> > > -   G_STATIC_ASSERT (G_N_ELEMENTS (g_dbus_error_entries) - 1 =3D=3D =
G_DBUS_ERROR_PROPERTY_READ_ONLY);
> > > --  static volatile gsize quark_volatile =3D 0;
> > > -+  static gsize quark =3D 0;
> > > -   g_dbus_error_register_error_domain ("g-dbus-error-quark",
> > > --                                      &quark_volatile,
> > > -+                                      &quark,
> > > -                                       g_dbus_error_entries,
> > > -                                       G_N_ELEMENTS (g_dbus_error_e=
ntries));
> > > --  return (GQuark) quark_volatile;
> > > -+  return (GQuark) quark;
> > > - }
> > > -
> > > - /**
> > > -@@ -185,25 +185,31 @@ g_dbus_error_register_error_domain (const gch=
ar           *error_domain_quark_na
> > > -                                     const GDBusErrorEntry *entries=
,
> > > -                                     guint                  num_ent=
ries)
> > > - {
> > > -+  gsize *quark;
> > > -+
> > > -   g_return_if_fail (error_domain_quark_name !=3D NULL);
> > > -   g_return_if_fail (quark_volatile !=3D NULL);
> > > -   g_return_if_fail (entries !=3D NULL);
> > > -   g_return_if_fail (num_entries > 0);
> > > -
> > > --  if (g_once_init_enter (quark_volatile))
> > > -+  /* Drop the volatile qualifier, which should never have been on =
the argument
> > > -+   * in the first place. */
> > > -+  quark =3D (gsize *) quark_volatile;
> > > -+
> > > -+  if (g_once_init_enter (quark))
> > > -     {
> > > -       guint n;
> > > --      GQuark quark;
> > > -+      GQuark new_quark;
> > > -
> > > --      quark =3D g_quark_from_static_string (error_domain_quark_nam=
e);
> > > -+      new_quark =3D g_quark_from_static_string (error_domain_quark=
_name);
> > > -
> > > -       for (n =3D 0; n < num_entries; n++)
> > > -         {
> > > --          g_warn_if_fail (g_dbus_error_register_error (quark,
> > > -+          g_warn_if_fail (g_dbus_error_register_error (new_quark,
> > > -                                                        entries[n].=
error_code,
> > > -                                                        entries[n].=
dbus_error_name));
> > > -         }
> > > --      g_once_init_leave (quark_volatile, quark);
> > > -+      g_once_init_leave (quark, new_quark);
> > > -     }
> > > - }
> > > -
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0009-gio-Drop-unnec=
essary-volatile-qualifiers-from-intern.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0009-gio-Drop-unnecessary-volatile-qualifiers-from-intern.patch
> > > deleted file mode 100644
> > > index 7897d43bb0..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0009-gio-Drop-unnecessary-=
volatile-qualifiers-from-intern.patch
> > > +++ /dev/null
> > > @@ -1,207 +0,0 @@
> > > -From 74250cd9c9dfd3ad428e445c095ceac88ba18691 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:28:23 +0000
> > > -Subject: [PATCH 09/29] gio: Drop unnecessary volatile qualifiers fr=
om internal
> > > - variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/gdbusinterfaceskeleton.c |  2 +-
> > > - gio/gdbusintrospection.h     | 14 +++++++-------
> > > - gio/gdbusnameowning.c        |  4 ++--
> > > - gio/gdbusnamewatching.c      |  4 ++--
> > > - gio/gdbusprivate.c           | 10 +++++-----
> > > - gio/gnetworking.c            |  2 +-
> > > - 6 files changed, 18 insertions(+), 18 deletions(-)
> > > -
> > > -diff --git a/gio/gdbusinterfaceskeleton.c b/gio/gdbusinterfaceskele=
ton.c
> > > -index 243b4a0a4..76398df36 100644
> > > ---- a/gio/gdbusinterfaceskeleton.c
> > > -+++ b/gio/gdbusinterfaceskeleton.c
> > > -@@ -458,7 +458,7 @@ dbus_interface_interface_init (GDBusInterfaceIf=
ace *iface)
> > > -
> > > - typedef struct
> > > - {
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > -   GDBusInterfaceSkeleton       *interface;
> > > -   GDBusInterfaceMethodCallFunc  method_call_func;
> > > -   GDBusMethodInvocation        *invocation;
> > > -diff --git a/gio/gdbusintrospection.h b/gio/gdbusintrospection.h
> > > -index 14b171055..f2e291787 100644
> > > ---- a/gio/gdbusintrospection.h
> > > -+++ b/gio/gdbusintrospection.h
> > > -@@ -43,7 +43,7 @@ G_BEGIN_DECLS
> > > - struct _GDBusAnnotationInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint         ref_count;
> > > -+  gint                  ref_count;  /* (atomic) */
> > > -   gchar                *key;
> > > -   gchar                *value;
> > > -   GDBusAnnotationInfo **annotations;
> > > -@@ -63,7 +63,7 @@ struct _GDBusAnnotationInfo
> > > - struct _GDBusArgInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint         ref_count;
> > > -+  gint                  ref_count;  /* (atomic) */
> > > -   gchar                *name;
> > > -   gchar                *signature;
> > > -   GDBusAnnotationInfo **annotations;
> > > -@@ -84,7 +84,7 @@ struct _GDBusArgInfo
> > > - struct _GDBusMethodInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint         ref_count;
> > > -+  gint                  ref_count;  /* (atomic) */
> > > -   gchar                *name;
> > > -   GDBusArgInfo        **in_args;
> > > -   GDBusArgInfo        **out_args;
> > > -@@ -105,7 +105,7 @@ struct _GDBusMethodInfo
> > > - struct _GDBusSignalInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint         ref_count;
> > > -+  gint                  ref_count;  /* (atomic) */
> > > -   gchar                *name;
> > > -   GDBusArgInfo        **args;
> > > -   GDBusAnnotationInfo **annotations;
> > > -@@ -126,7 +126,7 @@ struct _GDBusSignalInfo
> > > - struct _GDBusPropertyInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint             ref_count;
> > > -+  gint                      ref_count;  /* (atomic) */
> > > -   gchar                    *name;
> > > -   gchar                    *signature;
> > > -   GDBusPropertyInfoFlags    flags;
> > > -@@ -149,7 +149,7 @@ struct _GDBusPropertyInfo
> > > - struct _GDBusInterfaceInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint         ref_count;
> > > -+  gint                  ref_count;  /* (atomic) */
> > > -   gchar                *name;
> > > -   GDBusMethodInfo     **methods;
> > > -   GDBusSignalInfo     **signals;
> > > -@@ -172,7 +172,7 @@ struct _GDBusInterfaceInfo
> > > - struct _GDBusNodeInfo
> > > - {
> > > -   /*< public >*/
> > > --  volatile gint         ref_count;
> > > -+  gint                  ref_count;  /* (atomic) */
> > > -   gchar                *path;
> > > -   GDBusInterfaceInfo  **interfaces;
> > > -   GDBusNodeInfo       **nodes;
> > > -diff --git a/gio/gdbusnameowning.c b/gio/gdbusnameowning.c
> > > -index d20e6ffed..1130d6789 100644
> > > ---- a/gio/gdbusnameowning.c
> > > -+++ b/gio/gdbusnameowning.c
> > > -@@ -55,7 +55,7 @@ typedef enum
> > > -
> > > - typedef struct
> > > - {
> > > --  volatile gint             ref_count;
> > > -+  gint                      ref_count;  /* (atomic) */
> > > -   guint                     id;
> > > -   GBusNameOwnerFlags        flags;
> > > -   gchar                    *name;
> > > -@@ -73,7 +73,7 @@ typedef struct
> > > -   guint                     name_acquired_subscription_id;
> > > -   guint                     name_lost_subscription_id;
> > > -
> > > --  volatile gboolean         cancelled; /* must hold lock when read=
ing or modifying */
> > > -+  gboolean                  cancelled; /* must hold lock when read=
ing or modifying */
> > > -
> > > -   gboolean                  needs_release;
> > > - } Client;
> > > -diff --git a/gio/gdbusnamewatching.c b/gio/gdbusnamewatching.c
> > > -index bc2a9119e..8d24700c5 100644
> > > ---- a/gio/gdbusnamewatching.c
> > > -+++ b/gio/gdbusnamewatching.c
> > > -@@ -56,7 +56,7 @@ typedef enum
> > > -
> > > - typedef struct
> > > - {
> > > --  volatile gint             ref_count;
> > > -+  gint                      ref_count;  /* (atomic) */
> > > -   guint                     id;
> > > -   gchar                    *name;
> > > -   GBusNameWatcherFlags      flags;
> > > -@@ -78,7 +78,7 @@ typedef struct
> > > - } Client;
> > > -
> > > - /* Must be accessed atomically. */
> > > --static volatile guint next_global_id =3D 1;
> > > -+static guint next_global_id =3D 1;  /* (atomic) */
> > > -
> > > - /* Must be accessed with @lock held. */
> > > - static GHashTable *map_id_to_client =3D NULL;
> > > -diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
> > > -index 2551e4791..99b37f3eb 100644
> > > ---- a/gio/gdbusprivate.c
> > > -+++ b/gio/gdbusprivate.c
> > > -@@ -265,7 +265,7 @@ ensure_required_types (void)
> > > -
> > > - typedef struct
> > > - {
> > > --  volatile gint refcount;
> > > -+  gint refcount;  /* (atomic) */
> > > -   GThread *thread;
> > > -   GMainContext *context;
> > > -   GMainLoop *loop;
> > > -@@ -341,12 +341,12 @@ typedef enum {
> > > -
> > > - struct GDBusWorker
> > > - {
> > > --  volatile gint                       ref_count;
> > > -+  gint                                ref_count;  /* (atomic) */
> > > -
> > > -   SharedThreadData                   *shared_thread_data;
> > > -
> > > -   /* really a boolean, but GLib 2.28 lacks atomic boolean ops */
> > > --  volatile gint                       stopped;
> > > -+  gint                                stopped;  /* (atomic) */
> > > -
> > > -   /* TODO: frozen (e.g. G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROC=
ESSING) currently
> > > -    * only affects messages received from the other peer (since GDB=
usServer is the
> > > -@@ -1941,11 +1941,11 @@ _g_dbus_debug_print_unlock (void)
> > > - void
> > > - _g_dbus_initialize (void)
> > > - {
> > > --  static volatile gsize initialized =3D 0;
> > > -+  static gsize initialized =3D 0;
> > > -
> > > -   if (g_once_init_enter (&initialized))
> > > -     {
> > > --      volatile GQuark g_dbus_error_domain;
> > > -+      GQuark g_dbus_error_domain;
> > > -       const gchar *debug;
> > > -
> > > -       g_dbus_error_domain =3D G_DBUS_ERROR;
> > > -diff --git a/gio/gnetworking.c b/gio/gnetworking.c
> > > -index 05507fe70..7bc6d73c4 100644
> > > ---- a/gio/gnetworking.c
> > > -+++ b/gio/gnetworking.c
> > > -@@ -61,7 +61,7 @@ void
> > > - g_networking_init (void)
> > > - {
> > > - #ifdef G_OS_WIN32
> > > --  static volatile gsize inited =3D 0;
> > > -+  static gsize inited =3D 0;
> > > -
> > > -   if (g_once_init_enter (&inited))
> > > -     {
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-kqueue-Fix-unl=
ocked-access-to-shared-variable.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0010-kqueue-Fix-unlocked-access-to-shared-variable.patch
> > > deleted file mode 100644
> > > index e52b709422..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0010-kqueue-Fix-unlocked-a=
ccess-to-shared-variable.patch
> > > +++ /dev/null
> > > @@ -1,51 +0,0 @@
> > > -From e4e88688a0722237effc56cc21438d0c8e82de88 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:29:26 +0000
> > > -Subject: [PATCH 10/29] kqueue: Fix unlocked access to shared variab=
le
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -And drop the `volatile` qualifier because it doesn=E2=80=99t help.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/kqueue/kqueue-missing.c | 5 +++--
> > > - 1 file changed, 3 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/gio/kqueue/kqueue-missing.c b/gio/kqueue/kqueue-missin=
g.c
> > > -index 37af82e5b..d1ffdf4bd 100644
> > > ---- a/gio/kqueue/kqueue-missing.c
> > > -+++ b/gio/kqueue/kqueue-missing.c
> > > -@@ -34,7 +34,7 @@ static gboolean km_debug_enabled =3D FALSE;
> > > - static GSList *missing_subs_list =3D NULL;
> > > - G_LOCK_DEFINE_STATIC (missing_lock);
> > > -
> > > --static volatile gboolean scan_missing_running =3D FALSE;
> > > -+static gboolean scan_missing_running =3D FALSE;  /* must be access=
ed under @missing_lock */
> > > -
> > > -
> > > - static gboolean
> > > -@@ -62,7 +62,6 @@ _km_add_missing (kqueue_sub *sub)
> > > -
> > > -   KM_W ("adding %s to missing list\n", sub->filename);
> > > -   missing_subs_list =3D g_slist_prepend (missing_subs_list, sub);
> > > --  G_UNLOCK (missing_lock);
> > > -
> > > -   if (!scan_missing_running)
> > > -     {
> > > -@@ -73,6 +72,8 @@ _km_add_missing (kqueue_sub *sub)
> > > -       g_source_attach (source, GLIB_PRIVATE_CALL (g_get_worker_con=
text) ());
> > > -       g_source_unref (source);
> > > -     }
> > > -+
> > > -+  G_UNLOCK (missing_lock);
> > > - }
> > > -
> > > - /**
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0011-tests-Drop-unn=
ecessary-volatile-qualifiers-from-test.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0011-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > deleted file mode 100644
> > > index ea3fd9f6e9..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0011-tests-Drop-unnecessar=
y-volatile-qualifiers-from-test.patch
> > > +++ /dev/null
> > > @@ -1,126 +0,0 @@
> > > -From 7cdb68713c1863a27ad82d801756ec74097e8e87 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:30:36 +0000
> > > -Subject: [PATCH 11/29] tests: Drop unnecessary volatile qualifiers =
from tests
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - tests/gobject/performance-threaded.c |  2 +-
> > > - tests/gobject/performance.c          |  4 ++--
> > > - tests/onceinit.c                     | 16 ++++++++--------
> > > - 3 files changed, 11 insertions(+), 11 deletions(-)
> > > -
> > > -diff --git a/tests/gobject/performance-threaded.c b/tests/gobject/p=
erformance-threaded.c
> > > -index 30ea5bd80..c98541d66 100644
> > > ---- a/tests/gobject/performance-threaded.c
> > > -+++ b/tests/gobject/performance-threaded.c
> > > -@@ -52,7 +52,7 @@ static GType liststore_interfaces[6];
> > > - static gpointer
> > > - register_types (void)
> > > - {
> > > --  static volatile gsize inited =3D 0;
> > > -+  static gsize inited =3D 0;
> > > -   if (g_once_init_enter (&inited))
> > > -     {
> > > -       liststore_interfaces[0] =3D simple_register_class ("GtkBuild=
able", G_TYPE_INTERFACE, 0);
> > > -diff --git a/tests/gobject/performance.c b/tests/gobject/performanc=
e.c
> > > -index 236ffaed0..163be58b4 100644
> > > ---- a/tests/gobject/performance.c
> > > -+++ b/tests/gobject/performance.c
> > > -@@ -575,8 +575,8 @@ test_type_check_run (PerformanceTest *test,
> > > -                    gpointer _data)
> > > - {
> > > -   struct TypeCheckTest *data =3D _data;
> > > --  volatile GObject *object =3D data->object;
> > > --  volatile GType type, types[5];
> > > -+  GObject *object =3D data->object;
> > > -+  GType type, types[5];
> > > -   int i, j;
> > > -
> > > -   types[0] =3D test_iface1_get_type ();
> > > -diff --git a/tests/onceinit.c b/tests/onceinit.c
> > > -index 89ba6a136..9788efcbd 100644
> > > ---- a/tests/onceinit.c
> > > -+++ b/tests/onceinit.c
> > > -@@ -25,13 +25,13 @@
> > > -
> > > - static GMutex       tmutex;
> > > - static GCond        tcond;
> > > --static volatile int thread_call_count =3D 0;
> > > -+static int thread_call_count =3D 0;  /* (atomic) */
> > > - static char         dummy_value =3D 'x';
> > > -
> > > - static void
> > > - assert_singleton_execution1 (void)
> > > - {
> > > --  static volatile int seen_execution =3D 0;
> > > -+  static int seen_execution =3D 0;  /* (atomic) */
> > > -   int old_seen_execution =3D g_atomic_int_add (&seen_execution, 1)=
;
> > > -   if (old_seen_execution !=3D 0)
> > > -     g_error ("%s: function executed more than once", G_STRFUNC);
> > > -@@ -40,7 +40,7 @@ assert_singleton_execution1 (void)
> > > - static void
> > > - assert_singleton_execution2 (void)
> > > - {
> > > --  static volatile int seen_execution =3D 0;
> > > -+  static int seen_execution =3D 0;  /* (atomic) */
> > > -   int old_seen_execution =3D g_atomic_int_add (&seen_execution, 1)=
;
> > > -   if (old_seen_execution !=3D 0)
> > > -     g_error ("%s: function executed more than once", G_STRFUNC);
> > > -@@ -49,7 +49,7 @@ assert_singleton_execution2 (void)
> > > - static void
> > > - assert_singleton_execution3 (void)
> > > - {
> > > --  static volatile int seen_execution =3D 0;
> > > -+  static int seen_execution =3D 0;  /* (atomic) */
> > > -   int old_seen_execution =3D g_atomic_int_add (&seen_execution, 1)=
;
> > > -   if (old_seen_execution !=3D 0)
> > > -     g_error ("%s: function executed more than once", G_STRFUNC);
> > > -@@ -58,7 +58,7 @@ assert_singleton_execution3 (void)
> > > - static void
> > > - initializer1 (void)
> > > - {
> > > --  static volatile gsize initialized =3D 0;
> > > -+  static gsize initialized =3D 0;
> > > -   if (g_once_init_enter (&initialized))
> > > -     {
> > > -       gsize initval =3D 42;
> > > -@@ -70,7 +70,7 @@ initializer1 (void)
> > > - static gpointer
> > > - initializer2 (void)
> > > - {
> > > --  static volatile gsize initialized =3D 0;
> > > -+  static gsize initialized =3D 0;
> > > -   if (g_once_init_enter (&initialized))
> > > -     {
> > > -       void *pointer_value =3D &dummy_value;
> > > -@@ -83,7 +83,7 @@ initializer2 (void)
> > > - static void
> > > - initializer3 (void)
> > > - {
> > > --  static volatile gsize initialized =3D 0;
> > > -+  static gsize initialized =3D 0;
> > > -   if (g_once_init_enter (&initialized))
> > > -     {
> > > -       gsize initval =3D 42;
> > > -@@ -163,7 +163,7 @@ main (int   argc,
> > > -       static void                                       \
> > > -       test_initializer_##N (void)                       \
> > > -       {                                                 \
> > > --        static volatile gsize initialized =3D 0;          \
> > > -+        static gsize initialized =3D 0;                   \
> > > -         if (g_once_init_enter (&initialized))           \
> > > -           {                                             \
> > > -             g_free (g_strdup_printf ("cpuhog%5d", 1));  \
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0012-tests-Fix-non-=
atomic-access-to-some-shared-variables.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0012-tests-Fix-non-atomic-access-to-some-shared-variables.patch
> > > deleted file mode 100644
> > > index be7fcba8c8..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0012-tests-Fix-non-atomic-=
access-to-some-shared-variables.patch
> > > +++ /dev/null
> > > @@ -1,103 +0,0 @@
> > > -From 1a7f0002a052725fb646e136fadd5dad66222d7f Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:31:01 +0000
> > > -Subject: [PATCH 12/29] tests: Fix non-atomic access to some shared =
variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -And drop the `volatile` qualifier from the variables, as that doesn=
=
=E2=80=99t
> > > -help with thread safety.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - tests/refcount/objects.c     | 8 ++++----
> > > - tests/refcount/properties3.c | 8 ++++----
> > > - 2 files changed, 8 insertions(+), 8 deletions(-)
> > > -
> > > -diff --git a/tests/refcount/objects.c b/tests/refcount/objects.c
> > > -index 963766d00..0c471a42b 100644
> > > ---- a/tests/refcount/objects.c
> > > -+++ b/tests/refcount/objects.c
> > > -@@ -26,7 +26,7 @@ struct _GTestClass
> > > - };
> > > -
> > > - static GType my_test_get_type (void);
> > > --static volatile gboolean stopping;
> > > -+static gint stopping;  /* (atomic) */
> > > -
> > > - static void my_test_class_init (GTestClass * klass);
> > > - static void my_test_init (GTest * test);
> > > -@@ -101,7 +101,7 @@ run_thread (GTest * test)
> > > - {
> > > -   gint i =3D 1;
> > > -
> > > --  while (!stopping) {
> > > -+  while (!g_atomic_int_get (&stopping)) {
> > > -     my_test_do_refcount (test);
> > > -     if ((i++ % 10000) =3D=3D 0) {
> > > -       g_print (".");
> > > -@@ -128,7 +128,7 @@ main (int argc, char **argv)
> > > -
> > > -   test_threads =3D g_array_new (FALSE, FALSE, sizeof (GThread *));
> > > -
> > > --  stopping =3D FALSE;
> > > -+  g_atomic_int_set (&stopping, 0);
> > > -
> > > -   for (i =3D 0; i < n_threads; i++) {
> > > -     GThread *thread;
> > > -@@ -141,7 +141,7 @@ main (int argc, char **argv)
> > > -   }
> > > -   g_usleep (5000000);
> > > -
> > > --  stopping =3D TRUE;
> > > -+  g_atomic_int_set (&stopping, 1);
> > > -
> > > -   g_print ("\nstopping\n");
> > > -
> > > -diff --git a/tests/refcount/properties3.c b/tests/refcount/properti=
es3.c
> > > -index bc8820661..31f26a46e 100644
> > > ---- a/tests/refcount/properties3.c
> > > -+++ b/tests/refcount/properties3.c
> > > -@@ -34,7 +34,7 @@ struct _GTestClass
> > > - static GType my_test_get_type (void);
> > > - G_DEFINE_TYPE (GTest, my_test, G_TYPE_OBJECT)
> > > -
> > > --static volatile gboolean stopping;
> > > -+static gint stopping;  /* (atomic) */
> > > -
> > > - static void my_test_get_property (GObject    *object,
> > > -                                 guint       prop_id,
> > > -@@ -140,7 +140,7 @@ run_thread (GTest * test)
> > > - {
> > > -   gint i =3D 1;
> > > -
> > > --  while (!stopping) {
> > > -+  while (!g_atomic_int_get (&stopping)) {
> > > -     my_test_do_property (test);
> > > -     if ((i++ % 10000) =3D=3D 0)
> > > -       {
> > > -@@ -170,7 +170,7 @@ main (int argc, char **argv)
> > > -
> > > -   test_threads =3D g_array_new (FALSE, FALSE, sizeof (GThread *));
> > > -
> > > --  stopping =3D FALSE;
> > > -+  g_atomic_int_set (&stopping, 0);
> > > -
> > > -   for (i =3D 0; i < n_threads; i++) {
> > > -     GThread *thread;
> > > -@@ -180,7 +180,7 @@ main (int argc, char **argv)
> > > -   }
> > > -   g_usleep (30000000);
> > > -
> > > --  stopping =3D TRUE;
> > > -+  g_atomic_int_set (&stopping, 1);
> > > -   g_print ("\nstopping\n");
> > > -
> > > -   /* join all threads */
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0013-gatomic-Drop-u=
nnecessary-volatile-qualifiers-from-in.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0013-gatomic-Drop-unnecessary-volatile-qualifiers-from-in.patch
> > > deleted file mode 100644
> > > index efc6817bd1..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0013-gatomic-Drop-unnecess=
ary-volatile-qualifiers-from-in.patch
> > > +++ /dev/null
> > > @@ -1,180 +0,0 @@
> > > -From 3c648457c284b4ba313b8591008d2e18ae4335eb Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:36:37 +0000
> > > -Subject: [PATCH 13/29] gatomic: Drop unnecessary volatile qualifier=
s from
> > > - internal variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -It=E2=80=99s not necessary and provides no thread safety guarantees=
.
> > > -
> > > -The `volatile` qualifiers on the function arguments have to be kept=
, as
> > > -they are (unfortunately) part of the API.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/gatomic.c | 34 +++++++++++++++++-----------------
> > > - 1 file changed, 17 insertions(+), 17 deletions(-)
> > > -
> > > -diff --git a/glib/gatomic.c b/glib/gatomic.c
> > > -index 8b8c6453d..67f5ba6b4 100644
> > > ---- a/glib/gatomic.c
> > > -+++ b/glib/gatomic.c
> > > -@@ -316,7 +316,7 @@ guint
> > > - gpointer
> > > - (g_atomic_pointer_get) (const volatile void *atomic)
> > > - {
> > > --  return g_atomic_pointer_get ((const volatile gpointer *) atomic)=
;
> > > -+  return g_atomic_pointer_get ((gpointer *) atomic);
> > > - }
> > > -
> > > - /**
> > > -@@ -335,7 +335,7 @@ void
> > > - (g_atomic_pointer_set) (volatile void *atomic,
> > > -                         gpointer       newval)
> > > - {
> > > --  g_atomic_pointer_set ((volatile gpointer *) atomic, newval);
> > > -+  g_atomic_pointer_set ((gpointer *) atomic, newval);
> > > - }
> > > -
> > > - /**
> > > -@@ -363,7 +363,7 @@ gboolean
> > > -                                          gpointer       oldval,
> > > -                                          gpointer       newval)
> > > - {
> > > --  return g_atomic_pointer_compare_and_exchange ((volatile gpointer=
 *) atomic,
> > > -+  return g_atomic_pointer_compare_and_exchange ((gpointer *) atomi=
c,
> > > -                                                 oldval, newval);
> > > - }
> > > -
> > > -@@ -387,7 +387,7 @@ gssize
> > > - (g_atomic_pointer_add) (volatile void *atomic,
> > > -                         gssize         val)
> > > - {
> > > --  return g_atomic_pointer_add ((volatile gpointer *) atomic, val);
> > > -+  return g_atomic_pointer_add ((gpointer *) atomic, val);
> > > - }
> > > -
> > > - /**
> > > -@@ -411,7 +411,7 @@ gsize
> > > - (g_atomic_pointer_and) (volatile void *atomic,
> > > -                         gsize          val)
> > > - {
> > > --  return g_atomic_pointer_and ((volatile gpointer *) atomic, val);
> > > -+  return g_atomic_pointer_and ((gpointer *) atomic, val);
> > > - }
> > > -
> > > - /**
> > > -@@ -435,7 +435,7 @@ gsize
> > > - (g_atomic_pointer_or) (volatile void *atomic,
> > > -                        gsize          val)
> > > - {
> > > --  return g_atomic_pointer_or ((volatile gpointer *) atomic, val);
> > > -+  return g_atomic_pointer_or ((gpointer *) atomic, val);
> > > - }
> > > -
> > > - /**
> > > -@@ -459,7 +459,7 @@ gsize
> > > - (g_atomic_pointer_xor) (volatile void *atomic,
> > > -                         gsize          val)
> > > - {
> > > --  return g_atomic_pointer_xor ((volatile gpointer *) atomic, val);
> > > -+  return g_atomic_pointer_xor ((gpointer *) atomic, val);
> > > - }
> > > -
> > > - #elif defined (G_PLATFORM_WIN32)
> > > -@@ -591,7 +591,7 @@ guint
> > > - gpointer
> > > - (g_atomic_pointer_get) (const volatile void *atomic)
> > > - {
> > > --  const volatile gpointer *ptr =3D atomic;
> > > -+  const gpointer *ptr =3D atomic;
> > > -
> > > -   MemoryBarrier ();
> > > -   return *ptr;
> > > -@@ -601,7 +601,7 @@ void
> > > - (g_atomic_pointer_set) (volatile void *atomic,
> > > -                         gpointer       newval)
> > > - {
> > > --  volatile gpointer *ptr =3D atomic;
> > > -+  gpointer *ptr =3D atomic;
> > > -
> > > -   *ptr =3D newval;
> > > -   MemoryBarrier ();
> > > -@@ -797,7 +797,7 @@ guint
> > > - gpointer
> > > - (g_atomic_pointer_get) (const volatile void *atomic)
> > > - {
> > > --  const volatile gpointer *ptr =3D atomic;
> > > -+  const gpointer *ptr =3D atomic;
> > > -   gpointer value;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -@@ -811,7 +811,7 @@ void
> > > - (g_atomic_pointer_set) (volatile void *atomic,
> > > -                         gpointer       newval)
> > > - {
> > > --  volatile gpointer *ptr =3D atomic;
> > > -+  gpointer *ptr =3D atomic;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -   *ptr =3D newval;
> > > -@@ -823,7 +823,7 @@ gboolean
> > > -                                          gpointer       oldval,
> > > -                                          gpointer       newval)
> > > - {
> > > --  volatile gpointer *ptr =3D atomic;
> > > -+  gpointer *ptr =3D atomic;
> > > -   gboolean success;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -@@ -840,7 +840,7 @@ gssize
> > > - (g_atomic_pointer_add) (volatile void *atomic,
> > > -                         gssize         val)
> > > - {
> > > --  volatile gssize *ptr =3D atomic;
> > > -+  gssize *ptr =3D atomic;
> > > -   gssize oldval;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -@@ -855,7 +855,7 @@ gsize
> > > - (g_atomic_pointer_and) (volatile void *atomic,
> > > -                         gsize          val)
> > > - {
> > > --  volatile gsize *ptr =3D atomic;
> > > -+  gsize *ptr =3D atomic;
> > > -   gsize oldval;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -@@ -870,7 +870,7 @@ gsize
> > > - (g_atomic_pointer_or) (volatile void *atomic,
> > > -                        gsize          val)
> > > - {
> > > --  volatile gsize *ptr =3D atomic;
> > > -+  gsize *ptr =3D atomic;
> > > -   gsize oldval;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -@@ -885,7 +885,7 @@ gsize
> > > - (g_atomic_pointer_xor) (volatile void *atomic,
> > > -                         gsize          val)
> > > - {
> > > --  volatile gsize *ptr =3D atomic;
> > > -+  gsize *ptr =3D atomic;
> > > -   gsize oldval;
> > > -
> > > -   pthread_mutex_lock (&g_atomic_lock);
> > > -@@ -915,5 +915,5 @@ gint
> > > - g_atomic_int_exchange_and_add (volatile gint *atomic,
> > > -                                gint           val)
> > > - {
> > > --  return (g_atomic_int_add) (atomic, val);
> > > -+  return (g_atomic_int_add) ((gint *) atomic, val);
> > > - }
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0014-gatomic-Drop-u=
nnecessary-volatile-qualifiers-from-ma.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0014-gatomic-Drop-unnecessary-volatile-qualifiers-from-ma.patch
> > > deleted file mode 100644
> > > index bcc06e05cd..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0014-gatomic-Drop-unnecess=
ary-volatile-qualifiers-from-ma.patch
> > > +++ /dev/null
> > > @@ -1,56 +0,0 @@
> > > -From 9474655eb21d64519b293e780bb686976cbdb790 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:38:36 +0000
> > > -Subject: [PATCH 14/29] gatomic: Drop unnecessary volatile qualifier=
s from
> > > - macro variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -It=E2=80=99s not necessary and provides no thread safety guarantees=
.
> > > -
> > > -The `volatile` qualifiers on the function arguments have to be kept=
, as
> > > -they are (unfortunately) part of the API.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/gatomic.h | 6 +++---
> > > - 1 file changed, 3 insertions(+), 3 deletions(-)
> > > -
> > > -diff --git a/glib/gatomic.h b/glib/gatomic.h
> > > -index bb1435c70..e6eccfada 100644
> > > ---- a/glib/gatomic.h
> > > -+++ b/glib/gatomic.h
> > > -@@ -211,7 +211,7 @@ G_END_DECLS
> > > -   }))
> > > - #define g_atomic_pointer_and(atomic, val) \
> > > -   (G_GNUC_EXTENSION ({                                            =
           \
> > > --    volatile gsize *gapa_atomic =3D (volatile gsize *) (atomic);  =
             \
> > > -+    gsize *gapa_atomic =3D (gsize *) (atomic);                    =
             \
> > > -     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));  =
               \
> > > -     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gsize));     =
               \
> > > -     (void) (0 ? (gpointer) *(atomic) : NULL);                     =
           \
> > > -@@ -220,7 +220,7 @@ G_END_DECLS
> > > -   }))
> > > - #define g_atomic_pointer_or(atomic, val) \
> > > -   (G_GNUC_EXTENSION ({                                            =
           \
> > > --    volatile gsize *gapo_atomic =3D (volatile gsize *) (atomic);  =
             \
> > > -+    gsize *gapo_atomic =3D (gsize *) (atomic);                    =
             \
> > > -     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));  =
               \
> > > -     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gsize));     =
               \
> > > -     (void) (0 ? (gpointer) *(atomic) : NULL);                     =
           \
> > > -@@ -229,7 +229,7 @@ G_END_DECLS
> > > -   }))
> > > - #define g_atomic_pointer_xor(atomic, val) \
> > > -   (G_GNUC_EXTENSION ({                                            =
           \
> > > --    volatile gsize *gapx_atomic =3D (volatile gsize *) (atomic);  =
             \
> > > -+    gsize *gapx_atomic =3D (gsize *) (atomic);                    =
             \
> > > -     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));  =
               \
> > > -     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gsize));     =
               \
> > > -     (void) (0 ? (gpointer) *(atomic) : NULL);                     =
           \
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0015-glib-Drop-unne=
cessary-volatile-qualifiers-from-inter.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0015-glib-Drop-unnecessary-volatile-qualifiers-from-inter.patch
> > > deleted file mode 100644
> > > index 9468548e3a..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0015-glib-Drop-unnecessary=
-volatile-qualifiers-from-inter.patch
> > > +++ /dev/null
> > > @@ -1,169 +0,0 @@
> > > -From 1314ff93fc4d3379483c33da6a7deff27f71ed95 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:40:56 +0000
> > > -Subject: [PATCH 15/29] glib: Drop unnecessary volatile qualifiers f=
rom
> > > - internal variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/gdatetime.c | 2 +-
> > > - glib/gkeyfile.c  | 2 +-
> > > - glib/gmain.c     | 8 ++++----
> > > - glib/gmarkup.c   | 2 +-
> > > - glib/gregex.c    | 6 +++---
> > > - glib/gthread.c   | 6 +++---
> > > - 6 files changed, 13 insertions(+), 13 deletions(-)
> > > -
> > > -diff --git a/glib/gdatetime.c b/glib/gdatetime.c
> > > -index 1755257be..453077f6d 100644
> > > ---- a/glib/gdatetime.c
> > > -+++ b/glib/gdatetime.c
> > > -@@ -126,7 +126,7 @@ struct _GDateTime
> > > -   /* 1 is 0001-01-01 in Proleptic Gregorian */
> > > -   gint32 days;
> > > -
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > - };
> > > -
> > > - /* Time conversion {{{1 */
> > > -diff --git a/glib/gkeyfile.c b/glib/gkeyfile.c
> > > -index 9d0215331..bbe638b74 100644
> > > ---- a/glib/gkeyfile.c
> > > -+++ b/glib/gkeyfile.c
> > > -@@ -512,7 +512,7 @@ struct _GKeyFile
> > > -
> > > -   gchar **locales;
> > > -
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > - };
> > > -
> > > - typedef struct _GKeyFileKeyValuePair GKeyFileKeyValuePair;
> > > -diff --git a/glib/gmain.c b/glib/gmain.c
> > > -index 772b8ecfc..9c5f0ef1e 100644
> > > ---- a/glib/gmain.c
> > > -+++ b/glib/gmain.c
> > > -@@ -272,7 +272,7 @@ struct _GMainContext
> > > -   guint owner_count;
> > > -   GSList *waiters;
> > > -
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > -
> > > -   GHashTable *sources;              /* guint -> GSource */
> > > -
> > > -@@ -303,7 +303,7 @@ struct _GMainContext
> > > -
> > > - struct _GSourceCallback
> > > - {
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > -   GSourceFunc func;
> > > -   gpointer    data;
> > > -   GDestroyNotify notify;
> > > -@@ -313,7 +313,7 @@ struct _GMainLoop
> > > - {
> > > -   GMainContext *context;
> > > -   gboolean is_running; /* (atomic) */
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > - };
> > > -
> > > - struct _GTimeoutSource
> > > -@@ -4749,7 +4749,7 @@ g_main_context_get_poll_func (GMainContext *c=
ontext)
> > > -  *
> > > -  * |[<!-- language=3D"C" -->
> > > -  *   #define NUM_TASKS 10
> > > -- *   static volatile gint tasks_remaining =3D NUM_TASKS;
> > > -+ *   static gint tasks_remaining =3D NUM_TASKS;  // (atomic)
> > > -  *   ...
> > > -  *
> > > -  *   while (g_atomic_int_get (&tasks_remaining) !=3D 0)
> > > -diff --git a/glib/gmarkup.c b/glib/gmarkup.c
> > > -index ba4dfd2e4..b8327fb6d 100644
> > > ---- a/glib/gmarkup.c
> > > -+++ b/glib/gmarkup.c
> > > -@@ -119,7 +119,7 @@ struct _GMarkupParseContext
> > > - {
> > > -   const GMarkupParser *parser;
> > > -
> > > --  volatile gint ref_count;
> > > -+  gint ref_count;  /* (atomic) */
> > > -
> > > -   GMarkupParseFlags flags;
> > > -
> > > -diff --git a/glib/gregex.c b/glib/gregex.c
> > > -index 52416bbb9..5e6ddfb46 100644
> > > ---- a/glib/gregex.c
> > > -+++ b/glib/gregex.c
> > > -@@ -203,7 +203,7 @@ G_STATIC_ASSERT (G_REGEX_RAW               =3D=
=3D PCRE_UTF8);
> > > -
> > > - struct _GMatchInfo
> > > - {
> > > --  volatile gint ref_count;      /* the ref count */
> > > -+  gint ref_count;               /* the ref count (atomic) */
> > > -   GRegex *regex;                /* the regex */
> > > -   GRegexMatchFlags match_opts;  /* options used at match time on t=
he regex */
> > > -   gint matches;                 /* number of matching sub patterns=
 */
> > > -@@ -218,7 +218,7 @@ struct _GMatchInfo
> > > -
> > > - struct _GRegex
> > > - {
> > > --  volatile gint ref_count;      /* the ref count for the immutable=
 part */
> > > -+  gint ref_count;               /* the ref count for the immutable=
 part (atomic) */
> > > -   gchar *pattern;               /* the pattern */
> > > -   pcre *pcre_re;                /* compiled form of the pattern */
> > > -   GRegexCompileFlags compile_opts;      /* options used at compile=
 time on the pattern */
> > > -@@ -1300,7 +1300,7 @@ g_regex_new (const gchar         *pattern,
> > > -   pcre *re;
> > > -   const gchar *errmsg;
> > > -   gboolean optimize =3D FALSE;
> > > --  static volatile gsize initialised =3D 0;
> > > -+  static gsize initialised =3D 0;
> > > -
> > > -   g_return_val_if_fail (pattern !=3D NULL, NULL);
> > > -   g_return_val_if_fail (error =3D=3D NULL || *error =3D=3D NULL, N=
ULL);
> > > -diff --git a/glib/gthread.c b/glib/gthread.c
> > > -index 53f3a0848..612a9739f 100644
> > > ---- a/glib/gthread.c
> > > -+++ b/glib/gthread.c
> > > -@@ -513,7 +513,7 @@ static GMutex    g_once_mutex;
> > > - static GCond     g_once_cond;
> > > - static GSList   *g_once_init_list =3D NULL;
> > > -
> > > --static volatile guint g_thread_n_created_counter =3D 0;
> > > -+static guint g_thread_n_created_counter =3D 0;  /* (atomic) */
> > > -
> > > - static void g_thread_cleanup (gpointer data);
> > > - static GPrivate     g_thread_specific_private =3D G_PRIVATE_INIT (=
g_thread_cleanup);
> > > -@@ -694,7 +694,7 @@ g_once_impl (GOnce       *once,
> > > - gboolean
> > > - (g_once_init_enter) (volatile void *location)
> > > - {
> > > --  volatile gsize *value_location =3D location;
> > > -+  gsize *value_location =3D (gsize *) location;
> > > -   gboolean need_init =3D FALSE;
> > > -   g_mutex_lock (&g_once_mutex);
> > > -   if (g_atomic_pointer_get (value_location) =3D=3D 0)
> > > -@@ -731,7 +731,7 @@ void
> > > - (g_once_init_leave) (volatile void *location,
> > > -                      gsize          result)
> > > - {
> > > --  volatile gsize *value_location =3D location;
> > > -+  gsize *value_location =3D (gsize *) location;
> > > -
> > > -   g_return_if_fail (g_atomic_pointer_get (value_location) =3D=3D 0=
);
> > > -   g_return_if_fail (result !=3D 0);
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0016-gobject-Drop-u=
nnecessary-volatile-qualifiers-from-in.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0016-gobject-Drop-unnecessary-volatile-qualifiers-from-in.patch
> > > deleted file mode 100644
> > > index 8111b3b51d..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0016-gobject-Drop-unnecess=
ary-volatile-qualifiers-from-in.patch
> > > +++ /dev/null
> > > @@ -1,126 +0,0 @@
> > > -From 08d04d0428cc26935a2d42083f1710432465c98a Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 18:42:43 +0000
> > > -Subject: [PATCH 16/29] gobject: Drop unnecessary volatile qualifier=
s from
> > > - internal variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gobject/gclosure.c |  2 +-
> > > - gobject/gclosure.h | 20 ++++++++++----------
> > > - gobject/gobject.c  |  4 ++--
> > > - gobject/gtype.c    | 10 +++++-----
> > > - 4 files changed, 18 insertions(+), 18 deletions(-)
> > > -
> > > -diff --git a/gobject/gclosure.c b/gobject/gclosure.c
> > > -index 1d1f2f48a..6d41e6d8a 100644
> > > ---- a/gobject/gclosure.c
> > > -+++ b/gobject/gclosure.c
> > > -@@ -98,7 +98,7 @@
> > > -
> > > - typedef union {
> > > -   GClosure closure;
> > > --  volatile gint vint;
> > > -+  gint vint;
> > > - } ClosureInt;
> > > -
> > > - #define CHANGE_FIELD(_closure, _field, _OP, _value, _must_set, _SE=
T_OLD, _SET_NEW)      \
> > > -diff --git a/gobject/gclosure.h b/gobject/gclosure.h
> > > -index a0f91f538..884e403a8 100644
> > > ---- a/gobject/gclosure.h
> > > -+++ b/gobject/gclosure.h
> > > -@@ -175,20 +175,20 @@ struct _GClosureNotifyData
> > > - struct _GClosure
> > > - {
> > > -   /*< private >*/
> > > --  volatile            guint    ref_count : 15;
> > > -+  guint ref_count : 15;  /* (atomic) */
> > > -   /* meta_marshal is not used anymore but must be zero for histori=
cal reasons
> > > -      as it was exposed in the G_CLOSURE_N_NOTIFIERS macro */
> > > --  volatile            guint    meta_marshal_nouse : 1;
> > > --  volatile            guint    n_guards : 1;
> > > --  volatile            guint    n_fnotifiers : 2;      /* finalizat=
ion notifiers */
> > > --  volatile            guint    n_inotifiers : 8;      /* invalidat=
ion notifiers */
> > > --  volatile            guint    in_inotify : 1;
> > > --  volatile            guint    floating : 1;
> > > -+  guint meta_marshal_nouse : 1;  /* (atomic) */
> > > -+  guint n_guards : 1;  /* (atomic) */
> > > -+  guint n_fnotifiers : 2;  /* finalization notifiers (atomic) */
> > > -+  guint n_inotifiers : 8;  /* invalidation notifiers (atomic) */
> > > -+  guint in_inotify : 1;  /* (atomic) */
> > > -+  guint floating : 1;  /* (atomic) */
> > > -   /*< protected >*/
> > > --  volatile            guint    derivative_flag : 1;
> > > -+  guint derivative_flag : 1;  /* (atomic) */
> > > -   /*< public >*/
> > > --  volatile            guint    in_marshal : 1;
> > > --  volatile            guint    is_invalid : 1;
> > > -+  guint in_marshal : 1;  /* (atomic) */
> > > -+  guint is_invalid : 1;  /* (atomic) */
> > > -
> > > -   /*< private >*/     void   (*marshal)  (GClosure       *closure,
> > > -                                           GValue /*out*/ *return_v=
alue,
> > > -diff --git a/gobject/gobject.c b/gobject/gobject.c
> > > -index 6e9c44a1e..a3a32be9f 100644
> > > ---- a/gobject/gobject.c
> > > -+++ b/gobject/gobject.c
> > > -@@ -174,9 +174,9 @@ typedef struct
> > > -   GTypeInstance  g_type_instance;
> > > -
> > > -   /*< private >*/
> > > --  volatile guint ref_count;
> > > -+  guint          ref_count;  /* (atomic) */
> > > - #ifdef HAVE_OPTIONAL_FLAGS
> > > --  volatile guint optional_flags;
> > > -+  guint          optional_flags;  /* (atomic) */
> > > - #endif
> > > -   GData         *qdata;
> > > - } GObjectReal;
> > > -diff --git a/gobject/gtype.c b/gobject/gtype.c
> > > -index 51dad7690..be5989a3e 100644
> > > ---- a/gobject/gtype.c
> > > -+++ b/gobject/gtype.c
> > > -@@ -221,9 +221,9 @@ typedef enum
> > > - /* --- structures --- */
> > > - struct _TypeNode
> > > - {
> > > --  guint volatile ref_count;
> > > -+  guint        ref_count;  /* (atomic) */
> > > - #ifdef G_ENABLE_DEBUG
> > > --  guint volatile instance_count;
> > > -+  guint        instance_count;  /* (atomic) */
> > > - #endif
> > > -   GTypePlugin *plugin;
> > > -   guint        n_children; /* writable with lock */
> > > -@@ -233,7 +233,7 @@ struct _TypeNode
> > > -   guint        is_instantiatable : 1;
> > > -   guint        mutatable_check_cache : 1;     /* combines some com=
mon path checks */
> > > -   GType       *children; /* writable with lock */
> > > --  TypeData * volatile data;
> > > -+  TypeData    *data;
> > > -   GQuark       qname;
> > > -   GData       *global_gdata;
> > > -   union {
> > > -@@ -569,8 +569,8 @@ type_node_new_W (TypeNode    *pnode,
> > > - }
> > > -
> > > - static inline IFaceEntry*
> > > --lookup_iface_entry_I (volatile IFaceEntries *entries,
> > > --                    TypeNode *iface_node)
> > > -+lookup_iface_entry_I (IFaceEntries *entries,
> > > -+                      TypeNode     *iface_node)
> > > - {
> > > -   guint8 *offsets;
> > > -   guint offset_index;
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0017-gmessages-Drop=
-unnecessary-volatile-qualifiers-from-.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0017-gmessages-Drop-unnecessary-volatile-qualifiers-from-.patch
> > > deleted file mode 100644
> > > index 02816a887c..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0017-gmessages-Drop-unnece=
ssary-volatile-qualifiers-from-.patch
> > > +++ /dev/null
> > > @@ -1,44 +0,0 @@
> > > -From eee7e3c6688f2f1ee9beed5d6d209973c1df387e Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 19:14:25 +0000
> > > -Subject: [PATCH 17/29] gmessages: Drop unnecessary volatile qualifi=
ers from
> > > - macro variables
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -It=E2=80=99s not necessary and provides no thread safety guarantees=
.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/gmessages.h | 4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/glib/gmessages.h b/glib/gmessages.h
> > > -index 6a28443b4..2e3650baf 100644
> > > ---- a/glib/gmessages.h
> > > -+++ b/glib/gmessages.h
> > > -@@ -478,7 +478,7 @@ g_debug (const gchar *format,
> > > - #if defined(G_HAVE_ISO_VARARGS) && !G_ANALYZER_ANALYZING
> > > - #define g_warning_once(...) \
> > > -   G_STMT_START { \
> > > --    static volatile int G_PASTE (_GWarningOnceBoolean, __LINE__) =
=3D 0; \
> > > -+    static int G_PASTE (_GWarningOnceBoolean, __LINE__) =3D 0;  /*=
 (atomic) */ \
> > > -     if (g_atomic_int_compare_and_exchange (&G_PASTE (_GWarningOnce=
Boolean, __LINE__), \
> > > -                                            0, 1)) \
> > > -       g_warning (__VA_ARGS__); \
> > > -@@ -487,7 +487,7 @@ g_debug (const gchar *format,
> > > - #elif defined(G_HAVE_GNUC_VARARGS)  && !G_ANALYZER_ANALYZING
> > > - #define g_warning_once(format...) \
> > > -   G_STMT_START { \
> > > --    static volatile int G_PASTE (_GWarningOnceBoolean, __LINE__) =
=3D 0; \
> > > -+    static int G_PASTE (_GWarningOnceBoolean, __LINE__) =3D 0;  /*=
 (atomic) */ \
> > > -     if (g_atomic_int_compare_and_exchange (&G_PASTE (_GWarningOnce=
Boolean, __LINE__), \
> > > -                                            0, 1)) \
> > > -       g_warning (format); \
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0018-gtypes-Drop-vo=
latile-qualifier-from-gatomicrefcount.patch b/meta/recipes-core/glib-2.0/gl=
ib-2.0/0018-gtypes-Drop-volatile-qualifier-from-gatomicrefcount.patch
> > > deleted file mode 100644
> > > index 50cb3c470e..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0018-gtypes-Drop-volatile-=
qualifier-from-gatomicrefcount.patch
> > > +++ /dev/null
> > > @@ -1,35 +0,0 @@
> > > -From 8a87069ff42a0631dce153701cb2ec5e343a958c Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 19:16:30 +0000
> > > -Subject: [PATCH 18/29] gtypes: Drop volatile qualifier from gatomic=
refcount
> > > -
> > > -This is technically an API break, but since the type is meant to be
> > > -opaque (third party code is not meant to treat it like an integer) =
it
> > > -should not cause problems.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/gtypes.h | 4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/glib/gtypes.h b/glib/gtypes.h
> > > -index 23c5a1295..2c4825582 100644
> > > ---- a/glib/gtypes.h
> > > -+++ b/glib/gtypes.h
> > > -@@ -550,8 +550,8 @@ struct _GTimeVal
> > > -   glong tv_usec;
> > > - } GLIB_DEPRECATED_TYPE_IN_2_62_FOR(GDateTime);
> > > -
> > > --typedef gint            grefcount;
> > > --typedef volatile gint   gatomicrefcount;
> > > -+typedef gint grefcount;
> > > -+typedef gint gatomicrefcount;  /* should be accessed only using at=
omics */
> > > -
> > > - G_END_DECLS
> > > -
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0019-gatomicarray-D=
rop-volatile-qualifier-from-GAtomicArr.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0019-gatomicarray-Drop-volatile-qualifier-from-GAtomicArr.patch
> > > deleted file mode 100644
> > > index be3211664a..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0019-gatomicarray-Drop-vol=
atile-qualifier-from-GAtomicArr.patch
> > > +++ /dev/null
> > > @@ -1,44 +0,0 @@
> > > -From 46bae4f18dfec8fedda82648091752d270b2dff8 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 19:19:20 +0000
> > > -Subject: [PATCH 19/29] gatomicarray: Drop volatile qualifier from G=
AtomicArray
> > > - API
> > > -
> > > -This is an API break, but it should not affect third party code sin=
ce
> > > -that code should not be interacting with the `data` member in a way=
 that
> > > -invokes its `volatile` qualifier (such as copying to an intermediat=
e
> > > -variable).
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gobject/gatomicarray.h | 4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/gobject/gatomicarray.h b/gobject/gatomicarray.h
> > > -index 9550fa396..89043c5e4 100644
> > > ---- a/gobject/gatomicarray.h
> > > -+++ b/gobject/gatomicarray.h
> > > -@@ -29,7 +29,7 @@ G_BEGIN_DECLS
> > > -
> > > - typedef struct _GAtomicArray GAtomicArray;
> > > - struct _GAtomicArray {
> > > --  volatile gpointer data;               /* elements - atomic */
> > > -+  gpointer data;  /* elements - atomic */
> > > - };
> > > -
> > > - void     _g_atomic_array_init   (GAtomicArray *array);
> > > -@@ -42,7 +42,7 @@ void     _g_atomic_array_update (GAtomicArray *ar=
ray,
> > > - #define  G_ATOMIC_ARRAY_GET_LOCKED(_array, _type) ((_type *)((_arr=
ay)->data))
> > > -
> > > - #define G_ATOMIC_ARRAY_DO_TRANSACTION(_array, _type, _C_) G_STMT_S=
TART {      \
> > > --    volatile gpointer *_datap  =3D &(_array)->data;               =
              \
> > > -+    gpointer *_datap  =3D &(_array)->data;                        =
      \
> > > -     _type *transaction_data, *__check;                            =
                    \
> > > -                                                                   =
            \
> > > -     __check =3D g_atomic_pointer_get (_datap);                    =
              \
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-gobject-Drop-v=
olatile-qualifier-from-GObject.ref_cou.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0020-gobject-Drop-volatile-qualifier-from-GObject.ref_cou.patch
> > > deleted file mode 100644
> > > index ae024a9af4..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0020-gobject-Drop-volatile=
-qualifier-from-GObject.ref_cou.patch
> > > +++ /dev/null
> > > @@ -1,33 +0,0 @@
> > > -From 334f6953364680ddc6c0d3da13fda1d92bf5379d Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 19:21:07 +0000
> > > -Subject: [PATCH 20/29] gobject: Drop volatile qualifier from GObjec=
t.ref_count
> > > -
> > > -This is an API break, but no third party code should be touching
> > > -`GObject.ref_count`, let alone in a way which would be changed by t=
he
> > > -removal of the `volatile` qualifier.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gobject/gobject.h | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/gobject/gobject.h b/gobject/gobject.h
> > > -index 7f55e1976..a84c183f8 100644
> > > ---- a/gobject/gobject.h
> > > -+++ b/gobject/gobject.h
> > > -@@ -247,7 +247,7 @@ struct  _GObject
> > > -   GTypeInstance  g_type_instance;
> > > -
> > > -   /*< private >*/
> > > --  volatile guint ref_count;
> > > -+  guint          ref_count;  /* (atomic) */
> > > -   GData         *qdata;
> > > - };
> > > - /**
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0021-tests-Drop-unn=
ecessary-volatile-qualifiers-from-test.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0021-tests-Drop-unnecessary-volatile-qualifiers-from-test.patch
> > > deleted file mode 100644
> > > index b8ed99ce15..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0021-tests-Drop-unnecessar=
y-volatile-qualifiers-from-test.patch
> > > +++ /dev/null
> > > @@ -1,51 +0,0 @@
> > > -From 8a112c3c6e5fe6838ee29eec7caa62ba32d9bc40 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 19:22:49 +0000
> > > -Subject: [PATCH 21/29] tests: Drop unnecessary volatile qualifiers =
from tests
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -These variables were already (correctly) accessed atomically. The
> > > -`volatile` qualifier doesn=E2=80=99t help with that.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gobject/tests/qdata.c       | 2 +-
> > > - gobject/tests/threadtests.c | 4 ++--
> > > - 2 files changed, 3 insertions(+), 3 deletions(-)
> > > -
> > > -diff --git a/gobject/tests/qdata.c b/gobject/tests/qdata.c
> > > -index 528bdc68e..7d46efb15 100644
> > > ---- a/gobject/tests/qdata.c
> > > -+++ b/gobject/tests/qdata.c
> > > -@@ -17,7 +17,7 @@ gboolean fail;
> > > - #define ROUNDS 10000
> > > -
> > > - GObject *object;
> > > --volatile gint bucket[THREADS];
> > > -+gint bucket[THREADS];  /* accessed from multiple threads, but shou=
ld never be contested due to the sequence of thread operations */
> > > -
> > > - static gpointer
> > > - thread_func (gpointer data)
> > > -diff --git a/gobject/tests/threadtests.c b/gobject/tests/threadtest=
s.c
> > > -index e341a9d67..b6f9e17fa 100644
> > > ---- a/gobject/tests/threadtests.c
> > > -+++ b/gobject/tests/threadtests.c
> > > -@@ -27,8 +27,8 @@
> > > - #include <glib.h>
> > > - #include <glib-object.h>
> > > -
> > > --static volatile int mtsafe_call_counter =3D 0; /* multi thread saf=
e call counter */
> > > --static int          unsafe_call_counter =3D 0; /* single-threaded =
call counter */
> > > -+static int mtsafe_call_counter =3D 0; /* multi thread safe call co=
unter, must be accessed atomically */
> > > -+static int unsafe_call_counter =3D 0; /* single-threaded call coun=
ter */
> > > - static GCond sync_cond;
> > > - static GMutex sync_mutex;
> > > -
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0022-build-Drop-unn=
ecessary-volatile-qualifiers-from-conf.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0022-build-Drop-unnecessary-volatile-qualifiers-from-conf.patch
> > > deleted file mode 100644
> > > index 5da509d178..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0022-build-Drop-unnecessar=
y-volatile-qualifiers-from-conf.patch
> > > +++ /dev/null
> > > @@ -1,38 +0,0 @@
> > > -From daf90bfa99fc02a253d538c65fbaa12f2e6c1c45 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Wed, 11 Nov 2020 19:23:18 +0000
> > > -Subject: [PATCH 22/29] build: Drop unnecessary volatile qualifiers =
from
> > > - configure tests
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - meson.build | 3 ++-
> > > - 1 file changed, 2 insertions(+), 1 deletion(-)
> > > -
> > > -diff --git a/meson.build b/meson.build
> > > -index e0b308a25..ad7f887fb 100644
> > > ---- a/meson.build
> > > -+++ b/meson.build
> > > -@@ -1773,7 +1773,7 @@ endforeach
> > > - # that then to silently fall back on emulated atomic ops just beca=
use
> > > - # the user had the wrong build environment.
> > > - atomictest =3D '''int main() {
> > > --  volatile int atomic =3D 2;
> > > -+  int atomic =3D 2;
> > > -   __sync_bool_compare_and_swap (&atomic, 2, 3);
> > > -   return 0;
> > > - }
> > > -@@ -1883,6 +1883,7 @@ endif
> > > -
> > > - # FIXME: we should make it print the result and always return 0, s=
o that
> > > - # the output in meson shows up as green
> > > -+# volatile is needed here to avoid optimisations in the test
> > > - stack_grows_check_prog =3D '''
> > > -   volatile int *a =3D 0, *b =3D 0;
> > > -   void f (int i) {
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0023-gdbusprivate-A=
void-a-warning-about-a-statement-with-.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0023-gdbusprivate-Avoid-a-warning-about-a-statement-with-.patch
> > > deleted file mode 100644
> > > index 012f9ca87a..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0023-gdbusprivate-Avoid-a-=
warning-about-a-statement-with-.patch
> > > +++ /dev/null
> > > @@ -1,33 +0,0 @@
> > > -From 0604f5858259c32744e6fc912ed4feb308651a3a Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Mon, 16 Nov 2020 14:47:23 +0000
> > > -Subject: [PATCH 23/29] gdbusprivate: Avoid a warning about a statem=
ent with no
> > > - effect
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/gdbusprivate.c | 5 ++---
> > > - 1 file changed, 2 insertions(+), 3 deletions(-)
> > > -
> > > -diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
> > > -index 99b37f3eb..4e42c1a4d 100644
> > > ---- a/gio/gdbusprivate.c
> > > -+++ b/gio/gdbusprivate.c
> > > -@@ -1945,11 +1945,10 @@ _g_dbus_initialize (void)
> > > -
> > > -   if (g_once_init_enter (&initialized))
> > > -     {
> > > --      GQuark g_dbus_error_domain;
> > > -       const gchar *debug;
> > > -
> > > --      g_dbus_error_domain =3D G_DBUS_ERROR;
> > > --      (g_dbus_error_domain); /* To avoid -Wunused-but-set-variable=
 */
> > > -+      /* Ensure the domain is registered. */
> > > -+      g_dbus_error_quark ();
> > > -
> > > -       debug =3D g_getenv ("G_DBUS_DEBUG");
> > > -       if (debug !=3D NULL)
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0024-tests-Add-comm=
ent-to-volatile-atomic-tests.patch b/meta/recipes-core/glib-2.0/glib-2.0/00=
24-tests-Add-comment-to-volatile-atomic-tests.patch
> > > deleted file mode 100644
> > > index 7350803c6f..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0024-tests-Add-comment-to-=
volatile-atomic-tests.patch
> > > +++ /dev/null
> > > @@ -1,49 +0,0 @@
> > > -From 2d03f99ae4de394cac0690717d96c2d884ccdae2 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Mon, 16 Nov 2020 14:47:47 +0000
> > > -Subject: [PATCH 24/29] tests: Add comment to volatile atomic tests
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -`volatile` should not be used to indicate atomic variables, and we
> > > -shouldn=E2=80=99t encourage its use. Keep the tests, since they che=
ck that we
> > > -don=E2=80=99t emit warnings when built against incorrect old code w=
hich uses
> > > -`volatile`. But add a comment to stop copy/paste use of `volatile`
> > > -in the future.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/tests/atomic.c | 6 ++++++
> > > - 1 file changed, 6 insertions(+)
> > > -
> > > -diff --git a/glib/tests/atomic.c b/glib/tests/atomic.c
> > > -index 7d2459f3a..14e6e454e 100644
> > > ---- a/glib/tests/atomic.c
> > > -+++ b/glib/tests/atomic.c
> > > -@@ -94,6 +94,9 @@ test_types (void)
> > > -   res =3D g_atomic_pointer_compare_and_exchange (&vp_str, NULL, st=
r);
> > > -   g_assert_true (res);
> > > -
> > > -+  /* Note that atomic variables should almost certainly not be mar=
ked as
> > > -+   * `volatile` =E2=80=94 see http://isvolatileusefulwiththreads.i=
n/c/. This test exists
> > > -+   * to make sure that we don=E2=80=99t warn when built against ol=
der third party code. */
> > > -   g_atomic_pointer_set (&vp_str_vol, NULL);
> > > -   res =3D g_atomic_pointer_compare_and_exchange (&vp_str_vol, NULL=
, str);
> > > -   g_assert_true (res);
> > > -@@ -210,6 +213,9 @@ G_GNUC_END_IGNORE_DEPRECATIONS
> > > -   res =3D g_atomic_pointer_compare_and_exchange (&vp_str, NULL, (c=
har *) str);
> > > -   g_assert_true (res);
> > > -
> > > -+  /* Note that atomic variables should almost certainly not be mar=
ked as
> > > -+   * `volatile` =E2=80=94 see http://isvolatileusefulwiththreads.i=
n/c/. This test exists
> > > -+   * to make sure that we don=E2=80=99t warn when built against ol=
der third party code. */
> > > -   g_atomic_pointer_set (&vp_str_vol, NULL);
> > > -   res =3D g_atomic_pointer_compare_and_exchange (&vp_str_vol, NULL=
, (char *) str);
> > > -   g_assert_true (res);
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0025-gthread-Use-g_=
atomic-primitives-correctly-in-destruc.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0025-gthread-Use-g_atomic-primitives-correctly-in-destruc.patch
> > > deleted file mode 100644
> > > index c15a3b8a57..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0025-gthread-Use-g_atomic-=
primitives-correctly-in-destruc.patch
> > > +++ /dev/null
> > > @@ -1,77 +0,0 @@
> > > -From 6bd0a4b29753570a2c20b61b5ad2c0068567b7b6 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Mon, 16 Nov 2020 16:44:29 +0000
> > > -Subject: [PATCH 25/29] gthread: Use g_atomic() primitives correctly=
 in
> > > - destructor list
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -In the Windows destructor list, consistently access
> > > -`g_private_destructors` using atomic primitives.
> > > -
> > > -`g_atomic_pointer_compare_and_exchange()` should be equivalent to
> > > -`InterlockedCompareExchangePointer()`, but is a bit more understand=
able
> > > -in a general GLib context, and pairs with `g_atomic_pointer_get()`.=
 (I
> > > -can=E2=80=99t find a Windows API equivalent for that.)
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - glib/gthread-win32.c | 13 +++++++------
> > > - 1 file changed, 7 insertions(+), 6 deletions(-)
> > > -
> > > -diff --git a/glib/gthread-win32.c b/glib/gthread-win32.c
> > > -index 0c37dc6c1..20aca6fa1 100644
> > > ---- a/glib/gthread-win32.c
> > > -+++ b/glib/gthread-win32.c
> > > -@@ -301,7 +301,7 @@ struct _GPrivateDestructor
> > > -   GPrivateDestructor *next;
> > > - };
> > > -
> > > --static GPrivateDestructor * volatile g_private_destructors;
> > > -+static GPrivateDestructor *g_private_destructors;  /* (atomic) pre=
pend-only */
> > > - static CRITICAL_SECTION g_private_lock;
> > > -
> > > - static DWORD
> > > -@@ -329,7 +329,7 @@ g_private_get_impl (GPrivate *key)
> > > -                 g_thread_abort (errno, "malloc");
> > > -               destructor->index =3D impl;
> > > -               destructor->notify =3D key->notify;
> > > --              destructor->next =3D g_private_destructors;
> > > -+              destructor->next =3D g_atomic_pointer_get (&g_privat=
e_destructors);
> > > -
> > > -               /* We need to do an atomic store due to the unlocked
> > > -                * access to the destructor list from the thread exi=
t
> > > -@@ -337,13 +337,14 @@ g_private_get_impl (GPrivate *key)
> > > -                *
> > > -                * It can double as a sanity check...
> > > -                */
> > > --              if (InterlockedCompareExchangePointer (&g_private_de=
structors, destructor,
> > > --                                                     destructor->n=
ext) !=3D destructor->next)
> > > -+              if (!g_atomic_pointer_compare_and_exchange (&g_priva=
te_destructors,
> > > -+                                                          destruct=
or->next,
> > > -+                                                          destruct=
or))
> > > -                 g_thread_abort (0, "g_private_get_impl(1)");
> > > -             }
> > > -
> > > -           /* Ditto, due to the unlocked access on the fast path */
> > > --          if (InterlockedCompareExchangePointer (&key->p, impl, NU=
LL) !=3D NULL)
> > > -+          if (!g_atomic_pointer_compare_and_exchange (&key->p, NUL=
L, impl))
> > > -             g_thread_abort (0, "g_private_get_impl(2)");
> > > -         }
> > > -       LeaveCriticalSection (&g_private_lock);
> > > -@@ -635,7 +636,7 @@ g_thread_win32_thread_detach (void)
> > > -        */
> > > -       dtors_called =3D FALSE;
> > > -
> > > --      for (dtor =3D g_private_destructors; dtor; dtor =3D dtor->ne=
xt)
> > > -+      for (dtor =3D g_atomic_pointer_get (&g_private_destructors);=
 dtor; dtor =3D dtor->next)
> > > -         {
> > > -           gpointer value;
> > > -
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0026-gtype-Fix-some=
-typos-in-comments.patch b/meta/recipes-core/glib-2.0/glib-2.0/0026-gtype-F=
ix-some-typos-in-comments.patch
> > > deleted file mode 100644
> > > index 7090a12a8b..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0026-gtype-Fix-some-typos-=
in-comments.patch
> > > +++ /dev/null
> > > @@ -1,47 +0,0 @@
> > > -From 041dd8b70bd14b041d6a495492eb7a5fc7568bb7 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Mon, 16 Nov 2020 16:47:54 +0000
> > > -Subject: [PATCH 26/29] gtype: Fix some typos in comments
> > > -
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > ----
> > > - gobject/gtype.c | 8 ++++----
> > > - 1 file changed, 4 insertions(+), 4 deletions(-)
> > > -
> > > -diff --git a/gobject/gtype.c b/gobject/gtype.c
> > > -index be5989a3e..ae1af8a05 100644
> > > ---- a/gobject/gtype.c
> > > -+++ b/gobject/gtype.c
> > > -@@ -2290,7 +2290,7 @@ type_class_init_Wm (TypeNode   *node,
> > > -    * inherited interfaces are already init_state =3D=3D INITIALIZE=
D, because
> > > -    * they either got setup in the above base_init loop, or during
> > > -    * class_init from within type_add_interface_Wm() for this or
> > > --   * an anchestor type.
> > > -+   * an ancestor type.
> > > -    */
> > > -   i =3D 0;
> > > -   while ((entries =3D CLASSED_NODE_IFACES_ENTRIES_LOCKED (node)) !=
=
=3D NULL)
> > > -@@ -3462,7 +3462,7 @@ g_type_depth (GType type)
> > > -  * be used to determine the types and order in which the leaf type=
 is
> > > -  * descended from the root type.
> > > -  *
> > > -- * Returns: immediate child of @root_type and anchestor of @leaf_t=
ype
> > > -+ * Returns: immediate child of @root_type and ancestor of @leaf_ty=
pe
> > > -  */
> > > - GType
> > > - g_type_next_base (GType type,
> > > -@@ -3549,8 +3549,8 @@ type_node_conforms_to_U (TypeNode *node,
> > > -
> > > - /**
> > > -  * g_type_is_a:
> > > -- * @type: type to check anchestry for
> > > -- * @is_a_type: possible anchestor of @type or interface that @type
> > > -+ * @type: type to check ancestry for
> > > -+ * @is_a_type: possible ancestor of @type or interface that @type
> > > -  *     could conform to
> > > -  *
> > > -  * If @is_a_type is a derivable type, check whether @type is a
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0027-gtype-Add-some=
-missing-atomic-accesses-to-init_state.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0027-gtype-Add-some-missing-atomic-accesses-to-init_state.patch
> > > deleted file mode 100644
> > > index 9c4e45ff41..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0027-gtype-Add-some-missin=
g-atomic-accesses-to-init_state.patch
> > > +++ /dev/null
> > > @@ -1,76 +0,0 @@
> > > -From 47da8ec5d9a284e07f77c7d59fc8eacf3ebf188a Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Mon, 16 Nov 2020 16:57:22 +0000
> > > -Subject: [PATCH 27/29] gtype: Add some missing atomic accesses to i=
nit_state
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=3DUTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -Half of the references to `init_state` in `gtype.c` already correct=
ly
> > > -accessed it atomically, but a couple didn=E2=80=99t. Drop the `vola=
tile`
> > > -qualifier from its declaration, as that=E2=80=99s not necessary for=
 atomic
> > > -access.
> > > -
> > > -Note that this is the `init_state` in `TypeData`, *not* the `init_s=
tate`
> > > -in `IFaceEntry`.
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Helps: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gobject/gtype.c | 10 +++++-----
> > > - 1 file changed, 5 insertions(+), 5 deletions(-)
> > > -
> > > -diff --git a/gobject/gtype.c b/gobject/gtype.c
> > > -index ae1af8a05..909faf138 100644
> > > ---- a/gobject/gtype.c
> > > -+++ b/gobject/gtype.c
> > > -@@ -322,7 +322,7 @@ struct _ClassData
> > > -   CommonData         common;
> > > -   guint16            class_size;
> > > -   guint16            class_private_size;
> > > --  int volatile       init_state; /* atomic - g_type_class_ref read=
s it unlocked */
> > > -+  int                init_state;  /* (atomic) - g_type_class_ref r=
eads it unlocked */
> > > -   GBaseInitFunc      class_init_base;
> > > -   GBaseFinalizeFunc  class_finalize_base;
> > > -   GClassInitFunc     class_init;
> > > -@@ -336,7 +336,7 @@ struct _InstanceData
> > > -   CommonData         common;
> > > -   guint16            class_size;
> > > -   guint16            class_private_size;
> > > --  int volatile       init_state; /* atomic - g_type_class_ref read=
s it unlocked */
> > > -+  int                init_state;  /* (atomic) - g_type_class_ref r=
eads it unlocked */
> > > -   GBaseInitFunc      class_init_base;
> > > -   GBaseFinalizeFunc  class_finalize_base;
> > > -   GClassInitFunc     class_init;
> > > -@@ -1415,7 +1415,7 @@ type_node_add_iface_entry_W (TypeNode   *node=
,
> > > -
> > > -   if (parent_entry)
> > > -     {
> > > --      if (node->data && node->data->class.init_state >=3D BASE_IFA=
CE_INIT)
> > > -+      if (node->data && g_atomic_int_get (&node->data->class.init_=
state) >=3D BASE_IFACE_INIT)
> > > -         {
> > > -           entries->entry[i].init_state =3D INITIALIZED;
> > > -           entries->entry[i].vtable =3D parent_entry->vtable;
> > > -@@ -1481,7 +1481,7 @@ type_add_interface_Wm (TypeNode             *=
node,
> > > -    */
> > > -   if (node->data)
> > > -     {
> > > --      InitState class_state =3D node->data->class.init_state;
> > > -+      InitState class_state =3D g_atomic_int_get (&node->data->cla=
ss.init_state);
> > > -
> > > -       if (class_state >=3D BASE_IFACE_INIT)
> > > -         type_iface_vtable_base_init_Wm (iface, node);
> > > -@@ -2175,7 +2175,7 @@ type_class_init_Wm (TypeNode   *node,
> > > -   g_assert (node->is_classed && node->data &&
> > > -           node->data->class.class_size &&
> > > -           !node->data->class.class &&
> > > --          node->data->class.init_state =3D=3D UNINITIALIZED);
> > > -+          g_atomic_int_get (&node->data->class.init_state) =3D=3D =
UNINITIALIZED);
> > > -   if (node->data->class.class_private_size)
> > > -     class =3D g_malloc0 (ALIGN_STRUCT (node->data->class.class_siz=
e) + node->data->class.class_private_size);
> > > -   else
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0028-gresource-Fix-=
a-pointer-mismatch-with-an-atomic-load.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0028-gresource-Fix-a-pointer-mismatch-with-an-atomic-load.patch
> > > deleted file mode 100644
> > > index e03fac19f4..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0028-gresource-Fix-a-point=
er-mismatch-with-an-atomic-load.patch
> > > +++ /dev/null
> > > @@ -1,29 +0,0 @@
> > > -From 7d417f8406b8fa32a25659120738d22be6a1b482 Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Mon, 16 Nov 2020 17:17:21 +0000
> > > -Subject: [PATCH 28/29] gresource: Fix a pointer mismatch with an at=
omic load
> > > -
> > > -This squashes a warning when compiling with Clang.
> > > -
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > ----
> > > - gio/gresource.c | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/gio/gresource.c b/gio/gresource.c
> > > -index 79a49d33d..b495d12ac 100644
> > > ---- a/gio/gresource.c
> > > -+++ b/gio/gresource.c
> > > -@@ -1398,7 +1398,7 @@ register_lazy_static_resources (void)
> > > - void
> > > - g_static_resource_init (GStaticResource *static_resource)
> > > - {
> > > --  gpointer next;
> > > -+  GStaticResource *next;
> > > -
> > > -   do
> > > -     {
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0029-docs-Document-=
not-to-use-volatile-qualifiers.patch b/meta/recipes-core/glib-2.0/glib-2.0/=
0029-docs-Document-not-to-use-volatile-qualifiers.patch
> > > deleted file mode 100644
> > > index 3311ad65d6..0000000000
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/0029-docs-Document-not-to-=
use-volatile-qualifiers.patch
> > > +++ /dev/null
> > > @@ -1,258 +0,0 @@
> > > -From 83e48d8ac1fee98059e2305d8909dca26190bddc Mon Sep 17 00:00:00 2=
001
> > > -From: Philip Withnall <pwithnall@endlessos.org>
> > > -Date: Tue, 17 Nov 2020 10:15:15 +0000
> > > -Subject: [PATCH 29/29] docs: Document not to use `volatile` qualifi=
ers
> > > -
> > > -Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
> > > -
> > > -Fixes: #600
> > > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/me=
rge_requests/1719]
> > > ----
> > > - gio/gdbusconnection.c | 12 ++++++++---
> > > - gio/gdbuserror.c      |  3 +++
> > > - glib/gatomic.c        | 48 +++++++++++++++++++++++++++++++++++++++=
++++
> > > - glib/gthread.c        |  6 ++++++
> > > - 4 files changed, 66 insertions(+), 3 deletions(-)
> > > -
> > > -diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
> > > -index 91c365e80..65939a4d2 100644
> > > ---- a/gio/gdbusconnection.c
> > > -+++ b/gio/gdbusconnection.c
> > > -@@ -1708,7 +1708,9 @@ g_dbus_connection_send_message_unlocked (GDBu=
sConnection   *connection,
> > > -  * will be assigned by @connection and set on @message via
> > > -  * g_dbus_message_set_serial(). If @out_serial is not %NULL, then =
the
> > > -  * serial number used will be written to this location prior to
> > > -- * submitting the message to the underlying transport.
> > > -+ * submitting the message to the underlying transport. While it ha=
s a `volatile`
> > > -+ * qualifier, this is a historical artifact and the argument passe=
d to it should
> > > -+ * not be `volatile`.
> > > -  *
> > > -  * If @connection is closed then the operation will fail with
> > > -  * %G_IO_ERROR_CLOSED. If @message is not well-formed,
> > > -@@ -1979,7 +1981,9 @@ g_dbus_connection_send_message_with_reply_unl=
ocked (GDBusConnection     *connect
> > > -  * will be assigned by @connection and set on @message via
> > > -  * g_dbus_message_set_serial(). If @out_serial is not %NULL, then =
the
> > > -  * serial number used will be written to this location prior to
> > > -- * submitting the message to the underlying transport.
> > > -+ * submitting the message to the underlying transport. While it ha=
s a `volatile`
> > > -+ * qualifier, this is a historical artifact and the argument passe=
d to it should
> > > -+ * not be `volatile`.
> > > -  *
> > > -  * If @connection is closed then the operation will fail with
> > > -  * %G_IO_ERROR_CLOSED. If @cancellable is canceled, the operation =
will
> > > -@@ -2105,7 +2109,9 @@ send_message_with_reply_sync_cb (GDBusConnect=
ion *connection,
> > > -  * will be assigned by @connection and set on @message via
> > > -  * g_dbus_message_set_serial(). If @out_serial is not %NULL, then =
the
> > > -  * serial number used will be written to this location prior to
> > > -- * submitting the message to the underlying transport.
> > > -+ * submitting the message to the underlying transport. While it ha=
s a `volatile`
> > > -+ * qualifier, this is a historical artifact and the argument passe=
d to it should
> > > -+ * not be `volatile`.
> > > -  *
> > > -  * If @connection is closed then the operation will fail with
> > > -  * %G_IO_ERROR_CLOSED. If @cancellable is canceled, the operation =
will
> > > -diff --git a/gio/gdbuserror.c b/gio/gdbuserror.c
> > > -index b03a33f27..4ad97bb6e 100644
> > > ---- a/gio/gdbuserror.c
> > > -+++ b/gio/gdbuserror.c
> > > -@@ -177,6 +177,9 @@ g_dbus_error_quark (void)
> > > -  *
> > > -  * Helper function for associating a #GError error domain with D-B=
us error names.
> > > -  *
> > > -+ * While @quark_volatile has a `volatile` qualifier, this is a his=
torical
> > > -+ * artifact and the argument passed to it should not be `volatile`=
.
> > > -+ *
> > > -  * Since: 2.26
> > > -  */
> > > - void
> > > -diff --git a/glib/gatomic.c b/glib/gatomic.c
> > > -index 67f5ba6b4..0bc67aa35 100644
> > > ---- a/glib/gatomic.c
> > > -+++ b/glib/gatomic.c
> > > -@@ -105,6 +105,9 @@
> > > -  * This call acts as a full compiler and hardware
> > > -  * memory barrier (before the get).
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of the integer
> > > -  *
> > > -  * Since: 2.4
> > > -@@ -125,6 +128,9 @@ gint
> > > -  * This call acts as a full compiler and hardware
> > > -  * memory barrier (after the set).
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Since: 2.4
> > > -  */
> > > - void
> > > -@@ -144,6 +150,9 @@ void
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Since: 2.4
> > > -  **/
> > > - void
> > > -@@ -163,6 +172,9 @@ void
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: %TRUE if the resultant value is zero
> > > -  *
> > > -  * Since: 2.4
> > > -@@ -189,6 +201,9 @@ gboolean
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: %TRUE if the exchange took place
> > > -  *
> > > -  * Since: 2.4
> > > -@@ -216,6 +231,9 @@ gboolean
> > > -  * Before version 2.30, this function did not return a value
> > > -  * (but g_atomic_int_exchange_and_add() did, and had the same mean=
ing).
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the add, signed
> > > -  *
> > > -  * Since: 2.4
> > > -@@ -240,6 +258,9 @@ gint
> > > -  * Think of this operation as an atomic version of
> > > -  * `{ tmp =3D *atomic; *atomic &=3D val; return tmp; }`.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the operation, unsigned
> > > -  *
> > > -  * Since: 2.30
> > > -@@ -264,6 +285,9 @@ guint
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the operation, unsigned
> > > -  *
> > > -  * Since: 2.30
> > > -@@ -288,6 +312,9 @@ guint
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the operation, unsigned
> > > -  *
> > > -  * Since: 2.30
> > > -@@ -309,6 +336,9 @@ guint
> > > -  * This call acts as a full compiler and hardware
> > > -  * memory barrier (before the get).
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of the pointer
> > > -  *
> > > -  * Since: 2.4
> > > -@@ -329,6 +359,9 @@ gpointer
> > > -  * This call acts as a full compiler and hardware
> > > -  * memory barrier (after the set).
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Since: 2.4
> > > -  **/
> > > - void
> > > -@@ -354,6 +387,9 @@ void
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: %TRUE if the exchange took place
> > > -  *
> > > -  * Since: 2.4
> > > -@@ -379,6 +415,9 @@ gboolean
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the add, signed
> > > -  *
> > > -  * Since: 2.30
> > > -@@ -403,6 +442,9 @@ gssize
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the operation, unsigned
> > > -  *
> > > -  * Since: 2.30
> > > -@@ -427,6 +469,9 @@ gsize
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the operation, unsigned
> > > -  *
> > > -  * Since: 2.30
> > > -@@ -451,6 +496,9 @@ gsize
> > > -  *
> > > -  * This call acts as a full compiler and hardware memory barrier.
> > > -  *
> > > -+ * While @atomic has a `volatile` qualifier, this is a historical =
artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: the value of @atomic before the operation, unsigned
> > > -  *
> > > -  * Since: 2.30
> > > -diff --git a/glib/gthread.c b/glib/gthread.c
> > > -index 612a9739f..29216d7fd 100644
> > > ---- a/glib/gthread.c
> > > -+++ b/glib/gthread.c
> > > -@@ -686,6 +686,9 @@ g_once_impl (GOnce       *once,
> > > -  *   // use initialization_value here
> > > -  * ]|
> > > -  *
> > > -+ * While @location has a `volatile` qualifier, this is a historica=
l artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Returns: %TRUE if the initialization section should be entered,
> > > -  *     %FALSE and blocks otherwise
> > > -  *
> > > -@@ -725,6 +728,9 @@ gboolean
> > > -  * releases concurrent threads blocking in g_once_init_enter() on =
this
> > > -  * initialization variable.
> > > -  *
> > > -+ * While @location has a `volatile` qualifier, this is a historica=
l artifact and
> > > -+ * the pointer passed to it should not be `volatile`.
> > > -+ *
> > > -  * Since: 2.14
> > > -  */
> > > - void
> > > ---
> > > -2.30.1
> > > -
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.pa=
tch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > > index 4cbcc29a50..e3001762ad 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > > @@ -13,25 +13,24 @@ Signed-off-by: Ross Burton <ross.burton@intel.co=
m>
> > >
> > >  Port patch to 2.48
> > >  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > > -
> > >  ---
> > >   gio/giomodule.c | 12 +++++++++++-
> > >   1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/gio/giomodule.c b/gio/giomodule.c
> > > -index dc4d6d3..da46906 100644
> > > +index ca1daf2..954a250 100644
> > >  --- a/gio/giomodule.c
> > >  +++ b/gio/giomodule.c
> > > -@@ -49,6 +49,8 @@
> > > - #include "gmemorymonitordbus.h"
> > > +@@ -51,6 +51,8 @@
> > >   #ifdef G_OS_WIN32
> > >   #include "gregistrysettingsbackend.h"
> > > + #include "giowin32-priv.h"
> > >  +#else
> > >  +#include <dlfcn.h>
> > >   #endif
> > >   #include <glib/gstdio.h>
> > >
> > > -@@ -1163,7 +1165,15 @@ get_gio_module_dir (void)
> > > +@@ -1212,7 +1214,15 @@ get_gio_module_dir (void)
> > >                                        NULL);
> > >         g_free (install_dir);
> > >   #else
> > > @@ -48,3 +47,6 @@ index dc4d6d3..da46906 100644
> > >   #endif
> > >       }
> > >
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/re=
cipes-core/glib-2.0/glib-2.0_2.68.0.bb
> > > similarity index 50%
> > > rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > > rename to meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb
> > > index 3909b76ddf..3a90be8bc9 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb
> > > @@ -19,40 +19,9 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/gli=
b-${PV}.tar.xz \
> > >             file://0001-gio-tests-codegen.py-bump-timeout-to-100-sec=
onds.patch \
> > >             file://0001-tests-codegen.py-removing-unecessary-print-s=
tatement.patch \
> > >             "
> > > -SRC_URI +=3D "\
> > > -           file://0001-gobject-Drop-use-of-volatile-from-get_type-m=
acros.patch \
> > > -           file://0002-tests-Fix-non-atomic-access-to-a-shared-vari=
able.patch \
> > > -           file://0003-tests-Fix-non-atomic-access-to-a-shared-vari=
able.patch \
> > > -           file://0004-tests-Drop-unnecessary-volatile-qualifiers-f=
rom-test.patch \
> > > -           file://0005-tests-Fix-non-atomic-access-to-some-shared-v=
ariables.patch \
> > > -           file://0006-tests-Drop-unnecessary-volatile-qualifiers-f=
rom-test.patch \
> > > -           file://0007-gdbusconnection-Drop-unnecessary-volatile-qu=
alifiers.patch \
> > > -           file://0008-gdbuserror-Drop-unnecessary-volatile-qualifi=
ers-from.patch \
> > > -           file://0009-gio-Drop-unnecessary-volatile-qualifiers-fro=
m-intern.patch \
> > > -           file://0010-kqueue-Fix-unlocked-access-to-shared-variabl=
e.patch \
> > > -           file://0011-tests-Drop-unnecessary-volatile-qualifiers-f=
rom-test.patch \
> > > -           file://0012-tests-Fix-non-atomic-access-to-some-shared-v=
ariables.patch \
> > > -           file://0013-gatomic-Drop-unnecessary-volatile-qualifiers=
-from-in.patch \
> > > -           file://0014-gatomic-Drop-unnecessary-volatile-qualifiers=
-from-ma.patch \
> > > -           file://0015-glib-Drop-unnecessary-volatile-qualifiers-fr=
om-inter.patch \
> > > -           file://0016-gobject-Drop-unnecessary-volatile-qualifiers=
-from-in.patch \
> > > -           file://0017-gmessages-Drop-unnecessary-volatile-qualifie=
rs-from-.patch \
> > > -           file://0018-gtypes-Drop-volatile-qualifier-from-gatomicr=
efcount.patch \
> > > -           file://0019-gatomicarray-Drop-volatile-qualifier-from-GA=
tomicArr.patch \
> > > -           file://0020-gobject-Drop-volatile-qualifier-from-GObject=
.ref_cou.patch \
> > > -           file://0021-tests-Drop-unnecessary-volatile-qualifiers-f=
rom-test.patch \
> > > -           file://0022-build-Drop-unnecessary-volatile-qualifiers-f=
rom-conf.patch \
> > > -           file://0023-gdbusprivate-Avoid-a-warning-about-a-stateme=
nt-with-.patch \
> > > -           file://0024-tests-Add-comment-to-volatile-atomic-tests.p=
atch \
> > > -           file://0025-gthread-Use-g_atomic-primitives-correctly-in=
-destruc.patch \
> > > -           file://0026-gtype-Fix-some-typos-in-comments.patch \
> > > -           file://0027-gtype-Add-some-missing-atomic-accesses-to-in=
it_state.patch \
> > > -           file://0028-gresource-Fix-a-pointer-mismatch-with-an-ato=
mic-load.patch \
> > > -           file://0029-docs-Document-not-to-use-volatile-qualifiers=
.patch \
> > > -"
> > >  SRC_URI_append_class-native =3D " file://relocate-modules.patch"
> > >
> > > -SRC_URI[sha256sum] =3D "09f158769f6f26b31074e15b1ac80ec39b13b53102d=
fae66cfe826fb2cc65502"
> > > +SRC_URI[sha256sum] =3D "67734f584f3a05a2872f57e9a8db38f3b06c7087fb5=
31c5a839d9171968103ea"
> > >
> > >  # Find any meson cross files in FILESPATH that are relevant for the=
 current
> > >  # build (using siteinfo) and add them to EXTRA_OEMESON.
> > > --
> > > 2.25.1
> > >
> > >
> > >=20
> > >
