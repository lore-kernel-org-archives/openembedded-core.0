Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qgst1-0002PA-DZ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 08:25:31 +0200
Received: by iwn4 with SMTP id 4so5410555iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 23:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=jYqiR0FaBpujcQejNl0Wi1Rh/N7dAQi+iwkZEw67C5g=;
	b=wR1XT0cSSpis03QUGfK7yiorckJm+BgX/Hrh3muSwLKiGKkjxeBrWdM8DAjto2cPG9
	NQJsIBbq7Mm2v2xExWhqjFBVZ3zlPUoKRjLKt7b5Jo0yeFy3+oqdPB3tz51lpOkr4GV/
	CvC1/1OWOKec3Fy61n7JgzbwzjYAvIiDWLG4k=
Received: by 10.42.18.5 with SMTP id v5mr626196ica.450.1310538092527;
	Tue, 12 Jul 2011 23:21:32 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f13sm8724416ibe.10.2011.07.12.23.21.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 23:21:31 -0700 (PDT)
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
	<bd724f86b719044e4e7958999893f8fbf3801f76.1310497097.git.nitin.a.kamble@intel.com>
In-Reply-To: <bd724f86b719044e4e7958999893f8fbf3801f76.1310497097.git.nitin.a.kamble@intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <B49A8790-9DF0-4DAA-A95A-EC2E9F854CCB@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2011 23:22:07 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] udev-172: add a newer version for newer kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 06:25:31 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 12, 2011, at 12:02 PM, nitin.a.kamble@intel.com wrote:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> the 2.6.38 kernel has dropped v4lv1 support. and udev-168 fails to
> compile because of that. So add a newer 172 version of udev to work with
> 2.6.38 kernel.
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> meta/recipes-core/udev/udev-172/init              |   59 +++++++++
> meta/recipes-core/udev/udev-172/local.rules       |   35 ++++++
> meta/recipes-core/udev/udev-172/permissions.rules |  131 +++++++++++++++++=
++++
> meta/recipes-core/udev/udev-172/run.rules         |   14 +++
> meta/recipes-core/udev/udev-172/udev.rules        |  116 +++++++++++++++++=
+
> meta/recipes-core/udev/udev_172.bb                |    6 +
> 6 files changed, 361 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-core/udev/udev-172/init
> create mode 100644 meta/recipes-core/udev/udev-172/local.rules
> create mode 100644 meta/recipes-core/udev/udev-172/permissions.rules
> create mode 100644 meta/recipes-core/udev/udev-172/run.rules
> create mode 100644 meta/recipes-core/udev/udev-172/udev.rules
> create mode 100644 meta/recipes-core/udev/udev_172.bb

Meta-oe ha 171 it would be nice if you could look inti it and incorporate an=
y differences into 172
Then we can retire 171 from meta-oe
>=20
> diff --git a/meta/recipes-core/udev/udev-172/init b/meta/recipes-core/udev=
/udev-172/init
> new file mode 100644
> index 0000000..9ce95ee
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev-172/init
> @@ -0,0 +1,59 @@
> +#!/bin/sh -e
> +
> +### BEGIN INIT INFO
> +# Provides:          udev
> +# Required-Start:    mountvirtfs
> +# Required-Stop:    =20
> +# Default-Start:     S
> +# Default-Stop:
> +# Short-Description: Start udevd, populate /dev and load drivers.
> +### END INIT INFO
> +
> +export TZ=3D/etc/localtime
> +
> +[ -d /sys/class ] || exit 1
> +[ -r /proc/mounts ] || exit 1
> +[ -x /sbin/udevd ] || exit 1
> +[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
> +
> +kill_udevd() {
> +        if [ -x /sbin/pidof ]; then
> +                pid=3D`/sbin/pidof -x udevd`
> +                [ -n "$pid" ] && kill $pid
> +        fi
> +}
> +
> +export ACTION=3Dadd
> +# propagate /dev from /sys
> +echo -n "Starting udev"
> +
> +# mount the tmpfs on /dev, if not already done
> +LANG=3DC awk "\$2 =3D=3D \"/dev\" && \$4 =3D=3D \"tmpfs\" { exit 1 }" /pr=
oc/mounts && {
> +        mount -n -o mode=3D0755 -t tmpfs none "/dev"
> +        mkdir -m 0755 /dev/pts
> +        mkdir -m 1777 /dev/shm
> +}
> +
> +if [ -e /etc/dev.tar ]; then
> +    (cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
> +    not_first_boot=3D1
> +fi
> +
> +# make_extra_nodes
> +kill_udevd > "/dev/null" 2>&1
> +
> +        # trigger the sorted events
> +        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
> +        /sbin/udevd -d
> +
> +        /sbin/udevadm control --env=3DSTARTUP=3D1
> +        if [ "$not_first_boot" !=3D "" ];then
> +            /sbin/udevadm trigger --subsystem-nomatch=3Dtty --subsystem-n=
omatch=3Dmem --subsystem-nomatch=3Dvc --subsystem-nomatch=3Dvtconsole --subs=
ystem-nomatch=3Dmisc --subsystem-nomatch=3Ddcon --subsystem-nomatch=3Dpci_bu=
s  --subsystem-nomatch=3Dgraphics  --subsystem-nomatch=3Dbacklight --subsyst=
em-nomatch=3Dvideo4linux  --subsystem-nomatch=3Dplatform
> +            (/sbin/udevadm settle --timeout=3D3; /sbin/udevadm control --=
env=3DSTARTUP=3D)&
> +        else
> +            /sbin/udevadm trigger
> +            /sbin/udevadm settle
> +        fi
> +
> +echo
> +exit 0
> diff --git a/meta/recipes-core/udev/udev-172/local.rules b/meta/recipes-co=
re/udev/udev-172/local.rules
> new file mode 100644
> index 0000000..625e49a
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev-172/local.rules
> @@ -0,0 +1,35 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing=
 node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Media automounting
> +SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add"    RUN+=3D"/etc/udev/scripts/mo=
unt.sh"
> +SUBSYSTEM=3D=3D"block", ACTION=3D=3D"remove" RUN+=3D"/etc/udev/scripts/mo=
unt.sh"
> +
> +# Handle network interface setup
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add" RUN+=3D"/etc/udev/scripts/network=
.sh"
> +SUBSYSTEM=3D=3D"net", ACTION=3D=3D"remove" RUN+=3D"/etc/udev/scripts/netw=
ork.sh"
> +
> +# The first framebuffer is symlinked to /dev/fb                      =20
> +KERNEL=3D=3D"fb0", SYMLINK+=3D"fb"
> +
> +# The first rtc device is symlinked to /dev/rtc
> +KERNEL=3D=3D"rtc0", SYMLINK+=3D"rtc"
> +
> +# Try and modprobe for drivers for new hardware
> +ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", RU=
N+=3D"/sbin/modprobe $env{MODALIAS}"
> +
> +# Create a symlink to any touchscreen input device
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D"=
input:*-e0*,3,*a0,1,*18,*", SYMLINK+=3D"input/touchscreen0"
> +
> diff --git a/meta/recipes-core/udev/udev-172/permissions.rules b/meta/reci=
pes-core/udev/udev-172/permissions.rules
> new file mode 100644
> index 0000000..205b733
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev-172/permissions.rules
> @@ -0,0 +1,131 @@
> +ACTION!=3D"add", GOTO=3D"permissions_end"
> +
> +# workarounds needed to synchronize with sysfs
> +# only needed for kernels < v2.6.18-rc1
> +ENV{PHYSDEVPATH}!=3D"?*", ENV{PHYSDEVBUS}=3D=3D"?*",    WAIT_FOR_SYSFS=3D=
"bus"
> +SUBSYSTEM=3D=3D"scsi", KERNEL=3D=3D"[0-9]*:[0-9]*",    WAIT_FOR_SYSFS=3D"=
ioerr_cnt"
> +# only needed for kernels < 2.6.16
> +SUBSYSTEM=3D=3D"net",                WAIT_FOR_SYSFS=3D"address"
> +# only needed for kernels < 2.6.17
> +SUBSYSTEM=3D=3D"net", ENV{DRIVER}=3D=3D"?*",        WAIT_FOR_SYSFS=3D"dev=
ice/driver"
> +
> +# devices needed to load the drivers providing them
> +KERNEL=3D=3D"tun",                    OPTIONS+=3D"ignore_remove"
> +KERNEL=3D=3D"ppp",                    OPTIONS+=3D"ignore_remove"
> +KERNEL=3D=3D"loop[0-9]*",                OPTIONS+=3D"ignore_remove"
> +
> +# default permissions for block devices
> +SUBSYSTEM=3D=3D"block",                GROUP=3D"disk"
> +# the aacraid driver is broken and reports that disks removable (see #404=
927)
> +SUBSYSTEM=3D=3D"block", ATTRS{removable}=3D=3D"1", \
> +    DRIVERS!=3D"aacraid",            GROUP=3D"floppy"
> +# all block devices on these buses are "removable"
> +SUBSYSTEM=3D=3D"block", SUBSYSTEMS=3D=3D"usb|ieee1394|mmc|pcmcia", GROUP=3D=
"floppy"
> +
> +# IDE devices
> +KERNEL=3D=3D"hd[a-z]|pcd[0-9]*",            DRIVERS=3D=3D"ide-cdrom|pcd",=
 \
> +    IMPORT{program}=3D"cdrom_id --export $tempnode"
> +ENV{ID_CDROM}=3D=3D"?*",                GROUP=3D"cdrom"
> +KERNEL=3D=3D"ht[0-9]*",                GROUP=3D"tape"
> +KERNEL=3D=3D"nht[0-9]*",                GROUP=3D"tape"
> +
> +# SCSI devices
> +KERNEL=3D=3D"sr[0-9]*", IMPORT{program}=3D"cdrom_id --export $tempnode"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"1",                GROUP=3D"tap=
e"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"3", ATTRS{vendor}=3D=3D"HP",   =
 GROUP=3D"scanner"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"3", ATTRS{vendor}=3D=3D"Epson",=
    GROUP=3D"scanner"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"3", ATTRS{vendor}=3D=3D"EPSON",=
    GROUP=3D"scanner"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"4",                GROUP=3D"cdr=
om"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"5",                GROUP=3D"cdr=
om"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"6",                GROUP=3D"sca=
nner"
> +SUBSYSTEMS=3D=3D"scsi", ATTRS{type}=3D=3D"8",                GROUP=3D"tap=
e"
> +
> +# USB devices
> +KERNEL=3D=3D"legousbtower*",    MODE=3D"0666"
> +KERNEL=3D=3D"lp[0-9]*", SUBSYSTEMS=3D=3D"usb",        GROUP=3D"lp"
> +
> +# usbfs-like devices
> +SUBSYSTEM=3D=3D"usb", ENV{DEVTYPE}=3D=3D"usb_device", \
> +                MODE=3D"0664"
> +
> +# iRiver music players
> +SUBSYSTEM=3D=3D"usb", ENV{DEVTYPE}=3D=3D"usb_device",    GROUP=3D"plugdev=
", \
> +    ATTRS{idVendor}=3D=3D"4102", ATTRS{idProduct}=3D=3D"10[01][135789]"
> +
> +# serial devices
> +SUBSYSTEM=3D=3D"tty",                GROUP=3D"dialout"
> +SUBSYSTEM=3D=3D"capi",                GROUP=3D"dialout"
> +SUBSYSTEM=3D=3D"slamr",                GROUP=3D"dialout"
> +SUBSYSTEM=3D=3D"zaptel",                GROUP=3D"dialout"
> +
> +# vc devices (all members of the tty subsystem)
> +KERNEL=3D=3D"ptmx",            MODE=3D"0666",    GROUP=3D"root"
> +KERNEL=3D=3D"console",        MODE=3D"0600",    GROUP=3D"root"
> +KERNEL=3D=3D"tty",            MODE=3D"0666",    GROUP=3D"root"
> +KERNEL=3D=3D"tty[0-9]*",                GROUP=3D"root"
> +KERNEL=3D=3D"pty*",            MODE=3D"0666",    GROUP=3D"tty"
> +
> +# video devices
> +SUBSYSTEM=3D=3D"video4linux",            GROUP=3D"video"
> +SUBSYSTEM=3D=3D"drm",                GROUP=3D"video"
> +SUBSYSTEM=3D=3D"dvb",                GROUP=3D"video"
> +SUBSYSTEM=3D=3D"em8300",                GROUP=3D"video"
> +SUBSYSTEM=3D=3D"graphics",                GROUP=3D"video"
> +SUBSYSTEM=3D=3D"nvidia",                GROUP=3D"video"
> +
> +# misc devices
> +KERNEL=3D=3D"random",        MODE=3D"0666"
> +KERNEL=3D=3D"urandom",        MODE=3D"0666"
> +KERNEL=3D=3D"mem",            MODE=3D"0640",    GROUP=3D"kmem"
> +KERNEL=3D=3D"kmem",            MODE=3D"0640",    GROUP=3D"kmem"
> +KERNEL=3D=3D"port",            MODE=3D"0640",    GROUP=3D"kmem"
> +KERNEL=3D=3D"full",            MODE=3D"0666"
> +KERNEL=3D=3D"null",            MODE=3D"0666"
> +KERNEL=3D=3D"zero",            MODE=3D"0666"
> +KERNEL=3D=3D"inotify",        MODE=3D"0666"
> +KERNEL=3D=3D"sgi_fetchop",        MODE=3D"0666"
> +KERNEL=3D=3D"sonypi",        MODE=3D"0666"
> +KERNEL=3D=3D"agpgart",                GROUP=3D"video"
> +KERNEL=3D=3D"nvram",                GROUP=3D"nvram"
> +KERNEL=3D=3D"rtc|rtc[0-9]*",            GROUP=3D"audio"
> +KERNEL=3D=3D"tpm*",            MODE=3D"0600",    OWNER=3D"tss", GROUP=3D"=
tss"
> +KERNEL=3D=3D"fuse",                    GROUP=3D"fuse"
> +KERNEL=3D=3D"kqemu",        MODE=3D"0666"
> +KERNEL=3D=3D"kvm",                    GROUP=3D"kvm"
> +KERNEL=3D=3D"tun",            MODE=3D"0666",
> +
> +KERNEL=3D=3D"cdemu[0-9]*",                GROUP=3D"cdrom"
> +KERNEL=3D=3D"pktcdvd[0-9]*",            GROUP=3D"cdrom"
> +KERNEL=3D=3D"pktcdvd",        MODE=3D"0644"
> +
> +KERNEL=3D=3D"uverbs*",                GROUP=3D"rdma"
> +KERNEL=3D=3D"ucm*",                    GROUP=3D"rdma"
> +KERNEL=3D=3D"rdma_ucm",                GROUP=3D"rdma"
> +
> +# printers and parallel devices
> +SUBSYSTEM=3D=3D"printer",                GROUP=3D"lp"
> +SUBSYSTEM=3D=3D"ppdev",                GROUP=3D"lp"
> +KERNEL=3D=3D"irlpt*",                GROUP=3D"lp"
> +KERNEL=3D=3D"pt[0-9]*",                GROUP=3D"tape"
> +KERNEL=3D=3D"pht[0-9]*",                GROUP=3D"tape"
> +
> +# sound devices
> +SUBSYSTEM=3D=3D"sound",                GROUP=3D"audio"
> +
> +# ieee1394 devices      =20
> +KERNEL=3D=3D"raw1394",                GROUP=3D"disk"
> +KERNEL=3D=3D"dv1394*",                GROUP=3D"video"
> +KERNEL=3D=3D"video1394*",                GROUP=3D"video"
> +
> +# input devices
> +KERNEL=3D=3D"event[0-9]*", ATTRS{name}=3D=3D"*dvb*|*DVB*|* IR *" \
> +                MODE=3D"0664",    GROUP=3D"video"
> +KERNEL=3D=3D"js[0-9]*",        MODE=3D"0664"
> +KERNEL=3D=3D"lirc[0-9]*",                GROUP=3D"video"
> +
> +# AOE character devices
> +SUBSYSTEM=3D=3D"aoe",        MODE=3D"0220",    GROUP=3D"disk"
> +SUBSYSTEM=3D=3D"aoe", KERNEL=3D=3D"err", MODE=3D"0440"
> +
> +LABEL=3D"permissions_end"
> +
> diff --git a/meta/recipes-core/udev/udev-172/run.rules b/meta/recipes-core=
/udev/udev-172/run.rules
> new file mode 100644
> index 0000000..75d7137
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev-172/run.rules
> @@ -0,0 +1,14 @@
> +# debugging monitor
> +RUN+=3D"socket:/org/kernel/udev/monitor"
> +
> +# run a command on remove events
> +ACTION=3D=3D"remove", ENV{REMOVE_CMD}!=3D"", RUN+=3D"$env{REMOVE_CMD}"
> +
> +# ignore the events generated by virtual consoles
> +KERNEL=3D=3D"ptmx",        OPTIONS+=3D"last_rule"
> +KERNEL=3D=3D"console",    OPTIONS+=3D"last_rule"
> +KERNEL=3D=3D"tty"    ,    OPTIONS+=3D"last_rule"
> +KERNEL=3D=3D"tty[0-9]*",    OPTIONS+=3D"last_rule"
> +KERNEL=3D=3D"pty*",        OPTIONS+=3D"last_rule"
> +SUBSYSTEM=3D=3D"vc",    OPTIONS+=3D"last_rule"
> +
> diff --git a/meta/recipes-core/udev/udev-172/udev.rules b/meta/recipes-cor=
e/udev/udev-172/udev.rules
> new file mode 100644
> index 0000000..a19d4a0
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev-172/udev.rules
> @@ -0,0 +1,116 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing=
 node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# workaround for devices which do not report media changes
> +SUBSYSTEMS=3D=3D"ide", KERNEL=3D=3D"hd[a-z]", ATTR{removable}=3D=3D"1", \=

> +    ENV{ID_MODEL}=3D=3D"IOMEGA_ZIP*",    NAME=3D"%k", OPTIONS+=3D"all_par=
titions"
> +SUBSYSTEMS=3D=3D"ide", KERNEL=3D=3D"hd[a-z]", ATTRS{media}=3D=3D"floppy",=
 \
> +    OPTIONS+=3D"all_partitions"
> +
> +# SCSI devices
> +SUBSYSTEMS=3D=3D"scsi", KERNEL=3D=3D"sr[0-9]*",    NAME=3D"scd%n", SYMLIN=
K+=3D"sr%n"
> +
> +# USB devices
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"auer[0-9]*",    NAME=3D"usb/%k"
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"cpad[0-9]*",    NAME=3D"usb/%k"
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"dabusb*",        NAME=3D"usb/%k"
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"hiddev*",        NAME=3D"usb/%k"
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"legousbtower*",    NAME=3D"usb/%k"
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"lp[0-9]*",        NAME=3D"usb/%k"
> +SUBSYSTEMS=3D=3D"usb", KERNEL=3D=3D"ttyUSB*", \
> +    ATTRS{product}=3D=3D"Palm Handheld*|Handspring Visor|palmOne Handheld=
", \
> +                    SYMLINK+=3D"pilot"
> +
> +# usbfs-like devices
> +SUBSYSTEM=3D=3D"usb_device",    PROGRAM=3D"/bin/sh -c 'K=3D%k; K=3D$${K#u=
sbdev}; printf bus/usb/%%03i/%%03i $${K%%%%.*} $${K#*.}'", ACTION=3D=3D"add"=
, \
> +                NAME=3D"%c"
> +SUBSYSTEM=3D=3D"usb", ENV{DEVTYPE}=3D=3D"usb_device",    NAME=3D"bus/usb/=
$env{BUSNUM}/$env{DEVNUM}"
> +
> +# serial devices
> +KERNEL=3D=3D"capi",            NAME=3D"capi20", SYMLINK+=3D"isdn/capi20"
> +KERNEL=3D=3D"capi[0-9]*",        NAME=3D"capi/%n"
> +
> +# video devices
> +KERNEL=3D=3D"dvb*",            PROGRAM=3D"/bin/sh -c 'K=3D%k; K=3D$${K#dv=
b}; printf dvb/adapter%%i/%%s $${K%%%%.*} $${K#*.}", ACTION=3D=3D"add", \
> +                NAME=3D"%c"
> +KERNEL=3D=3D"card[0-9]*",        NAME=3D"dri/%k"
> +
> +# misc devices
> +KERNEL=3D=3D"hw_random",        NAME=3D"hwrng"
> +KERNEL=3D=3D"tun",            NAME=3D"net/%k"
> +KERNEL=3D=3D"evtchn",        NAME=3D"xen/%k"
> +
> +KERNEL=3D=3D"cdemu[0-9]*",        NAME=3D"cdemu/%n"
> +KERNEL=3D=3D"pktcdvd[0-9]*",    NAME=3D"pktcdvd/%n"
> +KERNEL=3D=3D"pktcdvd",        NAME=3D"pktcdvd/control"
> +
> +KERNEL=3D=3D"cpu[0-9]*",        NAME=3D"cpu/%n/cpuid"
> +KERNEL=3D=3D"msr[0-9]*",        NAME=3D"cpu/%n/msr"
> +KERNEL=3D=3D"microcode",        NAME=3D"cpu/microcode"
> +
> +KERNEL=3D=3D"umad*",        NAME=3D"infiniband/%k"
> +KERNEL=3D=3D"issm*",        NAME=3D"infiniband/%k"
> +KERNEL=3D=3D"uverbs*",        NAME=3D"infiniband/%k"
> +KERNEL=3D=3D"ucm*",            NAME=3D"infiniband/%k"
> +KERNEL=3D=3D"rdma_ucm",        NAME=3D"infiniband/%k"
> +
> +# ALSA devices
> +KERNEL=3D=3D"controlC[0-9]*",    NAME=3D"snd/%k"
> +KERNEL=3D=3D"hwC[D0-9]*",        NAME=3D"snd/%k"
> +KERNEL=3D=3D"pcmC[D0-9cp]*",    NAME=3D"snd/%k"
> +KERNEL=3D=3D"midiC[D0-9]*",        NAME=3D"snd/%k"
> +KERNEL=3D=3D"timer",        NAME=3D"snd/%k"
> +KERNEL=3D=3D"seq",            NAME=3D"snd/%k"
> +
> +# ieee1394 devices      =20
> +KERNEL=3D=3D"dv1394*",        NAME=3D"dv1394/%n"
> +KERNEL=3D=3D"video1394*",        NAME=3D"video1394/%n"
> +
> +# input devices
> +KERNEL=3D=3D"mice",            NAME=3D"input/%k"
> +KERNEL=3D=3D"mouse[0-9]*",        NAME=3D"input/%k"
> +KERNEL=3D=3D"event[0-9]*",        NAME=3D"input/%k"
> +KERNEL=3D=3D"js[0-9]*",        NAME=3D"input/%k"
> +KERNEL=3D=3D"ts[0-9]*",        NAME=3D"input/%k"
> +KERNEL=3D=3D"uinput",        NAME=3D"input/%k"
> +
> +# Zaptel
> +KERNEL=3D=3D"zapctl",        NAME=3D"zap/ctl"
> +KERNEL=3D=3D"zaptimer",        NAME=3D"zap/timer"
> +KERNEL=3D=3D"zapchannel",        NAME=3D"zap/channel"
> +KERNEL=3D=3D"zappseudo",        NAME=3D"zap/pseudo"
> +KERNEL=3D=3D"zap[0-9]*",        NAME=3D"zap/%n"
> +
> +# AOE character devices
> +SUBSYSTEM=3D=3D"aoe", KERNEL=3D=3D"discover",    NAME=3D"etherd/%k"
> +SUBSYSTEM=3D=3D"aoe", KERNEL=3D=3D"err",    NAME=3D"etherd/%k"
> +SUBSYSTEM=3D=3D"aoe", KERNEL=3D=3D"interfaces",    NAME=3D"etherd/%k"
> +SUBSYSTEM=3D=3D"aoe", KERNEL=3D=3D"revalidate",    NAME=3D"etherd/%k"
> +
> +# device mapper creates its own device nodes, so ignore these
> +KERNEL=3D=3D"dm-[0-9]*",        OPTIONS+=3D"ignore_device"
> +KERNEL=3D=3D"device-mapper",    NAME=3D"mapper/control"
> +
> +KERNEL=3D=3D"rfcomm[0-9]*", NAME=3D"%k", GROUP=3D"users", MODE=3D"0660"
> +
> +# Firmware Helper
> +ACTION=3D=3D"add", SUBSYSTEM=3D=3D"firmware", RUN+=3D"/lib/udev/firmware.=
sh"
> +
> +# Samsung UARTS
> +KERNEL=3D=3D"s3c2410_serial[0-9]",   NAME=3D"ttySAC%n"
> +
> +# MXC UARTs
> +KERNEL=3D=3D"ttymxc[0-4]",   NAME=3D"ttymxc%n"
> +
> diff --git a/meta/recipes-core/udev/udev_172.bb b/meta/recipes-core/udev/u=
dev_172.bb
> new file mode 100644
> index 0000000..7e3f956
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev_172.bb
> @@ -0,0 +1,6 @@
> +include udev-new.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI[md5sum] =3D "9af0a8457cc178d18661a5848f18c4c9"
> +SRC_URI[sha256sum] =3D "93222392488a52f8eb79c7d4f6b992d19bd375c79a87ead4b=
480be1cc25382d7"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


