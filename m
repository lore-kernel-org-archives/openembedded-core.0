Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.6447.1603965354893599082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VeRv/sDt;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id u7so1134497vsq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HCn3jlZknj6IBoT4Mughyf8nMvpN2ZDHI1NCF7s/GVw=;
        b=VeRv/sDtPWwyDDsjgs3IQ1W5jLaXafxR9MeTyknRlteABUs/f6DhwRkfhp2cvYS539
         LtXtI9wRTpS7/tYlPOim09cMCSoWT9JlPcinO3TmB/426MFddBixA7txrek20Ya0qq87
         d01ue8nPy6CgDhGITwYhk2lAMDuUuTInCzvlQgikNUwdCTa212K7FYcpTib0inGbfJsB
         zsgKlI2r2wys+O6DVOZsN+ufLrQjg/UPuxtjVBjWx+9Kp5XAt1Ub8nzqGv6QNxMl2S4t
         RcDUylayqWS+EW1KesYqIESETFpgcnqXlSB3BBgTon3tzNBA08BeryPWSKpnb/GPpy8W
         4mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HCn3jlZknj6IBoT4Mughyf8nMvpN2ZDHI1NCF7s/GVw=;
        b=saRFvNXyDfSknpDsfkgeamLt+7fdxva/K9noyK0zwocSS6fUFzNzhNNUDIgbfQauiF
         QZ9SqXlu7OqGDFVXT6kghj7ttvM1hDMzQXB/sKJg1JRue4O11z1EnOh7/dBk4Yhc1Npu
         DhSBOyvrgZLUlhkO1lMspk7LYmPqQNK5YpPjX2Ax3LExP2PDUIHrG47ICSLL5HfY3g3i
         8JGxfdNh9tQZfo+zh45o40W5HxCo70tTGwWL1yUoBrdmEkIkciFx8+L8Cq4T/m8BY3sT
         osZJZaQsiZUAOMpRuycvYMsay9NdVmeNfsEmpyt8b6Cpz7YGPeO4f67sjG6cRsOELoKd
         cY8A==
X-Gm-Message-State: AOAM5335OwTaKQgSHCxYQb0UmVSdX32EpFWC0Y+gCihqZyrwk2G0HpxH
	uBjtrEKng3iVFZw0tD2vXxxmU+x5QB7bXWDBLmc=
X-Google-Smtp-Source: ABdhPJyv9ynH/QHpRMGB9rYS1B6Ucbe+52gj+qfG23SblKd5b6yMA730SLWVvBmQ5dwzhXpUWmyEC6LlwbqBGdcw6vo=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr2038578vso.20.1603965353963;
 Thu, 29 Oct 2020 02:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
 <20201028210558.21070-2-alex.kanavin@gmail.com> <CAMKF1srczW3hZ1_4eof7WnPPvGF=8Ukh-sJAQJPZGNn1Md8Amw@mail.gmail.com>
In-Reply-To: <CAMKF1srczW3hZ1_4eof7WnPPvGF=8Ukh-sJAQJPZGNn1Md8Amw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2020 10:55:42 +0100
Message-ID: <CANNYZj_8Wv7tmhVABYAw_yPcDkE_MK5y8OR2KVy-NY3jqmy37w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/33] glib-2.0: upgrade 2.64.5 -> 2.66.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000027b3e205b2cc49cb"

--00000000000027b3e205b2cc49cb
Content-Type: text/plain; charset="UTF-8"

The patch is already in master, so you can directly cherry-pick it. It is
not deleted by the update, because the backport is even newer.

Alex

On Thu, 29 Oct 2020 at 04:52, Khem Raj <raj.khem@gmail.com> wrote:

> I think this needs to accommodate/delete patch added by
>
> https://lists.openembedded.org/g/openembedded-core/message/143792?p=,,,20,0,0,0::Created,,glib-2.0,20,2,0,77821523
>
> since we are needing it on dunfell, I would say reverting it along
> with this upgrade on master is preferred.
>
> On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...-correctly-when-building-with-mingw3.patch | 20 +++++++++----------
> >  .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
> >  ...{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} |  2 +-
> >  3 files changed, 12 insertions(+), 12 deletions(-)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.5.bb =>
> glib-2.0_2.66.1.bb} (95%)
> >
> > diff --git
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> > index d075cd3f23..d6765b163b 100644
> > ---
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> > +++
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> > @@ -1,4 +1,4 @@
> > -From d3334e83ae0da9ca184eb9c8daf0854544ece023 Mon Sep 17 00:00:00 2001
> > +From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Wed, 13 Feb 2019 15:32:05 +0100
> >  Subject: [PATCH] Set host_machine correctly when building with mingw32
> > @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   4 files changed, 9 insertions(+), 6 deletions(-)
> >
> >  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> > -index dab65d2..e8bb2ee 100644
> > +index 3a19c82..b762835 100644
> >  --- a/gio/tests/meson.build
> >  +++ b/gio/tests/meson.build
> >  @@ -12,7 +12,7 @@ test_c_args = [
> > @@ -26,7 +26,7 @@ index dab65d2..e8bb2ee 100644
> >     common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library
> ('secur32')]
> >   endif
> >
> > -@@ -132,7 +132,7 @@ else
> > +@@ -133,7 +133,7 @@ else
> >   endif
> >
> >   #  Test programs buildable on UNIX only
> > @@ -35,7 +35,7 @@ index dab65d2..e8bb2ee 100644
> >     gio_tests += {
> >       'file' : {},
> >       'gdbus-peer' : {
> > -@@ -384,7 +384,7 @@ if host_machine.system() != 'windows'
> > +@@ -385,7 +385,7 @@ if host_machine.system() != 'windows'
> >   endif # unix
> >
> >   #  Test programs buildable on Windows only
> > @@ -44,7 +44,7 @@ index dab65d2..e8bb2ee 100644
> >     gio_tests += {'win32-streams' : {}}
> >   endif
> >
> > -@@ -454,7 +454,7 @@ if cc.get_id() != 'msvc' and cc.get_id() !=
> 'clang-cl'
> > +@@ -455,7 +455,7 @@ if cc.get_id() != 'msvc' and cc.get_id() !=
> 'clang-cl'
> >     }
> >   endif
> >
> > @@ -54,10 +54,10 @@ index dab65d2..e8bb2ee 100644
> >       'gdbus-example-unix-fd-client' : {
> >         'install' : false,
> >  diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> > -index 3dedafc..94605e6 100644
> > +index 6eb23e8..36eb919 100644
> >  --- a/glib/tests/meson.build
> >  +++ b/glib/tests/meson.build
> > -@@ -134,7 +134,7 @@ if glib_conf.has('HAVE_EVENTFD')
> > +@@ -137,7 +137,7 @@ if glib_conf.has('HAVE_EVENTFD')
> >     }
> >   endif
> >
> > @@ -67,7 +67,7 @@ index 3dedafc..94605e6 100644
> >       glib_tests += {
> >         'gpoll' : {
> >  diff --git a/meson.build b/meson.build
> > -index e1b4b79..afb6eaa 100644
> > +index 47f3a5c..7ea7ad1 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> >  @@ -32,6 +32,9 @@ else
> > @@ -78,8 +78,8 @@ index e1b4b79..afb6eaa 100644
> >  +  host_system = 'windows'
> >  +endif
> >
> > - glib_version = meson.project_version()
> > - glib_api_version = '2.0'
> > + if host_system == 'darwin'
> > +   ios_test_code = '''#include <TargetConditionals.h>
> >  diff --git a/tests/meson.build b/tests/meson.build
> >  index 6741f8f..12fdc90 100644
> >  --- a/tests/meson.build
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > index fe87482ae2..07e37acf7d 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > @@ -1,4 +1,4 @@
> > -From 2a715765c6ceb2e8b4cc42e060aee75016111d1a Mon Sep 17 00:00:00 2001
> > +From 75c0423e1dc34fa20de70bc9932625fd0de4a912 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Fri, 11 Mar 2016 15:35:55 +0000
> >  Subject: [PATCH] glib-2.0: relocate the GIO module directory for native
> builds
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
> > similarity index 95%
> > rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
> > rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
> > index a30c5215be..52c7e42fbd 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
> > @@ -21,7 +21,7 @@ SRC_URI =
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >
> >  SRC_URI_append_class-native = " file://relocate-modules.patch"
> >
> > -SRC_URI[sha256sum] =
> "9cbd5bd2715ead1c28d53c46f7b7b6ff6166f5887b772c1a9e3bf2910cfecc11"
> > +SRC_URI[sha256sum] =
> "a269ffe69fbcc3a21ff1acb1b6146b2a5723499d6e2de33ae16ccb6d2438ef60"
> >
> >  # Find any meson cross files in FILESPATH that are relevant for the
> current
> >  # build (using siteinfo) and add them to EXTRA_OEMESON.
> > --
> > 2.29.0
> >
> >
> > 
> >
>

--00000000000027b3e205b2cc49cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch is already in master, so you can directly c=
herry-pick it. It is not deleted by the update, because the backport is eve=
n newer.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Oct 2020 at 04:5=
2, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I t=
hink this needs to accommodate/delete patch added by<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1437=
92?p=3D,,,20,0,0,0::Created,,glib-2.0,20,2,0,77821523" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message=
/143792?p=3D,,,20,0,0,0::Created,,glib-2.0,20,2,0,77821523</a><br>
<br>
since we are needing it on dunfell, I would say reverting it along<br>
with this upgrade on master is preferred.<br>
<br>
On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-correctly-when-building-with-mingw3.patch | 20 +++++++++---=
-------<br>
&gt;=C2=A0 .../glib-2.0/glib-2.0/relocate-modules.patch=C2=A0 |=C2=A0 2 +-=
<br>
&gt;=C2=A0 ...{<a href=3D"http://glib-2.0_2.64.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">glib-2.0_2.64.5.bb</a> =3D&gt; <a href=3D"http://glib-2.0_2=
.66.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.1.bb</a>} |=C2=
=
=A0 2 +-<br>
&gt;=C2=A0 3 files changed, 12 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0_2=
.64.5.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.64.5.bb</a> =3D&g=
t; <a href=3D"http://glib-2.0_2.66.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">glib-2.0_2.66.1.bb</a>} (95%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machin=
e-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/gl=
ib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch<br>
&gt; index d075cd3f23..d6765b163b 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-corre=
ctly-when-building-with-mingw3.patch<br>
&gt; +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-corre=
ctly-when-building-with-mingw3.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From d3334e83ae0da9ca184eb9c8daf0854544ece023 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 13 Feb 2019 15:32:05 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Set host_machine correctly when building with =
mingw32<br>
&gt; @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt=
;<br>
&gt;=C2=A0 =C2=A04 files changed, 9 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gio/tests/meson.build b/gio/tests/meson.build<br>
&gt; -index dab65d2..e8bb2ee 100644<br>
&gt; +index 3a19c82..b762835 100644<br>
&gt;=C2=A0 --- a/gio/tests/meson.build<br>
&gt;=C2=A0 +++ b/gio/tests/meson.build<br>
&gt;=C2=A0 @@ -12,7 +12,7 @@ test_c_args =3D [<br>
&gt; @@ -26,7 +26,7 @@ index dab65d2..e8bb2ee 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0common_gio_tests_deps +=3D [iphlpapi_dep, winsock2=
, cc.find_library (&#39;secur32&#39;)]<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt; -@@ -132,7 +132,7 @@ else<br>
&gt; +@@ -133,7 +133,7 @@ else<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#=C2=A0 Test programs buildable on UNIX only<br>
&gt; @@ -35,7 +35,7 @@ index dab65d2..e8bb2ee 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0gio_tests +=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;file&#39; : {},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gdbus-peer&#39; : {<br>
&gt; -@@ -384,7 +384,7 @@ if host_machine.system() !=3D &#39;windows&#39;<=
br>
&gt; +@@ -385,7 +385,7 @@ if host_machine.system() !=3D &#39;windows&#39;<=
br>
&gt;=C2=A0 =C2=A0endif # unix<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#=C2=A0 Test programs buildable on Windows only<br>
&gt; @@ -44,7 +44,7 @@ index dab65d2..e8bb2ee 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0gio_tests +=3D {&#39;win32-streams&#39; : {}}<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt; -@@ -454,7 +454,7 @@ if cc.get_id() !=3D &#39;msvc&#39; and cc.get_id=
() !=3D &#39;clang-cl&#39;<br>
&gt; +@@ -455,7 +455,7 @@ if cc.get_id() !=3D &#39;msvc&#39; and cc.get_id=
() !=3D &#39;clang-cl&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt; @@ -54,10 +54,10 @@ index dab65d2..e8bb2ee 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gdbus-example-unix-fd-client&#39; : {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;install&#39; : false,<br>
&gt;=C2=A0 diff --git a/glib/tests/meson.build b/glib/tests/meson.build<br=
>
&gt; -index 3dedafc..94605e6 100644<br>
&gt; +index 6eb23e8..36eb919 100644<br>
&gt;=C2=A0 --- a/glib/tests/meson.build<br>
&gt;=C2=A0 +++ b/glib/tests/meson.build<br>
&gt; -@@ -134,7 +134,7 @@ if glib_conf.has(&#39;HAVE_EVENTFD&#39;)<br>
&gt; +@@ -137,7 +137,7 @@ if glib_conf.has(&#39;HAVE_EVENTFD&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt; @@ -67,7 +67,7 @@ index 3dedafc..94605e6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0glib_tests +=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gpoll&#39; : {<br>
&gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; -index e1b4b79..afb6eaa 100644<br>
&gt; +index 47f3a5c..7ea7ad1 100644<br>
&gt;=C2=A0 --- a/meson.build<br>
&gt;=C2=A0 +++ b/meson.build<br>
&gt;=C2=A0 @@ -32,6 +32,9 @@ else<br>
&gt; @@ -78,8 +78,8 @@ index e1b4b79..afb6eaa 100644<br>
&gt;=C2=A0 +=C2=A0 host_system =3D &#39;windows&#39;<br>
&gt;=C2=A0 +endif<br>
&gt;<br>
&gt; - glib_version =3D meson.project_version()<br>
&gt; - glib_api_version =3D &#39;2.0&#39;<br>
&gt; + if host_system =3D=3D &#39;darwin&#39;<br>
&gt; +=C2=A0 =C2=A0ios_test_code =3D &#39;&#39;&#39;#include &lt;TargetCon=
ditionals.h&gt;<br>
&gt;=C2=A0 diff --git a/tests/meson.build b/tests/meson.build<br>
&gt;=C2=A0 index 6741f8f..12fdc90 100644<br>
&gt;=C2=A0 --- a/tests/meson.build<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.pat=
ch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch<br>
&gt; index fe87482ae2..07e37acf7d 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch<br>
&gt; +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2a715765c6ceb2e8b4cc42e060aee75016111d1a Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 75c0423e1dc34fa20de70bc9932625fd0de4a912 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" =
target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 11 Mar 2016 15:35:55 +0000<br>
&gt;=C2=A0 Subject: [PATCH] glib-2.0: relocate the GIO module directory fo=
r native builds<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.=
64.5.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.64.5.bb</a> b/meta=
/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.1.bb" rel=3D"norefer=
rer" target=3D"_blank">glib-2.0_2.66.1.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.6=
4.5.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.64.5.bb</a><br>
&gt; rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.=
1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.1.bb</a><br>
&gt; index a30c5215be..52c7e42fbd 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.64.5.bb=
" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.64.5.bb</a><br>
&gt; +++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.1.bb=
" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.1.bb</a><br>
&gt; @@ -21,7 +21,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/=
glib-${PV}.tar.xz \<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; file://relocate-modules.=
patch&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;9cbd5bd2715ead1c28d53c46f7b7b6ff6166f58=
87b772c1a9e3bf2910cfecc11&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;a269ffe69fbcc3a21ff1acb1b6146b2a5723499=
d6e2de33ae16ccb6d2438ef60&quot;<br>
&gt;<br>
&gt;=C2=A0 # Find any meson cross files in FILESPATH that are relevant for=
 the current<br>
&gt;=C2=A0 # build (using siteinfo) and add them to EXTRA_OEMESON.<br>
&gt; --<br>
&gt; 2.29.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--00000000000027b3e205b2cc49cb--
