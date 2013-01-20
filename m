Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tx4HZ-0006Fz-GA
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 00:27:07 +0100
Received: by mail-we0-f171.google.com with SMTP id u3so1488153wey.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 15:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VA2wlTA0SNwuwp2divUzwd1O1Yne67e7s1PXha5BWAQ=;
	b=yi2isiPO5zVGa0eBAo5T2NoHS4rRmYbSDk5us454DM/Y1RCpbXmkPOao+wkEwxy4JN
	5z15Wbc65311UAKw+vYJnUxopAY76kw/kqDmaDrlT9BpQ97m3SaF4MP6L4pDn+cTy480
	C57tXL0eekfp+48XKK+t07Li8pRWIRKWHJNRxh7JXrQs7t5iNaQ5LdXp/QbuA3XufBXQ
	VfQx3KomYYM2oHSw/KbVGeAEe2wk7j6j+Eb/5S89Sing/WUFSmKEhUbxkQuRg0hxgVe+
	l1qWS5aFuDtjNpVg8UVjmaZ/CiucqDzAH5yjAGFp35qBZVnSznEHgtWmhH8rGdYPY/pE
	6Osg==
X-Received: by 10.194.20.231 with SMTP id q7mr23225437wje.44.1358723465658;
	Sun, 20 Jan 2013 15:11:05 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s16sm18565245wii.0.2013.01.20.15.11.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 15:11:04 -0800 (PST)
Date: Mon, 21 Jan 2013 00:11:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130120231106.GI29386@jama.palm1.palmone.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<99d5574cd12a8ed68886120775aec583b2941684.1358635193.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <99d5574cd12a8ed68886120775aec583b2941684.1358635193.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] systemd: add systemd recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 23:27:08 -0000
X-Groupsio-MsgNum: 34113
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gJNQRAHI5jiYqw2y"
Content-Disposition: inline

--gJNQRAHI5jiYqw2y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2013 at 10:47:07PM +0000, Ross Burton wrote:
> From: Radu Moisan <radu.moisan@intel.com>
>=20
> Add systemd recipes and associated support recipes.
>=20
> Mostly based on meta-oe/meta-systemd, so almost all credit should go to:
>=20
> Andreas M=FCller <schnitzeltony@googlemail.com>
> Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> Holger Hans Peter Freyther <holger@moiji-mobile.com>
> Khem Raj <raj.khem@gmail.com>
> Koen Kooi <koen@dominion.thruhere.net>
> Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---

Looking at diff between oe-core systemd recipe and meta-systemd, can you
explain why python support got disabled.

And why are there diffs like:
-               /libstemd-udevd \
+               /lib/udev/udevd \
+               /lib/systemd/systemd-udevd \
(the later is meta-systemd).

Is there some plan to send patches for meta-systemd to remove bits merged=
=20
to oe-core? Right now a lot of stuff is not parsing due to removed=20
dbus-systemd package.

Cheers,

>  meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
>  .../systemd/systemd-compat-units/machineid.service |   16 +
>  .../systemd-compat-units/run-postinsts.service     |   17 +
>  meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
>  .../systemd-serialgetty/serial-getty@.service      |   32 ++
>  .../systemd/systemd-systemctl-native.bb            |   15 +
>  .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
>  .../systemd/systemd/00-create-volatile.conf        |   10 +
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
>  meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>  .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>  .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>  .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>  .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++=
++++++
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>  .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
>  meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>  meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
>  22 files changed, 1597 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machin=
eid.service
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-po=
stinsts.service
>  create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-=
getty@.service
>  create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
>  create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
>  create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.=
conf
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd=
-analyze-use-argparse-instead-of-getop.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze=
-use-GDBus-instead-of-dbus-python.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>  create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_get=
env.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configu=
re-check-uclibc.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-exe=
cvpe.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fal=
locate.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-get=
ty-unit.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mko=
stemp.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msf=
ormat.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>  create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>  create mode 100644 meta/recipes-core/systemd/systemd_196.bb
>=20
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
> new file mode 100644
> index 0000000..a7bfee3
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -0,0 +1,58 @@
> +DESCRIPTION =3D "Units to make systemd work better with existing sysvini=
t scripts"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +
> +PR =3D "r18"
> +
> +inherit allarch
> +
> +SRC_URI =3D "file://*.service"
> +
> +do_install() {
> +	install -d ${D}${systemd_unitdir}/system/basic.target.wants
> +	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
> +	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}=
/system
> +	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.tar=
get.wants/
> +	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.t=
arget.wants/
> +
> +	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/sys=
tem
> +	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.targe=
t.wants/
> +	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.=
wants/
> +
> +	# hack to make old style sysvinit postinsts succeed
> +	install -d ${D}${bindir}
> +	echo "echo 1" > ${D}${bindir}/runlevel
> +	chmod 0755 ${D}${bindir}/runlevel
> +}
> +
> +SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
> +  busybox-udhcpc \
> +  dnsmasq \
> +  hwclock \
> +  networking \
> +  syslog.busybox \
> +"
> +
> +pkg_postinst_${PN} () {
> +	cd $D${sysconfdir}/init.d
> +
> +	echo "Disabling the following sysv scripts: "
> +
> +	OPTS=3D""
> +
> +	if [ -n "$D" ]; then
> +		OPTS=3D"--root=3D$D"
> +	fi
> +
> +	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> +		if [ \( -e $i -o $i.sh \) -a ! -e $D${sysconfdir}/systemd/system/$i.se=
rvice ] ; then
> +			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
> +		fi
> +	done ; echo
> +}
> +
> +FILES_${PN} =3D "${systemd_unitdir}/system ${bindir}"
> +RDPEPENDS_${PN} =3D "systemd"
> +
> +
> diff --git a/meta/recipes-core/systemd/systemd-compat-units/machineid.ser=
vice b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> new file mode 100644
> index 0000000..cab8f76
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=3DMachine ID first boot configure
> +DefaultDependencies=3Dno
> +ConditionPathExists=3D|!/etc/machine-id
> +After=3Dremount-rootfs.service
> +Before=3Dsysinit.target
> +
> +[Service]
> +ExecStart=3D/bin/systemd-machine-id-setup
> +RemainAfterExit=3DNo
> +Type=3Doneshot
> +StandardOutput=3Dsyslog
> +
> +[Install]
> +WantedBy=3Dbasic.target
> +WantedBy=3Dsysinit.target
> diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts=
=2Eservice b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.s=
ervice
> new file mode 100644
> index 0000000..da6fe76
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=3DRun pending postinsts
> +DefaultDependencies=3Dno
> +ConditionPathExists=3D|/etc/rcS.d/S98run-postinsts
> +After=3Dremount-rootfs.service tmp.mount
> +Before=3Dsysinit.target
> +
> +[Service]
> +ExecStart=3D/etc/rcS.d/S98run-postinsts
> +RemainAfterExit=3DNo
> +Type=3Doneshot
> +StandardOutput=3Dsyslog
> +TimeoutSec=3D0
> +
> +[Install]
> +WantedBy=3Dbasic.target
> +WantedBy=3Dsysinit.target
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
> new file mode 100644
> index 0000000..7e7368b
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION =3D "Systemd serial config"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> +
> +PR =3D "r3"
> +
> +SERIAL_CONSOLE ?=3D "115200 ttyS0"
> +
> +SRC_URI =3D "file://serial-getty@.service"
> +
> +def get_serial_console_value(d, index):
> +    c =3D d.getVar('SERIAL_CONSOLE', True)
> +
> +    if len(c):
> +        return c.split()[index]
> +
> +    return ""
> +
> +def get_baudrate(d):
> +    return get_serial_console_value(d, 0)
> +
> +def get_console(d):
> +    return get_serial_console_value(d, 1)
> +
> +do_install() {
> +	if [ ! ${@get_baudrate(d)} =3D "" ]; then
> +		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(d)}/g ${WORKDIR}/serial-getty=
@.service
> +		install -d ${D}${systemd_unitdir}/system/
> +		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
> +		install ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
> +
> +		# enable the service
> +		ln -sf ${systemd_unitdir}/system/serial-getty@.service \
> +			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@g=
et_console(d)}.service
> +	fi
> +}
> +
> +PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-doc"
> +
> +RRECOMMENDS_${PN} =3D ""
> +RDEPENDS_${PN} =3D "systemd"
> +
> +# This is a machine specific file
> +FILES_${PN} =3D "${systemd_unitdir}/system/serial-getty@.service ${sysco=
nfdir}"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.=
service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.servi=
ce
> new file mode 100644
> index 0000000..8eeaab6
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> @@ -0,0 +1,32 @@
> +#  This file is part of systemd.
> +#
> +#  systemd is free software; you can redistribute it and/or modify it
> +#  under the terms of the GNU General Public License as published by
> +#  the Free Software Foundation; either version 2 of the License, or
> +#  (at your option) any later version.
> +
> +[Unit]
> +Description=3DSerial Getty on %I
> +BindTo=3Ddev-%i.device
> +After=3Ddev-%i.device systemd-user-sessions.service
> +
> +# If additional gettys are spawned during boot then we should make
> +# sure that this is synchronized before getty.target, even though
> +# getty.target didn't actually pull it in.
> +Before=3Dgetty.target
> +
> +[Service]
> +Environment=3DTERM=3Dvt100
> +ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@
> +Restart=3Dalways
> +RestartSec=3D0
> +UtmpIdentifier=3D%I
> +TTYPath=3D/dev/%I
> +TTYReset=3Dyes
> +TTYVHangup=3Dyes
> +KillMode=3Dprocess
> +IgnoreSIGPIPE=3Dno
> +
> +# Some login implementations ignore SIGTERM, so we send SIGHUP
> +# instead, to ensure that login terminates cleanly.
> +KillSignal=3DSIGHUP
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta=
/recipes-core/systemd/systemd-systemctl-native.bb
> new file mode 100644
> index 0000000..5940584
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "Wrapper to enable of systemd services"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +
> +PR =3D "r6"
> +
> +inherit native
> +
> +SRC_URI =3D "file://systemctl"
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> +}
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta=
/recipes-core/systemd/systemd-systemctl/systemctl
> new file mode 100755
> index 0000000..d71c7ed
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -0,0 +1,126 @@
> +#!/bin/sh
> +echo "Started $0 $*"
> +
> +ROOT=3D
> +
> +# parse command line params
> +action=3D
> +while [ $# !=3D 0 ]; do
> +	opt=3D"$1"
> +
> +	case "$opt" in
> +		enable)
> +			shift
> +
> +			action=3D"$opt"
> +			services=3D"$1"
> +			cmd_args=3D"1"
> +			shift
> +			;;
> +		disable)
> +			shift
> +
> +			action=3D"$opt"
> +			services=3D"$1"
> +			cmd_args=3D"1"
> +			shift
> +			;;
> +		mask)
> +			shift
> +
> +			action=3D"$opt"
> +			services=3D"$1"
> +			cmd_args=3D"1"
> +			shift
> +			;;
> +		--root=3D*)
> +			ROOT=3D${opt##--root=3D}
> +			cmd_args=3D"0"
> +			shift
> +			;;
> +		*)
> +			if [ "$cmd_args" =3D "1" ]; then
> +				services=3D"$services $opt"=20
> +				shift
> +			else
> +				echo "'$opt' is an unkown option; exiting with error"
> +				exit 1
> +			fi
> +			;;
> +	esac
> +done
> +
> +for service in $services; do
> +	if [ "$action" =3D "mask" ]; then
> +		if [ ! -d $ROOT/etc/systemd/system/ ]; then
> +			mkdir -p $ROOT/etc/systemd/system/
> +		fi
> +		cmd=3D"ln -s /dev/null $ROOT/etc/systemd/system/$service"
> +		echo "$cmd"
> +		$cmd
> +		exit 0
> +	fi
> +
> +	echo "Try to find location of $service..."
> +	# find service file
> +	for p in $ROOT/etc/systemd/system \
> +		 $ROOT/lib/systemd/system \
> +		 $ROOT/usr/lib/systemd/system; do
> +		if [ -e $p/$service ]; then
> +			service_file=3D$p/$service
> +			service_file=3D${service_file##$ROOT}
> +		fi
> +	done
> +	if [ -z "$service_file" ]; then
> +		echo "'$service' couldn't be found; exiting with error"
> +		exit 1
> +	fi
> +	echo "Found $service in $service_file"
> +
> +	# create the required symbolic links
> +	wanted_by=3D$(grep WantedBy $ROOT/$service_file \
> +		        | sed 's,WantedBy=3D,,g' \
> +		        | tr ',' '\n' \
> +		        | grep '\(\.target$\)\|\(\.service$\)')
> +
> +	for r in $wanted_by; do
> +		echo "WantedBy=3D$r found in $service"
> +		if [ "$action" =3D "enable" ]; then
> +			mkdir -p $ROOT/etc/systemd/system/$r.wants
> +			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
> +			echo "Enabled $service for $wanted_by."
> +		else
> +			rm -f $ROOT/etc/systemd/system/$r.wants/$service
> +			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
> +			echo "Disabled $service for $wanted_by."
> +		fi
> +	done
> +
> +	# create the required symbolic 'Alias' links
> +	alias=3D$(grep Alias $ROOT/$service_file \
> +		        | sed 's,Alias=3D,,g' \
> +		        | tr ',' '\n' \
> +		        | grep '\.service$')
> +
> +	for r in $alias; do
> +		if [ "$action" =3D "enable" ]; then
> +			mkdir -p $ROOT/etc/systemd/system
> +			ln -s $service_file $ROOT/etc/systemd/system/$r
> +			echo "Enabled $service for $alias."
> +		else
> +			rm -f $ROOT/etc/systemd/system/$r
> +			echo "Disabled $service for $alias."
> +		fi
> +	done
> +
> +	# call us for the other required scripts
> +	also=3D$(grep Also $ROOT/$service_file \
> +		   | sed 's,Also=3D,,g' \
> +		   | tr ',' '\n')
> +	for a in $also; do
> +		echo "Also=3D$a found in $service"
> +		if [ "$action" =3D "enable" ]; then
> +			$0 --root=3D$ROOT enable $a
> +		fi
> +	done
> +done
> diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/=
meta/recipes-core/systemd/systemd/00-create-volatile.conf
> new file mode 100644
> index 0000000..d160a9b
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> @@ -0,0 +1,10 @@
> +#This goes hand-in-hand with the base-files of OE-Core. The file must
> +# be sorted before 'systemd.conf' becuase this attempts to create a file
> +# inside /var/log.
> +
> +
> +d		/var/volatile/cache	-	-	-	-
> +d		/var/volatile/log		-	-	-	-
> +d		/var/volatile/lock		-	-	-	-
> +d		/var/volatile/run		-	-	-	-
> +d		/var/volatile/tmp		-	-	-	-
> diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyz=
e-use-argparse-instead-of-getop.patch b/meta/recipes-core/systemd/systemd/0=
001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
> new file mode 100644
> index 0000000..7de2705
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-a=
rgparse-instead-of-getop.patch
> @@ -0,0 +1,103 @@
> +From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Mon, 10 Dec 2012 12:24:32 +0100
> +Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of ge=
topt"
> +
> +This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
> +
> +Argparse is broken in current OE python
> +---
> + src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++--------=
-------
> + 1 files changed, 39 insertions(+), 21 deletions(-)
> +
> +diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
> +index 88699d6..87a83dd 100755
> +--- a/src/analyze/systemd-analyze
> ++++ b/src/analyze/systemd-analyze
> +@@ -1,7 +1,6 @@
> + #!/usr/bin/python
> +=20
> +-import sys, os
> +-import argparse
> ++import getopt, sys, os
> + from gi.repository import Gio
> + try:
> +         import cairo
> +@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size =3D 12, r =3D=
 0, g =3D 0, b =3D 0, vcenter =3D 0.5
> +=20
> +         context.restore()
> +=20
> ++def usage():
> ++        sys.stdout.write("""systemd-analyze [--user] time
> ++systemd-analyze [--user] blame
> ++systemd-analyze [--user] plot
> ++
> ++Process systemd profiling information
> ++
> ++  -h --help         Show this help
> ++""")
> ++
> ++def help():
> ++        usage()
> ++        sys.exit()
> ++
> + def time():
> +=20
> +         initrd_time, start_time, finish_time =3D acquire_start_time()
> +@@ -266,29 +279,34 @@ def plot():
> +=20
> +         surface.finish()
> +=20
> +-parser =3D argparse.ArgumentParser(formatter_class=3Dargparse.RawDescri=
ptionHelpFormatter,
> +-                                 description=3D'Process systemd profili=
ng information',
> +-                                 epilog=3D'''\
> +-time - print time spent in the kernel before reaching userspace
> +-blame - print list of running units ordered by time to init
> +-plot - output SVG graphic showing service initialization
> +-''')
> +-
> +-parser.add_argument('action', choices=3D('time', 'blame', 'plot'),
> +-                    default=3D'time', nargs=3D'?',
> +-                    help=3D'action to perform (default: time)')
> +-parser.add_argument('--user', action=3D'store_true',
> +-                    help=3D'use the session bus')
> ++def unknown_verb():
> ++        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
> ++        usage()
> ++        sys.exit(1)
> +=20
> +-args =3D parser.parse_args()
> ++bus =3D Gio.BusType.SYSTEM
> +=20
> +-if args.user:
> +-        bus =3D Gio.BusType.SESSION
> +-else:
> +-        bus =3D Gio.BusType.SYSTEM
> ++try:
> ++        opts, args =3D getopt.gnu_getopt(sys.argv[1:], "h", ["help", "u=
ser"])
> ++except getopt.GetoptError as err:
> ++        sys.stdout.write(str(err) + "\n")
> ++        usage()
> ++        sys.exit(2)
> ++for o, a in opts:
> ++        if o in ("-h", "--help"):
> ++                help()
> ++        elif o =3D=3D '--user':
> ++                bus =3D Gio.BusType.SESSION
> ++        else:
> ++                assert False, "unhandled option"
> +=20
> + verb =3D {'time' : time,
> + 	'blame': blame,
> + 	'plot' : plot,
> ++	'help' : help,
> + 	}
> +-verb.get(args.action)()
> ++
> ++if len(args) =3D=3D 0:
> ++        time()
> ++else:
> ++        verb.get(args[0], unknown_verb)()
> +--=20
> +1.7.7.6
> +
> diff --git a/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GD=
Bus-instead-of-dbus-python.patch b/meta/recipes-core/systemd/systemd/0002-R=
evert-analyze-use-GDBus-instead-of-dbus-python.patch
> new file mode 100644
> index 0000000..e5e8d7d
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-ins=
tead-of-dbus-python.patch
> @@ -0,0 +1,91 @@
> +From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Mon, 10 Dec 2012 12:25:00 +0100
> +Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
> +
> +This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
> +
> +Python-gobject is too old in current OE
> +---
> + src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
> + 1 files changed, 14 insertions(+), 17 deletions(-)
> +
> +diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
> +index 87a83dd..636fd74 100755
> +--- a/src/analyze/systemd-analyze
> ++++ b/src/analyze/systemd-analyze
> +@@ -1,15 +1,14 @@
> + #!/usr/bin/python
> +=20
> +-import getopt, sys, os
> +-from gi.repository import Gio
> ++import getopt, dbus, sys, os
> + try:
> +         import cairo
> + except ImportError:
> +         cairo =3D None
> +=20
> + def acquire_time_data():
> +-        manager =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFl=
ags.NONE,
> +-                None, 'org.freedesktop.systemd1', '/org/freedesktop/sys=
temd1', 'org.freedesktop.systemd1.Manager', None)
> ++
> ++        manager =3D dbus.Interface(bus.get_object('org.freedesktop.syst=
emd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
> +         units =3D manager.ListUnits()
> +=20
> +         l =3D []
> +@@ -18,25 +17,23 @@ def acquire_time_data():
> +                 if i[5] !=3D "":
> +                         continue
> +=20
> +-                properties =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.=
DBusProxyFlags.NONE,
> +-                        None, 'org.freedesktop.systemd1', i[6], 'org.fr=
eedesktop.DBus.Properties', None)
> ++                properties =3D dbus.Interface(bus.get_object('org.freed=
esktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
> +=20
> +-                ixt =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'InactiveExitTimestampMonotonic')
> +-                aet =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'ActiveEnterTimestampMonotonic')
> +-                axt =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'ActiveExitTimestampMonotonic')
> +-                iet =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'InactiveEnterTimestampMonotonic')
> ++                ixt =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'InactiveExitTimestampMonotonic'))
> ++                aet =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'ActiveEnterTimestampMonotonic'))
> ++                axt =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'ActiveExitTimestampMonotonic'))
> ++                iet =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'InactiveEnterTimestampMonotonic'))
> +=20
> +                 l.append((str(i[0]), ixt, aet, axt, iet))
> +=20
> +         return l
> +=20
> + def acquire_start_time():
> +-        properties =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProx=
yFlags.NONE,
> +-                None, 'org.freedesktop.systemd1', '/org/freedesktop/sys=
temd1', 'org.freedesktop.DBus.Properties', None)
> ++        properties =3D dbus.Interface(bus.get_object('org.freedesktop.s=
ystemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
> +=20
> +-        initrd_time =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Manager', 'InitRDTimestampMonotonic')
> +-        userspace_time =3D properties.Get('(ss)', 'org.freedesktop.syst=
emd1.Manager', 'UserspaceTimestampMonotonic')
> +-        finish_time =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Manager', 'FinishTimestampMonotonic')
> ++        initrd_time =3D int(properties.Get('org.freedesktop.systemd1.Ma=
nager', 'InitRDTimestampMonotonic'))
> ++        userspace_time =3D int(properties.Get('org.freedesktop.systemd1=
=2EManager', 'UserspaceTimestampMonotonic'))
> ++        finish_time =3D int(properties.Get('org.freedesktop.systemd1.Ma=
nager', 'FinishTimestampMonotonic'))
> +=20
> +         if finish_time =3D=3D 0:
> +                 sys.stderr.write("Bootup is not yet finished. Please tr=
y again later.\n")
> +@@ -284,7 +281,7 @@ def unknown_verb():
> +         usage()
> +         sys.exit(1)
> +=20
> +-bus =3D Gio.BusType.SYSTEM
> ++bus =3D dbus.SystemBus()
> +=20
> + try:
> +         opts, args =3D getopt.gnu_getopt(sys.argv[1:], "h", ["help", "u=
ser"])
> +@@ -296,7 +293,7 @@ for o, a in opts:
> +         if o in ("-h", "--help"):
> +                 help()
> +         elif o =3D=3D '--user':
> +-                bus =3D Gio.BusType.SESSION
> ++                bus =3D dbus.SessionBus()
> +         else:
> +                 assert False, "unhandled option"
> +=20
> +--=20
> +1.7.7.6
> +
> diff --git a/meta/recipes-core/systemd/systemd/modprobe.rules b/meta/reci=
pes-core/systemd/systemd/modprobe.rules
> new file mode 100644
> index 0000000..d4a096b
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/modprobe.rules
> @@ -0,0 +1,17 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existin=
g node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Try and modprobe for drivers for new hardware
> +ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", R=
UN+=3D"/sbin/modprobe $env{MODALIAS}"
> diff --git a/meta/recipes-core/systemd/systemd/optional_secure_getenv.pat=
ch b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
> new file mode 100644
> index 0000000..35f1467
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
> @@ -0,0 +1,19 @@
> +on uclibc secure_getenv is not available
> +therefore default to using getenv instead
> +
> +Singed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: git/src/shared/missing.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
> ++++ git/src/shared/missing.h	2012-09-22 18:48:44.081276570 -0700
> +@@ -233,6 +233,8 @@
> + #ifndef HAVE_SECURE_GETENV
> + #  ifdef HAVE___SECURE_GETENV
> + #    define secure_getenv __secure_getenv
> ++#  elif defined __UCLIBC__
> ++#    define secure_getenv getenv
> + #  else
> + #    error neither secure_getenv nor __secure_getenv are available
> + #  endif
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-configure-chec=
k-uclibc.patch b/meta/recipes-core/systemd/systemd/systemd-pam-configure-ch=
eck-uclibc.patch
> new file mode 100644
> index 0000000..1bfc3bd
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclib=
c.patch
> @@ -0,0 +1,26 @@
> +--- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
> ++++ systemd-pam-185/configure.ac	2012-06-21 22:57:10.000000000 -0400
> +@@ -63,6 +63,23 @@
> +=20
> + AC_PATH_PROG([M4], [m4])
> +=20
> ++# check for few functions not implemented in uClibc
> ++
> ++AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
> ++
> ++# check for %ms format support - assume always no if cross compiling
> ++
> ++AC_MSG_CHECKING([whether %ms format is supported by *scanf])
> ++
> ++AC_RUN_IFELSE(
> ++	[AC_LANG_PROGRAM([[ include <stdio.h> ]],
> ++			[[ char *buf1, *buf2, *buf3, str=3D"1 2.3 abcde" ;
> ++			   int rc =3D sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
> ++			   return (rc=3D=3D3)?0:1;]])],
> ++	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by=
 *scanf.])],
> ++	[AC_MSG_RESULT([no])],
> ++	[AC_MSG_RESULT([no])])
> ++
> + # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own li=
ne
> + m4_ifdef([GTK_DOC_CHECK], [
> + GTK_DOC_CHECK([1.18],[--flavour no-tmpl])
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.pa=
tch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
> new file mode 100644
> index 0000000..449c27f
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
> @@ -0,0 +1,26 @@
> +Index: git/src/nspawn/nspawn.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/nspawn/nspawn.c	2012-09-22 17:57:05.000000000 -0700
> ++++ git/src/nspawn/nspawn.c	2012-09-22 18:01:41.541405768 -0700
> +@@ -63,6 +63,8 @@
> +         LINK_GUEST
> + } LinkJournal;
> +=20
> ++#include "config.h"
> ++
> + static char *arg_directory =3D NULL;
> + static char *arg_user =3D NULL;
> + static char **arg_controllers =3D NULL;
> +@@ -1373,7 +1375,12 @@
> +                                 a[0] =3D (char*) "/sbin/init";
> +                                 execve(a[0], a, (char**) envp);
> +                         } else if (argc > optind)
> ++#ifdef HAVE_EXECVPE
> +                                 execvpe(argv[optind], argv + optind, (c=
har**) envp);
> ++#else
> ++                                environ =3D (char **)envp;
> ++                                execvp(argv[optind], argv + optind);
> ++#endif /* HAVE_EXECVPE */		=09
> +                         else {
> +                                 chdir(home ? home : "/root");
> +                                 execle("/bin/bash", "-bash", NULL, (cha=
r**) envp);
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.=
patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> new file mode 100644
> index 0000000..089ba64
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> @@ -0,0 +1,82 @@
> +Index: git/src/journal/journal-file.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/journal/journal-file.c	2012-09-02 09:49:15.126089594 -0=
700
> ++++ git/src/journal/journal-file.c	2012-09-02 09:49:17.118089670 -0700
> +@@ -34,6 +34,8 @@
> + #include "compress.h"
> + #include "fsprg.h"
> +=20
> ++#include "config.h"
> ++
> + #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
> + #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
> +=20
> +@@ -262,7 +264,7 @@
> +=20
> + static int journal_file_allocate(JournalFile *f, uint64_t offset, uint6=
4_t size) {
> +         uint64_t old_size, new_size;
> +-        int r;
> ++        int r =3D 0;
> +=20
> +         assert(f);
> +=20
> +@@ -307,10 +309,25 @@
> +         /* Note that the glibc fallocate() fallback is very
> +            inefficient, hence we try to minimize the allocation area
> +            as we can. */
> ++#ifdef HAVE_POSIX_ALLOCATE
> +         r =3D posix_fallocate(f->fd, old_size, new_size - old_size);
> +         if (r !=3D 0)
> +                 return -r;
> +=20
> ++#else
> ++	/* Use good old method to write zeros into the journal file
> ++	   perhaps very inefficient yet working. */
> ++	if(new_size > old_size) {
> ++		char *buf =3D alloca(new_size - old_size);
> ++		off_t oldpos =3D lseek(f->fd, 0, SEEK_CUR);
> ++		bzero(buf, new_size - old_size);
> ++		lseek(f->fd, old_size, SEEK_SET);
> ++		r =3D write(f->fd, buf, new_size - old_size);
> ++		lseek(f->fd, oldpos, SEEK_SET);
> ++	}
> ++	if (r < 0)
> ++		return -errno;
> ++#endif /* HAVE_POSIX_FALLOCATE */
> +         if (fstat(f->fd, &f->last_stat) < 0)
> +                 return -errno;
> +=20
> +Index: git/src/journal/journald-kmsg.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/journal/journald-kmsg.c	2012-09-02 09:49:15.130089595 -=
0700
> ++++ git/src/journal/journald-kmsg.c	2012-09-02 12:26:17.326447895 -0700
> +@@ -404,6 +404,7 @@
> +=20
> + int server_open_kernel_seqnum(Server *s) {
> +         int fd;
> ++	int r =3D 0;
> +         uint64_t *p;
> +=20
> +         assert(s);
> +@@ -417,8 +418,19 @@
> +                 log_error("Failed to open /run/systemd/journal/kernel-s=
eqnum, ignoring: %m");
> +                 return 0;
> +         }
> +-
> +-        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
> ++#ifdef HAVE_POSIX_ALLOCATE
> ++        r =3D posix_fallocate(fd, 0, sizeof(uint64_t));
> ++#else
> ++	/* Use good old method to write zeros into the journal file
> ++	   perhaps very inefficient yet working. */
> ++	char *buf =3D alloca(sizeof(uint64_t));
> ++	off_t oldpos =3D lseek(fd, 0, SEEK_CUR);
> ++	bzero(buf, sizeof(uint64_t));
> ++	lseek(fd, 0, SEEK_SET);
> ++	r =3D write(fd, buf, sizeof(uint64_t));
> ++	lseek(fd, oldpos, SEEK_SET);
> ++#endif /* HAVE_POSIX_FALLOCATE */
> ++	if (r < 0) {
> +                 log_error("Failed to allocate sequential number file, i=
gnoring: %m");
> +                 close_nointr_nofail(fd);
> +                 return 0;
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit=
=2Epatch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.pat=
ch
> new file mode 100644
> index 0000000..3e5ea71
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
> @@ -0,0 +1,35 @@
> +Prefer getty to agetty in console setup systemd units
> +
> +Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> +---
> + units/getty@.service.m4        |    2 +-
> + units/serial-getty@.service.m4 |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +Index: systemd-37/units/getty@.service.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- systemd-37.orig/units/getty@.service.m4
> ++++ systemd-37/units/getty@.service.m4
> +@@ -41,7 +41,7 @@
> +=20
> + [Service]
> + Environment=3DTERM=3Dlinux
> + # the VT is cleared by TTYVTDisallocate
> +-ExecStart=3D-/sbin/agetty --noclear %I 38400
> ++ExecStart=3D-/sbin/getty -L %I 115200 linux
> + Type=3Didle
> + Restart=3Dalways
> + RestartSec=3D0
> +Index: systemd-37/units/serial-getty@.service.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- systemd-37.orig/units/serial-getty@.service.m4
> ++++ systemd-37/units/serial-getty@.service.m4
> +@@ -37,7 +37,7 @@
> +=20
> + [Service]
> + Environment=3DTERM=3Dvt102
> +-ExecStart=3D-/sbin/agetty -s %I 115200,38400,9600
> ++ExecStart=3D-/sbin/getty -L %I 115200 vt100
> + Type=3Didle
> + Restart=3Dalways
> + RestartSec=3D0
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.p=
atch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> new file mode 100644
> index 0000000..8de9a3a
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> @@ -0,0 +1,166 @@
> +Index: git/src/journal/journal-send.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/journal/journal-send.c	2012-09-02 00:10:08.748768268 -0=
700
> ++++ git/src/journal/journal-send.c	2012-09-02 00:10:10.508768335 -0700
> +@@ -34,6 +34,8 @@
> +=20
> + #define SNDBUF_SIZE (8*1024*1024)
> +=20
> ++#include "config.h"
> ++
> + /* We open a single fd, and we'll share it with the current process,
> +  * all its threads, and all its subprocesses. This means we need to
> +  * initialize it atomically, and need to operate on it atomically
> +@@ -293,7 +295,12 @@
> +          * file and just pass a file descriptor of it to the other
> +          * side */
> +=20
> ++#ifdef HAVE_MKOSTEMP
> +         buffer_fd =3D mkostemp(path, O_CLOEXEC|O_RDWR);
> ++#else
> ++	buffer_fd =3D mkstemp(path);
> ++	if (buffer_fd >=3D 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
> ++#endif	/* HAVE_MKOSTEMP */
> +         if (buffer_fd < 0) {
> +                 r =3D -errno;
> +                 goto finish;
> +Index: git/src/core/manager.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/core/manager.c	2012-09-02 00:10:08.732768266 -0700
> ++++ git/src/core/manager.c	2012-09-02 00:10:10.512768334 -0700
> +@@ -67,6 +67,8 @@
> + #include "cgroup-util.h"
> + #include "path-util.h"
> +=20
> ++#include "config.h"
> ++
> + /* As soon as 16 units are in our GC queue, make sure to run a gc sweep=
 */
> + #define GC_QUEUE_ENTRIES_MAX 16
> +=20
> +@@ -1701,7 +1703,12 @@
> +                 return -ENOMEM;
> +=20
> +         saved_umask =3D umask(0077);
> ++#ifdef HAVE_MKOSTEMP
> +         fd =3D mkostemp(path, O_RDWR|O_CLOEXEC);
> ++#else
> ++	fd =3D mkstemp(path);
> ++	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> ++#endif	/* HAVE_MKOSTEMP */
> +         umask(saved_umask);
> +=20
> +         if (fd < 0) {
> +Index: git/src/shared/util.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/shared/util.c	2012-09-02 00:10:08.784768269 -0700
> ++++ git/src/shared/util.c	2012-09-02 00:10:10.512768334 -0700
> +@@ -68,6 +68,8 @@
> + #include "exit-status.h"
> + #include "hashmap.h"
> +=20
> ++#include "config.h"
> ++
> + int saved_argc =3D 0;
> + char **saved_argv =3D NULL;
> +=20
> +@@ -4519,7 +4521,12 @@
> +         t[k] =3D '.';
> +         stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
> +=20
> ++#ifdef HAVE_MKOSTEMP
> +         fd =3D mkostemp(t, O_WRONLY|O_CLOEXEC);
> ++#else
> ++	fd =3D mkstemp(t);
> ++	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> ++#endif	/* HAVE_MKOSTEMP */
> +         if (fd < 0) {
> +                 free(t);
> +                 return -errno;
> +Index: git/src/shared/ask-password-api.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/shared/ask-password-api.c	2012-09-02 00:10:08.772768268=
 -0700
> ++++ git/src/shared/ask-password-api.c	2012-09-02 00:10:10.512768334 -0700
> +@@ -37,6 +37,8 @@
> +=20
> + #include "ask-password-api.h"
> +=20
> ++#include "config.h"
> ++
> + static void backspace_chars(int ttyfd, size_t p) {
> +=20
> +         if (ttyfd < 0)
> +@@ -326,7 +328,12 @@
> +         mkdir_p_label("/run/systemd/ask-password", 0755);
> +=20
> +         u =3D umask(0022);
> ++#ifdef HAVE_MKOSTEMP
> +         fd =3D mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
> ++#else
> ++	fd =3D mkstemp(temp);
> ++	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> ++#endif	/* HAVE_MKOSTEMP */
> +         umask(u);
> +=20
> +         if (fd < 0) {
> +Index: git/src/journal/journalctl.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/journal/journalctl.c	2012-09-02 00:10:08.752768267 -0700
> ++++ git/src/journal/journalctl.c	2012-09-02 00:18:41.928787779 -0700
> +@@ -540,7 +540,13 @@
> +         n /=3D arg_interval;
> +=20
> +         close_nointr_nofail(fd);
> ++#ifdef HAVE_MKOSTEMP
> +         fd =3D mkostemp(k, O_WRONLY|O_CLOEXEC|O_NOCTTY);
> ++#else
> ++	fd =3D mkstemp(k);
> ++	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> ++#endif /* HAVE_MKOSTEMP */
> ++
> +         if (fd < 0) {
> +                 log_error("Failed to open %s: %m", k);
> +                 r =3D -errno;
> +Index: git/src/journal/journal-verify.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/journal/journal-verify.c	2012-09-02 00:10:08.752768267 =
-0700
> ++++ git/src/journal/journal-verify.c	2012-09-02 00:24:10.268800268 -0700
> +@@ -693,8 +693,12 @@
> + #endif
> +         } else if (f->seal)
> +                 return -ENOKEY;
> +-
> ++#ifdef HAVE_MKOSTEMP
> +         data_fd =3D mkostemp(data_path, O_CLOEXEC);
> ++#else
> ++	data_fd =3D mkstemp(data_path);
> ++	if (data_fd >=3D 0) fcntl(data_fd, F_SETFD, FD_CLOEXEC);
> ++#endif	/* HAVE_MKOSTEMP */
> +         if (data_fd < 0) {
> +                 log_error("Failed to create data file: %m");
> +                 r =3D -errno;
> +@@ -702,7 +706,12 @@
> +         }
> +         unlink(data_path);
> +=20
> ++#ifdef HAVE_MKOSTEMP
> +         entry_fd =3D mkostemp(entry_path, O_CLOEXEC);
> ++#else
> ++	entry_fd =3D mkstemp(entry_path);
> ++	if (entry_fd >=3D 0) fcntl(entry_fd, F_SETFD, FD_CLOEXEC);
> ++#endif	/* HAVE_MKOSTEMP */
> +         if (entry_fd < 0) {
> +                 log_error("Failed to create entry file: %m");
> +                 r =3D -errno;
> +@@ -710,7 +719,12 @@
> +         }
> +         unlink(entry_path);
> +=20
> ++#ifdef HAVE_MKOSTEMP
> +         entry_array_fd =3D mkostemp(entry_array_path, O_CLOEXEC);
> ++#else
> ++	entry_array_fd =3D mkstemp(entry_array_path);
> ++	if (entry_array_fd >=3D 0) fcntl(entry_array_fd, F_SETFD, FD_CLOEXEC);
> ++#endif  /* HAVE_MKOSTEMP */
> +         if (entry_array_fd < 0) {
> +                 log_error("Failed to create entry array file: %m");
> +                 r =3D -errno;
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.p=
atch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> new file mode 100644
> index 0000000..ee63329
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> @@ -0,0 +1,335 @@
> +--- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -=
0400
> ++++ systemd-pam-185/src/fsck/fsck.c	2012-06-22 21:15:56.000000000 -0400
> +@@ -36,6 +36,8 @@
> + #include "bus-errors.h"
> + #include "virt.h"
> +=20
> ++#include "config.h"
> ++
> + static bool arg_skip =3D false;
> + static bool arg_force =3D false;
> + static bool arg_show_progress =3D false;
> +@@ -193,9 +195,16 @@
> +                 char *device;
> +                 double p;
> +                 usec_t t;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 if (fscanf(f, "%i %lu %lu %ms", &pass, &cur, &max, &dev=
ice) !=3D 4)
> +-                        break;
> ++#else
> ++		device =3D malloc(257);
> ++		if (fscanf(f, "%i %lu %lu %256s", &pass, &cur, &max, device) !=3D 4) {
> ++			free(device);
> ++		}
> ++
> ++#endif /* HAVE_MSFORMAT */
> ++			break;
> +=20
> +                 /* Only show one progress counter at max */
> +                 if (!locked) {
> +--- systemd-pam-185/src/core/swap.c.orig	2012-06-22 23:22:55.000000000 -=
0400
> ++++ systemd-pam-185/src/core/swap.c	2012-06-22 21:17:10.000000000 -0400
> +@@ -40,6 +40,8 @@
> + #include "def.h"
> + #include "path-util.h"
> +=20
> ++#include "config.h"
> ++
> + static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] =
=3D {
> +         [SWAP_DEAD] =3D UNIT_INACTIVE,
> +         [SWAP_ACTIVATING] =3D UNIT_ACTIVATING,
> +@@ -1038,7 +1040,7 @@
> +         for (i =3D 1;; i++) {
> +                 char *dev =3D NULL, *d;
> +                 int prio =3D 0, k;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 if ((k =3D fscanf(m->proc_swaps,
> +                                 "%ms "  /* device/file */
> +                                 "%*s "  /* type of swap */
> +@@ -1046,10 +1048,18 @@
> +                                 "%*s "  /* used */
> +                                 "%i\n", /* priority */
> +                                 &dev, &prio)) !=3D 2) {
> +-
> ++#else
> ++		dev =3D malloc(257);
> ++                if ((k =3D fscanf(m->proc_swaps,
> ++                                "%256s "   /* device/file */
> ++                                "%*s "  /* type of swap */
> ++                                "%*s "  /* swap size */
> ++                                "%*s "  /* used */
> ++                                "%i\n", /* priority */
> ++                                dev, &prio)) !=3D 2) {
> ++#endif /* HAVE_MSFORMAT */
> +                         if (k =3D=3D EOF)
> +                                 break;
> +-
> +                         log_warning("Failed to parse /proc/swaps:%u.", =
i);
> +                         free(dev);
> +                         continue;
> +--- systemd-pam-185/src/core/mount-setup.c.orig	2012-06-22 23:23:41.0000=
00000 -0400
> ++++ systemd-pam-185/src/core/mount-setup.c	2012-06-22 21:19:44.000000000=
 -0400
> +@@ -28,6 +28,7 @@
> + #include <assert.h>
> + #include <unistd.h>
> + #include <ftw.h>
> ++#include <linux/fs.h>
> +
> + #include "mount-setup.h"
> + #include "dev-setup.h"
> +@@ -41,6 +41,8 @@
> + #include "path-util.h"
> + #include "missing.h"
> +=20
> ++#include "config.h"
> ++
> + #ifndef TTY_GID
> + #define TTY_GID 5
> + #endif
> +@@ -200,9 +202,12 @@
> +         for (;;) {
> +                 char *controller;
> +                 int enabled =3D 0;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) =
!=3D 2) {
> +-
> ++#else
> ++		controller =3D malloc(257);
> ++                if (fscanf(f, "%256s %*i %*i %i", controller, &enabled)=
 !=3D 2) {
> ++#endif /* HAVE_MSFORMAT */
> +                         if (feof(f))
> +                                 break;
> +=20
> +--- systemd-pam-185/src/core/mount.c.orig	2012-06-22 23:24:17.000000000 =
-0400
> ++++ systemd-pam-185/src/core/mount.c	2012-06-22 22:51:21.000000000 -0400
> +@@ -41,6 +41,8 @@
> + #include "exit-status.h"
> + #include "def.h"
> +=20
> ++#include "config.h"
> ++
> + static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] =
=3D {
> +         [MOUNT_DEAD] =3D UNIT_INACTIVE,
> +         [MOUNT_MOUNTING] =3D UNIT_ACTIVATING,
> +@@ -1514,7 +1516,7 @@
> +                 int k;
> +=20
> +                 device =3D path =3D options =3D options2 =3D fstype =3D=
 d =3D p =3D o =3D NULL;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 if ((k =3D fscanf(m->proc_self_mountinfo,
> +                                 "%*s "       /* (1) mount id */
> +                                 "%*s "       /* (2) parent id */
> +@@ -1533,7 +1535,31 @@
> +                                 &fstype,
> +                                 &device,
> +                                 &options2)) !=3D 5) {
> +-
> ++#else
> ++		path =3D malloc(257);
> ++		options =3D malloc(257);
> ++		fstype =3D malloc(257);
> ++		device =3D malloc(257);
> ++		options2 =3D malloc(257);
> ++                if ((k =3D fscanf(m->proc_self_mountinfo,
> ++                                "%*s "       /* (1) mount id */
> ++                                "%*s "       /* (2) parent id */
> ++                                "%*s "       /* (3) major:minor */
> ++                                "%*s "       /* (4) root */
> ++                                "%256s "     /* (5) mount point */
> ++                                "%256s"      /* (6) mount options */
> ++                                "%*[^-]"     /* (7) optional fields */
> ++                                "- "         /* (8) separator */
> ++                                "%256s "     /* (9) file system type */
> ++                                "%256s"      /* (10) mount source */
> ++                                "%256s"      /* (11) mount options 2 */
> ++                                "%*[^\n]",   /* some rubbish at the end=
 */
> ++                                path,
> ++                                options,
> ++                                fstype,
> ++                                device,
> ++                                options2)) !=3D 5) {
> ++#endif /* HAVE_MSFORMAT */
> +                         if (k =3D=3D EOF)
> +                                 break;
> +=20
> +--- systemd-pam-185/src/core/umount.c.orig	2012-06-22 23:24:37.000000000=
 -0400
> ++++ systemd-pam-185/src/core/umount.c	2012-06-22 22:56:15.000000000 -0400
> +@@ -35,6 +35,8 @@
> + #include "path-util.h"
> + #include "util.h"
> +=20
> ++#include "config.h"
> ++
> + typedef struct MountPoint {
> +         char *path;
> +         dev_t devnum;
> +@@ -74,7 +76,7 @@
> +                 MountPoint *m;
> +=20
> +                 path =3D p =3D NULL;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 if ((k =3D fscanf(proc_self_mountinfo,
> +                                 "%*s "       /* (1) mount id */
> +                                 "%*s "       /* (2) parent id */
> +@@ -89,6 +91,23 @@
> +                                 "%*s"        /* (11) mount options 2 */
> +                                 "%*[^\n]",   /* some rubbish at the end=
 */
> +                                 &path)) !=3D 1) {
> ++#else
> ++		path =3D malloc(257);
> ++                if ((k =3D fscanf(proc_self_mountinfo,
> ++                                "%*s "       /* (1) mount id */
> ++                                "%*s "       /* (2) parent id */
> ++                                "%*s "       /* (3) major:minor */
> ++                                "%*s "       /* (4) root */
> ++                                "%256s "     /* (5) mount point */
> ++                                "%*s"        /* (6) mount options */
> ++                                "%*[^-]"     /* (7) optional fields */
> ++                                "- "         /* (8) separator */
> ++                                "%*s "       /* (9) file system type */
> ++                                "%*s"        /* (10) mount source */
> ++                                "%*s"        /* (11) mount options 2 */
> ++                                "%*[^\n]",   /* some rubbish at the end=
 */
> ++                                path)) !=3D 1) {
> ++#endif /* HAVE_MSFORMAT */
> +                         if (k =3D=3D EOF)
> +                                 break;
> +=20
> +@@ -150,7 +169,7 @@
> +                 MountPoint *swap;
> +                 char *dev =3D NULL, *d;
> +                 int k;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 if ((k =3D fscanf(proc_swaps,
> +                                 "%ms " /* device/file */
> +                                 "%*s " /* type of swap */
> +@@ -158,7 +177,16 @@
> +                                 "%*s " /* used */
> +                                 "%*s\n", /* priority */
> +                                 &dev)) !=3D 1) {
> +-
> ++#else
> ++		dev =3D malloc(257);
> ++                if ((k =3D fscanf(proc_swaps,
> ++                                "%256s " /* device/file */
> ++                                "%*s " /* type of swap */
> ++                                "%*s " /* swap size */
> ++                                "%*s " /* used */
> ++                                "%*s\n", /* priority */
> ++                                dev)) !=3D 1) {
> ++#endif /* HAVE_MSFORMAT */
> +                         if (k =3D=3D EOF)
> +                                 break;
> +=20
> +--- systemd-pam-185/src/shared/socket-util.c.orig	2012-06-22 23:25:00.00=
0000000 -0400
> ++++ systemd-pam-185/src/shared/socket-util.c	2012-06-22 22:59:27.0000000=
00 -0400
> +@@ -39,6 +39,8 @@
> + #include "socket-util.h"
> + #include "missing.h"
> +=20
> ++#include "config.h"
> ++
> + int socket_address_parse(SocketAddress *a, const char *s) {
> +         int r;
> +         char *e, *n;
> +@@ -201,8 +203,16 @@
> +         a->type =3D SOCK_RAW;
> +=20
> +         errno =3D 0;
> +-        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> ++#ifdef HAVE_MSFORMAT
> ++	if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> ++                return errno ? -errno : -EINVAL;
> ++#else
> ++	sfamily =3D malloc(257);
> ++	if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
> ++		free(sfamily);
> +                 return errno ? -errno : -EINVAL;
> ++	}
> ++#endif /* HAVE_MSFORMAT */
> +=20
> +         if ((family =3D netlink_family_from_string(sfamily)) < 0)
> +                 if (safe_atoi(sfamily, &family) < 0) {
> +--- systemd-pam-185/src/tmpfiles/tmpfiles.c.orig	2012-06-22 23:25:21.000=
000000 -0400
> ++++ systemd-pam-185/src/tmpfiles/tmpfiles.c	2012-06-22 23:13:49.00000000=
0 -0400
> +@@ -48,6 +48,8 @@
> + #include "set.h"
> + #include "conf-files.h"
> +=20
> ++#include "config.h"
> ++
> + /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
> +  * them in the file system. This is intended to be used to create
> +  * properly owned directories beneath /tmp, /var/tmp, /run, which are
> +@@ -970,7 +972,7 @@
> +         i =3D new0(Item, 1);
> +         if (!i)
> +                 return log_oom();
> +-
> ++#ifdef HAVE_MSFORMAT
> +         if (sscanf(buffer,
> +                    "%c "
> +                    "%ms "
> +@@ -986,6 +988,28 @@
> +                    &group,
> +                    &age,
> +                    &n) < 2) {
> ++#else
> ++	i->path =3D malloc(257);
> ++	mode =3D malloc(257);
> ++	user =3D malloc(257);
> ++	group =3D malloc(257);
> ++	age =3D malloc(257);
> ++        if (sscanf(buffer,
> ++                   "%c "
> ++                   "%256s "
> ++                   "%256s "
> ++                   "%256s "
> ++                   "%256s "
> ++                   "%256s "
> ++                   "%n",
> ++                   &type,
> ++                   i->path,
> ++                   mode,
> ++                   user,
> ++                   group,
> ++                   age,
> ++                   &n) < 2) {
> ++#endif /* HAVE_MSFORMAT */
> +                 log_error("[%s:%u] Syntax error.", fname, line);
> +                 r =3D -EIO;
> +                 goto finish;
> +--- systemd-pam-185/src/cryptsetup/cryptsetup-generator.c.orig	2012-06-2=
2 23:25:47.000000000 -0400
> ++++ systemd-pam-185/src/cryptsetup/cryptsetup-generator.c	2012-06-22 23:=
16:35.000000000 -0400
> +@@ -30,6 +30,8 @@
> + #include "virt.h"
> + #include "strv.h"
> +=20
> ++#include "config.h"
> ++
> + static const char *arg_dest =3D "/tmp";
> + static bool arg_enabled =3D true;
> + static bool arg_read_crypttab =3D true;
> +@@ -421,8 +423,15 @@
> +                 l =3D strstrip(line);
> +                 if (*l =3D=3D '#' || *l =3D=3D 0)
> +                         continue;
> +-
> ++#ifdef HAVE_MSFORMAT
> +                 k =3D sscanf(l, "%ms %ms %ms %ms", &name, &device, &pas=
sword, &options);
> ++#else
> ++		name =3D malloc(257);
> ++		device =3D malloc(257);
> ++		password =3D malloc(257);
> ++		options =3D malloc(257);
> ++                k =3D sscanf(l, "%256s %256s %256s %256s", name, device=
, password, options);
> ++#endif /* HAVE_MSFORMAT */
> +                 if (k < 2 || k > 4) {
> +                         log_error("Failed to parse /etc/crypttab:%u, ig=
noring.", n);
> +                         r =3D EXIT_FAILURE;
> diff --git a/meta/recipes-core/systemd/systemd/touchscreen.rules b/meta/r=
ecipes-core/systemd/systemd/touchscreen.rules
> new file mode 100644
> index 0000000..d83fd16
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/touchscreen.rules
> @@ -0,0 +1,18 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existin=
g node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Create a symlink to any touchscreen input device
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*18,*", SYMLINK+=3D"input/touchscreen0"
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"ads7846", SYMLINK+=3D"input/touchscreen0"
> diff --git a/meta/recipes-core/systemd/systemd/use-rootlibdir.patch b/met=
a/recipes-core/systemd/systemd/use-rootlibdir.patch
> new file mode 100644
> index 0000000..4c471b6
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/use-rootlibdir.patch
> @@ -0,0 +1,107 @@
> +Upstream-Status: Undecided
> +
> +This patch removes some of hardcoded references to /lib
> +and /usr/lib since on some architectures it should be
> +/lib64 and /usr/lib64 atleast in OE
> +
> +I am not sure about the intention of hardcoded values
> +thats why status is undecided
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: git/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/Makefile.am	2012-09-22 11:07:58.811981199 -0700
> ++++ git/Makefile.am	2012-09-22 11:09:11.267983956 -0700
> +@@ -64,25 +64,25 @@
> +=20
> + # Our own, non-special dirs
> + pkgsysconfdir=3D$(sysconfdir)/systemd
> +-userunitdir=3D$(prefix)/lib/systemd/user
> +-userpresetdir=3D$(prefix)/lib/systemd/user-preset
> +-tmpfilesdir=3D$(prefix)/lib/tmpfiles.d
> +-sysctldir=3D$(prefix)/lib/sysctl.d
> +-usergeneratordir=3D$(prefix)/lib/systemd/user-generators
> ++userunitdir=3D$(prefix)/$(rootlibdir)/systemd/user
> ++userpresetdir=3D$(prefix)/$(rootlibdir)/systemd/user-preset
> ++tmpfilesdir=3D$(prefix)/$(rootlibdir)/tmpfiles.d
> ++sysctldir=3D$(prefix)/$(rootlibdir)/sysctl.d
> ++usergeneratordir=3D$(prefix)/$(rootlibdir)/systemd/user-generators
> + pkgincludedir=3D$(includedir)/systemd
> + systemgeneratordir=3D$(rootlibexecdir)/system-generators
> + systemshutdowndir=3D$(rootlibexecdir)/system-shutdown
> + systemsleepdir=3D$(rootlibexecdir)/system-sleep
> +-systemunitdir=3D$(rootprefix)/lib/systemd/system
> +-systempresetdir=3D$(rootprefix)/lib/systemd/system-preset
> +-udevlibexecdir=3D$(rootprefix)/lib/udev
> ++systemunitdir=3D$(rootprefix)/$(rootlibdir)/systemd/system
> ++systempresetdir=3D$(rootprefix)/$(rootlibdir)/systemd/system-preset
> ++udevlibexecdir=3D$(rootprefix)/$(rootlibdir)/udev
> + udevhomedir =3D $(udevlibexecdir)
> + udevrulesdir =3D $(udevlibexecdir)/rules.d
> +=20
> + # And these are the special ones for /
> + rootprefix=3D@rootprefix@
> + rootbindir=3D$(rootprefix)/bin
> +-rootlibexecdir=3D$(rootprefix)/lib/systemd
> ++rootlibexecdir=3D$(rootprefix)/$(rootlibdir)/systemd
> +=20
> + CLEANFILES =3D $(BUILT_SOURCES)
> + EXTRA_DIST =3D
> +@@ -132,7 +132,7 @@
> + 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=3D\"$(bindir)/systemd-stdio-bridge\=
" \
> + 	-DROOTPREFIX=3D\"$(rootprefix)\" \
> + 	-DRUNTIME_DIR=3D\"/run\" \
> +-	-DRANDOM_SEED=3D\"$(localstatedir)/lib/random-seed\" \
> ++	-DRANDOM_SEED=3D\"$(localstatedir)/$(rootlibdir)/random-seed\" \
> + 	-DSYSTEMD_CRYPTSETUP_PATH=3D\"$(rootlibexecdir)/systemd-cryptsetup\" \
> + 	-DSYSTEM_GENERATOR_PATH=3D\"$(systemgeneratordir)\" \
> + 	-DUSER_GENERATOR_PATH=3D\"$(usergeneratordir)\" \
> +@@ -2692,7 +2692,7 @@
> +=20
> + binfmt-install-data-hook:
> + 	$(MKDIR_P) -m 0755 \
> +-		$(DESTDIR)$(prefix)/lib/binfmt.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
> + 		$(DESTDIR)$(sysconfdir)/binfmt.d \
> + 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
> + 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
> +@@ -3107,7 +3107,7 @@
> +=20
> + timedated-install-data-hook:
> + 	$(MKDIR_P) -m 0755 \
> +-		$(DESTDIR)$(prefix)/lib/systemd/ntp-units.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/systemd/ntp-units.d \
> + 		$(DESTDIR)$(sysconfdir)/systemd/ntp-units.d
> + 	( cd $(DESTDIR)$(systemunitdir) && \
> + 		rm -f dbus-org.freedesktop.timedate1.service  && \
> +@@ -3337,7 +3337,7 @@
> + logind-install-data-hook:
> + 	$(MKDIR_P) -m 0755 \
> + 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
> +-		$(DESTDIR)$(localstatedir)/lib/systemd
> ++		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
> + 	( cd $(DESTDIR)$(systemunitdir) && \
> + 		rm -f dbus-org.freedesktop.login1.service && \
> + 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
> +@@ -3494,7 +3494,7 @@
> + 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
> + 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
> + 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
> +-		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
> ++		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
> + 		-e 's,@prefix\@,$(prefix),g' \
> + 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
> + 		-e 's,@libdir\@,$(libdir),g' \
> +@@ -3619,9 +3619,9 @@
> + 	$(MKDIR_P) -m 0755 \
> + 		$(DESTDIR)$(tmpfilesdir) \
> + 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
> +-		$(DESTDIR)$(prefix)/lib/modules-load.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
> + 		$(DESTDIR)$(sysconfdir)/modules-load.d \
> +-		$(DESTDIR)$(prefix)/lib/sysctl.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
> + 		$(DESTDIR)$(sysconfdir)/sysctl.d \
> + 		$(DESTDIR)$(systemshutdowndir) \
> + 		$(DESTDIR)$(systemsleepdir) \
> diff --git a/meta/recipes-core/systemd/systemd/var-run.conf b/meta/recipe=
s-core/systemd/systemd/var-run.conf
> new file mode 100644
> index 0000000..c2c18e2
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/var-run.conf
> @@ -0,0 +1,4 @@
> +# empty /var/run
> +R	/var/run/*	-	-	-	-	-
> +# systemd-update-utmp-runlevel.service fails to start without this
> +f /var/run/utmp 0644 root root - -
> diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core=
/systemd/systemd_196.bb
> new file mode 100644
> index 0000000..1861437
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd_196.bb
> @@ -0,0 +1,249 @@
> +DESCRIPTION =3D "Systemd a init replacement"
> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> +
> +LICENSE =3D "GPLv2 & LGPLv2.1 & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
> +                    file://LICENSE.LGPL2.1;md5=3Dfb919cc88dbe06ec0b0bd50=
e001ccf1f \
> +                    file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8=
868ed"
> +
> +PROVIDES =3D "udev"
> +
> +DEPENDS =3D "xz kmod gtk-doc-stub-native docbook-sgml-dtd-4.1-native int=
ltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers u=
sbutils glib-2.0 libgcrypt"
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> +
> +SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
> +
> +SECTION =3D "base/shell"
> +
> +inherit useradd pkgconfig autotools perlnative
> +
> +SRC_URI =3D "http://www.freedesktop.org/software/systemd/systemd-${PV}.t=
ar.xz \
> +           file://0001-Revert-systemd-analyze-use-argparse-instead-of-ge=
top.patch \
> +           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.p=
atch \
> +           file://touchscreen.rules \
> +           file://modprobe.rules \
> +           file://var-run.conf \
> +           ${UCLIBCPATCHES} \
> +           file://00-create-volatile.conf \
> +          "
> +SRC_URI[md5sum] =3D "05ebd7f108e420e2b4e4810ea4b3c810"
> +SRC_URI[sha256sum] =3D "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcf=
fdfc6f058b55e4bf"
> +
> +UCLIBCPATCHES =3D ""
> +UCLIBCPATCHES_libc-uclibc =3D "file://systemd-pam-configure-check-uclibc=
=2Epatch \
> +                             file://systemd-pam-fix-execvpe.patch \
> +                             file://systemd-pam-fix-fallocate.patch \
> +                             file://systemd-pam-fix-getty-unit.patch \
> +                             file://systemd-pam-fix-mkostemp.patch \
> +                             file://systemd-pam-fix-msformat.patch \
> +                             file://optional_secure_getenv.patch \
> +                            "
> +LDFLAGS_libc-uclibc_append =3D " -lrt"
> +
> +# This will disappear with systemd 197
> +SYSTEMDDISTRO ?=3D "debian"
> +
> +CACHED_CONFIGUREVARS =3D "ac_cv_file__usr_share_pci_ids=3Dno \
> +                        ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
> +                        ac_cv_file__usr_share_misc_pci_ids=3Dyes"
> +
> +# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
> +EXTRA_OECONF =3D " --with-distro=3D${SYSTEMDDISTRO} \
> +                 --with-rootprefix=3D${base_prefix} \
> +                 --with-rootlibdir=3D${base_libdir} \
> +                 --sbindir=3D${base_sbindir} \
> +                 --libexecdir=3D${base_libdir} \
> +                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pa=
m', '--disable-pam', d)} \
> +                 --enable-xz \
> +                 --disable-manpages \
> +                 --disable-coredump \
> +                 --disable-introspection \
> +                 --with-pci-ids-path=3D/usr/share/misc \
> +                 --disable-gtk-doc-html \
> +                 --disable-tcpwrap \
> +                 --enable-split-usr \
> +                 --disable-microhttpd \
> +                 --without-python \
> +               "
> +
> +# There's no docbook-xsl-native, so for the xsltproc check to false
> +do_configure_prepend() {
> +	export CPP=3D"${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
> +	sed -i /xsltproc/d configure.ac
> +
> +	# we only have /home/root, not /root
> +	sed -i -e 's:=3D/root:=3D/home/root:g' units/*.service*
> +
> +	gtkdocize --docdir ${S}/docs/
> +}
> +
> +do_install() {
> +	autotools_do_install
> +	install -d ${D}/${base_sbindir}
> +	# provided by a seperate recipe
> +	rm ${D}${systemd_unitdir}/system/serial-getty* -f
> +
> +	# provide support for initramfs
> +	ln -s ${systemd_unitdir}/systemd ${D}/init
> +	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
> +
> +	# create dir for journal
> +	install -d ${D}${localstatedir}/log/journal
> +
> +	# create machine-id
> +	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machi=
ne-id-setup at install time, b) have / read-only and an empty file there (f=
or stateless) and c) boot with / writable
> +	touch ${D}${sysconfdir}/machine-id
> +
> +	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
> +
> +	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
> +
> +	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tm=
pfiles.d/
> +}
> +
> +python populate_packages_prepend (){
> +    systemdlibdir =3D d.getVar("base_libdir", True)
> +    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Sys=
temd %s library', extra_depends=3D'', allow_links=3DTrue)
> +}
> +PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> +
> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "-r lock"
> +
> +FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
> +RDEPENDS_${PN}-analyze =3D "python-dbus python-argparse python-textutils"
> +RRECOMMENDS_${PN}-analyze =3D "python-pycairo"
> +
> +FILES_${PN}-initramfs =3D "/init"
> +RDEPENDS_${PN}-initramfs =3D "${PN}"
> +
> +FILES_${PN}-gui =3D "${bindir}/systemadm"
> +
> +FILES_${PN}-vconsole-setup =3D "${systemd_unitdir}/systemd-vconsole-setu=
p \
> +                              ${systemd_unitdir}/system/systemd-vconsole=
-setup.service \
> +                              ${systemd_unitdir}/system/sysinit.target.w=
ants/systemd-vconsole-setup.service"
> +
> +RRECOMMENDS_${PN}-vconsole-setup =3D "kbd kbd-consolefonts"
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/systemd/journald.conf \
> +                ${sysconfdir}/systemd/logind.conf \
> +                ${sysconfdir}/systemd/system.conf \
> +                ${sysconfdir}/systemd/user.conf"
> +
> +FILES_${PN} =3D " ${base_bindir}/* \
> +                ${datadir}/dbus-1/services \
> +                ${datadir}/dbus-1/system-services \
> +                ${datadir}/polkit-1 \
> +                ${datadir}/${PN} \
> +                ${sysconfdir}/bash_completion.d/ \
> +                ${sysconfdir}/binfmt.d/ \
> +                ${sysconfdir}/dbus-1/ \
> +                ${sysconfdir}/machine-id \
> +                ${sysconfdir}/modules-load.d/ \
> +                ${sysconfdir}/sysctl.d/ \
> +                ${sysconfdir}/systemd/ \
> +                ${sysconfdir}/tmpfiles.d/ \
> +                ${sysconfdir}/xdg/ \
> +                ${sysconfdir}/init.d/README \
> +                ${systemd_unitdir}/* \
> +                ${systemd_unitdir}/system/* \
> +                /lib/udev/rules.d/99-systemd.rules \
> +                ${base_libdir}/security/*.so \
> +                /cgroup \
> +                ${bindir}/systemd* \
> +                ${bindir}/localectl \
> +                ${bindir}/hostnamectl \
> +                ${bindir}/timedatectl \
> +                ${exec_prefix}/lib/tmpfiles.d/*.conf \
> +                ${exec_prefix}/lib/systemd \
> +                ${exec_prefix}/lib/binfmt.d \
> +                ${exec_prefix}/lib/modules-load.d \
> +                ${exec_prefix}/lib/sysctl.d \
> +                ${localstatedir} \
> +                ${libexecdir} \
> +                /lib/udev/rules.d/70-uaccess.rules \
> +                /lib/udev/rules.d/71-seat.rules \
> +                /lib/udev/rules.d/73-seat-late.rules \
> +                /lib/udev/rules.d/99-systemd.rules \
> +               "
> +
> +FILES_${PN}-dbg +=3D "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.de=
bug ${base_libdir}/security/.debug/"
> +FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
> +
> +RDEPENDS_${PN} +=3D "dbus udev-systemd"
> +
> +# kbd -> loadkeys,setfont
> +# systemd calls 'modprobe -sab --', which busybox doesn't support due to=
 lack
> +# of blacklist support, so use proper modprobe from module-init-tools
> +# And pull in the kernel modules mentioned in INSTALL
> +# swapon -p is also not supported by busybox
> +# busybox mount is broken
> +RRECOMMENDS_${PN} +=3D "systemd-serialgetty \
> +                      util-linux-agetty \
> +                      util-linux-swaponoff \
> +                      util-linux-fsck e2fsprogs-e2fsck \
> +                      module-init-tools \
> +                      util-linux-mount util-linux-umount \
> +                      kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 \
> +"
> +
> +PACKAGES =3D+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
> +
> +FILES_udev-dbg +=3D "/lib/udev/.debug"
> +
> +RDEPENDS_udev +=3D "udev-utils"
> +RPROVIDES_udev =3D "hotplug"
> +
> +FILES_udev +=3D "${base_sbindir}/udevd \
> +               /libstemd-udevd \
> +               /lib/udev/accelerometer \
> +               /lib/udev/ata_id \
> +               /lib/udev/cdrom_id \
> +               /lib/udev/collect \
> +               /lib/udev/findkeyboards \
> +               /lib/udev/keyboard-force-release.sh \
> +               /lib/udev/keymap \
> +               /lib/udev/mtd_probe \
> +               /lib/udev/scsi_id \
> +               /lib/udev/v4l_id \
> +               /lib/udev/keymaps \
> +               /lib/udev/rules.d/4*.rules \
> +               /lib/udev/rules.d/5*.rules \
> +               /lib/udev/rules.d/6*.rules \
> +               /lib/udev/rules.d/70-power-switch.rules \
> +               /lib/udev/rules.d/75*.rules \
> +               /lib/udev/rules.d/78*.rules \
> +               /lib/udev/rules.d/8*.rules \
> +               /lib/udev/rules.d/95*.rules \
> +               ${base_libdir}/udev/hwdb.d \
> +               ${sysconfdir}/udev \
> +              "
> +
> +FILES_udev-consolekit +=3D "/lib/ConsoleKit"
> +RDEPENDS_udev-consolekit +=3D "${@base_contains('DISTRO_FEATURES', 'x11'=
, 'consolekit', '', d)}"
> +
> +FILES_udev-utils =3D "${bindir}/udevadm"
> +
> +FILES_udev-systemd =3D "${systemd_unitdir}/system/*udev* ${systemd_unitd=
ir}/system/*.wants/*udev*"
> +RDEPENDS_udev-systemd =3D "udev"
> +
> +# TODO:
> +# u-a for runlevel and telinit
> +
> +pkg_postinst_systemd () {
> +update-alternatives --install ${base_sbindir}/init init ${systemd_unitdi=
r}/systemd 300
> +update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/s=
ystemctl 300
> +update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindi=
r}/systemctl 300
> +update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_b=
indir}/systemctl 300
> +update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_b=
indir}/systemctl 300
> +}
> +
> +pkg_prerm_systemd () {
> +update-alternatives --remove init ${systemd_unitdir}/systemd
> +update-alternatives --remove halt ${base_bindir}/systemctl
> +update-alternatives --remove reboot ${base_bindir}/systemctl
> +update-alternatives --remove shutdown ${base_bindir}/systemctl
> +update-alternatives --remove poweroff ${base_bindir}/systemctl
> +}
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gJNQRAHI5jiYqw2y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD8eYoACgkQN1Ujt2V2gBwVKQCfbou+1vP+Hx20TR+PTn1V1fas
0v0An161eMSWydf3r7ualRb3vWZZ2hCc
=ckhn
-----END PGP SIGNATURE-----

--gJNQRAHI5jiYqw2y--
