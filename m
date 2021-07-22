Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.2089.1626982353095559126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k94WrJOo;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id az15so1507221vkb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQx0yfZ2ZKFCtW9/8gDDtOnLeckAoMPxVJ6K9X9LWQ4=;
        b=k94WrJOoKKlXfWOO0+SybYU+DlPMHZ18iFaE/MelMpooFqdOYtjhdpG3kAgntq1o96
         RapX02hKqk3EhsR28Zu5U0piZTS0vo6HKDsqzchsztXiw8Bjjcxf1sQJ/NXrI9q9flzB
         KzWgZhjWCzukppFnZESHigfXc+IyLrUvWXAbsEKKM6lXXWWy5FwP4Vz1X9uHJNo4LdG6
         de8HKwr4MHaeoAHT/j8RxGMCG/49PiTb1yNp7soUSZYTAZSPE7yO/TAbHIvO4/ltmlmt
         cK4IcIY3TarU0vVJ5YmAovuXldH+VFVbwtY5QZcvVir5v+UvLSXmG5PbEasXka4aWTIb
         kl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQx0yfZ2ZKFCtW9/8gDDtOnLeckAoMPxVJ6K9X9LWQ4=;
        b=duZ7y3cbCCvyCLlVPJTtHErs2JwezzDWhx7fTzP9VNR9vw6g/runUYmX+lC5rZgZ/+
         70Xqq1DoRtIWAhyHHpOkcThTFAj4Wu6I5fvQ9QEuxKp9ZoHe+a8tT6w/GVuCa136N6DJ
         q2L5wtj4mlNyoxaBOYYw99ZrIn8jUs/PkIFbTMTM0qen5iLoaWOXYVoMLp9D/S/hRie5
         E5UW3IvryXeaAdsno9ykSBj9DX7BMbh5qsGGwlhaawL+enRxBkSYbCQ/ORQmuM6q/rmJ
         q5OXkFt4MvwI0bx9hgqPX1hj0xWl9crEA895HYQGbYpR8CjVBTuNO0Y1xCiSWchuNQ9s
         GEig==
X-Gm-Message-State: AOAM531B+7aDpeSIjTcQ6HhVTd4epgGNZSmPTXK23ucKnvWJjJ+a6UIL
	IKSOwBA5cjW4PY0cLQt1PuTE0LHbHH8sVAhuMvo=
X-Google-Smtp-Source: ABdhPJwUT6EfBOZd3oUahsSEb8NB6IpoApKU/Bwjwbw223H1VdLC2WTlocIC0CuknfQy7INZAWM0hWWvVzrdGxmZp0s=
X-Received: by 2002:ac5:cd50:: with SMTP id n16mr1691992vkm.7.1626982352218;
 Thu, 22 Jul 2021 12:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-5-alex.kanavin@gmail.com> <YPNgpxhGuSTD4MRR@piout.net> <CAMKF1srti2+wBcUFXjGw9qg6DUP34T0+53ULyPku48-9_5VeAg@mail.gmail.com>
In-Reply-To: <CAMKF1srti2+wBcUFXjGw9qg6DUP34T0+53ULyPku48-9_5VeAg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 22 Jul 2021 21:32:20 +0200
Message-ID: <CANNYZj_YTdFa4zMXaRLov=q9NHEL74rAeANG6T9bpQBJXiej4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/21] systemd: update 248.3 -> 249
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000028eea205c7bb59db"

--00000000000028eea205c7bb59db
Content-Type: text/plain; charset="UTF-8"

I amended my commit, and will resend with the next upgrade batch.

Alex

On Sun, 18 Jul 2021 at 02:44, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Jul 17, 2021 at 3:58 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello Alex,
> >
> > This patch does apply on master but the patch introduced by "systemd:
> > Fix libseccomp testcase involving __NR_ppoll" needs to be refreshed, can
> > you do that?
>
> this patch is already upstream in 249 so you can drop it when upgrading to
> 249+
>
> >
> > On 14/07/2021 14:25:50+0200, Alexander Kanavin wrote:
> > > jinja is now required:
> > >
> https://github.com/systemd/systemd/commit/e0698c66f4569c91e3fdd54ca77449698ae38704
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...temd-boot_248.3.bb => systemd-boot_249.bb} |  2 +-
> > >  meta/recipes-core/systemd/systemd.inc         |  4 +-
> > >  ...tall-dependency-links-at-install-tim.patch | 38 +++++++++----------
> > >  .../{systemd_248.3.bb => systemd_249.bb}      |  6 +--
> > >  4 files changed, 25 insertions(+), 25 deletions(-)
> > >  rename meta/recipes-core/systemd/{systemd-boot_248.3.bb =>
> systemd-boot_249.bb} (98%)
> > >  rename meta/recipes-core/systemd/{systemd_248.3.bb => systemd_249.bb}
> (99%)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd-boot_248.3.bb
> b/meta/recipes-core/systemd/systemd-boot_249.bb
> > > similarity index 98%
> > > rename from meta/recipes-core/systemd/systemd-boot_248.3.bb
> > > rename to meta/recipes-core/systemd/systemd-boot_249.bb
> > > index 249e620f4e..2c0bec4eda 100644
> > > --- a/meta/recipes-core/systemd/systemd-boot_248.3.bb
> > > +++ b/meta/recipes-core/systemd/systemd-boot_249.bb
> > > @@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> > >
> > >  require conf/image-uefi.conf
> > >
> > > -DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
> > > +DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native
> python3-jinja2-native"
> > >
> > >  inherit meson pkgconfig gettext
> > >  inherit deploy
> > > diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> > > index 0524a25008..79fb15f8fe 100644
> > > --- a/meta/recipes-core/systemd/systemd.inc
> > > +++ b/meta/recipes-core/systemd/systemd.inc
> > > @@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
> > >  LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> > >
> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
> > >
> > > -SRCREV = "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
> > > -SRCBRANCH = "v248-stable"
> > > +SRCREV = "f6278558da0304ec6b646bb172ce4688c7f162a5"
> > > +SRCBRANCH = "v249-stable"
> > >  SRC_URI = "git://
> github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}
> <http://github.com/systemd/systemd-stable.git;protocol=git;branch=$%7BSRCBRANCH%7D>
> \
> > >  "
> > >
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > > index 8dd22eeb7b..d3af734e06 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > > @@ -1,4 +1,4 @@
> > > -From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001
> > > +From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Thu, 21 Feb 2019 16:23:24 +0800
> > >  Subject: [PATCH] binfmt: Don't install dependency links at install
> time for
> > > @@ -25,11 +25,11 @@ Signed-off-by: Scott Murray <
> scott.murray@konsulko.com>
> > >   units/systemd-binfmt.service.in         | 4 ++++
> > >   3 files changed, 9 insertions(+), 4 deletions(-)
> > >
> > > -Index: systemd-stable/units/meson.build
> > > -===================================================================
> > > ---- systemd-stable.orig/units/meson.build
> > > -+++ systemd-stable/units/meson.build
> > > -@@ -55,8 +55,7 @@ units = [
> > > +diff --git a/units/meson.build b/units/meson.build
> > > +index 17e9ead9c1..e5502be620 100644
> > > +--- a/units/meson.build
> > > ++++ b/units/meson.build
> > > +@@ -59,8 +59,7 @@ units = [
> > >           ['poweroff.target',                     '',
> > >            (with_runlevels ? 'runlevel0.target' : '')],
> > >           ['printer.target',                      ''],
> > > @@ -39,9 +39,9 @@ Index: systemd-stable/units/meson.build
> > >           ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
> > >           ['reboot.target',                       '',
> > >            'ctrl-alt-del.target' + (with_runlevels ? '
> runlevel6.target' : '')],
> > > -@@ -166,8 +165,7 @@ in_units = [
> > > -         ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
> > > +@@ -178,8 +177,7 @@ in_units = [
> > >           ['rescue.service',                       ''],
> > > +         ['serial-getty@.service',                ''],
> > >           ['systemd-backlight@.service',
>  'ENABLE_BACKLIGHT'],
> > >  -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
> > >  -         'sysinit.target.wants/'],
> > > @@ -49,21 +49,21 @@ Index: systemd-stable/units/meson.build
> > >           ['systemd-bless-boot.service',           'ENABLE_EFI
> HAVE_BLKID'],
> > >           ['systemd-boot-check-no-failures.service', ''],
> > >           ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
> > > -Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
> > > -===================================================================
> > > ---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
> > > -+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
> > > -@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
> > > +diff --git a/units/proc-sys-fs-binfmt_misc.automount
> b/units/proc-sys-fs-binfmt_misc.automount
> > > +index 172c8757ab..f65d8930c6 100644
> > > +--- a/units/proc-sys-fs-binfmt_misc.automount
> > > ++++ b/units/proc-sys-fs-binfmt_misc.automount
> > > +@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=/proc/sys/
> > >
> > >   [Automount]
> > >   Where=/proc/sys/fs/binfmt_misc
> > >  +
> > >  +[Install]
> > >  +WantedBy=sysinit.target
> > > -Index: systemd-stable/units/systemd-binfmt.service.in
> > > -===================================================================
> > > ---- systemd-stable.orig/units/systemd-binfmt.service.in
> > > -+++ systemd-stable/units/systemd-binfmt.service.in
> > > +diff --git a/units/systemd-binfmt.service.in b/units/
> systemd-binfmt.service.in
> > > +index fdafce7ff7..4efc05e495 100644
> > > +--- a/units/systemd-binfmt.service.in
> > > ++++ b/units/systemd-binfmt.service.in
> > >  @@ -14,6 +14,7 @@ Documentation=
> https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
> > >   Documentation=
> https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
> > >   DefaultDependencies=no
> > > @@ -73,8 +73,8 @@ Index: systemd-stable/units/
> systemd-binfmt.service.in
> > >   After=proc-sys-fs-binfmt_misc.mount
> > >   Before=sysinit.target shutdown.target
> > >  @@ -30,3 +31,6 @@ RemainAfterExit=yes
> > > - ExecStart=@rootlibexecdir@/systemd-binfmt
> > > - ExecStop=@rootlibexecdir@/systemd-binfmt --unregister
> > > + ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
> > > + ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> > >   TimeoutSec=90s
> > >  +
> > >  +[Install]
> > > diff --git a/meta/recipes-core/systemd/systemd_248.3.bb
> b/meta/recipes-core/systemd/systemd_249.bb
> > > similarity index 99%
> > > rename from meta/recipes-core/systemd/systemd_248.3.bb
> > > rename to meta/recipes-core/systemd/systemd_249.bb
> > > index 37607708f7..9bfb12249c 100644
> > > --- a/meta/recipes-core/systemd/systemd_248.3.bb
> > > +++ b/meta/recipes-core/systemd/systemd_249.bb
> > > @@ -4,7 +4,7 @@ PROVIDES = "udev"
> > >
> > >  PE = "1"
> > >
> > > -DEPENDS = "intltool-native gperf-native libcap util-linux"
> > > +DEPENDS = "intltool-native gperf-native libcap util-linux
> python3-jinja2-native"
> > >
> > >  SECTION = "base/shell"
> > >
> > > @@ -14,8 +14,7 @@ inherit useradd pkgconfig meson perlnative
> update-rc.d update-alternatives qemu
> > >  # that we don't build both udev and systemd in world builds.
> > >  REQUIRED_DISTRO_FEATURES = "systemd"
> > >
> > > -SRC_URI += " \
> > > -           file://touchscreen.rules \
> > > +SRC_URI += "file://touchscreen.rules \
> > >             file://00-create-volatile.conf \
> > >             ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback',
> 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
> > >             ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '',
> d)} \
> > > @@ -686,6 +685,7 @@ FILES_udev += "${base_sbindir}/udevd \
> > >                 ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules
> \
> > > +               ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/README \
> > >                 ${sysconfdir}/udev \
> > > --
> > > 2.31.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> > 
> >
>

--00000000000028eea205c7bb59db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I amended my commit, and will resend with the next up=
grade batch.</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 18 Jul 2021 at =
02:44, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Sat, Jul 17, 2021 at 3:58 PM Alexandre Belloni<br>
&lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">ale=
xandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Alex,<br>
&gt;<br>
&gt; This patch does apply on master but the patch introduced by &quot;sys=
temd:<br>
&gt; Fix libseccomp testcase involving __NR_ppoll&quot; needs to be refres=
hed, can<br>
&gt; you do that?<br>
<br>
this patch is already upstream in 249 so you can drop it when upgrading to=
 249+<br>
<br>
&gt;<br>
&gt; On 14/07/2021 14:25:50+0200, Alexander Kanavin wrote:<br>
&gt; &gt; jinja is now required:<br>
&gt; &gt; <a href=3D"https://github.com/systemd/systemd/commit/e0698c66f45=
69c91e3fdd54ca77449698ae38704" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/systemd/systemd/commit/e0698c66f4569c91e3fdd54ca77449698ae38704=
</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://temd-boot_248.3.bb" rel=3D"noreferrer=
" target=3D"_blank">temd-boot_248.3.bb</a> =3D&gt; <a href=3D"http://system=
d-boot_249.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.bb</a>=
} |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; &gt;=C2=A0 ...tall-dependency-links-at-install-tim.patch | 38 +++++++=
++----------<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://systemd_248.3.bb" rel=3D"noreferrer=
" target=3D"_blank">systemd_248.3.bb</a> =3D&gt; <a href=3D"http://systemd_=
249.bb" rel=3D"noreferrer" target=3D"_blank">systemd_249.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 +--<br>
&gt; &gt;=C2=A0 4 files changed, 25 insertions(+), 25 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://system=
d-boot_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb=
</a> =3D&gt; <a href=3D"http://systemd-boot_249.bb" rel=3D"noreferrer" targ=
et=3D"_blank">systemd-boot_249.bb</a>} (98%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://system=
d_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a> =3D&g=
t; <a href=3D"http://systemd_249.bb" rel=3D"noreferrer" target=3D"_blank">s=
ystemd_249.bb</a>} (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd=
-boot_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb<=
/a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-boot_249.bb</a><br>
&gt; &gt; similarity index 98%<br>
&gt; &gt; rename from meta/recipes-core/systemd/<a href=3D"http://systemd-=
boot_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</=
a><br>
&gt; &gt; rename to meta/recipes-core/systemd/<a href=3D"http://systemd-bo=
ot_249.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.bb</a><br>
&gt; &gt; index 249e620f4e..2c0bec4eda 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_2=
48.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_2=
49.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.bb</a><br>
&gt; &gt; @@ -3,7 +3,7 @@ FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/syste=
md:&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 require conf/image-uefi.conf<br>
&gt; &gt;<br>
&gt; &gt; -DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gpe=
rf-native&quot;<br>
&gt; &gt; +DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gpe=
rf-native python3-jinja2-native&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit meson pkgconfig gettext<br>
&gt; &gt;=C2=A0 inherit deploy<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipe=
s-core/systemd/systemd.inc<br>
&gt; &gt; index 0524a25008..79fb15f8fe 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd.inc<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd.inc<br>
&gt; &gt; @@ -14,8 +14,8 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<b=
r>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D75141=
9260aa954499f7abaabaa882bbe \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516=
c&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV =3D &quot;37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76&quot;=
<br>
&gt; &gt; -SRCBRANCH =3D &quot;v248-stable&quot;<br>
&gt; &gt; +SRCREV =3D &quot;f6278558da0304ec6b646bb172ce4688c7f162a5&quot;=
<br>
&gt; &gt; +SRCBRANCH =3D &quot;v249-stable&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/syste=
md/systemd-stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"nore=
ferrer" target=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3D=
git;branch=3D${SRCBRANCH}</a> \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t=
-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/=
systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch<br>
&gt; &gt; index 8dd22eeb7b..d3af734e06 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-instal=
l-dependency-links-at-install-tim.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-instal=
l-dependency-links-at-install-tim.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Thu, 21 Feb 2019 16:23:24 +0800<br>
&gt; &gt;=C2=A0 Subject: [PATCH] binfmt: Don&#39;t install dependency link=
s at install time for<br>
&gt; &gt; @@ -25,11 +25,11 @@ Signed-off-by: Scott Murray &lt;<a href=3D"m=
ailto:scott.murray@konsulko.com" target=3D"_blank">scott.murray@konsulko.co=
m</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0units/<a href=3D"http://systemd-binfmt.service.in" r=
el=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt; &gt;=C2=A0 =C2=A03 files changed, 9 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; -Index: systemd-stable/units/meson.build<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- systemd-stable.orig/units/meson.build<br>
&gt; &gt; -+++ systemd-stable/units/meson.build<br>
&gt; &gt; -@@ -55,8 +55,7 @@ units =3D [<br>
&gt; &gt; +diff --git a/units/meson.build b/units/meson.build<br>
&gt; &gt; +index 17e9ead9c1..e5502be620 100644<br>
&gt; &gt; +--- a/units/meson.build<br>
&gt; &gt; ++++ b/units/meson.build<br>
&gt; &gt; +@@ -59,8 +59,7 @@ units =3D [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;poweroff.target&#3=
9;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (with_runlevels ? &#39;=
runlevel0.target&#39; : &#39;&#39;)],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;printer.target&#39=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 &#39;&#39;],<br>
&gt; &gt; @@ -39,9 +39,9 @@ Index: systemd-stable/units/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;proc-sys-fs-binfmt=
_misc.mount&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_BINFMT&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;reboot.target&#39;=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ctrl-alt-del.targe=
t&#39; + (with_runlevels ? &#39; runlevel6.target&#39; : &#39;&#39;)],<br>
&gt; &gt; -@@ -166,8 +165,7 @@ in_units =3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;rc-local.service&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;HAVE_SYSV_COMPAT&#39;],<br>
&gt; &gt; +@@ -178,8 +177,7 @@ in_units =3D [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;rescue.service&#39=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&#39;&#39;],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;serial-getty@.service&#=
39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;],<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;systemd-backlight@=
.service&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_BACKLIGH=
T&#39;],<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;systemd-binfmt.service&=
#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_BIN=
FMT&#39;,<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sysinit.target.wan=
ts/&#39;],<br>
&gt; &gt; @@ -49,21 +49,21 @@ Index: systemd-stable/units/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;systemd-bless-boot=
.service&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_EFI HAVE=
_BLKID&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;systemd-boot-check=
-no-failures.service&#39;, &#39;&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;systemd-coredump@.=
service&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ENABLE_COREDUMP=
&#39;],<br>
&gt; &gt; -Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount<b=
r>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount=
<br>
&gt; &gt; -+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount<br>
&gt; &gt; -@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=3D/proc/sys/<br>
&gt; &gt; +diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/pr=
oc-sys-fs-binfmt_misc.automount<br>
&gt; &gt; +index 172c8757ab..f65d8930c6 100644<br>
&gt; &gt; +--- a/units/proc-sys-fs-binfmt_misc.automount<br>
&gt; &gt; ++++ b/units/proc-sys-fs-binfmt_misc.automount<br>
&gt; &gt; +@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=3D/proc/sys/<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0[Automount]<br>
&gt; &gt;=C2=A0 =C2=A0Where=3D/proc/sys/fs/binfmt_misc<br>
&gt; &gt;=C2=A0 +<br>
&gt; &gt;=C2=A0 +[Install]<br>
&gt; &gt;=C2=A0 +WantedBy=3Dsysinit.target<br>
&gt; &gt; -Index: systemd-stable/units/<a href=3D"http://systemd-binfmt.se=
rvice.in" rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a=
><br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- systemd-stable.orig/units/<a href=3D"http://systemd-binfmt.=
service.in" rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in<=
/a><br>
&gt; &gt; -+++ systemd-stable/units/<a href=3D"http://systemd-binfmt.servi=
ce.in" rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a><b=
r>
&gt; &gt; +diff --git a/units/<a href=3D"http://systemd-binfmt.service.in"=
 rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a> b/units=
/<a href=3D"http://systemd-binfmt.service.in" rel=3D"noreferrer" target=3D"=
_blank">systemd-binfmt.service.in</a><br>
&gt; &gt; +index fdafce7ff7..4efc05e495 100644<br>
&gt; &gt; +--- a/units/<a href=3D"http://systemd-binfmt.service.in" rel=3D=
"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a><br>
&gt; &gt; ++++ b/units/<a href=3D"http://systemd-binfmt.service.in" rel=3D=
"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a><br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@ Documentation=3D<a href=3D"https://www.k=
ernel.org/doc/html/latest/admin-guide/binfmt-misc.htm" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.kernel.org/doc/html/latest/admin-guide/binfmt-=
misc.htm</a><br>
&gt; &gt;=C2=A0 =C2=A0Documentation=3D<a href=3D"https://www.freedesktop.o=
rg/wiki/Software/systemd/APIFileSystems" rel=3D"noreferrer" target=3D"_blan=
k">https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems</a><br>
&gt; &gt;=C2=A0 =C2=A0DefaultDependencies=3Dno<br>
&gt; &gt; @@ -73,8 +73,8 @@ Index: systemd-stable/units/<a href=3D"http://=
systemd-binfmt.service.in" rel=3D"noreferrer" target=3D"_blank">systemd-bin=
fmt.service.in</a><br>
&gt; &gt;=C2=A0 =C2=A0After=3Dproc-sys-fs-binfmt_misc.mount<br>
&gt; &gt;=C2=A0 =C2=A0Before=3Dsysinit.target shutdown.target<br>
&gt; &gt;=C2=A0 @@ -30,3 +31,6 @@ RemainAfterExit=3Dyes<br>
&gt; &gt; - ExecStart=3D@rootlibexecdir@/systemd-binfmt<br>
&gt; &gt; - ExecStop=3D@rootlibexecdir@/systemd-binfmt --unregister<br>
&gt; &gt; + ExecStart=3D{{ROOTLIBEXECDIR}}/systemd-binfmt<br>
&gt; &gt; + ExecStop=3D{{ROOTLIBEXECDIR}}/systemd-binfmt --unregister<br>
&gt; &gt;=C2=A0 =C2=A0TimeoutSec=3D90s<br>
&gt; &gt;=C2=A0 +<br>
&gt; &gt;=C2=A0 +[Install]<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd=
_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd_249.bb" rel=3D"noreferrer" =
target=3D"_blank">systemd_249.bb</a><br>
&gt; &gt; similarity index 99%<br>
&gt; &gt; rename from meta/recipes-core/systemd/<a href=3D"http://systemd_=
248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a><br>
&gt; &gt; rename to meta/recipes-core/systemd/<a href=3D"http://systemd_24=
9.bb" rel=3D"noreferrer" target=3D"_blank">systemd_249.bb</a><br>
&gt; &gt; index 37607708f7..9bfb12249c 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_248.3.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_249.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd_249.bb</a><br>
&gt; &gt; @@ -4,7 +4,7 @@ PROVIDES =3D &quot;udev&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt; &gt;<br>
&gt; &gt; -DEPENDS =3D &quot;intltool-native gperf-native libcap util-linu=
x&quot;<br>
&gt; &gt; +DEPENDS =3D &quot;intltool-native gperf-native libcap util-linu=
x python3-jinja2-native&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SECTION =3D &quot;base/shell&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -14,8 +14,7 @@ inherit useradd pkgconfig meson perlnative upd=
ate-rc.d update-alternatives qemu<br>
&gt; &gt;=C2=A0 # that we don&#39;t build both udev and systemd in world b=
uilds.<br>
&gt; &gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI +=3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://touchscreen.rul=
es \<br>
&gt; &gt; +SRC_URI +=3D &quot;file://touchscreen.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00-create-=
volatile.conf \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;file=
://org.freedesktop.hostname1_no_polkit.conf&#39;, &#39;&#39;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;file=
://00-hostnamed-network-user.conf&#39;, &#39;&#39;, d)} \<br>
&gt; &gt; @@ -686,6 +685,7 @@ FILES_udev +=3D &quot;${base_sbindir}/udevd =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/78-sound-card.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/80-drivers.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/80-net-setup-link.rules \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootli=
bexecdir}/udev/rules.d/81-net-dhcp.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/90-vconsole.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/README \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${s=
ysconfdir}/udev \<br>
&gt; &gt; --<br>
&gt; &gt; 2.31.1<br>
&gt; &gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">=
https://bootlin.com</a><br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--00000000000028eea205c7bb59db--
