Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.3102.1604002448138644555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H2qNLvkv;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id 140so3103376qko.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDIm6hvzkQ6HANVr2P44VYOBOjjKtUkzNc7+ERpveXo=;
        b=H2qNLvkvCcysXjutIh4MY8truatnQkDOjDATSInlS1nB7+10KFkz5tRQd/EnjM7Wgv
         H8KmiGSe7LENOGxKRyVN5inlx2hhIWivP6SNh801ghHuS/Hr1LGFyIgZR6MNxbmtfhHn
         Pnr4oNXkSn7IFKLbCBSNCViL+Dlbkyze/C5Xnja/A7oNYvbPP1M4iB0Io6jMkh94Av+O
         I5xi1SpQ/S9Yyxt57OkYczBSpfXflYR4ERcVxXP5CRu/h1plf7Jb1blsNXrqABoq48Xm
         JPROvMaGQklpsOewdxTVfM1WD08QksdPrjkHIXLqFP38JVTxsz3iMkhnEHsxiulwk13P
         G72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDIm6hvzkQ6HANVr2P44VYOBOjjKtUkzNc7+ERpveXo=;
        b=F9RwXTrZE7LePpugyVQfvnZVXfaccsrxksyey2c3eE2U0OP7sIhorBKu3tcm6FSYnV
         KMLFm99k1hdTeT+UvPWFcm0sTEApT5zdaBUCDa/0Li7qucESyER0F7rLcgU/CG4k1q/B
         kMmIteqU/A2aSOxwY5IK8oHLtlJQArCtX0l9wTyHfeDQjxiTQ1sIPiZI1yrDIef9eTgE
         cTFLS2aS4u5GhsoI/CGn58cy9Gh8TSqPRS6zLEcABsv9xyslGicTFo01F270yzbEBsjQ
         PR8oZrFQIJ+grYlOKl85ORENY7NQIj1Q/zSApq6zYYvDS64Obz8og4+M8ZLKni8qJ2OI
         t08w==
X-Gm-Message-State: AOAM5301eu1MpkL3dlpR7vK0lrSqxaG7kP/jtKsJ9D/6N41ZmrcXHic3
	9c9xouc8lsg8CaY8Cl1LFPGcqS2AQfiqGjhz0Hc=
X-Google-Smtp-Source: ABdhPJzO/R7MWK0Tkp5y8hArFuf4nXuA6MKTiFtDg2NsR4ZLcMw9M1Lr8x+i00RPr1EDABLdLFTWdRhIZWxZLQthVNM=
X-Received: by 2002:a37:7fc7:: with SMTP id a190mr4361276qkd.337.1604002447227;
 Thu, 29 Oct 2020 13:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
 <20201028210558.21070-2-alex.kanavin@gmail.com> <CAMKF1srczW3hZ1_4eof7WnPPvGF=8Ukh-sJAQJPZGNn1Md8Amw@mail.gmail.com>
 <CANNYZj_8Wv7tmhVABYAw_yPcDkE_MK5y8OR2KVy-NY3jqmy37w@mail.gmail.com>
In-Reply-To: <CANNYZj_8Wv7tmhVABYAw_yPcDkE_MK5y8OR2KVy-NY3jqmy37w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Oct 2020 13:13:41 -0700
Message-ID: <CAMKF1sq3=N8du5wd4upVt_0_BQQ8_3eyFyo0k0pSvJ76Mpjjmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/33] glib-2.0: upgrade 2.64.5 -> 2.66.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 2:55 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The patch is already in master, so you can directly cherry-pick it. It is not deleted by the update, because the backport is even newer.
>

then I guess master-next is/was hosed for a while

> Alex
>
> On Thu, 29 Oct 2020 at 04:52, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I think this needs to accommodate/delete patch added by
>> https://lists.openembedded.org/g/openembedded-core/message/143792?p=,,,20,0,0,0::Created,,glib-2.0,20,2,0,77821523
>>
>> since we are needing it on dunfell, I would say reverting it along
>> with this upgrade on master is preferred.
>>
>> On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  ...-correctly-when-building-with-mingw3.patch | 20 +++++++++----------
>> >  .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
>> >  ...{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} |  2 +-
>> >  3 files changed, 12 insertions(+), 12 deletions(-)
>> >  rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} (95%)
>> >
>> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
>> > index d075cd3f23..d6765b163b 100644
>> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
>> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
>> > @@ -1,4 +1,4 @@
>> > -From d3334e83ae0da9ca184eb9c8daf0854544ece023 Mon Sep 17 00:00:00 2001
>> > +From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 2001
>> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
>> >  Date: Wed, 13 Feb 2019 15:32:05 +0100
>> >  Subject: [PATCH] Set host_machine correctly when building with mingw32
>> > @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> >   4 files changed, 9 insertions(+), 6 deletions(-)
>> >
>> >  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
>> > -index dab65d2..e8bb2ee 100644
>> > +index 3a19c82..b762835 100644
>> >  --- a/gio/tests/meson.build
>> >  +++ b/gio/tests/meson.build
>> >  @@ -12,7 +12,7 @@ test_c_args = [
>> > @@ -26,7 +26,7 @@ index dab65d2..e8bb2ee 100644
>> >     common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
>> >   endif
>> >
>> > -@@ -132,7 +132,7 @@ else
>> > +@@ -133,7 +133,7 @@ else
>> >   endif
>> >
>> >   #  Test programs buildable on UNIX only
>> > @@ -35,7 +35,7 @@ index dab65d2..e8bb2ee 100644
>> >     gio_tests += {
>> >       'file' : {},
>> >       'gdbus-peer' : {
>> > -@@ -384,7 +384,7 @@ if host_machine.system() != 'windows'
>> > +@@ -385,7 +385,7 @@ if host_machine.system() != 'windows'
>> >   endif # unix
>> >
>> >   #  Test programs buildable on Windows only
>> > @@ -44,7 +44,7 @@ index dab65d2..e8bb2ee 100644
>> >     gio_tests += {'win32-streams' : {}}
>> >   endif
>> >
>> > -@@ -454,7 +454,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
>> > +@@ -455,7 +455,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
>> >     }
>> >   endif
>> >
>> > @@ -54,10 +54,10 @@ index dab65d2..e8bb2ee 100644
>> >       'gdbus-example-unix-fd-client' : {
>> >         'install' : false,
>> >  diff --git a/glib/tests/meson.build b/glib/tests/meson.build
>> > -index 3dedafc..94605e6 100644
>> > +index 6eb23e8..36eb919 100644
>> >  --- a/glib/tests/meson.build
>> >  +++ b/glib/tests/meson.build
>> > -@@ -134,7 +134,7 @@ if glib_conf.has('HAVE_EVENTFD')
>> > +@@ -137,7 +137,7 @@ if glib_conf.has('HAVE_EVENTFD')
>> >     }
>> >   endif
>> >
>> > @@ -67,7 +67,7 @@ index 3dedafc..94605e6 100644
>> >       glib_tests += {
>> >         'gpoll' : {
>> >  diff --git a/meson.build b/meson.build
>> > -index e1b4b79..afb6eaa 100644
>> > +index 47f3a5c..7ea7ad1 100644
>> >  --- a/meson.build
>> >  +++ b/meson.build
>> >  @@ -32,6 +32,9 @@ else
>> > @@ -78,8 +78,8 @@ index e1b4b79..afb6eaa 100644
>> >  +  host_system = 'windows'
>> >  +endif
>> >
>> > - glib_version = meson.project_version()
>> > - glib_api_version = '2.0'
>> > + if host_system == 'darwin'
>> > +   ios_test_code = '''#include <TargetConditionals.h>
>> >  diff --git a/tests/meson.build b/tests/meson.build
>> >  index 6741f8f..12fdc90 100644
>> >  --- a/tests/meson.build
>> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
>> > index fe87482ae2..07e37acf7d 100644
>> > --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
>> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
>> > @@ -1,4 +1,4 @@
>> > -From 2a715765c6ceb2e8b4cc42e060aee75016111d1a Mon Sep 17 00:00:00 2001
>> > +From 75c0423e1dc34fa20de70bc9932625fd0de4a912 Mon Sep 17 00:00:00 2001
>> >  From: Ross Burton <ross.burton@intel.com>
>> >  Date: Fri, 11 Mar 2016 15:35:55 +0000
>> >  Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
>> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
>> > similarity index 95%
>> > rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
>> > rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
>> > index a30c5215be..52c7e42fbd 100644
>> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
>> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
>> > @@ -21,7 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>> >
>> >  SRC_URI_append_class-native = " file://relocate-modules.patch"
>> >
>> > -SRC_URI[sha256sum] = "9cbd5bd2715ead1c28d53c46f7b7b6ff6166f5887b772c1a9e3bf2910cfecc11"
>> > +SRC_URI[sha256sum] = "a269ffe69fbcc3a21ff1acb1b6146b2a5723499d6e2de33ae16ccb6d2438ef60"
>> >
>> >  # Find any meson cross files in FILESPATH that are relevant for the current
>> >  # build (using siteinfo) and add them to EXTRA_OEMESON.
>> > --
>> > 2.29.0
>> >
>> >
>> > 
>> >
