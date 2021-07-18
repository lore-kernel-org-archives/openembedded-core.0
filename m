Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.10417.1626569074175133536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jul 2021 17:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KyZrqVbL;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id j184so12880507qkd.6
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jul 2021 17:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hip65B7ARxBBM7cJP7nLkRyFh4gZrNDFjw3oGA4MWBw=;
        b=KyZrqVbLsAavYZhmieB6+cE5+LzVwUzYyLluwfP1Lik36jbVwgMA6aMu0HIfCT5o7M
         fbDm1nF2lu1NVuWT8zxwUCVZO688oV5faTunm84afbTCjq1roQm3+CFzZQ9zeJFWxVmx
         Dm5EaigUQp4Q9OREZnypLDn77b0IojLFUoVzNREtbXrMw4qRbGlVNTtQmmOIFUqMNSLu
         LJeLbJ8FxHtfvsTDaw0AERQTkek3qfrcjjI3m5imGc3gvE4Vawx+9vb1Sex2tDQ5XV2b
         4c1e8K0ywBpOnKqsf7pOmzspbwzXESaNRMl7j92BGmOVNig0sZ4mLwJr92fS3Iyl00hI
         cVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hip65B7ARxBBM7cJP7nLkRyFh4gZrNDFjw3oGA4MWBw=;
        b=pplPx9MBE0Y8XWbHbNriALP4W4VoTitnmifDLSVPMaNaUkcwouOVKWbP9/5rfa23S4
         KPoYMm1Y9nvAYvabY/rYbfL2tQvXx2iWpw506A6uS8WG87rtKwZjPSQRjDZpYMHXr/as
         T0khfaSi8V1WEfbceh3ElvuZhinslrgvmwyNdFjpQ+OrTcdtNmx40X+pe24YpEGMPGFp
         75iG/8mXIYkKW1ZA8hsJKrTTv1ZmdxbHLXIMZg/uuPpPRIx2PftYQZAOG1pmFauUtuzq
         yo4U+3Izkvvlwfw6NxmXNeoHat1RrN7i/Oh2wFWBX+Vqtloxb6etfmnDHJASaIgULYSW
         D3PA==
X-Gm-Message-State: AOAM533xStk9wx1h+UAtCE5qNNLgY1JupcpmxeuMjGm1JKH4QUqCjz9/
	vQrcPrI987oq0t8YT1DoOBA4Z6v3NQtDdedvHZQ=
X-Google-Smtp-Source: ABdhPJzQBAEkN25YYxeg1bjgzVKpvjUcAactdVwNu3OFsuB9wDhndQb4CCrfaI0DcAJ85Kq+TqGqwEiDN0hG1LMI5ew=
X-Received: by 2002:a05:620a:109a:: with SMTP id g26mr17787357qkk.25.1626569073263;
 Sat, 17 Jul 2021 17:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-5-alex.kanavin@gmail.com> <YPNgpxhGuSTD4MRR@piout.net>
In-Reply-To: <YPNgpxhGuSTD4MRR@piout.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 17 Jul 2021 17:44:07 -0700
Message-ID: <CAMKF1srti2+wBcUFXjGw9qg6DUP34T0+53ULyPku48-9_5VeAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/21] systemd: update 248.3 -> 249
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 17, 2021 at 3:58 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Alex,
>
> This patch does apply on master but the patch introduced by "systemd:
> Fix libseccomp testcase involving __NR_ppoll" needs to be refreshed, can
> you do that?

this patch is already upstream in 249 so you can drop it when upgrading to 249+

>
> On 14/07/2021 14:25:50+0200, Alexander Kanavin wrote:
> > jinja is now required:
> > https://github.com/systemd/systemd/commit/e0698c66f4569c91e3fdd54ca77449698ae38704
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...temd-boot_248.3.bb => systemd-boot_249.bb} |  2 +-
> >  meta/recipes-core/systemd/systemd.inc         |  4 +-
> >  ...tall-dependency-links-at-install-tim.patch | 38 +++++++++----------
> >  .../{systemd_248.3.bb => systemd_249.bb}      |  6 +--
> >  4 files changed, 25 insertions(+), 25 deletions(-)
> >  rename meta/recipes-core/systemd/{systemd-boot_248.3.bb => systemd-boot_249.bb} (98%)
> >  rename meta/recipes-core/systemd/{systemd_248.3.bb => systemd_249.bb} (99%)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-boot_248.3.bb b/meta/recipes-core/systemd/systemd-boot_249.bb
> > similarity index 98%
> > rename from meta/recipes-core/systemd/systemd-boot_248.3.bb
> > rename to meta/recipes-core/systemd/systemd-boot_249.bb
> > index 249e620f4e..2c0bec4eda 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_248.3.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_249.bb
> > @@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> >
> >  require conf/image-uefi.conf
> >
> > -DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
> > +DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native python3-jinja2-native"
> >
> >  inherit meson pkgconfig gettext
> >  inherit deploy
> > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> > index 0524a25008..79fb15f8fe 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
> >  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> >                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
> >
> > -SRCREV = "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
> > -SRCBRANCH = "v248-stable"
> > +SRCREV = "f6278558da0304ec6b646bb172ce4688c7f162a5"
> > +SRCBRANCH = "v249-stable"
> >  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
> >  "
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > index 8dd22eeb7b..d3af734e06 100644
> > --- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > @@ -1,4 +1,4 @@
> > -From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001
> > +From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:00 2001
> >  From: Chen Qi <Qi.Chen@windriver.com>
> >  Date: Thu, 21 Feb 2019 16:23:24 +0800
> >  Subject: [PATCH] binfmt: Don't install dependency links at install time for
> > @@ -25,11 +25,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> >   units/systemd-binfmt.service.in         | 4 ++++
> >   3 files changed, 9 insertions(+), 4 deletions(-)
> >
> > -Index: systemd-stable/units/meson.build
> > -===================================================================
> > ---- systemd-stable.orig/units/meson.build
> > -+++ systemd-stable/units/meson.build
> > -@@ -55,8 +55,7 @@ units = [
> > +diff --git a/units/meson.build b/units/meson.build
> > +index 17e9ead9c1..e5502be620 100644
> > +--- a/units/meson.build
> > ++++ b/units/meson.build
> > +@@ -59,8 +59,7 @@ units = [
> >           ['poweroff.target',                     '',
> >            (with_runlevels ? 'runlevel0.target' : '')],
> >           ['printer.target',                      ''],
> > @@ -39,9 +39,9 @@ Index: systemd-stable/units/meson.build
> >           ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
> >           ['reboot.target',                       '',
> >            'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
> > -@@ -166,8 +165,7 @@ in_units = [
> > -         ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
> > +@@ -178,8 +177,7 @@ in_units = [
> >           ['rescue.service',                       ''],
> > +         ['serial-getty@.service',                ''],
> >           ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
> >  -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
> >  -         'sysinit.target.wants/'],
> > @@ -49,21 +49,21 @@ Index: systemd-stable/units/meson.build
> >           ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
> >           ['systemd-boot-check-no-failures.service', ''],
> >           ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
> > -Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
> > -===================================================================
> > ---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
> > -+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
> > -@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
> > +diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
> > +index 172c8757ab..f65d8930c6 100644
> > +--- a/units/proc-sys-fs-binfmt_misc.automount
> > ++++ b/units/proc-sys-fs-binfmt_misc.automount
> > +@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=/proc/sys/
> >
> >   [Automount]
> >   Where=/proc/sys/fs/binfmt_misc
> >  +
> >  +[Install]
> >  +WantedBy=sysinit.target
> > -Index: systemd-stable/units/systemd-binfmt.service.in
> > -===================================================================
> > ---- systemd-stable.orig/units/systemd-binfmt.service.in
> > -+++ systemd-stable/units/systemd-binfmt.service.in
> > +diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
> > +index fdafce7ff7..4efc05e495 100644
> > +--- a/units/systemd-binfmt.service.in
> > ++++ b/units/systemd-binfmt.service.in
> >  @@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
> >   Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
> >   DefaultDependencies=no
> > @@ -73,8 +73,8 @@ Index: systemd-stable/units/systemd-binfmt.service.in
> >   After=proc-sys-fs-binfmt_misc.mount
> >   Before=sysinit.target shutdown.target
> >  @@ -30,3 +31,6 @@ RemainAfterExit=yes
> > - ExecStart=@rootlibexecdir@/systemd-binfmt
> > - ExecStop=@rootlibexecdir@/systemd-binfmt --unregister
> > + ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
> > + ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> >   TimeoutSec=90s
> >  +
> >  +[Install]
> > diff --git a/meta/recipes-core/systemd/systemd_248.3.bb b/meta/recipes-core/systemd/systemd_249.bb
> > similarity index 99%
> > rename from meta/recipes-core/systemd/systemd_248.3.bb
> > rename to meta/recipes-core/systemd/systemd_249.bb
> > index 37607708f7..9bfb12249c 100644
> > --- a/meta/recipes-core/systemd/systemd_248.3.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.bb
> > @@ -4,7 +4,7 @@ PROVIDES = "udev"
> >
> >  PE = "1"
> >
> > -DEPENDS = "intltool-native gperf-native libcap util-linux"
> > +DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
> >
> >  SECTION = "base/shell"
> >
> > @@ -14,8 +14,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
> >  # that we don't build both udev and systemd in world builds.
> >  REQUIRED_DISTRO_FEATURES = "systemd"
> >
> > -SRC_URI += " \
> > -           file://touchscreen.rules \
> > +SRC_URI += "file://touchscreen.rules \
> >             file://00-create-volatile.conf \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
> > @@ -686,6 +685,7 @@ FILES_udev += "${base_sbindir}/udevd \
> >                 ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
> >                 ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
> >                 ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
> > +               ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
> >                 ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
> >                 ${rootlibexecdir}/udev/rules.d/README \
> >                 ${sysconfdir}/udev \
> > --
> > 2.31.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> 
>
