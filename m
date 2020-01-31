Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
	[209.85.222.42])
	by mail.openembedded.org (Postfix) with ESMTP id 34DFE60B0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 10:51:45 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id u17so2361427uap.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 02:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PCPBIi7UtiQjDNUpQNL+yPYnVoh2oJHbGZDRjQMXNsA=;
	b=oFN8/iLSwq46shhPfUSHjckKXMTQUcZoBOSMMAAO4ZUQzIPOLROwl4FzUz6I61omhu
	43l3fSTgsE8hOQiTn16+cir7rWxRkX6ofUOWNUq6mUkvDWGb3MJaioD1d1PK/bkfDZvP
	k9rFS1bx5J2SKPg6zrbMKv5HVmxlA+o+eFMdH98ENrjbZ0rtxCoK1NJorkPYDfYEM0uH
	0RKcOWUo34XH4jxsFTildLhNyETQFtUSUUgxzB00dRcYd9+PAyI53QCbN7XqP7maDu2W
	p6wvuM6cWShyf/umJoqFeGsBEKS1vuFKD1E0kGZwU4qJqtKyUjGFluOo2KHUI0HHve9G
	jrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PCPBIi7UtiQjDNUpQNL+yPYnVoh2oJHbGZDRjQMXNsA=;
	b=VCNcaTfqV9yZLdmcU3zDZ6HYurNu/cJA9/jogHFoTdKBUYkp1CGQm4/0jOa6Dyf57k
	LdiWZA1GFd7Gx3BxX3qn+dBPvLGjSAi4X04A7w7Zyra4TaxhCpgAoADhIIM7hOGIS6jC
	Onkv+cuU3cYOYNid05luZLCnDkn3x+bL5PxxlvF50lNVNxmzfOI+mxgP/ERiXTAYA/+q
	BmVs/vSKkSWX0Ft1qBKDeVA7MruDF3bvSLmKyyCquRUzLOnD45j+JXSRIcv9dOTGC2Lx
	97skw7pCn7rUb1urkgbdWoU/T6LUWT4ZrjBb/+4GP2PND8TSR6zwNRCetdQ2BAu7xnku
	R0aQ==
X-Gm-Message-State: APjAAAX0bDXEfSomOoNKCB+hc6uMPR0Zs61RMTZYMz5TnUUEL2PoPr8h
	FVD2HvLwMHcDQK8VAFTqtL6w9iSwSRv2YYxyCVs=
X-Google-Smtp-Source: APXvYqyjrXgNnlKeiKsjyUOl56YxVmToZgD2+LoR5jJiVoCGYhT1hKotCE2PgcFCvt++Bnqsu5V/cIwxtD0IJWmeg6k=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr6025382uae.89.1580467905750; 
	Fri, 31 Jan 2020 02:51:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580403003.git.raj.khem@gmail.com>
	<24a8b4f8d4bdcf67fcae933539008f9f109c9fae.1580403003.git.raj.khem@gmail.com>
In-Reply-To: <24a8b4f8d4bdcf67fcae933539008f9f109c9fae.1580403003.git.raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Jan 2020 11:51:33 +0100
Message-ID: <CANNYZj-umaTRHOB7CUw3ukdZrGrTYXWzHBqboqvpNgRWM7v=Aw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runit: Add runit and related recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2020 10:51:46 -0000
Content-Type: multipart/alternative; boundary="00000000000019e9a1059d6d5ca0"

--00000000000019e9a1059d6d5ca0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. Does this really need to be in core? Who is the target audience and use
cases that aren't served by existing options?
2. There are no tests or image configurations for this. How will this be
checked?
3. The amount of patches is alarming. Can you get them upstream first
please?

Alex

On Fri, 31 Jan 2020 at 10:32, Khem Raj <raj.khem@gmail.com> wrote:

> * Another init system, very small in size with application life
>   cycle management
> * Add runit-services recipe for additional runit services from void linux
> * socklog is a system/kernel logger
> * Add socklog-services to provide additional logging services
>
> * disable the chkshsgr tests in socklog
>
> Running the chkhsgr test during cross compile fails
>
> ./chkshsgr || ( cat warn-shsgr; exit 1 )
> Oops. Your getgroups() returned 0, and setgroups() failed; this means
> that I can't reliably do my shsgr test. Please either ``make'' as root
> or ``make'' while you're in one or more supplementary groups.
>
> All OE based targets have working getgroups()/setgroups()
> implementation, so its a safe assumption and therefore make the test
> to be a dummy
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   2 +
>  meta/conf/layer.conf                          |   1 +
>  meta/recipes-core/runit/runit-serialgetty.bb  |  43 ++++++++
>  .../runit/runit-serialgetty/finish            |   2 +
>  meta/recipes-core/runit/runit-serialgetty/run |   2 +
>  meta/recipes-core/runit/runit-services.bb     |  50 +++++++++
>  ...y-for-services-on-Debian-is-etc-servi.diff |  87 +++++++++++++++
>  ...t-nosync-file-to-make-sync-on-shutdow.diff |  95 ++++++++++++++++
>  ...03-utmpset.c-mixes-int32_t-and-time_t.diff |  57 ++++++++++
>  ...-t-use-static-to-link-runit-runit-ini.diff |  30 ++++++
>  .../0005-patch-etc-runit-2-for-FHS.patch      |  17 +++
>  ...0006-make-buildsystem-respect-CFLAGS.patch |  21 ++++
>  .../runit/0007-move-communication-files.patch | 102 ++++++++++++++++++
>  .../runit/0008-emulate-sysv-runlevel-5.patch  |  20 ++++
>  .../runit/0009-fix-error-in-manpage.patch     |  23 ++++
>  meta/recipes-core/runit/runit/clearmem.patch  |  22 ++++
>  meta/recipes-core/runit/runit/cross.patch     |  50 +++++++++
>  ...h-disable-chkshgrp-test-that-fails-i.patch |  19 ++++
>  ...h-fix-spin-lock-on-systems-with-poor.patch |  20 ++++
>  ...h-make-build-system-print-compilatio.patch |  15 +++
>  meta/recipes-core/runit/runit/svlogd.patch    |  19 ++++
>  meta/recipes-core/runit/runit_2.1.2.bb        |  68 ++++++++++++
>  meta/recipes-core/runit/socklog-services.bb   |  23 ++++
>  ...-options-to-cp-to-ensure-proper-mods.patch |  33 ++++++
>  meta/recipes-core/runit/socklog/cross.patch   |  58 ++++++++++
>  meta/recipes-core/runit/socklog_2.1.0.bb      |  32 ++++++
>  26 files changed, 911 insertions(+)
>  create mode 100644 meta/recipes-core/runit/runit-serialgetty.bb
>  create mode 100644 meta/recipes-core/runit/runit-serialgetty/finish
>  create mode 100644 meta/recipes-core/runit/runit-serialgetty/run
>  create mode 100644 meta/recipes-core/runit/runit-services.bb
>  create mode 100644
> meta/recipes-core/runit/runit/0001-default-directory-for-services-on-Debi=
an-is-etc-servi.diff
>  create mode 100644
> meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-make-=
sync-on-shutdow.diff
>  create mode 100644
> meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.dif=
f
>  create mode 100644
> meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-link-=
runit-runit-ini.diff
>  create mode 100644
> meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
>  create mode 100644
> meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patch
>  create mode 100644
> meta/recipes-core/runit/runit/0007-move-communication-files.patch
>  create mode 100644
> meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
>  create mode 100644
> meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
>  create mode 100644 meta/recipes-core/runit/runit/clearmem.patch
>  create mode 100644 meta/recipes-core/runit/runit/cross.patch
>  create mode 100644
> meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.pa=
tch
>  create mode 100644
> meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.pa=
tch
>  create mode 100644
> meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.pa=
tch
>  create mode 100644 meta/recipes-core/runit/runit/svlogd.patch
>  create mode 100644 meta/recipes-core/runit/runit_2.1.2.bb
>  create mode 100644 meta/recipes-core/runit/socklog-services.bb
>  create mode 100644
> meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensure=
-proper-mods.patch
>  create mode 100644 meta/recipes-core/runit/socklog/cross.patch
>  create mode 100644 meta/recipes-core/runit/socklog_2.1.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index a80e85a2f6..5e79dc3892 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -616,6 +616,8 @@ RECIPE_MAINTAINER_pn-rsync =3D "Yi Zhao <
> yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-rt-tests =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-ruby =3D "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-run-postinsts =3D "Ross Burton <ross.burton@intel.c=
om
> >"
> +RECIPE_MAINTAINER_pn-runit =3D "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER_pn-runit-serialgetty =3D "Khem Raj <raj.khem@gmail.com=
>"
>  RECIPE_MAINTAINER_pn-rxvt-unicode =3D "Armin Kuster <akuster808@gmail.co=
m>"
>  RECIPE_MAINTAINER_pn-sato-screenshot =3D "Ross Burton <
> ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-sbc =3D "Tanu Kaskinen <tanuk@iki.fi>"
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index fcdf9ae5a3..07d9a9e32d 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -35,6 +35,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    keymaps \
>    udev-extraconf \
>    packagegroup-x11-xserver \
> +  runit-serialgetty \
>    systemd-serialgetty \
>    initscripts \
>    shadow \
> diff --git a/meta/recipes-core/runit/runit-serialgetty.bb
> b/meta/recipes-core/runit/runit-serialgetty.bb
> new file mode 100644
> index 0000000000..780a74bafa
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit-serialgetty.bb
> @@ -0,0 +1,43 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "Serial terminal support for runit"
> +
> +SECTION =3D "base utils"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +SRC_URI =3D "\
> +           file://run \
> +           file://finish \
> +"
> +
> +S =3D "${WORKDIR}"
> +
> +SERIAL_CONSOLES ??=3D "115200;ttyS0"
> +
> +do_install() {
> +       install -d ${D}${sysconfdir}/service
> ${D}${sysconfdir}/runit/runsvdir/default
> +       tmp=3D"${SERIAL_CONSOLES}"
> +       for i in $tmp
> +       do
> +               baudrate=3D`echo $i | sed 's/\;.*//'`
> +               ttydev=3D`echo $i | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
> +               install -d ${D}${sysconfdir}/sv/getty-${ttydev}
> +               install -m 755 ${WORKDIR}/run
> ${D}${sysconfdir}/sv/getty-${ttydev}
> +               install -m 755 ${WORKDIR}/finish
> ${D}${sysconfdir}/sv/getty-${ttydev}
> +               sed -i -e s/\@BAUDRATE\@/$baudrate/g
> ${D}${sysconfdir}/sv/getty-${ttydev}/run
> +               sed -i -e s/\@BAUDRATE\@/$baudrate/g
> ${D}${sysconfdir}/sv/getty-${ttydev}/finish
> +               sed -i -e s/\@TTY\@/$ttydev/g
> ${D}${sysconfdir}/sv/getty-${ttydev}/run
> +               sed -i -e s/\@TTY\@/$ttydev/g
> ${D}${sysconfdir}/sv/getty-${ttydev}/finish
> +               ln -s ${localstatedir}/run/sv.getty-${ttydev}
> ${D}${sysconfdir}/sv/getty-${ttydev}/supervise
> +               ln -s ${sysconfdir}/sv/getty-${ttydev}
> ${D}${sysconfdir}/service/getty-${ttydev}
> +               ln -s ${sysconfdir}/sv/getty-${ttydev}
> ${D}${sysconfdir}/runit/runsvdir/default/getty-${ttydev}
> +       done
> +}
> +# Since SERIAL_CONSOLES is likely to be set from the machine configurati=
on
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +FILES_${PN} =3D "${sysconfdir}"
> diff --git a/meta/recipes-core/runit/runit-serialgetty/finish
> b/meta/recipes-core/runit/runit-serialgetty/finish
> new file mode 100644
> index 0000000000..860c07d64d
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit-serialgetty/finish
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +exec utmpset -w @TTY@
> diff --git a/meta/recipes-core/runit/runit-serialgetty/run
> b/meta/recipes-core/runit/runit-serialgetty/run
> new file mode 100644
> index 0000000000..2070fbd711
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit-serialgetty/run
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +exec /sbin/getty @BAUDRATE@ @TTY@ vt102
> diff --git a/meta/recipes-core/runit/runit-services.bb
> b/meta/recipes-core/runit/runit-services.bb
> new file mode 100644
> index 0000000000..d24ed592dc
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit-services.bb
> @@ -0,0 +1,50 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "Additional runit scripts for OE based systems"
> +HOMEPAGE =3D "https://github.com/YoeDistro/oe-runit"
> +LICENSE =3D "PD"
> +LIC_FILES_CHKSUM =3D
> "file://README.md;beginline=3D41;endline=3D48;md5=3Df2f8535b84b11359cc775=
7b009cfd646"
> +SECTION =3D "base"
> +
> +PV =3D "20180623+git${SRCPV}"
> +
> +SRCREV =3D "8d5db5c26670e49524f33800aaf0337466495c84"
> +SRC_URI =3D "git://github.com/YoeDistro/oe-runit;branch=3Doe/master \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D "PREFIX=3D${exec_prefix}"
> +
> +do_install() {
> +       oe_runmake DESTDIR=3D${D} install
> +       install -d ${D}${base_bindir} ${D}${sysconfdir}/runit/runsvdir
> +       for f in shutdown halt reboot poweroff
> +       do
> +               ln -sf ${bindir}/$f ${D}${base_bindir}/$f
> +       done
> +}
> +
> +pkg_postinst_ontarget_${PN} () {
> +        # Enable default services:
> +        #       - agetty-tty[1-4] (default)
> +        #       - udevd (default)
> +        #       - sulogin (single)
> +        mkdir -p $D/etc/runit/runsvdir/single
> +        ln -sf /etc/sv/sulogin $D/etc/runit/runsvdir/single
> +
> +        mkdir -p $D/etc/runit/runsvdir/default
> +        if [ ! -e $D/etc/runit/runsvdir/current ]; then
> +               ln -sf default $D/etc/runit/runsvdir/current
> +       fi
> +        if [ -e $D/etc/sv/udevd/run ]; then
> +               ln -sf /etc/sv/udevd $D/etc/runit/runsvdir/default
> +       fi
> +}
> +
> +RDEPENDS_${PN} =3D "runit findutils util-linux-fsck coreutils"
> +
> +PACKAGES =3D+ "${PN}-dracut"
> +
> +FILES_${PN}-dracut =3D "${nonarch_libdir}/dracut"
> diff --git
> a/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-De=
bian-is-etc-servi.diff
> b/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-De=
bian-is-etc-servi.diff
> new file mode 100644
> index 0000000000..afc1bc5564
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-De=
bian-is-etc-servi.diff
> @@ -0,0 +1,87 @@
> +From d99515f6c8427e5f1c8f252532df8858bdef1007 Mon Sep 17 00:00:00 2001
> +From: Gerrit Pape <pape@smarden.org>
> +Date: Wed, 7 May 2008 23:51:16 +0000
> +Subject: [PATCH] default directory for services on Debian is
> /etc/service/,
> + not /service/
> +
> +---
> + runit-2.1.2/man/runsv.8      | 4 ++--
> + runit-2.1.2/man/runsvchdir.8 | 4 ++--
> + runit-2.1.2/man/sv.8         | 4 ++--
> + runit-2.1.2/src/sv.c         | 2 +-
> + 4 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/runit-2.1.2/man/runsv.8 b/runit-2.1.2/man/runsv.8
> +index 7c5abfc..75bc73a 100644
> +--- a/runit-2.1.2/man/runsv.8
> ++++ b/runit-2.1.2/man/runsv.8
> +@@ -157,9 +157,9 @@ This command is ignored if it is given to
> + .IR service /log/supervise/control.
> + .P
> + Example: to send a TERM signal to the socklog-unix service, either do
> +-  # sv term /service/socklog-unix
> ++  # sv term /etc/service/socklog-unix
> +  or
> +-  # printf t >/service/socklog-unix/supervise/control
> ++  # printf t >/etc/service/socklog-unix/supervise/control
> + .P
> + .BR printf (1)
> + usually blocks if no
> +diff --git a/runit-2.1.2/man/runsvchdir.8 b/runit-2.1.2/man/runsvchdir.8
> +index f7f94dc..a5fc180 100644
> +--- a/runit-2.1.2/man/runsvchdir.8
> ++++ b/runit-2.1.2/man/runsvchdir.8
> +@@ -27,13 +27,13 @@ with a symlink pointing to
> + .IR dir .
> + .P
> + Normally
> +-.I /service
> ++.I /etc/service
> + is a symlink to
> + .IR current ,
> + and
> + .BR runsvdir (8)
> + is running
> +-.IR /service/ .
> ++.IR /etc/service/ .
> + .SH EXIT CODES
> + .B runsvchdir
> + prints an error message and exits 111 on error.
> +diff --git a/runit-2.1.2/man/sv.8 b/runit-2.1.2/man/sv.8
> +index 7ed9852..fa56443 100644
> +--- a/runit-2.1.2/man/sv.8
> ++++ b/runit-2.1.2/man/sv.8
> +@@ -30,7 +30,7 @@ If
> + .I service
> + doesn't start with a dot or slash and doesn't end with a slash, it is
> + searched in the default services directory
> +-.IR /service/ ,
> ++.IR /etc/service/ ,
> + otherwise relative to the current directory.
> + .P
> + .I command
> +@@ -232,7 +232,7 @@ This option implies
> + .TP
> + .B SVDIR
> + The environment variable $SVDIR overrides the default services director=
y
> +-.IR /service/ .
> ++.IR /etc/service/ .
> + .TP
> + .B SVWAIT
> + The environment variable $SVWAIT overrides the default 7 seconds to wai=
t
> +diff --git a/runit-2.1.2/src/sv.c b/runit-2.1.2/src/sv.c
> +index 0125795..887e9d1 100644
> +--- a/runit-2.1.2/src/sv.c
> ++++ b/runit-2.1.2/src/sv.c
> +@@ -32,7 +32,7 @@
> + char *progname;
> + char *action;
> + char *acts;
> +-char *varservice =3D"/service/";
> ++char *varservice =3D"/etc/service/";
> + char **service;
> + char **servicex;
> + unsigned int services;
> +--
> +2.0.1
> +
> diff --git
> a/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-mak=
e-sync-on-shutdow.diff
> b/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-mak=
e-sync-on-shutdow.diff
> new file mode 100644
> index 0000000000..91f9e947e1
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-mak=
e-sync-on-shutdow.diff
> @@ -0,0 +1,95 @@
> +From aed8774b9aa813cbb3e8b732f6f7ae132f86c82b Mon Sep 17 00:00:00 2001
> +From: Andras Korn <korn-debbugs@elan.rulez.org>
> +Date: Thu, 6 Dec 2012 16:57:06 +0100
> +Subject: [PATCH] support /etc/runit/nosync file to make sync on
> + shutdown/reboot optional
> +
> +https://bugs.debian.org/695281
> +---
> + runit-2.1.2/doc/runit.8.html |  2 ++
> + runit-2.1.2/man/runit.8      |  5 +++++
> + runit-2.1.2/src/runit.c      | 15 ++++++++++-----
> + runit-2.1.2/src/runit.h      |  1 +
> + 4 files changed, 18 insertions(+), 5 deletions(-)
> +
> +--- a/runit-2.1.2/doc/runit.8.html
> ++++ b/runit-2.1.2/doc/runit.8.html
> +@@ -34,6 +34,8 @@ stage 2 if it is running, and runs <i>/e
> + and possibly halt or reboot the system are done here. If stage 3 return=
s,
> + <b>runit</b> checks if the file <i>/etc/runit/reboot</i> exists and has
> the execute by
> + owner permission set. If so, the system is rebooted, it&rsquo;s halted
> otherwise.
> ++If <i>/etc/runit/nosync</i> exists, <b>runit</b> doesn&rsquo;t invoke
> ++sync(). This is useful in vservers.
> +
> + <h2><a name=3D'sect6'>Ctrl-alt-del</a></h2>
> + If <b>runit</b> receives the ctrl-alt-del keyboard request and the file
> +--- a/runit-2.1.2/man/runit.8
> ++++ b/runit-2.1.2/man/runit.8
> +@@ -48,6 +48,11 @@ checks if the file
> + .I /etc/runit/reboot
> + exists and has the execute by owner permission set.
> + If so, the system is rebooted, it's halted otherwise.
> ++If
> ++.I /etc/runit/nosync
> ++exists,
> ++.B runit
> ++doesn't invoke sync(). This is useful in vservers.
> + .SH CTRL-ALT-DEL
> + If
> + .B runit
> +--- a/runit-2.1.2/src/runit.c
> ++++ b/runit-2.1.2/src/runit.c
> +@@ -41,6 +41,11 @@ void sig_int_handler (void) {
> + }
> + void sig_child_handler (void) { write(selfpipe[1], "", 1); }
> +
> ++void sync_if_needed() {
> ++  struct stat s;
> ++  if (stat(NOSYNC, &s) =3D=3D -1) sync();
> ++}
> ++
> + int main (int argc, const char * const *argv, char * const *envp) {
> +   const char * prog[2];
> +   int pid, pid2;
> +@@ -305,28 +310,28 @@ int main (int argc, const char * const *
> +   case -1:
> +   if ((stat(REBOOT, &s) !=3D -1) && (s.st_mode & S_IXUSR)) {
> +     strerr_warn2(INFO, "system reboot.", 0);
> +-    sync();
> ++    sync_if_needed();
> +     reboot_system(RB_AUTOBOOT);
> +   }
> +   else {
> + #ifdef RB_POWER_OFF
> +     strerr_warn2(INFO, "power off...", 0);
> +-    sync();
> ++    sync_if_needed();
> +     reboot_system(RB_POWER_OFF);
> +     sleep(2);
> + #endif
> + #ifdef RB_HALT_SYSTEM
> +     strerr_warn2(INFO, "system halt.", 0);
> +-    sync();
> ++    sync_if_needed();
> +     reboot_system(RB_HALT_SYSTEM);
> + #else
> + #ifdef RB_HALT
> +     strerr_warn2(INFO, "system halt.", 0);
> +-    sync();
> ++    sync_if_needed();
> +     reboot_system(RB_HALT);
> + #else
> +     strerr_warn2(INFO, "system reboot.", 0);
> +-    sync();
> ++    sync_if_needed();
> +     reboot_system(RB_AUTOBOOT);
> + #endif
> + #endif
> +--- a/runit-2.1.2/src/runit.h
> ++++ b/runit-2.1.2/src/runit.h
> +@@ -1,4 +1,5 @@
> + #define RUNIT "/sbin/runit"
> + #define STOPIT "/etc/runit/stopit"
> + #define REBOOT "/etc/runit/reboot"
> ++#define NOSYNC "/run/runit.nosync"
> + #define CTRLALTDEL "/etc/runit/ctrlaltdel"
> diff --git
> a/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.d=
iff
> b/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.d=
iff
> new file mode 100644
> index 0000000000..6b21bbb40e
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.d=
iff
> @@ -0,0 +1,57 @@
> +From 20a0afcd367666efc17c59cf121a0d991ff1bd09 Mon Sep 17 00:00:00 2001
> +From: Gerrit Pape <pape@smarden.org>
> +Date: Thu, 31 Jul 2014 12:25:49 +0000
> +Subject: [PATCH] utmpset.c: mixes "int32_t *" and "time_t *"
> +
> +Don't pass int32_t to time(), thx Lorenzo Beretta,
> +https://bugs.debian.org/754849
> +---
> + runit-2.1.2/src/utmpset.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/runit-2.1.2/src/utmpset.c b/runit-2.1.2/src/utmpset.c
> +index eea41a5..2e8a525 100644
> +--- a/runit-2.1.2/src/utmpset.c
> ++++ b/runit-2.1.2/src/utmpset.c
> +@@ -24,6 +24,7 @@ void usage(void) { strerr_die4x(1, "usage: ", progname=
,
> USAGE, "\n"); }
> + int utmp_logout(const char *line) {
> +   int fd;
> +   uw_tmp ut;
> ++  time_t t;
> +   int ok =3D-1;
> +
> +   if ((fd =3Dopen(UW_TMP_UFILE, O_RDWR, 0)) < 0)
> +@@ -35,7 +36,8 @@ int utmp_logout(const char *line) {
> +     if (!ut.ut_name[0] || (str_diff(ut.ut_line, line) !=3D 0)) continue=
;
> +     memset(ut.ut_name, 0, sizeof ut.ut_name);
> +     memset(ut.ut_host, 0, sizeof ut.ut_host);
> +-    if (time(&ut.ut_time) =3D=3D -1) break;
> ++    if (time(&t) =3D=3D -1) break;
> ++    ut.ut_time =3D t;
> + #ifdef DEAD_PROCESS
> +     ut.ut_type =3DDEAD_PROCESS;
> + #endif
> +@@ -52,6 +54,7 @@ int wtmp_logout(const char *line) {
> +   int len;
> +   struct stat st;
> +   uw_tmp ut;
> ++  time_t t;
> +
> +   if ((fd =3D open_append(UW_TMP_WFILE)) =3D=3D -1)
> +     strerr_die4sys(111, FATAL, "unable to open ", UW_TMP_WFILE, ": ");
> +@@ -65,10 +68,11 @@ int wtmp_logout(const char *line) {
> +   memset(&ut, 0, sizeof(uw_tmp));
> +   if ((len =3Dstr_len(line)) > sizeof ut.ut_line) len =3Dsizeof ut.ut_l=
ine
> -2;
> +   byte_copy(ut.ut_line, len, line);
> +-  if (time(&ut.ut_time) =3D=3D -1) {
> ++  if (time(&t) =3D=3D -1) {
> +     close(fd);
> +     return(-1);
> +   }
> ++  ut.ut_time =3D t;
> + #ifdef DEAD_PROCESS
> +   ut.ut_type =3DDEAD_PROCESS;
> + #endif
> +--
> +2.0.1
> +
> diff --git
> a/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-lin=
k-runit-runit-ini.diff
> b/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-lin=
k-runit-runit-ini.diff
> new file mode 100644
> index 0000000000..c2cdfc8881
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-lin=
k-runit-runit-ini.diff
> @@ -0,0 +1,30 @@
> +From 77d0f60701a401ea0de0925d9422c78fb560b4f6 Mon Sep 17 00:00:00 2001
> +From: Gerrit Pape <pape@smarden.org>
> +Date: Thu, 31 Jul 2014 12:54:32 +0000
> +Subject: [PATCH] src/Makefile: don't use -static to link runit,
> runit-init on
> + Debian
> +
> +---
> + runit-2.1.2/src/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/runit-2.1.2/src/Makefile b/runit-2.1.2/src/Makefile
> +index d9624de..507a419 100644
> +--- a/runit-2.1.2/src/Makefile
> ++++ b/runit-2.1.2/src/Makefile
> +@@ -6,10 +6,10 @@ check: $(IT)
> +       ./check-local $(IT)
> +
> + runit: load runit.o unix.a byte.a
> +-      ./load runit unix.a byte.a -static
> ++      ./load runit unix.a byte.a
> +
> + runit-init: load runit-init.o unix.a byte.a
> +-      ./load runit-init unix.a byte.a -static
> ++      ./load runit-init unix.a byte.a
> +
> + runsv: load runsv.o unix.a byte.a time.a
> +       ./load runsv unix.a byte.a time.a
> +--
> +2.0.1
> +
> diff --git
> a/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
> b/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
> new file mode 100644
> index 0000000000..8bcfe8801c
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
> @@ -0,0 +1,17 @@
> +Description: Make /etc/runit/2 respect FHS
> + On Debian system services directory is /etc/service, not /service.
> +Author: Dmitry Bogatov <KAction@gnu.org>
> +Last-Update: 2016-05-31
> +---
> +This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> +--- a/runit-2.1.2/etc/2
> ++++ b/runit-2.1.2/etc/2
> +@@ -1,6 +1,6 @@
> + #!/bin/sh
> +
>
> +-PATH=3D/command:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr=
/sbin:/usr/X11R6/bin
>
> ++PATH=3D/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/us=
r/X11R6/bin
> +
> + exec env - PATH=3D$PATH \
> +-runsvdir -P /service 'log:
> .........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
......................'
> ++runsvdir -P /etc/service 'log:
> .........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
......................'
> diff --git
> a/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patc=
h
> b/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patc=
h
> new file mode 100644
> index 0000000000..269d79a49b
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patc=
h
> @@ -0,0 +1,21 @@
> +Description: Make buildsystem respect dpkg-buildflags
> +Author: Dmitry Bogatov <KAction@gnu.org>
> +Last-Update: 2016-06-01
> +---
> +This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> +--- a/runit-2.1.2/src/print-cc.sh
> ++++ b/runit-2.1.2/src/print-cc.sh
> +@@ -2,4 +2,4 @@ cc=3D"`head -n1 conf-cc`"
> + systype=3D"`cat systype`"
> +
> + cat warn-auto.sh
> +-echo exec "$cc" '-c ${1+"$@"}'
> ++echo exec "$cc" "$CPPFLAGS" "$CFLAGS" '-c ${1+"$@"}'
> +--- a/runit-2.1.2/src/print-ld.sh
> ++++ b/runit-2.1.2/src/print-ld.sh
> +@@ -3,4 +3,4 @@ systype=3D"`cat systype`"
> +
> + cat warn-auto.sh
> + echo 'main=3D"$1"; shift'
> +-echo exec "$ld" '-o "$main" "$main".o ${1+"$@"}'
> ++echo exec "$ld" "$LDFLAGS" '-o "$main" "$main".o ${1+"$@"}'
> diff --git
> a/meta/recipes-core/runit/runit/0007-move-communication-files.patch
> b/meta/recipes-core/runit/runit/0007-move-communication-files.patch
> new file mode 100644
> index 0000000000..bfcbac8015
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/0007-move-communication-files.patch
> @@ -0,0 +1,102 @@
> +Description: Move communication files under /run
> + Runit by default uses files /etc/runit/stop and /etc/runit/reboot.
> + This configuration will not work when /etc is mounted read-only,
> + as such this patch renames this files into /run/runit.stop and
> + /run/runit.reboot
> +Author: Dmitry Bogatov <KAction@gnu.org>
> +Last-Update: 2016-06-02
> +---
> +This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> +--- a/runit-2.1.2/etc/debian/1
> ++++ b/runit-2.1.2/etc/debian/1
> +@@ -6,5 +6,5 @@ PATH=3D/command:/sbin:/bin:/usr/sbin:/usr/
> + /etc/init.d/rcS
> + /etc/init.d/rmnologin
> +
> +-touch /etc/runit/stopit
> +-chmod 0 /etc/runit/stopit
> ++touch /run/runit.stopit
> ++chmod 0 /run/runit.stopit
> +--- a/runit-2.1.2/etc/debian/3
> ++++ b/runit-2.1.2/etc/debian/3
> +@@ -4,7 +4,7 @@ exec 2>&1
> + PATH=3D/command:/sbin:/bin:/usr/sbin:/usr/bin
> +
> + LAST=3D0
> +-test -x /etc/runit/reboot && LAST=3D6
> ++test -x /run/runit.reboot && LAST=3D6
> +
> + echo 'Waiting for services to stop...'
> + sv -w196 force-stop /service/*
> +--- a/runit-2.1.2/etc/debian/ctrlaltdel
> ++++ b/runit-2.1.2/etc/debian/ctrlaltdel
> +@@ -4,6 +4,6 @@ PATH=3D/bin:/usr/bin
> + MSG=3D"System is going down in 14 seconds..."
> +
> + # echo 'disabled.' ; exit
> +-touch /etc/runit/stopit
> +-chmod 100 /etc/runit/stopit && echo "$MSG" | wall
> ++touch /etc/runit.stopit
> ++chmod 100 /etc/runit.stopit && echo "$MSG" | wall
> + /bin/sleep 14
> +--- a/runit-2.1.2/man/runit-init.8
> ++++ b/runit-2.1.2/man/runit-init.8
> +@@ -26,9 +26,9 @@ To signal
> + the system halt request,
> + .B runit-init
> + removes all permissions of the file
> +-.I /etc/runit/reboot
> ++.I /run/runit.reboot
> + (chmod 0), and sets the execute by owner permission of the file
> +-.I /etc/runit/stopit
> ++.I /run/runit.stopit
> + (chmod 100).
> + Then a CONT signal is sent to
> + .BR runit (8).
> +@@ -40,9 +40,9 @@ To signal
> + the system reboot request,
> + .B runit-init
> + sets the execute by owner permission of the files
> +-.I /etc/runit/reboot
> ++.I /run/runit.reboot
> + and
> +-.I /etc/runit/stopit
> ++.I /run/runit.stopit
> + (chmod 100). Then a CONT signal is sent to
> + .BR runit (8).
> + .SH EXIT CODES
> +--- a/runit-2.1.2/man/runit.8
> ++++ b/runit-2.1.2/man/runit.8
> +@@ -45,11 +45,11 @@ done here.
> + If stage 3 returns,
> + .B runit
> + checks if the file
> +-.I /etc/runit/reboot
> ++.I /run/runit.reboot
> + exists and has the execute by owner permission set.
> + If so, the system is rebooted, it's halted otherwise.
> + If
> +-.I /etc/runit/nosync
> ++.I /run/runit.nosync
> + exists,
> + .B runit
> + doesn't invoke sync(). This is useful in vservers.
> +@@ -70,7 +70,7 @@ only accepts signals in stage 2.
> + If
> + .B runit
> + receives a CONT signal and the file
> +-.I /etc/runit/stopit
> ++.I /run/runit.stopit
> + exists and has the execute by owner permission set,
> + .B runit
> + is told to shutdown the system.
> +--- a/runit-2.1.2/src/runit.h
> ++++ b/runit-2.1.2/src/runit.h
> +@@ -1,5 +1,5 @@
> + #define RUNIT "/sbin/runit"
> +-#define STOPIT "/etc/runit/stopit"
> +-#define REBOOT "/etc/runit/reboot"
> ++#define STOPIT "/run/runit.stopit"
> ++#define REBOOT "/run/runit.reboot"
> + #define NOSYNC "/run/runit.nosync"
> + #define CTRLALTDEL "/etc/runit/ctrlaltdel"
> diff --git
> a/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
> b/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
> new file mode 100644
> index 0000000000..0d370c8fe7
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
> @@ -0,0 +1,20 @@
> +Description: Emulalate sysv runlevel 5 by default
> + Currently, not many daemons in Debian provides proper runscripts, so
> + if user switches to runit, she will on next reboot, that none of daemon=
s,
> + including essential, like cron, are started.
> + .
> + This patch starts them in sysv-init style -- unmanaged, in background.
> + It is sub-par solution, but allows one-by-one transition.
> +Author: Dmitry Bogatov
> +Forwarded: not-needed
> +Last-Update: 2016-06-09
> +---
> +This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> +--- a/runit-2.1.2/etc/debian/1
> ++++ b/runit-2.1.2/etc/debian/1
> +@@ -8,3 +8,5 @@ PATH=3D/command:/sbin:/bin:/usr/sbin:/usr/
> +
> + touch /run/runit.stopit
> + chmod 0 /run/runit.stopit
> ++
> ++[ -e /etc/runit/no-emulate-sysv ] || /etc/init.d/rc 5
> diff --git a/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patc=
h
> b/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
> new file mode 100644
> index 0000000000..5803b0a387
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
> @@ -0,0 +1,23 @@
> +Description: Fix factual error in manpage.
> + Log ./finish script is not actually invoked. It is not clear, whether
> this
> + limitation is worth lifting.
> +Author: Dmitry Bogatov <KAction@gnu.org>
> +Forwarded: no
> +Last-Update: 2016-08-31
> +---
> +This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> +--- a/runit-2.1.2/man/runsv.8
> ++++ b/runit-2.1.2/man/runsv.8
> +@@ -54,10 +54,8 @@ and
> + .IR service /finish's
> + standard output to the pipe, switches to the directory
> + .IR service /log
> +-and starts ./run (and ./finish) exactly as described above for the
> +-.I service
> +-directory.
> +-The standard input of the log service is redirected to read from the
> pipe.
> ++and starts ./run script. The standard input of the log service
> ++is redirected to read from the pipe.
> + .P
> + .B runsv
> + maintains status information in a binary format (compatible to the
> diff --git a/meta/recipes-core/runit/runit/clearmem.patch
> b/meta/recipes-core/runit/runit/clearmem.patch
> new file mode 100644
> index 0000000000..3fa28a7006
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/clearmem.patch
> @@ -0,0 +1,22 @@
> +fix segfault in svlogd discovered on armv7hf-musl.
> +
> +Code in svlogd.c allocates some memory at startup which is
> +not zeroed, and other code was using those garbage values.
> +I have no idea why this has never caused a problem before, but
> +for me, svlogd consistently segfaults on armv7hf-musl when
> +it is called by socklog.
> +
> +Upstream-Status: Pending
> +Author: Christopher Brannon <chris@the-brannons.com>
> +
> +diff -Naur runit-2.1.2/src/svlogd.c runit-2.1.2/src/svlogd.c
> +--- runit-2.1.2/src/svlogd.c   2014-08-10 11:22:34.000000000 -0700
> ++++ runit-2.1.2/src/svlogd.c   2018-03-03 03:28:08.243085845 -0800
> +@@ -705,6 +705,7 @@
> +   coe(fdwdir);
> +   dir =3D(struct logdir*)alloc(dirn *sizeof(struct logdir));
> +   if (! dir) die_nomem();
> ++  memset(dir, 0, dirn * sizeof(struct logdir));
> +   for (i =3D0; i < dirn; ++i) {
> +     dir[i].fddir =3D-1; dir[i].fdcur =3D-1;
> +     dir[i].btmp =3D(char*)alloc(buflen *sizeof(char));
> diff --git a/meta/recipes-core/runit/runit/cross.patch
> b/meta/recipes-core/runit/runit/cross.patch
> new file mode 100644
> index 0000000000..3a9dcd8afe
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/cross.patch
> @@ -0,0 +1,50 @@
> +chskshsgr must be built for the host.
> +
> +Index: runit-2.1.2/src/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- runit-2.1.2.orig/src/Makefile
> ++++ runit-2.1.2/src/Makefile
> +@@ -170,11 +170,11 @@ byte_diff.o: byte.h byte_diff.c compile
> + byte_rchr.o: byte.h byte_rchr.c compile
> +       ./compile byte_rchr.c
> +
> +-chkshsgr: chkshsgr.o load
> +-      ./load chkshsgr
> ++chkshsgr: chkshsgr.o loadhost
> ++      ./loadhost chkshsgr
> +
> +-chkshsgr.o: chkshsgr.c compile
> +-      ./compile chkshsgr.c
> ++chkshsgr.o: chkshsgr.c compilehost
> ++      ./compilehost chkshsgr.c
> +
> + choose: choose.sh warn-auto.sh
> +       rm -f choose
> +@@ -185,6 +185,11 @@ choose: choose.sh warn-auto.sh
> + coe.o: coe.c coe.h compile
> +       ./compile coe.c
> +
> ++compilehost:
> ++      cat warn-auto.sh > compilehost
> ++      @echo 'exec ${BUILD_CC} ${BUILD_CFLAGS} -c $${1+"$$@"}' >>
> compilehost
> ++      chmod 555 compilehost
> ++
> + compile: conf-cc print-cc.sh systype warn-auto.sh
> +       rm -f compile
> +       sh print-cc.sh > compile
> +@@ -246,6 +251,15 @@ iopause.h: choose compile iopause.h1 iop
> + iopause.o: compile iopause.c iopause.h select.h tai.h taia.h uint64.h
> +       ./compile iopause.c
> +
> ++loadhost:
> ++      rm -f loadhost
> ++      @echo > loadhost
> ++      @echo 'systype=3D"`cat systype`"' >> loadhost
> ++      @echo 'cat warn-auto.sh' >> loadhost
> ++      @echo 'main=3D"$$1"; shift' >> loadhost
> ++      @echo 'exec ${BUILD_CC} ${BUILD_LDFLAGS}  -o "$$main" "$$main".o
> $${1+"$$@"}' >> loadhost
> ++      chmod 555 loadhost
> ++
> + load: conf-ld print-ld.sh systype warn-auto.sh
> +       rm -f load
> +       sh print-ld.sh > load
> diff --git
> a/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.=
patch
> b/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.=
patch
> new file mode 100644
> index 0000000000..6753dff4ef
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.=
patch
> @@ -0,0 +1,19 @@
> +From: Dmitry Bogatov <KAction@gnu.org>
> +Date: Sun, 13 May 2018 10:38:20 +0300
> +X-Dgit-Generated: 2.1.2-14 2c8a08023e964bf54344e7030573ef7ad6881880
> +Subject: [PATCH] Disable chkshgrp test, that fails in whalebuilder
> +
> +Upstream-Status: Pending
> +
> +---
> +
> +--- runit-2.1.2.orig/runit-2.1.2/src/Makefile
> ++++ runit-2.1.2/runit-2.1.2/src/Makefile
> +@@ -234,7 +234,6 @@ hassgprm.h: choose compile hassgprm.h1 h
> +
> + hasshsgr.h: chkshsgr choose compile hasshsgr.h1 hasshsgr.h2 load \
> + tryshsgr.c warn-shsgr
> +-      ./chkshsgr || ( cat warn-shsgr; exit 1 )
> +       ./choose clr tryshsgr hasshsgr.h1 hasshsgr.h2 > hasshsgr.h
> +
> + haswaitp.h: choose compile haswaitp.h1 haswaitp.h2 load trywaitp.c
> diff --git
> a/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.=
patch
> b/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.=
patch
> new file mode 100644
> index 0000000000..6f15e92779
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.=
patch
> @@ -0,0 +1,20 @@
> +From: Dmitry Bogatov <KAction@gnu.org>
> +Date: Mon, 28 May 2018 21:46:39 +0300
> +X-Dgit-Generated: 2.1.2-15 7791b76917a00ca44e3a5c297675214a40f7f215
> +Subject: [PATCH] Fix spin lock on systems with poor clock
> +
> +Upstream-Status: Pending
> +
> +---
> +
> +--- runit-2.1.2.orig/runit-2.1.2/src/svlogd.c
> ++++ runit-2.1.2/runit-2.1.2/src/svlogd.c
> +@@ -234,7 +234,7 @@ void rmoldest(struct logdir *ld) {
> +         if (unlink(f->d_name) =3D=3D -1)
> +           warn2("unable to unlink processor leftover", f->d_name);
> +       }
> +-      else {
> ++      else if (f->d_name[26] !=3D 'u') {
> +         ++n;
> +         if (str_diff(f->d_name, oldest) < 0) byte_copy(oldest, 27,
> f->d_name);
> +       }
> diff --git
> a/meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.=
patch
> b/meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.=
patch
> new file mode 100644
> index 0000000000..f62dfa36d3
> --- /dev/null
> +++
> b/meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.=
patch
> @@ -0,0 +1,15 @@
> +From: Dmitry Bogatov <KAction@gnu.org>
> +Date: Tue, 10 Apr 2018 20:08:14 +0300
> +X-Dgit-Generated: 2.1.2-10 9187ce34534181446afc87277ec0d460e5575f9c
> +Subject: [PATCH] Make build system print compilation commands
> +
> +Upstream-Status: Pending
> +
> +---
> +
> +--- runit-2.1.2.orig/runit-2.1.2/src/warn-auto.sh
> ++++ runit-2.1.2/runit-2.1.2/src/warn-auto.sh
> +@@ -1,2 +1,2 @@
> +-#!/bin/sh
> ++#!/bin/sh -x
> + # WARNING: This file was auto-generated. Do not edit!
> diff --git a/meta/recipes-core/runit/runit/svlogd.patch
> b/meta/recipes-core/runit/runit/svlogd.patch
> new file mode 100644
> index 0000000000..468fdb2ae4
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit/svlogd.patch
> @@ -0,0 +1,19 @@
> +Initialize all fields of sockaddr_in.
> +
> http://skarnet.org/cgi-bin/archive.cgi?2:mss:1163:201602:gpiglpbjdemlioae=
abbn
> +
> +set all fields of sockaddr_in in svlogd.
> +
> +Upstream-Status: Submitted
> +
> +Author: Leah Neukirchen <leah@vuxu.org>
> +
> +--- runit-2.1.2/src/svlogd.c 2014-08-10 15:22:34.000000000 -0300
> ++++ runit-2.1.2/src/svlogd.c 2016-02-04 22:53:52.910965361 -0300
> +@@ -430,6 +430,7 @@
> +   ld->name =3D(char*)fn;
> +   ld->ppid =3D0;
> +   ld->match =3D'+';
> ++  ld->udpaddr.sin_family =3DAF_INET;
> +   ld->udpaddr.sin_port =3D0;
> +   ld->udponly =3D0;
> +   while (! stralloc_copys(&ld->prefix, "")) pause_nomem();
> diff --git a/meta/recipes-core/runit/runit_2.1.2.bb
> b/meta/recipes-core/runit/runit_2.1.2.bb
> new file mode 100644
> index 0000000000..affb309be1
> --- /dev/null
> +++ b/meta/recipes-core/runit/runit_2.1.2.bb
> @@ -0,0 +1,68 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "A UNIX init scheme with service supervision"
> +HOMEPAGE =3D "http://smarden.org/runit/"
> +LICENSE =3D "BSD-3-Clause"
> +SECTION =3D "base"
> +
> +LIC_FILES_CHKSUM =3D
> "file://package/COPYING;md5=3Dc9e8a560732fc8b860b6a91341cc603b"
> +
> +inherit update-alternatives
> +
> +SRC_URI =3D "http://smarden.org/${BPN}/${BP}.tar.gz \
> +
>  file://0001-default-directory-for-services-on-Debian-is-etc-servi.diff;s=
triplevel=3D2
> \
> +
>  file://0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff;s=
triplevel=3D2
> \
> +
>  file://0003-utmpset.c-mixes-int32_t-and-time_t.diff;striplevel=3D2 \
> +
>  file://0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff;s=
triplevel=3D2
> \
> +           file://0005-patch-etc-runit-2-for-FHS.patch;striplevel=3D2 \
> +           file://0006-make-buildsystem-respect-CFLAGS.patch;striplevel=
=3D2
> \
> +           file://0007-move-communication-files.patch;striplevel=3D2 \
> +           file://0008-emulate-sysv-runlevel-5.patch;striplevel=3D2 \
> +           file://0009-fix-error-in-manpage.patch;striplevel=3D2 \
> +
>  file://patch-make-build-system-print-compilatio.patch;striplevel=3D2 \
> +
>  file://patch-disable-chkshgrp-test-that-fails-i.patch;striplevel=3D2 \
> +
>  file://patch-fix-spin-lock-on-systems-with-poor.patch;striplevel=3D2 \
> +           file://cross.patch \
> +           file://clearmem.patch \
> +           file://svlogd.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "6c985fbfe3a34608eb3c53dc719172c4"
> +SRC_URI[sha256sum] =3D
> "6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66ab49490992c0c47ba18"
> +
> +S =3D "${WORKDIR}/admin/${BPN}-${PV}"
> +
> +do_compile() {
> +       cd ${S}/src
> +       sed -e 's,sbin/runit,usr/bin/runit,g' -i ${S}/src/runit.h
> +       echo "$CC -D_GNU_SOURCE $CFLAGS" >conf-cc
> +       echo "$CC $LDFLAGS -Wl,-z -Wl,noexecstack" >conf-ld
> +       # change type short to gid_t for getgroups(2) and setgroups(2)
> +       sed -i -e 's:short x\[4\];$:gid_t x[4];:' ${S}/src/chkshsgr.c
> +       oe_runmake
> +
> +}
> +
> +do_install() {
> +       cd ${S}/src
> +       install -d ${D}${bindir}
> +       for f in chpst runit runit-init runsv runsvchdir runsvdir \
> +               sv svlogd utmpset; do
> +               install -m 0755 $f ${D}${bindir}
> +       done
> +       install -d ${D}${sysconfdir}/runit
> +       for f in 1 2 3 ctrlaltdel; do
> +               install -m 0755 ${S}/etc/debian/$f
> ${D}${sysconfdir}/runit/$f
> +       done
> +       sed -e 's,rmnologin,rmnologin.sh,g' -i ${D}${sysconfdir}/runit/1
> +       ln -s ${localstatedir}/run/runit.stopit
> ${D}${sysconfdir}/runit/stopit
> +        rm -rf ${D}${sysconfdir}/runit/{1,2,3,stopit,ctrlaltdel}
> +}
> +
> +RDEPENDS_${PN} +=3D "runit-serialgetty socklog socklog-services"
> +
> +ALTERNATIVE_${PN} =3D "init"
> +ALTERNATIVE_TARGET[init] =3D "${bindir}/runit-init"
> +ALTERNATIVE_LINK_NAME[init] =3D "${base_sbindir}/init"
> +ALTERNATIVE_PRIORITY[init] ?=3D "300"
> diff --git a/meta/recipes-core/runit/socklog-services.bb
> b/meta/recipes-core/runit/socklog-services.bb
> new file mode 100644
> index 0000000000..795bf8f390
> --- /dev/null
> +++ b/meta/recipes-core/runit/socklog-services.bb
> @@ -0,0 +1,23 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "Additional socklog configurations from Void Distro"
> +HOMEPAGE =3D "https://github.com/void-linux/void-socklog"
> +LICENSE =3D "PD"
> +LIC_FILES_CHKSUM =3D
> "file://nanoklogd.c;beginline=3D3;endline=3D6;md5=3D8c10698c7abd64f01ac42=
45e2b11ab64"
> +SECTION =3D "base"
> +
> +PV =3D "20150726+git${SRCPV}"
> +
> +SRCREV =3D "e6b8b91dcd38ebcfbb0d41753d814edf78b06989"
> +SRC_URI =3D "git://github.com/void-linux/socklog-void \
> +           file://0001-Use-options-to-cp-to-ensure-proper-mods.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D "PREFIX=3D${exec_prefix}"
> +
> +do_install() {
> +       oe_runmake DESTDIR=3D${D} install
> +}
> diff --git
> a/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensu=
re-proper-mods.patch
> b/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensu=
re-proper-mods.patch
> new file mode 100644
> index 0000000000..edd5bae2ef
> --- /dev/null
> +++
> b/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensu=
re-proper-mods.patch
> @@ -0,0 +1,33 @@
> +From b1f46a4d7273ba9b446527dc3f50aa4c318acdd3 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 4 Jan 2019 18:15:18 -0800
> +Subject: [PATCH] Use options to cp to ensure proper mods
> +
> +This ensures that permissions are in line when using staged installed in
> +OE e.g.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 4f96b6e..4889229 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -5,8 +5,8 @@ install: all
> +       install -Dm755 svlogtail ${DESTDIR}/usr/bin/svlogtail
> +       install -Dm755 syslog-stripdate ${DESTDIR}/usr/bin/syslog-stripda=
te
> +       mkdir -p ${DESTDIR}/etc ${DESTDIR}/var/log
> +-      cp -a sv ${DESTDIR}/etc
> +-      cp -a socklog ${DESTDIR}/var/log
> ++      cp -R --no-dereference --preserve=3Dmode,links sv ${DESTDIR}/etc
> ++      cp -R --no-dereference --preserve=3Dmode,links socklog
> ${DESTDIR}/var/log
> +
> + clean:
> +       rm -f nanoklogd
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-core/runit/socklog/cross.patch
> b/meta/recipes-core/runit/socklog/cross.patch
> new file mode 100644
> index 0000000000..bc0385f54e
> --- /dev/null
> +++ b/meta/recipes-core/runit/socklog/cross.patch
> @@ -0,0 +1,58 @@
> +chskshsgr must be built for the host.
> +
> +Original at:
> https://github.com/void-linux/void-packages/blob/master/srcpkgs/socklog/p=
atches/cross.patch
> +
> +Upstream-Status: Inappropriate [Cross-compile Specific]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -117,11 +117,11 @@ byte_rchr.o: byte.h byte_rchr.c compile
> + byte_zero.o: byte.h byte_zero.c compile
> +       ./compile byte_zero.c
> +
> +-chkshsgr: chkshsgr.o load
> +-      ./load chkshsgr
> ++chkshsgr: chkshsgr.o loadhost
> ++      ./loadhost chkshsgr
> +
> +-chkshsgr.o: chkshsgr.c compile
> +-      ./compile chkshsgr.c
> ++chkshsgr.o: chkshsgr.c compilehost
> ++      ./compilehost chkshsgr.c
> +
> + choose: choose.sh warn-auto.sh
> +       rm -f choose
> +@@ -137,6 +137,11 @@ compile: conf-cc print-cc.sh systype war
> +       sh print-cc.sh > compile
> +       chmod 555 compile
> +
> ++compilehost:
> ++      cat warn-auto.sh > compilehost
> ++      @echo 'gcc -c $${1+"$$@"}' >> compilehost
> ++      chmod 555 compilehost
> ++
> + direntry.h: choose compile direntry.h1 direntry.h2 trydrent.c
> +       ./choose c trydrent direntry.h1 direntry.h2 > direntry.h
> +
> +@@ -198,6 +203,15 @@ load: conf-ld print-ld.sh systype warn-a
> +       sh print-ld.sh > load
> +       chmod 555 load
> +
> ++loadhost:
> ++      rm -f loadhost
> ++      @echo > loadhost
> ++      @echo 'systype=3D"`cat systype`"' >> loadhost
> ++      @echo 'cat warn-auto.sh' >> loadhost
> ++      @echo 'main=3D"$$1"; shift' >> loadhost
> ++      @echo 'gcc -o "$$main" "$$main".o $${1+"$$@"}' >> loadhost
> ++      chmod 555 loadhost
> ++
> + lock_ex.o: compile hasflock.h lock.h lock_ex.c
> +       ./compile lock_ex.c
> +
> +@@ -410,4 +424,3 @@ wait_nohang.o: compile haswaitp.h wait_n
> +
> + wait_pid.o: compile error.h haswaitp.h wait_pid.c
> +       ./compile wait_pid.c
> +-
> diff --git a/meta/recipes-core/runit/socklog_2.1.0.bb
> b/meta/recipes-core/runit/socklog_2.1.0.bb
> new file mode 100644
> index 0000000000..fc3fbd9826
> --- /dev/null
> +++ b/meta/recipes-core/runit/socklog_2.1.0.bb
> @@ -0,0 +1,32 @@
> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Small and secure syslogd replacement for use with runit"
> +HOMEPAGE =3D "http://smarden.org/socklog/"
> +LICENSE =3D "BSD-3-Clause"
> +SECTION =3D "base"
> +
> +LIC_FILES_CHKSUM =3D
> "file://package/COPYING;md5=3Dc7a77593c4b489904800014396f3f742"
> +SRC_URI =3D "http://smarden.org/${BPN}/${BP}.tar.gz \
> +           file://cross.patch \
> +"
> +SRC_URI[md5sum] =3D "5d0e8e28c9329ad3af982c5241df9ff1"
> +SRC_URI[sha256sum] =3D
> "aa869a787ee004da4e5509b5a0031bcc17a4ab4ac650c2ce8d4e488123acb455"
> +
> +S =3D "${WORKDIR}/admin/${BPN}-${PV}"
> +
> +do_compile() {
> +       cd ${S}/src
> +       echo "$CC -D_GNU_SOURCE $CFLAGS" >conf-cc
> +       echo "$CC $LDFLAGS -Wl,-z -Wl,noexecstack" >conf-ld
> +       echo "int main() { return 0; }" >${S}/src/chkshsgr.c
> +       oe_runmake
> +}
> +
> +do_install() {
> +       cd ${S}/src
> +       install -d ${D}${bindir}
> +       for f in socklog socklog-conf socklog-check uncat tryto; do
> +               install -m 0755 $f ${D}${bindir}
> +       done
> +}
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000019e9a1059d6d5ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>1. Does this really need to be in core? Who is the ta=
rget audience and use cases that aren&#39;t served by existing options?<br>=
</div><div>2. There are no tests or image configurations for this. How will=
 this be checked?</div><div>3. The amount of patches is alarming. Can you g=
et them upstream first please?</div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, 31 Jan 2020 at 10:32, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">* Another init system, very small in size with applicati=
on life<br>
=C2=A0 cycle management<br>
* Add runit-services recipe for additional runit services from void linux<b=
r>
* socklog is a system/kernel logger<br>
* Add socklog-services to provide additional logging services<br>
<br>
* disable the chkshsgr tests in socklog<br>
<br>
Running the chkhsgr test during cross compile fails<br>
<br>
./chkshsgr || ( cat warn-shsgr; exit 1 )<br>
Oops. Your getgroups() returned 0, and setgroups() failed; this means<br>
that I can&#39;t reliably do my shsgr test. Please either ``make&#39;&#39; =
as root<br>
or ``make&#39;&#39; while you&#39;re in one or more supplementary groups.<b=
r>
<br>
All OE based targets have working getgroups()/setgroups()<br>
implementation, so its a safe assumption and therefore make the test<br>
to be a dummy<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-core/runit/<a href=3D"http://runit-serialgetty.bb" rel=
=3D"noreferrer" target=3D"_blank">runit-serialgetty.bb</a>=C2=A0 |=C2=A0 43=
 ++++++++<br>
=C2=A0.../runit/runit-serialgetty/finish=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-core/runit/runit-serialgetty/run |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-core/runit/<a href=3D"http://runit-services.bb" rel=3D"n=
oreferrer" target=3D"_blank">runit-services.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 50 +++++++++<br>
=C2=A0...y-for-services-on-Debian-is-etc-servi.diff |=C2=A0 87 ++++++++++++=
+++<br>
=C2=A0...t-nosync-file-to-make-sync-on-shutdow.diff |=C2=A0 95 ++++++++++++=
++++<br>
=C2=A0...03-utmpset.c-mixes-int32_t-and-time_t.diff |=C2=A0 57 ++++++++++<b=
r>
=C2=A0...-t-use-static-to-link-runit-runit-ini.diff |=C2=A0 30 ++++++<br>
=C2=A0.../0005-patch-etc-runit-2-for-FHS.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
17 +++<br>
=C2=A0...0006-make-buildsystem-respect-CFLAGS.patch |=C2=A0 21 ++++<br>
=C2=A0.../runit/0007-move-communication-files.patch | 102 +++++++++++++++++=
+<br>
=C2=A0.../runit/0008-emulate-sysv-runlevel-5.patch=C2=A0 |=C2=A0 20 ++++<br=
>
=C2=A0.../runit/0009-fix-error-in-manpage.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
23 ++++<br>
=C2=A0meta/recipes-core/runit/runit/clearmem.patch=C2=A0 |=C2=A0 22 ++++<br=
>
=C2=A0meta/recipes-core/runit/runit/cross.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
50 +++++++++<br>
=C2=A0...h-disable-chkshgrp-test-that-fails-i.patch |=C2=A0 19 ++++<br>
=C2=A0...h-fix-spin-lock-on-systems-with-poor.patch |=C2=A0 20 ++++<br>
=C2=A0...h-make-build-system-print-compilatio.patch |=C2=A0 15 +++<br>
=C2=A0meta/recipes-core/runit/runit/svlogd.patch=C2=A0 =C2=A0 |=C2=A0 19 ++=
++<br>
=C2=A0meta/recipes-core/runit/<a href=3D"http://runit_2.1.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">runit_2.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 68 ++++++++++++<br>
=C2=A0meta/recipes-core/runit/<a href=3D"http://socklog-services.bb" rel=3D=
"noreferrer" target=3D"_blank">socklog-services.bb</a>=C2=A0 =C2=A0|=C2=A0 =
23 ++++<br>
=C2=A0...-options-to-cp-to-ensure-proper-mods.patch |=C2=A0 33 ++++++<br>
=C2=A0meta/recipes-core/runit/socklog/cross.patch=C2=A0 =C2=A0|=C2=A0 58 ++=
++++++++<br>
=C2=A0meta/recipes-core/runit/<a href=3D"http://socklog_2.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">socklog_2.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 32 ++++++<br>
=C2=A026 files changed, 911 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/runit/<a href=3D"http://runit-se=
rialgetty.bb" rel=3D"noreferrer" target=3D"_blank">runit-serialgetty.bb</a>=
<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit-serialgetty/finish<b=
r>
=C2=A0create mode 100644 meta/recipes-core/runit/runit-serialgetty/run<br>
=C2=A0create mode 100644 meta/recipes-core/runit/<a href=3D"http://runit-se=
rvices.bb" rel=3D"noreferrer" target=3D"_blank">runit-services.bb</a><br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0001-default-directo=
ry-for-services-on-Debian-is-etc-servi.diff<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0002-support-etc-run=
it-nosync-file-to-make-sync-on-shutdow.diff<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0003-utmpset.c-mixes=
-int32_t-and-time_t.diff<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0004-src-Makefile-do=
n-t-use-static-to-link-runit-runit-ini.diff<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0005-patch-etc-runit=
-2-for-FHS.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0006-make-buildsyste=
m-respect-CFLAGS.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0007-move-communicat=
ion-files.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0008-emulate-sysv-ru=
nlevel-5.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/0009-fix-error-in-ma=
npage.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/clearmem.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/cross.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/patch-disable-chkshg=
rp-test-that-fails-i.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/patch-fix-spin-lock-=
on-systems-with-poor.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/patch-make-build-sys=
tem-print-compilatio.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/runit/svlogd.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/<a href=3D"http://runit_2.=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">runit_2.1.2.bb</a><br>
=C2=A0create mode 100644 meta/recipes-core/runit/<a href=3D"http://socklog-=
services.bb" rel=3D"noreferrer" target=3D"_blank">socklog-services.bb</a><b=
r>
=C2=A0create mode 100644 meta/recipes-core/runit/socklog-services/0001-Use-=
options-to-cp-to-ensure-proper-mods.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/socklog/cross.patch<br>
=C2=A0create mode 100644 meta/recipes-core/runit/<a href=3D"http://socklog_=
2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">socklog_2.1.0.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index a80e85a2f6..5e79dc3892 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -616,6 +616,8 @@ RECIPE_MAINTAINER_pn-rsync =3D &quot;Yi Zhao &lt;<a hre=
f=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-rt-tests =3D &quot;Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-ruby =3D &quot;Ross Burton &lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&quo=
t;<br>
=C2=A0RECIPE_MAINTAINER_pn-run-postinsts =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-runit =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-runit-serialgetty =3D &quot;Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot=
;<br>
=C2=A0RECIPE_MAINTAINER_pn-rxvt-unicode =3D &quot;Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-sato-screenshot =3D &quot;Ross Burton &lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-sbc =3D &quot;Tanu Kaskinen &lt;<a href=3D"mailt=
o:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&quot;<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index fcdf9ae5a3..07d9a9e32d 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -35,6 +35,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
=C2=A0 =C2=A0keymaps \<br>
=C2=A0 =C2=A0udev-extraconf \<br>
=C2=A0 =C2=A0packagegroup-x11-xserver \<br>
+=C2=A0 runit-serialgetty \<br>
=C2=A0 =C2=A0systemd-serialgetty \<br>
=C2=A0 =C2=A0initscripts \<br>
=C2=A0 =C2=A0shadow \<br>
diff --git a/meta/recipes-core/runit/<a href=3D"http://runit-serialgetty.bb=
" rel=3D"noreferrer" target=3D"_blank">runit-serialgetty.bb</a> b/meta/reci=
pes-core/runit/<a href=3D"http://runit-serialgetty.bb" rel=3D"noreferrer" t=
arget=3D"_blank">runit-serialgetty.bb</a><br>
new file mode 100644<br>
index 0000000000..780a74bafa<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/<a href=3D"http://runit-serialgetty.bb" rel=
=3D"noreferrer" target=3D"_blank">runit-serialgetty.bb</a><br>
@@ -0,0 +1,43 @@<br>
+# Copyright (C) 2017 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+DESCRIPTION =3D &quot;Serial terminal support for runit&quot;<br>
+<br>
+SECTION =3D &quot;base utils&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420&quot;<br>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://finish \<br>
+&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+SERIAL_CONSOLES ??=3D &quot;115200;ttyS0&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/service ${D}${sysc=
onfdir}/runit/runsvdir/default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp=3D&quot;${SERIAL_CONSOLES}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in $tmp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0baudrate=3D`echo $i=
 | sed &#39;s/\;.*//&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttydev=3D`echo $i |=
 sed -e &#39;s/^[0-9]*\;//&#39; -e &#39;s/\;.*//&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sy=
sconfdir}/sv/getty-${ttydev}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${WO=
RKDIR}/run ${D}${sysconfdir}/sv/getty-${ttydev}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${WO=
RKDIR}/finish ${D}${sysconfdir}/sv/getty-${ttydev}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s/\@BAUDR=
ATE\@/$baudrate/g ${D}${sysconfdir}/sv/getty-${ttydev}/run<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s/\@BAUDR=
ATE\@/$baudrate/g ${D}${sysconfdir}/sv/getty-${ttydev}/finish<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s/\@TTY\@=
/$ttydev/g ${D}${sysconfdir}/sv/getty-${ttydev}/run<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s/\@TTY\@=
/$ttydev/g ${D}${sysconfdir}/sv/getty-${ttydev}/finish<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${localstated=
ir}/run/sv.getty-${ttydev} ${D}${sysconfdir}/sv/getty-${ttydev}/supervise<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${sysconfdir}=
/sv/getty-${ttydev} ${D}${sysconfdir}/service/getty-${ttydev}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${sysconfdir}=
/sv/getty-${ttydev} ${D}${sysconfdir}/runit/runsvdir/default/getty-${ttydev=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
+# Since SERIAL_CONSOLES is likely to be set from the machine configuration=
<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${sysconfdir}&quot;<br>
diff --git a/meta/recipes-core/runit/runit-serialgetty/finish b/meta/recipe=
s-core/runit/runit-serialgetty/finish<br>
new file mode 100644<br>
index 0000000000..860c07d64d<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit-serialgetty/finish<br>
@@ -0,0 +1,2 @@<br>
+#!/bin/sh<br>
+exec utmpset -w @TTY@<br>
diff --git a/meta/recipes-core/runit/runit-serialgetty/run b/meta/recipes-c=
ore/runit/runit-serialgetty/run<br>
new file mode 100644<br>
index 0000000000..2070fbd711<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit-serialgetty/run<br>
@@ -0,0 +1,2 @@<br>
+#!/bin/sh<br>
+exec /sbin/getty @BAUDRATE@ @TTY@ vt102<br>
diff --git a/meta/recipes-core/runit/<a href=3D"http://runit-services.bb" r=
el=3D"noreferrer" target=3D"_blank">runit-services.bb</a> b/meta/recipes-co=
re/runit/<a href=3D"http://runit-services.bb" rel=3D"noreferrer" target=3D"=
_blank">runit-services.bb</a><br>
new file mode 100644<br>
index 0000000000..d24ed592dc<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/<a href=3D"http://runit-services.bb" rel=3D"n=
oreferrer" target=3D"_blank">runit-services.bb</a><br>
@@ -0,0 +1,50 @@<br>
+# Copyright (C) 2017 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+DESCRIPTION =3D &quot;Additional runit scripts for OE based systems&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/YoeDistro/oe-runit" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/YoeDistro/oe-runit</a>=
&quot;<br>
+LICENSE =3D &quot;PD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://README.md;beginline=3D41;endline=3D48;md=
5=3Df2f8535b84b11359cc7757b009cfd646&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+PV =3D &quot;20180623+git${SRCPV}&quot;<br>
+<br>
+SRCREV =3D &quot;8d5db5c26670e49524f33800aaf0337466495c84&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/YoeDistro/oe-runit;br=
anch=3Doe/master" rel=3D"noreferrer" target=3D"_blank">github.com/YoeDistro=
/oe-runit;branch=3Doe/master</a> \<br>
+&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;PREFIX=3D${exec_prefix}&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${base_bindir} ${D}${sysconfdir}=
/runit/runsvdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in shutdown halt reboot poweroff<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${bindir}/$f=
 ${D}${base_bindir}/$f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
+<br>
+pkg_postinst_ontarget_${PN} () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Enable default services:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0- agetty-tty[1-4] =
(default)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0- udevd (default)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0- sulogin (single)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $D/etc/runit/runsvdir/single<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf /etc/sv/sulogin $D/etc/runit/runsvdir/s=
ingle<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $D/etc/runit/runsvdir/default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e $D/etc/runit/runsvdir/current ]; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf default $D/e=
tc/runit/runsvdir/current<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $D/etc/sv/udevd/run ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf /etc/sv/udev=
d $D/etc/runit/runsvdir/default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+RDEPENDS_${PN} =3D &quot;runit findutils util-linux-fsck coreutils&quot;<b=
r>
+<br>
+PACKAGES =3D+ &quot;${PN}-dracut&quot;<br>
+<br>
+FILES_${PN}-dracut =3D &quot;${nonarch_libdir}/dracut&quot;<br>
diff --git a/meta/recipes-core/runit/runit/0001-default-directory-for-servi=
ces-on-Debian-is-etc-servi.diff b/meta/recipes-core/runit/runit/0001-defaul=
t-directory-for-services-on-Debian-is-etc-servi.diff<br>
new file mode 100644<br>
index 0000000000..afc1bc5564<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0001-default-directory-for-services-on-=
Debian-is-etc-servi.diff<br>
@@ -0,0 +1,87 @@<br>
+From d99515f6c8427e5f1c8f252532df8858bdef1007 Mon Sep 17 00:00:00 2001<br>
+From: Gerrit Pape &lt;<a href=3D"mailto:pape@smarden.org" target=3D"_blank=
">pape@smarden.org</a>&gt;<br>
+Date: Wed, 7 May 2008 23:51:16 +0000<br>
+Subject: [PATCH] default directory for services on Debian is /etc/service/=
,<br>
+ not /service/<br>
+<br>
+---<br>
+ runit-2.1.2/man/runsv.8=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
+ runit-2.1.2/man/runsvchdir.8 | 4 ++--<br>
+ runit-2.1.2/man/sv.8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
+ runit-2.1.2/src/sv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ 4 files changed, 7 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/runit-2.1.2/man/runsv.8 b/runit-2.1.2/man/runsv.8<br>
+index 7c5abfc..75bc73a 100644<br>
+--- a/runit-2.1.2/man/runsv.8<br>
++++ b/runit-2.1.2/man/runsv.8<br>
+@@ -157,9 +157,9 @@ This command is ignored if it is given to<br>
+ .IR service /log/supervise/control.<br>
+ .P<br>
+ Example: to send a TERM signal to the socklog-unix service, either do<br>
+-=C2=A0 # sv term /service/socklog-unix<br>
++=C2=A0 # sv term /etc/service/socklog-unix<br>
+=C2=A0 or<br>
+-=C2=A0 # printf t &gt;/service/socklog-unix/supervise/control<br>
++=C2=A0 # printf t &gt;/etc/service/socklog-unix/supervise/control<br>
+ .P<br>
+ .BR printf (1)<br>
+ usually blocks if no<br>
+diff --git a/runit-2.1.2/man/runsvchdir.8 b/runit-2.1.2/man/runsvchdir.8<b=
r>
+index f7f94dc..a5fc180 100644<br>
+--- a/runit-2.1.2/man/runsvchdir.8<br>
++++ b/runit-2.1.2/man/runsvchdir.8<br>
+@@ -27,13 +27,13 @@ with a symlink pointing to<br>
+ .IR dir .<br>
+ .P<br>
+ Normally <br>
+-.I /service<br>
++.I /etc/service<br>
+ is a symlink to<br>
+ .IR current ,<br>
+ and<br>
+ .BR runsvdir (8)<br>
+ is running<br>
+-.IR /service/ .<br>
++.IR /etc/service/ .<br>
+ .SH EXIT CODES<br>
+ .B runsvchdir<br>
+ prints an error message and exits 111 on error.<br>
+diff --git a/runit-2.1.2/man/sv.8 b/runit-2.1.2/man/sv.8<br>
+index 7ed9852..fa56443 100644<br>
+--- a/runit-2.1.2/man/sv.8<br>
++++ b/runit-2.1.2/man/sv.8<br>
+@@ -30,7 +30,7 @@ If<br>
+ .I service<br>
+ doesn&#39;t start with a dot or slash and doesn&#39;t end with a slash, i=
t is<br>
+ searched in the default services directory<br>
+-.IR /service/ ,<br>
++.IR /etc/service/ ,<br>
+ otherwise relative to the current directory.<br>
+ .P<br>
+ .I command<br>
+@@ -232,7 +232,7 @@ This option implies<br>
+ .TP<br>
+ .B SVDIR<br>
+ The environment variable $SVDIR overrides the default services directory<=
br>
+-.IR /service/ .<br>
++.IR /etc/service/ .<br>
+ .TP<br>
+ .B SVWAIT<br>
+ The environment variable $SVWAIT overrides the default 7 seconds to wait<=
br>
+diff --git a/runit-2.1.2/src/sv.c b/runit-2.1.2/src/sv.c<br>
+index 0125795..887e9d1 100644<br>
+--- a/runit-2.1.2/src/sv.c<br>
++++ b/runit-2.1.2/src/sv.c<br>
+@@ -32,7 +32,7 @@<br>
+ char *progname;<br>
+ char *action;<br>
+ char *acts;<br>
+-char *varservice =3D&quot;/service/&quot;;<br>
++char *varservice =3D&quot;/etc/service/&quot;;<br>
+ char **service;<br>
+ char **servicex;<br>
+ unsigned int services;<br>
+-- <br>
+2.0.1<br>
+<br>
diff --git a/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-fi=
le-to-make-sync-on-shutdow.diff b/meta/recipes-core/runit/runit/0002-suppor=
t-etc-runit-nosync-file-to-make-sync-on-shutdow.diff<br>
new file mode 100644<br>
index 0000000000..91f9e947e1<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-m=
ake-sync-on-shutdow.diff<br>
@@ -0,0 +1,95 @@<br>
+From aed8774b9aa813cbb3e8b732f6f7ae132f86c82b Mon Sep 17 00:00:00 2001<br>
+From: Andras Korn &lt;<a href=3D"mailto:korn-debbugs@elan.rulez.org" targe=
t=3D"_blank">korn-debbugs@elan.rulez.org</a>&gt;<br>
+Date: Thu, 6 Dec 2012 16:57:06 +0100<br>
+Subject: [PATCH] support /etc/runit/nosync file to make sync on<br>
+ shutdown/reboot optional<br>
+<br>
+<a href=3D"https://bugs.debian.org/695281" rel=3D"noreferrer" target=3D"_b=
lank">https://bugs.debian.org/695281</a><br>
+---<br>
+ runit-2.1.2/doc/runit.8.html |=C2=A0 2 ++<br>
+ runit-2.1.2/man/runit.8=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
+ runit-2.1.2/src/runit.c=C2=A0 =C2=A0 =C2=A0 | 15 ++++++++++-----<br>
+ runit-2.1.2/src/runit.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ 4 files changed, 18 insertions(+), 5 deletions(-)<br>
+<br>
+--- a/runit-2.1.2/doc/runit.8.html<br>
++++ b/runit-2.1.2/doc/runit.8.html<br>
+@@ -34,6 +34,8 @@ stage 2 if it is running, and runs &lt;i&gt;/e<br>
+ and possibly halt or reboot the system are done here. If stage 3 returns,=
<br>
+ &lt;b&gt;runit&lt;/b&gt; checks if the file &lt;i&gt;/etc/runit/reboot&lt=
;/i&gt; exists and has the execute by<br>
+ owner permission set. If so, the system is rebooted, it&amp;rsquo;s halte=
d otherwise.<br>
++If &lt;i&gt;/etc/runit/nosync&lt;/i&gt; exists, &lt;b&gt;runit&lt;/b&gt; =
doesn&amp;rsquo;t invoke<br>
++sync(). This is useful in vservers.<br>
+ <br>
+ &lt;h2&gt;&lt;a name=3D&#39;sect6&#39;&gt;Ctrl-alt-del&lt;/a&gt;&lt;/h2&g=
t;<br>
+ If &lt;b&gt;runit&lt;/b&gt; receives the ctrl-alt-del keyboard request an=
d the file<br>
+--- a/runit-2.1.2/man/runit.8<br>
++++ b/runit-2.1.2/man/runit.8<br>
+@@ -48,6 +48,11 @@ checks if the file<br>
+ .I /etc/runit/reboot<br>
+ exists and has the execute by owner permission set.<br>
+ If so, the system is rebooted, it&#39;s halted otherwise.<br>
++If<br>
++.I /etc/runit/nosync<br>
++exists,<br>
++.B runit<br>
++doesn&#39;t invoke sync(). This is useful in vservers.<br>
+ .SH CTRL-ALT-DEL<br>
+ If<br>
+ .B runit<br>
+--- a/runit-2.1.2/src/runit.c<br>
++++ b/runit-2.1.2/src/runit.c<br>
+@@ -41,6 +41,11 @@ void sig_int_handler (void) {<br>
+ }<br>
+ void sig_child_handler (void) { write(selfpipe[1], &quot;&quot;, 1); }<br=
>
+ <br>
++void sync_if_needed() {<br>
++=C2=A0 struct stat s;<br>
++=C2=A0 if (stat(NOSYNC, &amp;s) =3D=3D -1) sync();<br>
++}<br>
++<br>
+ int main (int argc, const char * const *argv, char * const *envp) {<br>
+=C2=A0 =C2=A0const char * prog[2];<br>
+=C2=A0 =C2=A0int pid, pid2;<br>
+@@ -305,28 +310,28 @@ int main (int argc, const char * const *<br>
+=C2=A0 =C2=A0case -1:<br>
+=C2=A0 =C2=A0if ((stat(REBOOT, &amp;s) !=3D -1) &amp;&amp; (s.st_mode &amp=
; S_IXUSR)) {<br>
+=C2=A0 =C2=A0 =C2=A0strerr_warn2(INFO, &quot;system reboot.&quot;, 0);<br>
+-=C2=A0 =C2=A0 sync();<br>
++=C2=A0 =C2=A0 sync_if_needed();<br>
+=C2=A0 =C2=A0 =C2=A0reboot_system(RB_AUTOBOOT);<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else {<br>
+ #ifdef RB_POWER_OFF<br>
+=C2=A0 =C2=A0 =C2=A0strerr_warn2(INFO, &quot;power off...&quot;, 0);<br>
+-=C2=A0 =C2=A0 sync();<br>
++=C2=A0 =C2=A0 sync_if_needed();<br>
+=C2=A0 =C2=A0 =C2=A0reboot_system(RB_POWER_OFF);<br>
+=C2=A0 =C2=A0 =C2=A0sleep(2);<br>
+ #endif<br>
+ #ifdef RB_HALT_SYSTEM<br>
+=C2=A0 =C2=A0 =C2=A0strerr_warn2(INFO, &quot;system halt.&quot;, 0);<br>
+-=C2=A0 =C2=A0 sync();<br>
++=C2=A0 =C2=A0 sync_if_needed();<br>
+=C2=A0 =C2=A0 =C2=A0reboot_system(RB_HALT_SYSTEM);<br>
+ #else<br>
+ #ifdef RB_HALT<br>
+=C2=A0 =C2=A0 =C2=A0strerr_warn2(INFO, &quot;system halt.&quot;, 0);<br>
+-=C2=A0 =C2=A0 sync();<br>
++=C2=A0 =C2=A0 sync_if_needed();<br>
+=C2=A0 =C2=A0 =C2=A0reboot_system(RB_HALT);<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0strerr_warn2(INFO, &quot;system reboot.&quot;, 0);<br>
+-=C2=A0 =C2=A0 sync();<br>
++=C2=A0 =C2=A0 sync_if_needed();<br>
+=C2=A0 =C2=A0 =C2=A0reboot_system(RB_AUTOBOOT);<br>
+ #endif<br>
+ #endif<br>
+--- a/runit-2.1.2/src/runit.h<br>
++++ b/runit-2.1.2/src/runit.h<br>
+@@ -1,4 +1,5 @@<br>
+ #define RUNIT &quot;/sbin/runit&quot;<br>
+ #define STOPIT &quot;/etc/runit/stopit&quot;<br>
+ #define REBOOT &quot;/etc/runit/reboot&quot;<br>
++#define NOSYNC &quot;/run/runit.nosync&quot;<br>
+ #define CTRLALTDEL &quot;/etc/runit/ctrlaltdel&quot;<br>
diff --git a/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and=
-time_t.diff b/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-a=
nd-time_t.diff<br>
new file mode 100644<br>
index 0000000000..6b21bbb40e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t=
.diff<br>
@@ -0,0 +1,57 @@<br>
+From 20a0afcd367666efc17c59cf121a0d991ff1bd09 Mon Sep 17 00:00:00 2001<br>
+From: Gerrit Pape &lt;<a href=3D"mailto:pape@smarden.org" target=3D"_blank=
">pape@smarden.org</a>&gt;<br>
+Date: Thu, 31 Jul 2014 12:25:49 +0000<br>
+Subject: [PATCH] utmpset.c: mixes &quot;int32_t *&quot; and &quot;time_t *=
&quot;<br>
+<br>
+Don&#39;t pass int32_t to time(), thx Lorenzo Beretta,<br>
+<a href=3D"https://bugs.debian.org/754849" rel=3D"noreferrer" target=3D"_b=
lank">https://bugs.debian.org/754849</a><br>
+---<br>
+ runit-2.1.2/src/utmpset.c | 8 ++++++--<br>
+ 1 file changed, 6 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/runit-2.1.2/src/utmpset.c b/runit-2.1.2/src/utmpset.c<br>
+index eea41a5..2e8a525 100644<br>
+--- a/runit-2.1.2/src/utmpset.c<br>
++++ b/runit-2.1.2/src/utmpset.c<br>
+@@ -24,6 +24,7 @@ void usage(void) { strerr_die4x(1, &quot;usage: &quot;, =
progname, USAGE, &quot;\n&quot;); }<br>
+ int utmp_logout(const char *line) {<br>
+=C2=A0 =C2=A0int fd;<br>
+=C2=A0 =C2=A0uw_tmp ut;<br>
++=C2=A0 time_t t;<br>
+=C2=A0 =C2=A0int ok =3D-1;<br>
+ <br>
+=C2=A0 =C2=A0if ((fd =3Dopen(UW_TMP_UFILE, O_RDWR, 0)) &lt; 0)<br>
+@@ -35,7 +36,8 @@ int utmp_logout(const char *line) {<br>
+=C2=A0 =C2=A0 =C2=A0if (!ut.ut_name[0] || (str_diff(ut.ut_line, line) !=3D=
 0)) continue;<br>
+=C2=A0 =C2=A0 =C2=A0memset(ut.ut_name, 0, sizeof ut.ut_name);<br>
+=C2=A0 =C2=A0 =C2=A0memset(ut.ut_host, 0, sizeof ut.ut_host);<br>
+-=C2=A0 =C2=A0 if (time(&amp;ut.ut_time) =3D=3D -1) break;<br>
++=C2=A0 =C2=A0 if (time(&amp;t) =3D=3D -1) break;<br>
++=C2=A0 =C2=A0 ut.ut_time =3D t;<br>
+ #ifdef DEAD_PROCESS<br>
+=C2=A0 =C2=A0 =C2=A0ut.ut_type =3DDEAD_PROCESS;<br>
+ #endif<br>
+@@ -52,6 +54,7 @@ int wtmp_logout(const char *line) {<br>
+=C2=A0 =C2=A0int len;<br>
+=C2=A0 =C2=A0struct stat st;<br>
+=C2=A0 =C2=A0uw_tmp ut;<br>
++=C2=A0 time_t t;<br>
+ <br>
+=C2=A0 =C2=A0if ((fd =3D open_append(UW_TMP_WFILE)) =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0strerr_die4sys(111, FATAL, &quot;unable to open &quot;=
, UW_TMP_WFILE, &quot;: &quot;);<br>
+@@ -65,10 +68,11 @@ int wtmp_logout(const char *line) {<br>
+=C2=A0 =C2=A0memset(&amp;ut, 0, sizeof(uw_tmp));<br>
+=C2=A0 =C2=A0if ((len =3Dstr_len(line)) &gt; sizeof ut.ut_line) len =3Dsiz=
eof ut.ut_line -2;<br>
+=C2=A0 =C2=A0byte_copy(ut.ut_line, len, line);<br>
+-=C2=A0 if (time(&amp;ut.ut_time) =3D=3D -1) {<br>
++=C2=A0 if (time(&amp;t) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0return(-1);<br>
+=C2=A0 =C2=A0}<br>
++=C2=A0 ut.ut_time =3D t;<br>
+ #ifdef DEAD_PROCESS<br>
+=C2=A0 =C2=A0ut.ut_type =3DDEAD_PROCESS;<br>
+ #endif<br>
+-- <br>
+2.0.1<br>
+<br>
diff --git a/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-stat=
ic-to-link-runit-runit-ini.diff b/meta/recipes-core/runit/runit/0004-src-Ma=
kefile-don-t-use-static-to-link-runit-runit-ini.diff<br>
new file mode 100644<br>
index 0000000000..c2cdfc8881<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-l=
ink-runit-runit-ini.diff<br>
@@ -0,0 +1,30 @@<br>
+From 77d0f60701a401ea0de0925d9422c78fb560b4f6 Mon Sep 17 00:00:00 2001<br>
+From: Gerrit Pape &lt;<a href=3D"mailto:pape@smarden.org" target=3D"_blank=
">pape@smarden.org</a>&gt;<br>
+Date: Thu, 31 Jul 2014 12:54:32 +0000<br>
+Subject: [PATCH] src/Makefile: don&#39;t use -static to link runit, runit-=
init on<br>
+ Debian<br>
+<br>
+---<br>
+ runit-2.1.2/src/Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/runit-2.1.2/src/Makefile b/runit-2.1.2/src/Makefile<br>
+index d9624de..507a419 100644<br>
+--- a/runit-2.1.2/src/Makefile<br>
++++ b/runit-2.1.2/src/Makefile<br>
+@@ -6,10 +6,10 @@ check: $(IT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./check-local $(IT)<br>
+ <br>
+ runit: load runit.o unix.a byte.a<br>
+-=C2=A0 =C2=A0 =C2=A0 ./load runit unix.a byte.a -static<br>
++=C2=A0 =C2=A0 =C2=A0 ./load runit unix.a byte.a<br>
+ <br>
+ runit-init: load runit-init.o unix.a byte.a<br>
+-=C2=A0 =C2=A0 =C2=A0 ./load runit-init unix.a byte.a -static<br>
++=C2=A0 =C2=A0 =C2=A0 ./load runit-init unix.a byte.a<br>
+ <br>
+ runsv: load runsv.o unix.a byte.a time.a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./load runsv unix.a byte.a time.a<br>
+-- <br>
+2.0.1<br>
+<br>
diff --git a/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.p=
atch b/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch<b=
r>
new file mode 100644<br>
index 0000000000..8bcfe8801c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch<br=
>
@@ -0,0 +1,17 @@<br>
+Description: Make /etc/runit/2 respect FHS<br>
+ On Debian system services directory is /etc/service, not /service.<br>
+Author: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_b=
lank">KAction@gnu.org</a>&gt;<br>
+Last-Update: 2016-05-31<br>
+---<br>
+This patch header follows DEP-3: <a href=3D"http://dep.debian.net/deps/dep=
3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.net/deps/dep3/</=
a><br>
+--- a/runit-2.1.2/etc/2<br>
++++ b/runit-2.1.2/etc/2<br>
+@@ -1,6 +1,6 @@<br>
+ #!/bin/sh<br>
+ <br>
+-PATH=3D/command:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/s=
bin:/usr/X11R6/bin<br>
++PATH=3D/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/=
X11R6/bin<br>
+ <br>
+ exec env - PATH=3D$PATH \<br>
+-runsvdir -P /service &#39;log: ..........................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
.....................................................&#39;<br>
++runsvdir -P /etc/service &#39;log: ......................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
.........................................................&#39;<br>
diff --git a/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CF=
LAGS.patch b/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CF=
LAGS.patch<br>
new file mode 100644<br>
index 0000000000..269d79a49b<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.pa=
tch<br>
@@ -0,0 +1,21 @@<br>
+Description: Make buildsystem respect dpkg-buildflags<br>
+Author: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_b=
lank">KAction@gnu.org</a>&gt;<br>
+Last-Update: 2016-06-01<br>
+---<br>
+This patch header follows DEP-3: <a href=3D"http://dep.debian.net/deps/dep=
3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.net/deps/dep3/</=
a><br>
+--- a/runit-2.1.2/src/print-cc.sh<br>
++++ b/runit-2.1.2/src/print-cc.sh<br>
+@@ -2,4 +2,4 @@ cc=3D&quot;`head -n1 conf-cc`&quot;<br>
+ systype=3D&quot;`cat systype`&quot;<br>
+ <br>
+ cat warn-auto.sh<br>
+-echo exec &quot;$cc&quot; &#39;-c ${1+&quot;$@&quot;}&#39;<br>
++echo exec &quot;$cc&quot; &quot;$CPPFLAGS&quot; &quot;$CFLAGS&quot; &#39;=
-c ${1+&quot;$@&quot;}&#39;<br>
+--- a/runit-2.1.2/src/print-ld.sh<br>
++++ b/runit-2.1.2/src/print-ld.sh<br>
+@@ -3,4 +3,4 @@ systype=3D&quot;`cat systype`&quot;<br>
+ <br>
+ cat warn-auto.sh<br>
+ echo &#39;main=3D&quot;$1&quot;; shift&#39;<br>
+-echo exec &quot;$ld&quot; &#39;-o &quot;$main&quot; &quot;$main&quot;.o $=
{1+&quot;$@&quot;}&#39;<br>
++echo exec &quot;$ld&quot; &quot;$LDFLAGS&quot; &#39;-o &quot;$main&quot; =
&quot;$main&quot;.o ${1+&quot;$@&quot;}&#39;<br>
diff --git a/meta/recipes-core/runit/runit/0007-move-communication-files.pa=
tch b/meta/recipes-core/runit/runit/0007-move-communication-files.patch<br>
new file mode 100644<br>
index 0000000000..bfcbac8015<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0007-move-communication-files.patch<br>
@@ -0,0 +1,102 @@<br>
+Description: Move communication files under /run<br>
+ Runit by default uses files /etc/runit/stop and /etc/runit/reboot.<br>
+ This configuration will not work when /etc is mounted read-only,<br>
+ as such this patch renames this files into /run/runit.stop and<br>
+ /run/runit.reboot<br>
+Author: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_b=
lank">KAction@gnu.org</a>&gt;<br>
+Last-Update: 2016-06-02<br>
+---<br>
+This patch header follows DEP-3: <a href=3D"http://dep.debian.net/deps/dep=
3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.net/deps/dep3/</=
a><br>
+--- a/runit-2.1.2/etc/debian/1<br>
++++ b/runit-2.1.2/etc/debian/1<br>
+@@ -6,5 +6,5 @@ PATH=3D/command:/sbin:/bin:/usr/sbin:/usr/<br>
+ /etc/init.d/rcS<br>
+ /etc/init.d/rmnologin<br>
+ <br>
+-touch /etc/runit/stopit<br>
+-chmod 0 /etc/runit/stopit<br>
++touch /run/runit.stopit<br>
++chmod 0 /run/runit.stopit<br>
+--- a/runit-2.1.2/etc/debian/3<br>
++++ b/runit-2.1.2/etc/debian/3<br>
+@@ -4,7 +4,7 @@ exec 2&gt;&amp;1<br>
+ PATH=3D/command:/sbin:/bin:/usr/sbin:/usr/bin<br>
+ <br>
+ LAST=3D0<br>
+-test -x /etc/runit/reboot &amp;&amp; LAST=3D6<br>
++test -x /run/runit.reboot &amp;&amp; LAST=3D6<br>
+ <br>
+ echo &#39;Waiting for services to stop...&#39;<br>
+ sv -w196 force-stop /service/*<br>
+--- a/runit-2.1.2/etc/debian/ctrlaltdel<br>
++++ b/runit-2.1.2/etc/debian/ctrlaltdel<br>
+@@ -4,6 +4,6 @@ PATH=3D/bin:/usr/bin<br>
+ MSG=3D&quot;System is going down in 14 seconds...&quot;<br>
+ <br>
+ # echo &#39;disabled.&#39; ; exit<br>
+-touch /etc/runit/stopit<br>
+-chmod 100 /etc/runit/stopit &amp;&amp; echo &quot;$MSG&quot; | wall<br>
++touch /etc/runit.stopit<br>
++chmod 100 /etc/runit.stopit &amp;&amp; echo &quot;$MSG&quot; | wall<br>
+ /bin/sleep 14<br>
+--- a/runit-2.1.2/man/runit-init.8<br>
++++ b/runit-2.1.2/man/runit-init.8<br>
+@@ -26,9 +26,9 @@ To signal<br>
+ the system halt request,<br>
+ .B runit-init<br>
+ removes all permissions of the file<br>
+-.I /etc/runit/reboot<br>
++.I /run/runit.reboot<br>
+ (chmod 0), and sets the execute by owner permission of the file<br>
+-.I /etc/runit/stopit<br>
++.I /run/runit.stopit<br>
+ (chmod 100).<br>
+ Then a CONT signal is sent to<br>
+ .BR runit (8).<br>
+@@ -40,9 +40,9 @@ To signal<br>
+ the system reboot request,<br>
+ .B runit-init<br>
+ sets the execute by owner permission of the files<br>
+-.I /etc/runit/reboot<br>
++.I /run/runit.reboot<br>
+ and<br>
+-.I /etc/runit/stopit<br>
++.I /run/runit.stopit<br>
+ (chmod 100). Then a CONT signal is sent to<br>
+ .BR runit (8).<br>
+ .SH EXIT CODES<br>
+--- a/runit-2.1.2/man/runit.8<br>
++++ b/runit-2.1.2/man/runit.8<br>
+@@ -45,11 +45,11 @@ done here.<br>
+ If stage 3 returns,<br>
+ .B runit<br>
+ checks if the file<br>
+-.I /etc/runit/reboot<br>
++.I /run/runit.reboot<br>
+ exists and has the execute by owner permission set.<br>
+ If so, the system is rebooted, it&#39;s halted otherwise.<br>
+ If<br>
+-.I /etc/runit/nosync<br>
++.I /run/runit.nosync<br>
+ exists,<br>
+ .B runit<br>
+ doesn&#39;t invoke sync(). This is useful in vservers.<br>
+@@ -70,7 +70,7 @@ only accepts signals in stage 2.<br>
+ If<br>
+ .B runit<br>
+ receives a CONT signal and the file<br>
+-.I /etc/runit/stopit<br>
++.I /run/runit.stopit<br>
+ exists and has the execute by owner permission set,<br>
+ .B runit<br>
+ is told to shutdown the system.<br>
+--- a/runit-2.1.2/src/runit.h<br>
++++ b/runit-2.1.2/src/runit.h<br>
+@@ -1,5 +1,5 @@<br>
+ #define RUNIT &quot;/sbin/runit&quot;<br>
+-#define STOPIT &quot;/etc/runit/stopit&quot;<br>
+-#define REBOOT &quot;/etc/runit/reboot&quot;<br>
++#define STOPIT &quot;/run/runit.stopit&quot;<br>
++#define REBOOT &quot;/run/runit.reboot&quot;<br>
+ #define NOSYNC &quot;/run/runit.nosync&quot;<br>
+ #define CTRLALTDEL &quot;/etc/runit/ctrlaltdel&quot;<br>
diff --git a/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.pat=
ch b/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch<br>
new file mode 100644<br>
index 0000000000..0d370c8fe7<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch<br>
@@ -0,0 +1,20 @@<br>
+Description: Emulalate sysv runlevel 5 by default<br>
+ Currently, not many daemons in Debian provides proper runscripts, so<br>
+ if user switches to runit, she will on next reboot, that none of daemons,=
<br>
+ including essential, like cron, are started.<br>
+ .<br>
+ This patch starts them in sysv-init style -- unmanaged, in background.<br=
>
+ It is sub-par solution, but allows one-by-one transition.<br>
+Author: Dmitry Bogatov<br>
+Forwarded: not-needed<br>
+Last-Update: 2016-06-09<br>
+---<br>
+This patch header follows DEP-3: <a href=3D"http://dep.debian.net/deps/dep=
3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.net/deps/dep3/</=
a><br>
+--- a/runit-2.1.2/etc/debian/1<br>
++++ b/runit-2.1.2/etc/debian/1<br>
+@@ -8,3 +8,5 @@ PATH=3D/command:/sbin:/bin:/usr/sbin:/usr/<br>
+ <br>
+ touch /run/runit.stopit<br>
+ chmod 0 /run/runit.stopit<br>
++<br>
++[ -e /etc/runit/no-emulate-sysv ] || /etc/init.d/rc 5<br>
diff --git a/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch =
b/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch<br>
new file mode 100644<br>
index 0000000000..5803b0a387<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch<br>
@@ -0,0 +1,23 @@<br>
+Description: Fix factual error in manpage.<br>
+ Log ./finish script is not actually invoked. It is not clear, whether thi=
s<br>
+ limitation is worth lifting.<br>
+Author: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_b=
lank">KAction@gnu.org</a>&gt;<br>
+Forwarded: no<br>
+Last-Update: 2016-08-31<br>
+---<br>
+This patch header follows DEP-3: <a href=3D"http://dep.debian.net/deps/dep=
3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.net/deps/dep3/</=
a><br>
+--- a/runit-2.1.2/man/runsv.8<br>
++++ b/runit-2.1.2/man/runsv.8<br>
+@@ -54,10 +54,8 @@ and<br>
+ .IR service /finish&#39;s<br>
+ standard output to the pipe, switches to the directory<br>
+ .IR service /log<br>
+-and starts ./run (and ./finish) exactly as described above for the<br>
+-.I service<br>
+-directory.<br>
+-The standard input of the log service is redirected to read from the pipe=
.<br>
++and starts ./run script. The standard input of the log service<br>
++is redirected to read from the pipe.<br>
+ .P<br>
+ .B runsv<br>
+ maintains status information in a binary format (compatible to the<br>
diff --git a/meta/recipes-core/runit/runit/clearmem.patch b/meta/recipes-co=
re/runit/runit/clearmem.patch<br>
new file mode 100644<br>
index 0000000000..3fa28a7006<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/clearmem.patch<br>
@@ -0,0 +1,22 @@<br>
+fix segfault in svlogd discovered on armv7hf-musl.<br>
+<br>
+Code in svlogd.c allocates some memory at startup which is<br>
+not zeroed, and other code was using those garbage values.<br>
+I have no idea why this has never caused a problem before, but<br>
+for me, svlogd consistently segfaults on armv7hf-musl when<br>
+it is called by socklog.<br>
+<br>
+Upstream-Status: Pending<br>
+Author: Christopher Brannon &lt;<a href=3D"mailto:chris@the-brannons.com" =
target=3D"_blank">chris@the-brannons.com</a>&gt;<br>
+<br>
+diff -Naur runit-2.1.2/src/svlogd.c runit-2.1.2/src/svlogd.c<br>
+--- runit-2.1.2/src/svlogd.c=C2=A0 =C2=A02014-08-10 11:22:34.000000000 -07=
00<br>
++++ runit-2.1.2/src/svlogd.c=C2=A0 =C2=A02018-03-03 03:28:08.243085845 -08=
00<br>
+@@ -705,6 +705,7 @@<br>
+=C2=A0 =C2=A0coe(fdwdir);<br>
+=C2=A0 =C2=A0dir =3D(struct logdir*)alloc(dirn *sizeof(struct logdir));<br=
>
+=C2=A0 =C2=A0if (! dir) die_nomem();<br>
++=C2=A0 memset(dir, 0, dirn * sizeof(struct logdir));<br>
+=C2=A0 =C2=A0for (i =3D0; i &lt; dirn; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0dir[i].fddir =3D-1; dir[i].fdcur =3D-1;<br>
+=C2=A0 =C2=A0 =C2=A0dir[i].btmp =3D(char*)alloc(buflen *sizeof(char));<br>
diff --git a/meta/recipes-core/runit/runit/cross.patch b/meta/recipes-core/=
runit/runit/cross.patch<br>
new file mode 100644<br>
index 0000000000..3a9dcd8afe<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/cross.patch<br>
@@ -0,0 +1,50 @@<br>
+chskshsgr must be built for the host.<br>
+<br>
+Index: runit-2.1.2/src/Makefile<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- runit-2.1.2.orig/src/Makefile<br>
++++ runit-2.1.2/src/Makefile<br>
+@@ -170,11 +170,11 @@ byte_diff.o: byte.h byte_diff.c compile<br>
+ byte_rchr.o: byte.h byte_rchr.c compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./compile byte_rchr.c<br>
+ <br>
+-chkshsgr: chkshsgr.o load<br>
+-=C2=A0 =C2=A0 =C2=A0 ./load chkshsgr <br>
++chkshsgr: chkshsgr.o loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 ./loadhost chkshsgr<br>
+ <br>
+-chkshsgr.o: chkshsgr.c compile<br>
+-=C2=A0 =C2=A0 =C2=A0 ./compile chkshsgr.c<br>
++chkshsgr.o: chkshsgr.c compilehost<br>
++=C2=A0 =C2=A0 =C2=A0 ./compilehost chkshsgr.c<br>
+ <br>
+ choose: choose.sh warn-auto.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f choose<br>
+@@ -185,6 +185,11 @@ choose: choose.sh warn-auto.sh<br>
+ coe.o: coe.c coe.h compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./compile coe.c<br>
+ <br>
++compilehost:<br>
++=C2=A0 =C2=A0 =C2=A0 cat warn-auto.sh &gt; compilehost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;exec ${BUILD_CC} ${BUILD_CFLAGS} -c $${1+=
&quot;$$@&quot;}&#39; &gt;&gt; compilehost<br>
++=C2=A0 =C2=A0 =C2=A0 chmod 555 compilehost<br>
++<br>
+ compile: conf-cc print-cc.sh systype warn-auto.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sh print-cc.sh &gt; compile<br>
+@@ -246,6 +251,15 @@ iopause.h: choose compile iopause.h1 iop<br>
+ iopause.o: compile iopause.c iopause.h select.h tai.h taia.h uint64.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./compile iopause.c<br>
+ <br>
++loadhost:<br>
++=C2=A0 =C2=A0 =C2=A0 rm -f loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &gt; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;systype=3D&quot;`cat systype`&quot;&#39; =
&gt;&gt; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;cat warn-auto.sh&#39; &gt;&gt; loadhost<b=
r>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;main=3D&quot;$$1&quot;; shift&#39; &gt;&g=
t; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;exec ${BUILD_CC} ${BUILD_LDFLAGS}=C2=A0 -=
o &quot;$$main&quot; &quot;$$main&quot;.o $${1+&quot;$$@&quot;}&#39; &gt;&g=
t; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 chmod 555 loadhost<br>
++<br>
+ load: conf-ld print-ld.sh systype warn-auto.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f load<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sh print-ld.sh &gt; load<br>
diff --git a/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that=
-fails-i.patch b/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-=
that-fails-i.patch<br>
new file mode 100644<br>
index 0000000000..6753dff4ef<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-=
i.patch<br>
@@ -0,0 +1,19 @@<br>
+From: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_bla=
nk">KAction@gnu.org</a>&gt;<br>
+Date: Sun, 13 May 2018 10:38:20 +0300<br>
+X-Dgit-Generated: 2.1.2-14 2c8a08023e964bf54344e7030573ef7ad6881880<br>
+Subject: [PATCH] Disable chkshgrp test, that fails in whalebuilder<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+---<br>
+<br>
+--- runit-2.1.2.orig/runit-2.1.2/src/Makefile<br>
++++ runit-2.1.2/runit-2.1.2/src/Makefile<br>
+@@ -234,7 +234,6 @@ hassgprm.h: choose compile hassgprm.h1 h<br>
+ <br>
+ hasshsgr.h: chkshsgr choose compile hasshsgr.h1 hasshsgr.h2 load \<br>
+ tryshsgr.c warn-shsgr<br>
+-=C2=A0 =C2=A0 =C2=A0 ./chkshsgr || ( cat warn-shsgr; exit 1 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./choose clr tryshsgr hasshsgr.h1 hasshsgr.h2 &=
gt; hasshsgr.h<br>
+ <br>
+ haswaitp.h: choose compile haswaitp.h1 haswaitp.h2 load trywaitp.c<br>
diff --git a/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-w=
ith-poor.patch b/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-syste=
ms-with-poor.patch<br>
new file mode 100644<br>
index 0000000000..6f15e92779<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poo=
r.patch<br>
@@ -0,0 +1,20 @@<br>
+From: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_bla=
nk">KAction@gnu.org</a>&gt;<br>
+Date: Mon, 28 May 2018 21:46:39 +0300<br>
+X-Dgit-Generated: 2.1.2-15 7791b76917a00ca44e3a5c297675214a40f7f215<br>
+Subject: [PATCH] Fix spin lock on systems with poor clock<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+---<br>
+<br>
+--- runit-2.1.2.orig/runit-2.1.2/src/svlogd.c<br>
++++ runit-2.1.2/runit-2.1.2/src/svlogd.c<br>
+@@ -234,7 +234,7 @@ void rmoldest(struct logdir *ld) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlink(f-&gt;d_name) =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn2(&quot;unable to unlink proc=
essor leftover&quot;, f-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 else if (f-&gt;d_name[26] !=3D &#39;u&#39;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str_diff(f-&gt;d_name, oldest) &lt; =
0) byte_copy(oldest, 27, f-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-core/runit/runit/patch-make-build-system-print-co=
mpilatio.patch b/meta/recipes-core/runit/runit/patch-make-build-system-prin=
t-compilatio.patch<br>
new file mode 100644<br>
index 0000000000..f62dfa36d3<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/patch-make-build-system-print-compilati=
o.patch<br>
@@ -0,0 +1,15 @@<br>
+From: Dmitry Bogatov &lt;<a href=3D"mailto:KAction@gnu.org" target=3D"_bla=
nk">KAction@gnu.org</a>&gt;<br>
+Date: Tue, 10 Apr 2018 20:08:14 +0300<br>
+X-Dgit-Generated: 2.1.2-10 9187ce34534181446afc87277ec0d460e5575f9c<br>
+Subject: [PATCH] Make build system print compilation commands<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+---<br>
+<br>
+--- runit-2.1.2.orig/runit-2.1.2/src/warn-auto.sh<br>
++++ runit-2.1.2/runit-2.1.2/src/warn-auto.sh<br>
+@@ -1,2 +1,2 @@<br>
+-#!/bin/sh<br>
++#!/bin/sh -x<br>
+ # WARNING: This file was auto-generated. Do not edit!<br>
diff --git a/meta/recipes-core/runit/runit/svlogd.patch b/meta/recipes-core=
/runit/runit/svlogd.patch<br>
new file mode 100644<br>
index 0000000000..468fdb2ae4<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/runit/svlogd.patch<br>
@@ -0,0 +1,19 @@<br>
+Initialize all fields of sockaddr_in.<br>
+<a href=3D"http://skarnet.org/cgi-bin/archive.cgi?2:mss:1163:201602:gpiglp=
bjdemlioaeabbn" rel=3D"noreferrer" target=3D"_blank">http://skarnet.org/cgi=
-bin/archive.cgi?2:mss:1163:201602:gpiglpbjdemlioaeabbn</a><br>
+<br>
+set all fields of sockaddr_in in svlogd.<br>
+<br>
+Upstream-Status: Submitted<br>
+<br>
+Author: Leah Neukirchen &lt;<a href=3D"mailto:leah@vuxu.org" target=3D"_bl=
ank">leah@vuxu.org</a>&gt;<br>
+<br>
+--- runit-2.1.2/src/svlogd.c 2014-08-10 15:22:34.000000000 -0300<br>
++++ runit-2.1.2/src/svlogd.c 2016-02-04 22:53:52.910965361 -0300<br>
+@@ -430,6 +430,7 @@<br>
+=C2=A0 =C2=A0ld-&gt;name =3D(char*)fn;<br>
+=C2=A0 =C2=A0ld-&gt;ppid =3D0;<br>
+=C2=A0 =C2=A0ld-&gt;match =3D&#39;+&#39;;<br>
++=C2=A0 ld-&gt;udpaddr.sin_family =3DAF_INET;<br>
+=C2=A0 =C2=A0ld-&gt;udpaddr.sin_port =3D0;<br>
+=C2=A0 =C2=A0ld-&gt;udponly =3D0;<br>
+=C2=A0 =C2=A0while (! stralloc_copys(&amp;ld-&gt;prefix, &quot;&quot;)) pa=
use_nomem();<br>
diff --git a/meta/recipes-core/runit/<a href=3D"http://runit_2.1.2.bb" rel=
=3D"noreferrer" target=3D"_blank">runit_2.1.2.bb</a> b/meta/recipes-core/ru=
nit/<a href=3D"http://runit_2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">=
runit_2.1.2.bb</a><br>
new file mode 100644<br>
index 0000000000..affb309be1<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/<a href=3D"http://runit_2.1.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">runit_2.1.2.bb</a><br>
@@ -0,0 +1,68 @@<br>
+# Copyright (C) 2017 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+DESCRIPTION =3D &quot;A UNIX init scheme with service supervision&quot;<br=
>
+HOMEPAGE =3D &quot;<a href=3D"http://smarden.org/runit/" rel=3D"noreferrer=
" target=3D"_blank">http://smarden.org/runit/</a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://package/COPYING;md5=3Dc9e8a560732fc8b860=
b6a91341cc603b&quot;<br>
+<br>
+inherit update-alternatives<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://smarden.org/$%7BBPN%7D/$%7BBP%7D.tar.g=
z" rel=3D"noreferrer" target=3D"_blank">http://smarden.org/${BPN}/${BP}.tar=
.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-default-directory-for=
-services-on-Debian-is-etc-servi.diff;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-support-etc-runit-nos=
ync-file-to-make-sync-on-shutdow.diff;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-utmpset.c-mixes-int32=
_t-and-time_t.diff;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-src-Makefile-don-t-us=
e-static-to-link-runit-runit-ini.diff;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-patch-etc-runit-2-for=
-FHS.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-make-buildsystem-resp=
ect-CFLAGS.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-move-communication-fi=
les.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-emulate-sysv-runlevel=
-5.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-fix-error-in-manpage.=
patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://patch-make-build-system-pr=
int-compilatio.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://patch-disable-chkshgrp-tes=
t-that-fails-i.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://patch-fix-spin-lock-on-sys=
tems-with-poor.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clearmem.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://svlogd.patch \<br>
+&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;6c985fbfe3a34608eb3c53dc719172c4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66=
ab49490992c0c47ba18&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/admin/${BPN}-${PV}&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s,sbin/runit,usr/bin/runit,g&#39; -=
i ${S}/src/runit.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$CC -D_GNU_SOURCE $CFLAGS&quot; &gt;=
conf-cc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$CC $LDFLAGS -Wl,-z -Wl,noexecstack&=
quot; &gt;conf-ld<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# change type short to gid_t for getgroups(2) a=
nd setgroups(2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:short x\[4\];$:gid_t x[4];:&#3=
9; ${S}/src/chkshsgr.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
+<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in chpst runit runit-init runsv runsvchdi=
r runsvdir \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sv svlogd utmpset; =
do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 $f =
${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/runit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in 1 2 3 ctrlaltdel; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S=
}/etc/debian/$f ${D}${sysconfdir}/runit/$f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s,rmnologin,rmnologin.sh,g&#39; -i =
${D}${sysconfdir}/runit/1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${localstatedir}/run/runit.stopit ${D}${s=
ysconfdir}/runit/stopit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${sysconfdir}/runit/{1,2,3,stopit,c=
trlaltdel}<br>
+}<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;runit-serialgetty socklog socklog-services&quot;=
<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;init&quot;<br>
+ALTERNATIVE_TARGET[init] =3D &quot;${bindir}/runit-init&quot;<br>
+ALTERNATIVE_LINK_NAME[init] =3D &quot;${base_sbindir}/init&quot;<br>
+ALTERNATIVE_PRIORITY[init] ?=3D &quot;300&quot;<br>
diff --git a/meta/recipes-core/runit/<a href=3D"http://socklog-services.bb"=
 rel=3D"noreferrer" target=3D"_blank">socklog-services.bb</a> b/meta/recipe=
s-core/runit/<a href=3D"http://socklog-services.bb" rel=3D"noreferrer" targ=
et=3D"_blank">socklog-services.bb</a><br>
new file mode 100644<br>
index 0000000000..795bf8f390<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/<a href=3D"http://socklog-services.bb" rel=3D=
"noreferrer" target=3D"_blank">socklog-services.bb</a><br>
@@ -0,0 +1,23 @@<br>
+# Copyright (C) 2017 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+DESCRIPTION =3D &quot;Additional socklog configurations from Void Distro&q=
uot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/void-linux/void-socklog" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/void-linux/void-soc=
klog</a>&quot;<br>
+LICENSE =3D &quot;PD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://nanoklogd.c;beginline=3D3;endline=3D6;md=
5=3D8c10698c7abd64f01ac4245e2b11ab64&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+PV =3D &quot;20150726+git${SRCPV}&quot;<br>
+<br>
+SRCREV =3D &quot;e6b8b91dcd38ebcfbb0d41753d814edf78b06989&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/void-linux/socklog-vo=
id" rel=3D"noreferrer" target=3D"_blank">github.com/void-linux/socklog-void=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-options-to-cp-to-=
ensure-proper-mods.patch \<br>
+&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;PREFIX=3D${exec_prefix}&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} install<br>
+}<br>
diff --git a/meta/recipes-core/runit/socklog-services/0001-Use-options-to-c=
p-to-ensure-proper-mods.patch b/meta/recipes-core/runit/socklog-services/00=
01-Use-options-to-cp-to-ensure-proper-mods.patch<br>
new file mode 100644<br>
index 0000000000..edd5bae2ef<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-en=
sure-proper-mods.patch<br>
@@ -0,0 +1,33 @@<br>
+From b1f46a4d7273ba9b446527dc3f50aa4c318acdd3 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Fri, 4 Jan 2019 18:15:18 -0800<br>
+Subject: [PATCH] Use options to cp to ensure proper mods<br>
+<br>
+This ensures that permissions are in line when using staged installed in<b=
r>
+OE e.g.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 4f96b6e..4889229 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -5,8 +5,8 @@ install: all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm755 svlogtail ${DESTDIR}/usr/bin/svl=
ogtail<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm755 syslog-stripdate ${DESTDIR}/usr/=
bin/syslog-stripdate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${DESTDIR}/etc ${DESTDIR}/var/log<br>
+-=C2=A0 =C2=A0 =C2=A0 cp -a sv ${DESTDIR}/etc<br>
+-=C2=A0 =C2=A0 =C2=A0 cp -a socklog ${DESTDIR}/var/log<br>
++=C2=A0 =C2=A0 =C2=A0 cp -R --no-dereference --preserve=3Dmode,links sv ${=
DESTDIR}/etc<br>
++=C2=A0 =C2=A0 =C2=A0 cp -R --no-dereference --preserve=3Dmode,links sockl=
og ${DESTDIR}/var/log<br>
+ <br>
+ clean:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f nanoklogd<br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/meta/recipes-core/runit/socklog/cross.patch b/meta/recipes-cor=
e/runit/socklog/cross.patch<br>
new file mode 100644<br>
index 0000000000..bc0385f54e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/socklog/cross.patch<br>
@@ -0,0 +1,58 @@<br>
+chskshsgr must be built for the host. <br>
+<br>
+Original at: <a href=3D"https://github.com/void-linux/void-packages/blob/m=
aster/srcpkgs/socklog/patches/cross.patch" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/void-linux/void-packages/blob/master/srcpkgs/socklo=
g/patches/cross.patch</a><br>
+<br>
+Upstream-Status: Inappropriate [Cross-compile Specific]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+--- a/src/Makefile<br>
++++ b/src/Makefile<br>
+@@ -117,11 +117,11 @@ byte_rchr.o: byte.h byte_rchr.c compile<br>
+ byte_zero.o: byte.h byte_zero.c compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./compile byte_zero.c<br>
+ <br>
+-chkshsgr: chkshsgr.o load<br>
+-=C2=A0 =C2=A0 =C2=A0 ./load chkshsgr <br>
++chkshsgr: chkshsgr.o loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 ./loadhost chkshsgr<br>
+ <br>
+-chkshsgr.o: chkshsgr.c compile<br>
+-=C2=A0 =C2=A0 =C2=A0 ./compile chkshsgr.c<br>
++chkshsgr.o: chkshsgr.c compilehost<br>
++=C2=A0 =C2=A0 =C2=A0 ./compilehost chkshsgr.c<br>
+ <br>
+ choose: choose.sh warn-auto.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f choose<br>
+@@ -137,6 +137,11 @@ compile: conf-cc print-cc.sh systype war<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sh print-cc.sh &gt; compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 555 compile<br>
+ <br>
++compilehost:<br>
++=C2=A0 =C2=A0 =C2=A0 cat warn-auto.sh &gt; compilehost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;gcc -c $${1+&quot;$$@&quot;}&#39; &gt;&gt=
; compilehost<br>
++=C2=A0 =C2=A0 =C2=A0 chmod 555 compilehost<br>
++<br>
+ direntry.h: choose compile direntry.h1 direntry.h2 trydrent.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./choose c trydrent direntry.h1 direntry.h2 &gt=
; direntry.h<br>
+ <br>
+@@ -198,6 +203,15 @@ load: conf-ld print-ld.sh systype warn-a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sh print-ld.sh &gt; load<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 555 load<br>
+ <br>
++loadhost:<br>
++=C2=A0 =C2=A0 =C2=A0 rm -f loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &gt; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;systype=3D&quot;`cat systype`&quot;&#39; =
&gt;&gt; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;cat warn-auto.sh&#39; &gt;&gt; loadhost<b=
r>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;main=3D&quot;$$1&quot;; shift&#39; &gt;&g=
t; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 @echo &#39;gcc -o &quot;$$main&quot; &quot;$$main&qu=
ot;.o $${1+&quot;$$@&quot;}&#39; &gt;&gt; loadhost<br>
++=C2=A0 =C2=A0 =C2=A0 chmod 555 loadhost<br>
++<br>
+ lock_ex.o: compile hasflock.h lock.h lock_ex.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./compile lock_ex.c<br>
+ <br>
+@@ -410,4 +424,3 @@ wait_nohang.o: compile haswaitp.h wait_n<br>
+ <br>
+ wait_pid.o: compile error.h haswaitp.h wait_pid.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./compile wait_pid.c<br>
+-<br>
diff --git a/meta/recipes-core/runit/<a href=3D"http://socklog_2.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">socklog_2.1.0.bb</a> b/meta/recipes-core=
/runit/<a href=3D"http://socklog_2.1.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">socklog_2.1.0.bb</a><br>
new file mode 100644<br>
index 0000000000..fc3fbd9826<br>
--- /dev/null<br>
+++ b/meta/recipes-core/runit/<a href=3D"http://socklog_2.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">socklog_2.1.0.bb</a><br>
@@ -0,0 +1,32 @@<br>
+# Copyright (C) 2018 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+SUMMARY =3D &quot;Small and secure syslogd replacement for use with runit&=
quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://smarden.org/socklog/" rel=3D"noreferr=
er" target=3D"_blank">http://smarden.org/socklog/</a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://package/COPYING;md5=3Dc7a77593c4b4899048=
00014396f3f742&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://smarden.org/$%7BBPN%7D/$%7BBP%7D.tar.g=
z" rel=3D"noreferrer" target=3D"_blank">http://smarden.org/${BPN}/${BP}.tar=
.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross.patch \<br>
+&quot;<br>
+SRC_URI[md5sum] =3D &quot;5d0e8e28c9329ad3af982c5241df9ff1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;aa869a787ee004da4e5509b5a0031bcc17a4ab4ac650c=
2ce8d4e488123acb455&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/admin/${BPN}-${PV}&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$CC -D_GNU_SOURCE $CFLAGS&quot; &gt;=
conf-cc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$CC $LDFLAGS -Wl,-z -Wl,noexecstack&=
quot; &gt;conf-ld<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;int main() { return 0; }&quot; &gt;$=
{S}/src/chkshsgr.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in socklog socklog-conf socklog-check unc=
at tryto; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 $f =
${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000019e9a1059d6d5ca0--
