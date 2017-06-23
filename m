Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id E0EB178055
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 19:04:48 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id t76so1809305ywc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tXXZw1y7aAtotq5VIcRslv1HvUIQVUjfMLDbABk7sa4=;
	b=SX3u8CvfK89ggjGyRk+uArPhzK6Ab63b92LUP7x0VaYIDNf4p52m/vaGUQjdvuuCAP
	nbyuSTfVT1hk3BOF6BIgK9R1G3DeJmlxr9La+Lr5UhX50igBwSR2hb+g49peEMbHhOWY
	r4o7TGxFKqNPtjbDls6dzAKQ3Zu5fkAytlUdYGGLyz9rh4wJbvpR2DqVEFztbB3cpjhE
	rlQg3CHesTHX+Dq0Dx/WN5pZqR2F8o2K2mwc96BYgPeENwCIT5WGkKvu//9QuSLwFykL
	Nc74B8zQjiE9WakN8PoosPEgUtXWpDanZ7WQmjERWed1z6MjGeNCn/Q1VwzAkOJvcUT0
	jOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tXXZw1y7aAtotq5VIcRslv1HvUIQVUjfMLDbABk7sa4=;
	b=j4ZkKGulclznX5HKbrMaX3LyFVeblB1lekX0UlazmgqGwMjfqQ8jf6TzLxanDMF5vd
	TxT/oQ33re4dGifCSu3+nEee36vCXingjcv0JQatjJFXoC5sgMch+fK2ieme78ZK1dTp
	JtWmSxAyB6CSXxdF4PboIa85H97EYJcrAHJ/GLprjbHaRMbjwugbtjVtcm3ix3rda8nB
	Ian19Bcj3lbAw9ghGirsrJ8Go4XK6ElU3XYEs3lkgTDU0re6c9HtE5Yf/0XfmXe28mGa
	Pao7SsNWLOtyJDG9qLaqsJyAg1SeB0pi2CeIyxh0V6zyWPwyL+LrLqUJ1MOlGh5xG67S
	eM7A==
X-Gm-Message-State: AKS2vOxHGzUaMfHS0/fs5w9K5OWaZjcfJrpluO+okMiTgnR6uG+Z88ew
	HnPH2fqz8ETmjUAjAQ04enWsEKqizQ==
X-Received: by 10.129.128.132 with SMTP id q126mr6886055ywf.259.1498244689556; 
	Fri, 23 Jun 2017 12:04:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 23 Jun 2017 12:04:48 -0700 (PDT)
In-Reply-To: <20170427214937.30754-1-Martin.Jansa@gmail.com>
References: <20170427214937.30754-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Jun 2017 21:04:48 +0200
Message-ID: <CA+chaQdrBPRG6LTdi7L3hYY0V2jELqVZva1MtJvVwcmfRs4LeQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Subject: Re: [PATCH] v86d, qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of fbsetup init script
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
X-List-Received-Date: Fri, 23 Jun 2017 19:04:50 -0000
Content-Type: multipart/alternative; boundary="94eb2c034cb281fc9a0552a54623"

--94eb2c034cb281fc9a0552a54623
Content-Type: text/plain; charset="UTF-8"

ping

On Thu, Apr 27, 2017 at 11:49 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * also add UVESA_MODE variable for easier change of resolution and respect
> it in QB_KERNEL_CMDLINE_APPEND
>   as well
> * don't use init script just to call modprobe
> * I wasn't able to test this all the way with runqemu, because runqemu
>   doesn't work on my system, but I've verified that the right params
>   appear there and that I can easily change UVESA_MODE from
>   conf/local.conf, the modules.d and modprobe.d files look OK:
>   OE qemux86@ ~/build/oe-core/tmp-glibc/deploy/images/qemux86/core-
> image-sato-qemux86-20170427212613.rootfs
>   $ cat etc/modules-load.d/uvesafb.conf
>   uvesafb
>
>   OE qemux86@ ~/build/oe-core/tmp-glibc/deploy/images/qemux86/core-
> image-sato-qemux86-20170427212613.rootfs
>   $ cat etc/modprobe.d/uvesafb.conf
>   options uvesafb mode_option=1600x1200-32
>
>   so I'll be able to drop this KERNEL_MODULE_AUTOLOAD +
>   KERNEL_MODULE_PROBECONF from my DISTRO conf.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/qemuboot-x86.inc |  7 +++++-
>  meta/recipes-bsp/v86d/v86d/fbsetup         |  3 ---
>  meta/recipes-bsp/v86d/v86d/uvesafb.conf    |  2 --
>  meta/recipes-bsp/v86d/v86d_0.1.10.bb       | 36
> ------------------------------
>  4 files changed, 6 insertions(+), 42 deletions(-)
>  delete mode 100755 meta/recipes-bsp/v86d/v86d/fbsetup
>  delete mode 100644 meta/recipes-bsp/v86d/v86d/uvesafb.conf
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
> b/meta/conf/machine/include/qemuboot-x86.inc
> index 06ac983d4d..18f755a5d0 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -10,6 +10,11 @@ QB_CPU_KVM_x86-64 = "-cpu kvm64"
>
>  QB_AUDIO_DRV = "alsa"
>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
> -QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32
> oprofile.timer=1 uvesafb.task_timeout=-1"
> +QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE}
> oprofile.timer=1 uvesafb.task_timeout=-1"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of
> entropy
>  QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device
> virtio-rng-pci"
> +
> +KERNEL_MODULE_AUTOLOAD += "uvesafb"
> +KERNEL_MODULE_PROBECONF += "uvesafb"
> +UVESA_MODE ?= "640x480-32"
> +module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
> diff --git a/meta/recipes-bsp/v86d/v86d/fbsetup
> b/meta/recipes-bsp/v86d/v86d/fbsetup
> deleted file mode 100755
> index 2a409cc529..0000000000
> --- a/meta/recipes-bsp/v86d/v86d/fbsetup
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -/sbin/modprobe uvesafb
> diff --git a/meta/recipes-bsp/v86d/v86d/uvesafb.conf
> b/meta/recipes-bsp/v86d/v86d/uvesafb.conf
> deleted file mode 100644
> index 43789755d3..0000000000
> --- a/meta/recipes-bsp/v86d/v86d/uvesafb.conf
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Load uvesafb.ko at boot
> -uvesafb
> diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/
> v86d_0.1.10.bb
> index eab466d30d..579a0a27eb 100644
> --- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> +++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> @@ -11,8 +11,6 @@ PR = "r2"
>
>  SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
>             file://Update-x86emu-from-X.org.patch \
> -           file://fbsetup \
> -           file://uvesafb.conf \
>             file://ar-from-env.patch \
>             file://aarch64-host.patch \
>  "
> @@ -23,9 +21,6 @@ SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3
> b4502badeb0d9194b4bd81241d25
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>
> -INITSCRIPT_NAME = "fbsetup"
> -INITSCRIPT_PARAMS = "start 0 S ."
> -
>  do_configure () {
>         ./configure --with-x86emu
>  }
> @@ -37,35 +32,4 @@ do_compile () {
>  do_install () {
>         install -d ${D}${base_sbindir}
>         install v86d ${D}${base_sbindir}/
> -
> -        # Only install fbsetup script if 'sysvinit' is in DISTRO_FEATURES
> -        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)};
> then
> -            install -d ${D}${sysconfdir}/init.d/
> -            install -m 0755 ${WORKDIR}/fbsetup ${D}${sysconfdir}/init.d/
> fbsetup
> -        fi
> -
> -        # Install systemd related configuration file
> -        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
> -            install -d ${D}${sysconfdir}/modules-load.d
> -            install -m 0644 ${WORKDIR}/uvesafb.conf
> ${D}${sysconfdir}/modules-load.d
> -        fi
> -}
> -
> -# As the recipe doesn't inherit systemd.bbclass, we need to set this
> variable
> -# manually to avoid unnecessary postinst/preinst generated.
> -python __anonymous() {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,
> d):
> -        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> -}
> -
> -inherit update-rc.d
> -
> -PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_
> FEATURES','systemd','systemd-systemctl-native','',d)}"
> -pkg_postinst_${PN} () {
> -       if ${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','true','false',d)}; then
> -               if [ -n "$D" ]; then
> -                       OPTS="--root=$D"
> -               fi
> -               systemctl $OPTS mask fbsetup.service
> -       fi
>  }
> --
> 2.12.2
>
>

--94eb2c034cb281fc9a0552a54623
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Apr 27, 2017 at 11:49 PM, Martin Jansa <span dir=3D"ltr">=
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* also =
add UVESA_MODE variable for easier change of resolution and respect it in Q=
B_KERNEL_CMDLINE_APPEND<br>
=C2=A0 as well<br>
* don&#39;t use init script just to call modprobe<br>
* I wasn&#39;t able to test this all the way with runqemu, because runqemu<=
br>
=C2=A0 doesn&#39;t work on my system, but I&#39;ve verified that the right =
params<br>
=C2=A0 appear there and that I can easily change UVESA_MODE from<br>
=C2=A0 conf/local.conf, the modules.d and modprobe.d files look OK:<br>
=C2=A0 OE qemux86@ ~/build/oe-core/tmp-glibc/<wbr>deploy/images/qemux86/cor=
e-<wbr>image-sato-qemux86-<wbr>20170427212613.rootfs<br>
=C2=A0 $ cat etc/modules-load.d/uvesafb.<wbr>conf<br>
=C2=A0 uvesafb<br>
<br>
=C2=A0 OE qemux86@ ~/build/oe-core/tmp-glibc/<wbr>deploy/images/qemux86/cor=
e-<wbr>image-sato-qemux86-<wbr>20170427212613.rootfs<br>
=C2=A0 $ cat etc/modprobe.d/uvesafb.conf<br>
=C2=A0 options uvesafb mode_option=3D1600x1200-32<br>
<br>
=C2=A0 so I&#39;ll be able to drop this KERNEL_MODULE_AUTOLOAD +<br>
=C2=A0 KERNEL_MODULE_PROBECONF from my DISTRO conf.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/<wbr>qemuboot-x86.inc |=C2=A0 7 +++++-<br>
=C2=A0meta/recipes-bsp/v86d/v86d/<wbr>fbsetup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 3 ---<br>
=C2=A0meta/recipes-bsp/v86d/v86d/<wbr>uvesafb.conf=C2=A0 =C2=A0 |=C2=A0 2 -=
-<br>
=C2=A0meta/recipes-bsp/v86d/<a href=3D"http://v86d_0.1.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">v86d_0.<wbr>1.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 36 ------------------------------<br>
=C2=A04 files changed, 6 insertions(+), 42 deletions(-)<br>
=C2=A0delete mode 100755 meta/recipes-bsp/v86d/v86d/<wbr>fbsetup<br>
=C2=A0delete mode 100644 meta/recipes-bsp/v86d/v86d/<wbr>uvesafb.conf<br>
<br>
diff --git a/meta/conf/machine/include/<wbr>qemuboot-x86.inc b/meta/conf/ma=
chine/include/<wbr>qemuboot-x86.inc<br>
index 06ac983d4d..18f755a5d0 100644<br>
--- a/meta/conf/machine/include/<wbr>qemuboot-x86.inc<br>
+++ b/meta/conf/machine/include/<wbr>qemuboot-x86.inc<br>
@@ -10,6 +10,11 @@ QB_CPU_KVM_x86-64 =3D &quot;-cpu kvm64&quot;<br>
<br>
=C2=A0QB_AUDIO_DRV =3D &quot;alsa&quot;<br>
=C2=A0QB_AUDIO_OPT =3D &quot;-soundhw ac97,es1370&quot;<br>
-QB_KERNEL_CMDLINE_APPEND =3D &quot;vga=3D0 uvesafb.mode_option=3D640x480-3=
2 oprofile.timer=3D1 uvesafb.task_timeout=3D-1&quot;<br>
+QB_KERNEL_CMDLINE_APPEND =3D &quot;vga=3D0 uvesafb.mode_option=3D${UVESA_<=
wbr>MODE} oprofile.timer=3D1 uvesafb.task_timeout=3D-1&quot;<br>
=C2=A0# Add the &#39;virtio-rng-pci&#39; device otherwise the guest may run=
 out of entropy<br>
=C2=A0QB_OPT_APPEND =3D &quot;-vga vmware -show-cursor -usb -usbdevice tabl=
et -device virtio-rng-pci&quot;<br>
+<br>
+KERNEL_MODULE_AUTOLOAD +=3D &quot;uvesafb&quot;<br>
+KERNEL_MODULE_PROBECONF +=3D &quot;uvesafb&quot;<br>
+UVESA_MODE ?=3D &quot;640x480-32&quot;<br>
+module_conf_uvesafb =3D &quot;options uvesafb mode_option=3D${UVESA_MODE}&=
quot;<br>
diff --git a/meta/recipes-bsp/v86d/v86d/<wbr>fbsetup b/meta/recipes-bsp/v86=
d/v86d/<wbr>fbsetup<br>
deleted file mode 100755<br>
index 2a409cc529..0000000000<br>
--- a/meta/recipes-bsp/v86d/v86d/<wbr>fbsetup<br>
+++ /dev/null<br>
@@ -1,3 +0,0 @@<br>
-#!/bin/sh<br>
-<br>
-/sbin/modprobe uvesafb<br>
diff --git a/meta/recipes-bsp/v86d/v86d/<wbr>uvesafb.conf b/meta/recipes-bs=
p/v86d/v86d/<wbr>uvesafb.conf<br>
deleted file mode 100644<br>
index 43789755d3..0000000000<br>
--- a/meta/recipes-bsp/v86d/v86d/<wbr>uvesafb.conf<br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-# Load uvesafb.ko at boot<br>
-uvesafb<br>
diff --git a/meta/recipes-bsp/v86d/<a href=3D"http://v86d_0.1.10.bb" rel=3D=
"noreferrer" target=3D"_blank">v86d_<wbr>0.1.10.bb</a> b/meta/recipes-bsp/v=
86d/<a href=3D"http://v86d_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">=
v86d_<wbr>0.1.10.bb</a><br>
index eab466d30d..579a0a27eb 100644<br>
--- a/meta/recipes-bsp/v86d/<a href=3D"http://v86d_0.1.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">v86d_<wbr>0.1.10.bb</a><br>
+++ b/meta/recipes-bsp/v86d/<a href=3D"http://v86d_0.1.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">v86d_<wbr>0.1.10.bb</a><br>
@@ -11,8 +11,6 @@ PR =3D &quot;r2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://distfiles.gentoo.org/distfiles/${=
BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://distfiles.gentoo.o=
rg/<wbr>distfiles/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Update-x86emu-from-X.<wbr>=
org.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fbsetup \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://uvesafb.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ar-from-env.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://aarch64-host.patch \<br>
=C2=A0&quot;<br>
@@ -23,9 +21,6 @@ SRC_URI[sha256sum] =3D &quot;<wbr>634964ae18ef68c8493add2=
ce150e3<wbr>b4502badeb0d9194b4bd81241d25<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(i.86|x86_64).*-linux&#39;<br>
<br>
-INITSCRIPT_NAME =3D &quot;fbsetup&quot;<br>
-INITSCRIPT_PARAMS =3D &quot;start 0 S .&quot;<br>
-<br>
=C2=A0do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./configure --with-x86emu<br>
=C2=A0}<br>
@@ -37,35 +32,4 @@ do_compile () {<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_sbindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install v86d ${D}${base_sbindir}/<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Only install fbsetup script if &#39;sysvinit=
&#39; is in DISTRO_FEATURES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATU=
RES&#39;,&#39;sysvinit&#39;,&#39;true&#39;,&#39;<wbr>false&#39;,d)}; then<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/ini=
t.d/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/fbset=
up ${D}${sysconfdir}/init.d/<wbr>fbsetup<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install systemd related configuration file<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATU=
RES&#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;<wbr>false&#39;,d)}; then<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/mod=
ules-<wbr>load.d<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/uvesa=
fb.conf ${D}${sysconfdir}/modules-<wbr>load.d<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-}<br>
-<br>
-# As the recipe doesn&#39;t inherit systemd.bbclass, we need to set this v=
ariable<br>
-# manually to avoid unnecessary postinst/preinst generated.<br>
-python __anonymous() {<br>
-=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#3=
9;sysvinit&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;INHIBIT_UPDATERCD_<wbr>BBCLASS&=
quot;, &quot;1&quot;)<br>
-}<br>
-<br>
-inherit update-rc.d<br>
-<br>
-PACKAGE_WRITE_DEPS_append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_<wbr=
>FEATURES&#39;,&#39;systemd&#39;,&#39;systemd-<wbr>systemctl-native&#39;,&#=
39;&#39;,d)}&quot;<br>
-pkg_postinst_${PN} () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;,&#39;systemd sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$D&qu=
ot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0OPTS=3D&quot;--root=3D$D&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS mas=
k fbsetup.service<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.2<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c034cb281fc9a0552a54623--
