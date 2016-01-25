Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 500F877117
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 20:11:11 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 77so163549958ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 12:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ayanUjMARu9CK6UikHdnUFAW8U8SGsSForI4prGtl0Q=;
	b=X1p1tuWlF2mRD5hFUxHqUUibNaIZCfj5u1mcj8JZe3ORlW+CRxSXNahlOiz3GfLpvy
	Hs2/fHbC5Y4eEQjycFmfHGyKHm6+IDC8kWJIakrW1cRpsdtztKkw+pf1Jl7L7K/wtIRM
	exRQXoM0Ek5VwZVP7fUUefpzaCl4S0TmbgRlNhgojRaB4PDCkMUzlf1W9cT6ZYdpKh9Z
	6cNFa8YKPLAI3YWChYINAS/mDCrHzpczqXe9CwQb9rdc/WFClVLkFRePAp1qc/3UyA1F
	yS4pptiQoYEawThIIuxIt0nnk5BMBdCSo3A+vVSb6T6RKRmqaqWImKSENmUGPyYglvFZ
	dTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ayanUjMARu9CK6UikHdnUFAW8U8SGsSForI4prGtl0Q=;
	b=LUeOJUIPSEVZxk6rATBKQKJadp9XpiympMibpbDmENnG6DRiTy5P6kb5zWhZ6vgrwo
	3BC5t8dWsoxcnWX0YOfhJCmanQhpZcmlMp3Q9N2U1vkNDrSU92vCeWLQBjUCWLtJoX5L
	091oznbfznB6v7h8wl9LwUCWalVIWWFTBfr8zr5F4dHHfVOzyDyF/E0V36GJ2ExXgIt8
	lSQad2Kg2gCxl5ifPHdU1S15MSpqSJOl5AVJBsMJsrROjswKJCJ+t+MeFOy0I109H64A
	SWCinSAZRbuXJLae4wOWGO8mN5inpuuvUuEbfpb0WlJqNWRRpAk9gC9RZ33sO/Xjl41q
	CTLw==
X-Gm-Message-State: AG10YOQShgf67fZy1tcLN1S6jQCIUKN2DtHBSNDK6JsgqLYJECvb0zIF7TFN+G30IpkY8JNQueEhGFm2Malwqw==
MIME-Version: 1.0
X-Received: by 10.107.165.14 with SMTP id o14mr17524861ioe.49.1453752672020;
	Mon, 25 Jan 2016 12:11:12 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 12:11:11 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 12:11:11 -0800 (PST)
In-Reply-To: <CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
Date: Mon, 25 Jan 2016 12:11:11 -0800
Message-ID: <CAMKF1sq-kfWz2CsZYsray1ygdCJH5s3SggihpeH6U0Y=Q4dx3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: Add support for busybox-init
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
X-List-Received-Date: Mon, 25 Jan 2016 20:11:11 -0000
Content-Type: multipart/alternative; boundary=001a1141f0c69b7067052a2e2b35

--001a1141f0c69b7067052a2e2b35
Content-Type: text/plain; charset=UTF-8

We have lsb compliant scripts unlike buildroot. Ditto wont work here
On Jan 25, 2016 12:39 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:

> On Fri, Jan 22, 2016 at 12:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > in config metadata we can configure busybox based init and device
> > initializer ( mdev ) using e.g.
> >
> > VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
> > VIRTUAL-RUNTIME_login_manager = "busybox"
> > VIRTUAL-RUNTIME_init_manager = "busybox"
> > VIRTUAL-RUNTIME_initscripts = "initscripts"
> > VIRTUAL-RUNTIME_keymaps = "keymaps"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> >
> > busybox can be used to provide init system
> > combined with mdev it makes it a complete init
> > system for really tiny systems.
> >
> > This patch uses above defines to configure features in busybox to enable
> > the init system and mdev in a configurable manner
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/busybox/busybox.inc       | 15 +++++++++++++++
> >  meta/recipes-core/busybox/busybox/init.cfg  |  3 +++
> >  meta/recipes-core/busybox/busybox/mdev.cfg  | 11 +++++++++++
> >  meta/recipes-core/busybox/busybox_1.24.1.bb |  6 ++++++
> >  meta/recipes-core/busybox/files/inittab     | 24
> ++++++++++++++++++++++++
> >  meta/recipes-core/busybox/files/rcK         | 25
> +++++++++++++++++++++++++
> >  meta/recipes-core/busybox/files/rcS         | 26
> ++++++++++++++++++++++++++
> >  meta/recipes-core/busybox/files/runlevel    | 11 +++++++++++
> >  8 files changed, 121 insertions(+)
> >  create mode 100644 meta/recipes-core/busybox/busybox/init.cfg
> >  create mode 100644 meta/recipes-core/busybox/busybox/mdev.cfg
> >  create mode 100644 meta/recipes-core/busybox/files/inittab
> >  create mode 100644 meta/recipes-core/busybox/files/rcK
> >  create mode 100644 meta/recipes-core/busybox/files/rcS
> >  create mode 100644 meta/recipes-core/busybox/files/runlevel
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> > index 9541123..e5710f0 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -275,6 +275,21 @@ do_install () {
> >                         install -m 0755 ${WORKDIR}/mdev-mount.sh
> ${D}${sysconfdir}/mdev
> >                 fi
> >         fi
> > +        if grep "CONFIG_INIT=y" ${B}/.config; then
> > +                install -D -m 0777 ${WORKDIR}/rcS
> ${D}${sysconfdir}/init.d/rcS
> > +                install -D -m 0777 ${WORKDIR}/rcK
> ${D}${sysconfdir}/init.d/rcK
> > +                install -D -m 0755 ${WORKDIR}/runlevel
> ${D}${base_sbindir}/runlevel
> > +                if grep "CONFIG_FEATURE_USE_INITTAB=y" ${B}/.config;
> then
> > +                        install -D -m 0777 ${WORKDIR}/inittab
> ${D}${sysconfdir}/inittab
> > +                        tmp="${SERIAL_CONSOLES}"
> > +                        for i in $tmp
> > +                        do
> > +                                j=`echo ${i} | sed s/\;/\ /g`
> > +                                label=`echo ${i} | sed -e 's/tty//' -e
> 's/^.*;//' -e 's/;.*//'`
> > +                                echo
> "tty$label::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> > +                        done
> > +                fi
> > +        fi
> >
> >      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> >          if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
> > diff --git a/meta/recipes-core/busybox/busybox/init.cfg
> b/meta/recipes-core/busybox/busybox/init.cfg
> > new file mode 100644
> > index 0000000..006d4c6
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/busybox/init.cfg
> > @@ -0,0 +1,3 @@
> > +CONFIG_INIT=y
> > +CONFIG_FEATURE_USE_INITTAB=y
> > +
> > diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg
> b/meta/recipes-core/busybox/busybox/mdev.cfg
> > new file mode 100644
> > index 0000000..6aefe90
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> > @@ -0,0 +1,11 @@
> > +CONFIG_MDEV=y
> > +CONFIG_FEATURE_MDEV_CONF=y
> > +CONFIG_FEATURE_MDEV_RENAME=y
> > +CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
> > +CONFIG_FEATURE_MDEV_EXEC=y
> > +CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
> > +
> > +CONFIG_SETSID=y
> > +CONFIG_CTTYHACK=y
> > +
> > +CONFIG_FEATURE_SHADOWPASSWDS=y
> > diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb
> b/meta/recipes-core/busybox/busybox_1.24.1.bb
> > index 5e19d9c..8adee53 100644
> > --- a/meta/recipes-core/busybox/busybox_1.24.1.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
> > @@ -39,6 +39,12 @@ SRC_URI = "
> http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> >             file://sha256sum.cfg \
> >             file://getopts.cfg \
> >             file://resize.cfg \
> > +           ${@["",
> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) ==
> 'busybox')]} \
> > +           ${@["",
> "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) ==
> 'busybox-mdev')]} \
> > +           file://inittab \
> > +           file://rcS \
> > +           file://rcK \
> > +           file://runlevel \
> >  "
> >  SRC_URI_append_libc-musl = " file://musl.cfg "
> >
> > diff --git a/meta/recipes-core/busybox/files/inittab
> b/meta/recipes-core/busybox/files/inittab
> > new file mode 100644
> > index 0000000..bfec4a7
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/files/inittab
> > @@ -0,0 +1,24 @@
> > +# This is run first except when booting in single-user mode.
> > +
> > +# Startup the system
> > +null::sysinit:/bin/mount -t proc proc /proc
> > +null::sysinit:/bin/mount -t sysfs sysfs /sys
> > +null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> > +null::sysinit:/bin/mount -o remount,rw /
> > +null::sysinit:/bin/mkdir -p /dev/pts
> > +null::sysinit:/bin/mount -t devpts devpts /dev/pts
> > +null::sysinit:/bin/mount -a
> > +
> > +::sysinit:/etc/init.d/rcS
> > +
> > +# Stuff to do before rebooting
> > +::ctrlaltdel:/sbin/reboot
> > +::shutdown:/etc/init.d/rcK
> > +::shutdown:/sbin/swapoff -a
> > +::shutdown:/bin/umount -a -r
> > +
> > +# Stuff to do when restarting the init process
> > +::restart:/sbin/init
> > +
> > +# set hostname
> > +null::sysinit:/bin/busybox hostname -F /etc/hostname
> > diff --git a/meta/recipes-core/busybox/files/rcK
> b/meta/recipes-core/busybox/files/rcK
> > new file mode 100644
> > index 0000000..050086e
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/files/rcK
> > @@ -0,0 +1,25 @@
> > +#!/bin/sh
> > +
> > +# Stop all init scripts in /etc/init.d
> > +# executing them in reversed numerical order.
> > +#
> > +for i in /etc/rc6.d/K??*; do
>
> Running the K?? scripts here is different to the way the Buildroot
> initscipts work. It's also not clear how the order is going to be
> reversed?
>
> Maybe try to work with the Buildroot version as-is, or add some
> comments to the commit message explaining why the OE and Buildroot
> versions need to differ.
>
>   https://git.busybox.net/buildroot/tree/package/initscripts/init.d/rcK
>
> > +     # Ignore dangling symlinks (if any).
> > +     [ ! -f "$i" ] && continue
> > +
> > +     case "$i" in
> > +       *.sh)
> > +           # Source shell script for speed.
> > +           (
> > +               trap - INT QUIT TSTP
> > +               set stop
> > +               . $i
> > +           )
> > +           ;;
> > +       *)
> > +           # No sh extension, so fork subprocess.
> > +           $i stop
> > +           ;;
> > +    esac
> > +done
> > +
> > diff --git a/meta/recipes-core/busybox/files/rcS
> b/meta/recipes-core/busybox/files/rcS
> > new file mode 100644
> > index 0000000..d18c26b
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/files/rcS
> > @@ -0,0 +1,26 @@
> > +#!/bin/sh
> > +
> > +# Stop all init scripts in /etc/init.d
> > +# executing them in reversed numerical order.
>
> This is a copy of the comment from rcK.
>
> > +
> > +for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
> > +     # Ignore dangling symlinks (if any).
> > +     [ ! -f "$i" ] && continue
> > +
> > +     case "$i" in
> > +       *.sh)
> > +           # Source shell script for speed.
> > +           (
> > +               trap - INT QUIT TSTP
> > +               set stop
>
> Should that be start? The Buildroot original is:
>
>   https://git.busybox.net/buildroot/tree/package/initscripts/init.d/rcS
>
> > +               . $i
> > +           )
> > +           ;;
> > +       *)
> > +           # No sh extension, so fork subprocess.
> > +           $i start
> > +           ;;
> > +    esac
> > +done
> > +
> > diff --git a/meta/recipes-core/busybox/files/runlevel
> b/meta/recipes-core/busybox/files/runlevel
> > new file mode 100644
> > index 0000000..866f3b5
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/files/runlevel
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh
> > +# busybox init does not have LSB ( sysvinit ) like initlevels
> > +# so lets fake it to 5 which is what we default anyway
> > +# this helps with opkg post installs where it tries to invoke
> > +# update-rc.d ad post install step.
> > +# for package upgrades
> > +# See code in update-rc.d around line 190 where it calls runlevel
> > +# program
> > +#
> > +echo "5"
> > +
> > --
> > 2.7.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141f0c69b7067052a2e2b35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">We have lsb compliant scripts unlike buildroot. Ditto wont w=
ork here</p>
<div class=3D"gmail_quote">On Jan 25, 2016 12:39 PM, &quot;Andre McCurdy&qu=
ot; &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; =
wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jan 2=
2, 2016 at 12:49 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt; wrote:<br>
&gt; in config metadata we can configure busybox based init and device<br>
&gt; initializer ( mdev ) using e.g.<br>
&gt;<br>
&gt; VIRTUAL-RUNTIME_dev_manager =3D &quot;busybox-mdev&quot;<br>
&gt; VIRTUAL-RUNTIME_login_manager =3D &quot;busybox&quot;<br>
&gt; VIRTUAL-RUNTIME_init_manager =3D &quot;busybox&quot;<br>
&gt; VIRTUAL-RUNTIME_initscripts =3D &quot;initscripts&quot;<br>
&gt; VIRTUAL-RUNTIME_keymaps =3D &quot;keymaps&quot;<br>
&gt; DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;sysvinit&quot;<br>
&gt;<br>
&gt; busybox can be used to provide init system<br>
&gt; combined with mdev it makes it a complete init<br>
&gt; system for really tiny systems.<br>
&gt;<br>
&gt; This patch uses above defines to configure features in busybox to enab=
le<br>
&gt; the init system and mdev in a configurable manner<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/busybox/busybox.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 15 +++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/busybox/busybox/init.cfg=C2=A0 |=C2=A0 3 +++<b=
r>
&gt;=C2=A0 meta/recipes-core/busybox/busybox/mdev.cfg=C2=A0 | 11 ++++++++++=
+<br>
&gt;=C2=A0 meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.24.1.bb</a> |=C2=A0 6 ++++++<=
br>
&gt;=C2=A0 meta/recipes-core/busybox/files/inittab=C2=A0 =C2=A0 =C2=A0| 24 =
++++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/busybox/files/rcK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 25 +++++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/busybox/files/rcS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 26 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/busybox/files/runlevel=C2=A0 =C2=A0 | 11 +++++=
++++++<br>
&gt;=C2=A0 8 files changed, 121 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/busybox/init.cfg<br=
>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/busybox/mdev.cfg<br=
>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/files/inittab<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/files/rcK<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/files/rcS<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/files/runlevel<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core=
/busybox/busybox.inc<br>
&gt; index 9541123..e5710f0 100644<br>
&gt; --- a/meta/recipes-core/busybox/busybox.inc<br>
&gt; +++ b/meta/recipes-core/busybox/busybox.inc<br>
&gt; @@ -275,6 +275,21 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfd=
ir}/mdev<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep &quot;CONFIG_INIT=3Dy&quot; ${B}/=
.config; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m=
 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m=
 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m=
 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep &quot=
;CONFIG_FEATURE_USE_INITTAB=3Dy&quot; ${B}/.config; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 install -D -m 0777 ${WORKDIR}/inittab ${D}${sysconfdir}/init=
tab<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 tmp=3D&quot;${SERIAL_CONSOLES}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for i in $tmp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j=3D`echo ${i} | sed s/\;/\ /g`<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label=3D`echo ${i} | sed -e &#39=
;s/tty//&#39; -e &#39;s/^.*;//&#39; -e &#39;s/;.*//&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;tty$label::respawn:${=
base_sbindir}/getty ${j}&quot; &gt;&gt; ${D}${sysconfdir}/inittab<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep -q &quot;CONFIG_SYSLOGD=3Dy&=
quot; ${B}/.config; then<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes=
-core/busybox/busybox/init.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000..006d4c6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/busybox/init.cfg<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +CONFIG_INIT=3Dy<br>
&gt; +CONFIG_FEATURE_USE_INITTAB=3Dy<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes=
-core/busybox/busybox/mdev.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000..6aefe90<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/busybox/mdev.cfg<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +CONFIG_MDEV=3Dy<br>
&gt; +CONFIG_FEATURE_MDEV_CONF=3Dy<br>
&gt; +CONFIG_FEATURE_MDEV_RENAME=3Dy<br>
&gt; +CONFIG_FEATURE_MDEV_RENAME_REGEXP=3Dy<br>
&gt; +CONFIG_FEATURE_MDEV_EXEC=3Dy<br>
&gt; +CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=3Dy<br>
&gt; +<br>
&gt; +CONFIG_SETSID=3Dy<br>
&gt; +CONFIG_CTTYHACK=3Dy<br>
&gt; +<br>
&gt; +CONFIG_FEATURE_SHADOWPASSWDS=3Dy<br>
&gt; diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.=
1.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.24.1.bb</a> b/meta/rec=
ipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">busybox_1.24.1.bb</a><br>
&gt; index 5e19d9c..8adee53 100644<br>
&gt; --- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.24.1.bb</a><br>
&gt; +++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.24.1.bb</a><br>
&gt; @@ -39,6 +39,12 @@ SRC_URI =3D &quot;<a href=3D"http://www.busybox.net=
/downloads/busybox-${PV}.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=
=3D"_blank">http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dt=
arball</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sha256sum.cfg \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://getopts.cfg \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://resize.cfg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@[&quot;&quot;, &quot;file=
://init.cfg&quot;][(d.getVar(&#39;VIRTUAL-RUNTIME_init_manager&#39;, True) =
=3D=3D &#39;busybox&#39;)]} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@[&quot;&quot;, &quot;file=
://mdev.cfg&quot;][(d.getVar(&#39;VIRTUAL-RUNTIME_dev_manager&#39;, True) =
=3D=3D &#39;busybox-mdev&#39;)]} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://inittab \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rcS \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rcK \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://runlevel \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://musl.cfg &quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-co=
re/busybox/files/inittab<br>
&gt; new file mode 100644<br>
&gt; index 0000000..bfec4a7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/files/inittab<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +# This is run first except when booting in single-user mode.<br>
&gt; +<br>
&gt; +# Startup the system<br>
&gt; +null::sysinit:/bin/mount -t proc proc /proc<br>
&gt; +null::sysinit:/bin/mount -t sysfs sysfs /sys<br>
&gt; +null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev<br>
&gt; +null::sysinit:/bin/mount -o remount,rw /<br>
&gt; +null::sysinit:/bin/mkdir -p /dev/pts<br>
&gt; +null::sysinit:/bin/mount -t devpts devpts /dev/pts<br>
&gt; +null::sysinit:/bin/mount -a<br>
&gt; +<br>
&gt; +::sysinit:/etc/init.d/rcS<br>
&gt; +<br>
&gt; +# Stuff to do before rebooting<br>
&gt; +::ctrlaltdel:/sbin/reboot<br>
&gt; +::shutdown:/etc/init.d/rcK<br>
&gt; +::shutdown:/sbin/swapoff -a<br>
&gt; +::shutdown:/bin/umount -a -r<br>
&gt; +<br>
&gt; +# Stuff to do when restarting the init process<br>
&gt; +::restart:/sbin/init<br>
&gt; +<br>
&gt; +# set hostname<br>
&gt; +null::sysinit:/bin/busybox hostname -F /etc/hostname<br>
&gt; diff --git a/meta/recipes-core/busybox/files/rcK b/meta/recipes-core/b=
usybox/files/rcK<br>
&gt; new file mode 100644<br>
&gt; index 0000000..050086e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/files/rcK<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +# Stop all init scripts in /etc/init.d<br>
&gt; +# executing them in reversed numerical order.<br>
&gt; +#<br>
&gt; +for i in /etc/rc6.d/K??*; do<br>
<br>
Running the K?? scripts here is different to the way the Buildroot<br>
initscipts work. It&#39;s also not clear how the order is going to be<br>
reversed?<br>
<br>
Maybe try to work with the Buildroot version as-is, or add some<br>
comments to the commit message explaining why the OE and Buildroot<br>
versions need to differ.<br>
<br>
=C2=A0 <a href=3D"https://git.busybox.net/buildroot/tree/package/initscript=
s/init.d/rcK" rel=3D"noreferrer" target=3D"_blank">https://git.busybox.net/=
buildroot/tree/package/initscripts/init.d/rcK</a><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Ignore dangling symlinks (if any).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -f &quot;$i&quot; ] &amp;&amp; continue<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case &quot;$i&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*.sh)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Source shell script for sp=
eed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trap - INT QUI=
T TSTP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. $i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# No sh extension, so fork s=
ubprocess.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$i stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +done<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/busybox/files/rcS b/meta/recipes-core/b=
usybox/files/rcS<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d18c26b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/files/rcS<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +# Stop all init scripts in /etc/init.d<br>
&gt; +# executing them in reversed numerical order.<br>
<br>
This is a copy of the comment from rcK.<br>
<br>
&gt; +<br>
&gt; +for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Ignore dangling symlinks (if any).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -f &quot;$i&quot; ] &amp;&amp; continue<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case &quot;$i&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*.sh)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Source shell script for sp=
eed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trap - INT QUI=
T TSTP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set stop<br>
<br>
Should that be start? The Buildroot original is:<br>
<br>
=C2=A0 <a href=3D"https://git.busybox.net/buildroot/tree/package/initscript=
s/init.d/rcS" rel=3D"noreferrer" target=3D"_blank">https://git.busybox.net/=
buildroot/tree/package/initscripts/init.d/rcS</a><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. $i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# No sh extension, so fork s=
ubprocess.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$i start<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +done<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/busybox/files/runlevel b/meta/recipes-c=
ore/busybox/files/runlevel<br>
&gt; new file mode 100644<br>
&gt; index 0000000..866f3b5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/files/runlevel<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +#!/bin/sh<br>
&gt; +# busybox init does not have LSB ( sysvinit ) like initlevels<br>
&gt; +# so lets fake it to 5 which is what we default anyway<br>
&gt; +# this helps with opkg post installs where it tries to invoke<br>
&gt; +# update-rc.d ad post install step.<br>
&gt; +# for package upgrades<br>
&gt; +# See code in update-rc.d around line 190 where it calls runlevel<br>
&gt; +# program<br>
&gt; +#<br>
&gt; +echo &quot;5&quot;<br>
&gt; +<br>
&gt; --<br>
&gt; 2.7.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1141f0c69b7067052a2e2b35--
