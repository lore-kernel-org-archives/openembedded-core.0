Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4B5C46CD4
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 03:20:15 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.117029.1703733613248263085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 19:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=heMQlag3;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-203fbbff863so2463806fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 19:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703733612; x=1704338412; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oskwl7ohEJkZfovO5EjFmfsbFmpor+mN6gPWqy7wW5A=;
        b=heMQlag3GBRMsIl2AZYvP3wzwtlSl2EWM7tF21k2qf9WU3X7mcW5JFkpn+d4ioEeLs
         KftxvHPyoVe22hyBiUIiSgWt4GiEA7PM7WgMu+mAcuxNNG2ZIqBTjUNhhrfIxvzKB1RJ
         galfpTgnw6m57w3vr0g7RCeeGYH4FECzqwxNl0guzHOKz48+GpHmXISPL0GU4qaT1CTc
         IE0V1+vFxcuKSz4PT8IM4WrbIwzQdbFMAc/qFTY+jCLtZA6CsHyUKZufZobadT8jONp7
         SPj14Wn9DbR0syWtKhZqi2qQaLQR3Bx98ju8ppO10h/1dE3JTyT2XomwDiDtrAXRp6Wj
         3efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703733612; x=1704338412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oskwl7ohEJkZfovO5EjFmfsbFmpor+mN6gPWqy7wW5A=;
        b=S5eplK95BqQC2TnxLGbSbORlylq1YqD+20aZA2CGQc6KZsspv31lzBHD0J2+dGRXOi
         bgJa3yAxgnbK6UOUUarH3Dp6A7khqyreh1zupPsZxfO3uYdf0X+5NqN5PO7+lwGTTY0A
         DmSgGI+AN4zQ481T4P1FN+r9lrZuncj6sQ6nf2QwpnE+WjuskDmnkViMmiFuk/iTP6ix
         9fkD3Y1v56TM0bafY41p/93KusPXL6ySJVdJYhp+WJl+lC4AS9/ZfmBylH66XLfoMdRe
         Qzpu8sH8+Vha4v70emRbprmPmP6g3r6w9hSFgMveAVG25C4VMlggd0yQVF31j42ce2kt
         W61A==
X-Gm-Message-State: AOJu0Yyu+ZbfkpUKTvH9CSvuI458WTgIoeP/WJLYyVyoxq45ZDv7M66R
	qDK2cfH73tEsEvAPE906nX2ng+VAtmrYUuLcUByRTBFj
X-Google-Smtp-Source: AGHT+IG1edve7Q38GIKcTpNahodQdbgtaKE5dwr3iTPewv2qYJQ+rp81l7Wrx89v+IS75TyO2piOyGZTAoRxMvKlnDE=
X-Received: by 2002:a05:6871:589:b0:203:bd0a:d376 with SMTP id
 u9-20020a056871058900b00203bd0ad376mr4139823oan.36.1703733612218; Wed, 27 Dec
 2023 19:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2023122711592084d34620@mail.local> <CO6PR11MB560279EC2354AEBC89D8E15FED9EA@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560279EC2354AEBC89D8E15FED9EA@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Dec 2023 19:19:46 -0800
Message-ID: <CAMKF1spSLhK=Z3XPui40JLfyUZiyRDr9V60+8OGOZ4caWBvUeg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
To: Qi.Chen@windriver.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 03:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192971

Please do a musl build too. We might have some patch conflicts to address.

On Wed, Dec 27, 2023 at 7:00=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> I double checked it in my environment, setting INIT_MANAGER to "systemd" =
and then 'bitbake systemd' will not generate this warning. In this case ROO=
T_HOME's value is "/root".
> I checked https://autobuilder.yoctoproject.org/typhoon/#/builders/40/buil=
ds/8354, but I couldn't find the configuration items that set the init mana=
ger to systemd.
> Does the build use the variable 'INIT_MANAGER'? Does it set ROOT_HOME to =
"/home/root" somewhere?
>
> Regards,
> Qi
>
> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Wednesday, December 27, 2023 7:59 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
>
> We hit the added warning on the autobuilders:
>
> WARNING: systemd-1_255.1-r0 do_install: Using /home/root as root user's h=
ome directory is not fully supported by systemd
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8354/st=
eps/14/logs/warnings
>
> On 27/12/2023 12:20:34+0800, Chen Qi via lists.openembedded.org wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > 1. Patch changes:
> >
> > 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> > is removed because it has no real effect now. The /lib is now /usr/lib
> > because 'usrmerge' is a required distro feature for systemd.
> >
> > 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
> > refreshed for the new version to avoid patch-fuzz issue.
> >
> > 2. root user's home directory now defaults to "/root":
> >
> > The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
> > value, so if users set ROOT_HOME to "/home/root", the behavior is the
> > same as before. However, this is only for backward compatibility. With
> > this patch, The ROOT_HOME value is set to "/root" in init-manager-syste=
md.inc.
> > This is because systemd's source codes are hardcoding "/root", and
> > other values are not officially supported. See the list below.
> > $ grep -rl '"/root"' src/ | grep -v 'src/test'
> > src/core/namespace.c
> > src/basic/user-util.c
> > src/nss-systemd/nss-systemd.c
> > src/nspawn/nspawn.c
> > src/firstboot/firstboot.c
> > src/shared/userdb.c
> > src/shared/user-record.c
> > $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/
> > tmpfiles.d/ units/ xorg/ tools/ sysusers.d/basic.conf.in
> > tmpfiles.d/provision.conf units/emergency.service.in
> > units/rescue.service.in tools/list-discoverable-partitions.py
> > Previously, the recipe was just substituting sysusers.d/basic.conf.in,
> > which is not enough to be treated as 'fully support'. I deliberately
> > put a warning message in do_install to warn users about non "/root"
> > ROOT_HOME value. Don't remove it until all above places are handled.
> >
> > 3. cgroupv2 is now the default.
> > cgroupv2 is the default for systemd for many years and it's the
> > default for distros such as ubuntu and fedora. Let's also use it as the=
 default.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../distro/include/init-manager-systemd.inc   |  2 +
> >  meta/recipes-core/systemd/systemd.inc         |  4 +-
> >  ...tall-dependency-links-at-install-tim.patch | 22 +++---
> > ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
> >  .../systemd/systemd/basic.conf.in             | 40 ----------
> >  .../{systemd_254.4.bb =3D> systemd_255.1.bb}    | 16 ++--
> >  6 files changed, 25 insertions(+), 132 deletions(-)  delete mode
> > 100644
> > meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt
> > .d-modules-load.d-to-.patch  delete mode 100644
> > meta/recipes-core/systemd/systemd/basic.conf.in
> >  rename meta/recipes-core/systemd/{systemd_254.4.bb =3D>
> > systemd_255.1.bb} (98%)
> >
> > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> > b/meta/conf/distro/include/init-manager-systemd.inc
> > index 595d1f2644..0a76647459 100644
> > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
> >  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> > +# systemd hardcodes /root in its source codes, other values are not
> > +offically supported ROOT_HOME ?=3D "/root"
> > diff --git a/meta/recipes-core/systemd/systemd.inc
> > b/meta/recipes-core/systemd/systemd.inc
> > index ccc3236457..1417e0150f 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7aba=
abaa882bbe \
> >                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
> >
> > -SRCREV =3D "2e7504449a51fb38db9cd2da391c6434f82def51"
> > -SRCBRANCH =3D "v254-stable"
> > +SRCREV =3D "2018ccef6645ce00c784369a22dc4e98f6d7061d"
> > +SRCBRANCH =3D "v255-stable"
> >  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dht=
tps;branch=3D${SRCBRANCH}"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git
> > a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
> > cy-links-at-install-tim.patch
> > b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
> > cy-links-at-install-tim.patch
> > index 085f1e9052..be231cf6b2 100644
> > ---
> > a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
> > cy-links-at-install-tim.patch
> > +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depe
> > +++ ndency-links-at-install-tim.patch
> > @@ -1,8 +1,8 @@
> > -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00
> > 2001
> > +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00
> > +2001
> >  From: Chen Qi <Qi.Chen@windriver.com>
> >  Date: Thu, 21 Feb 2019 16:23:24 +0800
> > -Subject: [PATCH] binfmt: Don't install dependency links at install
> > time for
> > - the binfmt services
> > +Subject: [PATCH 1/2] binfmt: Don't install dependency links at
> > +install time  for the binfmt services
> >
> >  use [Install] blocks so that they get created when the service is
> > enabled  like a traditional service.
> > @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
> >   3 files changed, 7 insertions(+), 2 deletions(-)
> >
> >  diff --git a/units/meson.build b/units/meson.build -index
> > c7939a10f8..219570ab19 100644
> > +index e7bfb7f838..1d5ec4b178 100644
> >  --- a/units/meson.build
> >  +++ b/units/meson.build
> > -@@ -149,7 +149,6 @@ units =3D [
> > +@@ -154,7 +154,6 @@ units =3D [
> >           {
> >             'file' : 'proc-sys-fs-binfmt_misc.automount',
> >             'conditions' : ['ENABLE_BINFMT'], @@ -36,7 +36,7 @@ index
> > c7939a10f8..219570ab19 100644
> >           },
> >           {
> >             'file' : 'proc-sys-fs-binfmt_misc.mount', -@@ -246,7
> > +245,6 @@ units =3D [
> > +@@ -251,7 +250,6 @@ units =3D [
> >           {
> >             'file' : 'systemd-binfmt.service.in',
> >             'conditions' : ['ENABLE_BINFMT'], @@ -45,7 +45,7 @@ index
> > c7939a10f8..219570ab19 100644
> >           {
> >             'file' : 'systemd-bless-boot.service.in',  diff --git
> > a/units/proc-sys-fs-binfmt_misc.automount
> > b/units/proc-sys-fs-binfmt_misc.automount
> > -index 6b1bbdc91e..5ec5b8670a 100644
> > +index 5d212015a5..6c2900ca77 100644
> >  --- a/units/proc-sys-fs-binfmt_misc.automount
> >  +++ b/units/proc-sys-fs-binfmt_misc.automount
> >  @@ -22,3 +22,6 @@ Before=3Dshutdown.target @@ -56,7 +56,7 @@ index
> > 6b1bbdc91e..5ec5b8670a 100644  +[Install]  +WantedBy=3Dsysinit.target
> > diff --git a/units/systemd-binfmt.service.in
> > b/units/systemd-binfmt.service.in -index b04412e037..63f116e4fa 100644
> > +index 6861c76674..531e9fbd90 100644
> >  --- a/units/systemd-binfmt.service.in  +++
> > b/units/systemd-binfmt.service.in  @@ -14,6 +14,7 @@
> > Documentation=3Dhttps://docs.kernel.org/admin-guide/binfmt-misc.html
> > @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
> >   After=3Dproc-sys-fs-binfmt_misc.mount
> >   After=3Dlocal-fs.target
> >  @@ -31,3 +32,6 @@ RemainAfterExit=3Dyes
> > - ExecStart=3D{{ROOTLIBEXECDIR}}/systemd-binfmt
> > - ExecStop=3D{{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> > + ExecStart=3D{{LIBEXECDIR}}/systemd-binfmt
> > + ExecStop=3D{{LIBEXECDIR}}/systemd-binfmt --unregister
> >   TimeoutSec=3D90s
> >  +
> >  +[Install]
> >  +WantedBy=3Dsysinit.target
> >  --
> > -2.39.2
> > +2.34.1
> >
> > diff --git
> > a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> > mt.d-modules-load.d-to-.patch
> > b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> > mt.d-modules-load.d-to-.patch
> > deleted file mode 100644
> > index 98914ae154..0000000000
> > ---
> > a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> > mt.d-modules-load.d-to-.patch
> > +++ /dev/null
> > @@ -1,73 +0,0 @@
> > -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00
> > 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 29 Sep 2020 18:01:41 -0700
> > -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to
> > /usr
> > -
> > -These directories are moved to /lib since systemd v246, commit
> > -4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
> > -the old /usr/lib is still being used.
> > -
> > -Upstream-Status: Inappropriate (OE-specific)
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> > ----
> > - src/core/systemd.pc.in           | 8 ++++----
> > - src/libsystemd/sd-path/sd-path.c | 8 ++++----
> > - 2 files changed, 8 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in -index
> > 693433b34b..8368a3ff02 100644
> > ---- a/src/core/systemd.pc.in
> > -+++ b/src/core/systemd.pc.in
> > -@@ -67,16 +67,16 @@ tmpfilesdir=3D${tmpfiles_dir}
> > -
> > - user_tmpfiles_dir=3D${prefix}/share/user-tmpfiles.d
> > -
> > --sysusers_dir=3D${rootprefix}/lib/sysusers.d
> > -+sysusers_dir=3D${prefix}/lib/sysusers.d
> > - sysusersdir=3D${sysusers_dir}
> > -
> > --sysctl_dir=3D${rootprefix}/lib/sysctl.d
> > -+sysctl_dir=3D${prefix}/lib/sysctl.d
> > - sysctldir=3D${sysctl_dir}
> > -
> > --binfmt_dir=3D${rootprefix}/lib/binfmt.d
> > -+binfmt_dir=3D${prefix}/lib/binfmt.d
> > - binfmtdir=3D${binfmt_dir}
> > -
> > --modules_load_dir=3D${rootprefix}/lib/modules-load.d
> > -+modules_load_dir=3D${prefix}/lib/modules-load.d
> > - modulesloaddir=3D${modules_load_dir}
> > -
> > - catalog_dir=3D${prefix}/lib/systemd/catalog
> > -diff --git a/src/libsystemd/sd-path/sd-path.c
> > b/src/libsystemd/sd-path/sd-path.c
> > -index 1af3a36d1d..def502b717 100644
> > ---- a/src/libsystemd/sd-path/sd-path.c
> > -+++ b/src/libsystemd/sd-path/sd-path.c
> > -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer=
, const char **ret) {
> > -                 return 0;
> > -
> > -         case SD_PATH_SYSUSERS:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/sysusers.d";
> > -+                *ret =3D "/usr/lib/sysusers.d";
> > -                 return 0;
> > -
> > -         case SD_PATH_SYSCTL:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/sysctl.d";
> > -+                *ret =3D "/usr/lib/sysctl.d";
> > -                 return 0;
> > -
> > -         case SD_PATH_BINFMT:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/binfmt.d";
> > -+                *ret =3D "/usr/lib/binfmt.d";
> > -                 return 0;
> > -
> > -         case SD_PATH_MODULES_LOAD:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/modules-load.d";
> > -+                *ret =3D "/usr/lib/modules-load.d";
> > -                 return 0;
> > -
> > -         case SD_PATH_CATALOG:
> > ---
> > -2.39.2
> > -
> > diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in
> > b/meta/recipes-core/systemd/systemd/basic.conf.in
> > deleted file mode 100644
> > index fac288f7fa..0000000000
> > --- a/meta/recipes-core/systemd/systemd/basic.conf.in
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -#  This file is part of systemd.
> > -#
> > -#  systemd is free software; you can redistribute it and/or modify it
> > -#  under the terms of the GNU Lesser General Public License as
> > published by -#  the Free Software Foundation; either version 2.1 of
> > the License, or -#  (at your option) any later version.
> > -
> > -# The superuser
> > -u root    0     "root" :ROOT_HOME:
> > -
> > -# The nobody user/group for NFS file systems
> > -g {{NOBODY_GROUP_NAME}} 65534       -            -
> > -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
> > -
> > -# Administrator group: can *see* more than normal users
> > -g adm     {{ADM_GID    }}     -            -
> > -
> > -# Administrator group: can *do* more than normal users
> > -g wheel   {{WHEEL_GID  }}     -            -
> > -
> > -# Access to shared database of users on the system
> > -g utmp    {{UTMP_GID   }}     -            -
> > -
> > -# Physical and virtual hardware access groups
> > -g audio   {{AUDIO_GID  }}     -            -
> > -g cdrom   {{CDROM_GID  }}     -            -
> > -g dialout {{DIALOUT_GID}}     -            -
> > -g disk    {{DISK_GID   }}     -            -
> > -g input   {{INPUT_GID  }}     -            -
> > -g kmem    {{KMEM_GID   }}     -            -
> > -g kvm     {{KVM_GID    }}     -            -
> > -g lp      {{LP_GID     }}     -            -
> > -g render  {{RENDER_GID }}     -            -
> > -g sgx     {{SGX_GID    }}     -            -
> > -g tape    {{TAPE_GID   }}     -            -
> > -g tty     {{TTY_GID    }}     -            -
> > -g video   {{VIDEO_GID  }}     -            -
> > -
> > -# Default group for normal users
> > -g users   {{USERS_GID  }}     -            -
> > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > b/meta/recipes-core/systemd/systemd_255.1.bb
> > similarity index 98%
> > rename from meta/recipes-core/systemd/systemd_254.4.bb
> > rename to meta/recipes-core/systemd/systemd_255.1.bb
> > index 0c12926bef..daa3a01fef 100644
> > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> > @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
> >  SRC_URI +=3D " \
> >             file://touchscreen.rules \
> >             file://00-create-volatile.conf \
> > -           file://basic.conf.in \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fal=
lback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fal=
lback', 'file://00-hostnamed-network-user.conf', '', d)} \
> >             file://init \
> > @@ -29,7 +28,6 @@ SRC_URI +=3D " \
> >             file://systemd-pager.sh \
> >             file://0002-binfmt-Don-t-install-dependency-links-at-instal=
l-tim.patch \
> >             file://0008-implment-systemd-sysv-install-for-OE.patch \
> > -           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.=
d-to-.patch \
> >             "
> >
> >  # patches needed by musl
> > @@ -73,6 +71,7 @@ PACKAGECONFIG ??=3D " \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev=
-shared', d)} \
> >      backlight \
> >      binfmt \
> > +    cgroupv2 \
> >      gshadow \
> >      hibernate \
> >      hostnamed \
> > @@ -266,12 +265,16 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kex=
ec
> > \  # The 60 seconds is watchdog's default vaule.
> >  WATCHDOG_TIMEOUT ??=3D "60"
> >
> > -do_configure:prepend() {
> > -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in >
> > ${S}/sysusers.d/basic.conf.in -}
> > -
> >  do_install() {
> >       meson_do_install
> > +     # Change the root user's home directory in /lib/sysusers.d/basic.=
conf.
> > +     # This is done merely for backward compatibility with previous sy=
stemd recipes.
> > +     # systemd hardcodes root user's HOME to be "/root". Changing to u=
se other values
> > +     # may have unexpected runtime behaviors.
> > +     if [ "${ROOT_HOME}" !=3D "/root" ]; then
> > +             bbwarn "Using ${ROOT_HOME} as root user's home directory =
is not fully supported by systemd"
> > +             sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib=
/sysusers.d/basic.conf
> > +     fi
> >       install -d ${D}/${base_sbindir}
> >       if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator'=
, 'false', 'true', d)}; then
> >               # Provided by a separate recipe
> > @@ -754,6 +757,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules=
 \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-input.rule=
s \
> >
> > ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> > +
> > + ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage-ta=
pe.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules =
\
> >                 ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
> > --
> > 2.34.1
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192970): https://lists.openembedded.org/g/openembedde=
d-core/message/192970
> Mute This Topic: https://lists.openembedded.org/mt/103380516/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

