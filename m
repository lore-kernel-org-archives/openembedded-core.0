Received: from mail-ey0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1QoRl7-0008On-Be; Wed, 03 Aug 2011 05:04:37 +0200
Received: by eyx24 with SMTP id 24so425160eyx.19
	for <multiple recipients>; Tue, 02 Aug 2011 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=IJOJDFu3lkJOkYTWGRy3IbrnUMB9I6gLicUIQSUtj68=;
	b=QHwFV1DE0E7Y1QtJiQJU4ZzT9DHDyerd889VohgB48151seOtDqddu6fxOkwuCjl2h
	QllQMK7JDRVOHXP5OqPlRFMAn3cDACFCfXEDSXDWkBOd6/yN/B1FS+4RHV9Nibbk41ht
	TxuMdit4v/vyzgO98DFnwwF2RAp/ZuQ/GEDnY=
MIME-Version: 1.0
Received: by 10.213.25.77 with SMTP id y13mr25901ebb.129.1312340415151; Tue,
	02 Aug 2011 20:00:15 -0700 (PDT)
Received: by 10.213.113.196 with HTTP; Tue, 2 Aug 2011 20:00:15 -0700 (PDT)
In-Reply-To: <CAD=GYpYeDmU6CN1MzztiKsf+tfOrWgBmkGfQoSpSRhoToDDskg@mail.gmail.com>
References: <CAD=GYpYeDmU6CN1MzztiKsf+tfOrWgBmkGfQoSpSRhoToDDskg@mail.gmail.com>
Date: Tue, 2 Aug 2011 22:00:15 -0500
Message-ID: <CAD=GYpbk+qV3E2uTuSpQV1R2G77K3-QL+6aHo0kGW5yodmxEvg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Kooi, Koen" <k-kooi@ti.com>, openembedded-devel@lists.openembedded.org,
	"Kridner, Jason" <jdk@ti.com>
Subject: Re: systemd-gnome-image do_rootfs failure
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
X-List-Received-Date: Wed, 03 Aug 2011 03:04:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I now get a build error as below with systemd-gnome-image in
do_rootfs, could you take a look?

Also I had to remove 'fontconfig' from RDEPENDS_task-gnome-fonts in
recipes-angstrom/tasks/angstrom-task-gnome.bb as the package didn't
exist and it was causing more opkg install problems in do_rootfs .
Could you comment on this? Thanks

| Configuring e2fsprogs-e2fsck.
| Configuring shadow.
| Configuring xauth.
| Configuring e2fsprogs-blkid.
| Configuring libavahi-core7.
| Configuring libdaemon0.
| Configuring sysvinit-pidof.
| Configuring libnss-mdns.
| Configuring avahi-daemon.
| Configuring avahi-systemd.
| Configuring connman-plugin-ethernet.
| Configuring kernel-module-nf-nat.
| Configuring kernel-module-ipt-masquerade.
| Configuring kernel-module-iptable-nat.
| Configuring kernel-module-iptable-filter.
| Configuring iptables.
| Configuring xf86-input-mouse.
| Configuring udev.
| Configuring xhost.
| Configuring xset.
| Configuring xrandr.
| Configuring xinetd.
| Configuring xrdb.
| Configuring task-gnome-xserver-base.
| Configuring connman-plugin-wifi.
| Configuring connman-systemd.
| Configuring avahi-utils.
| Configuring tinylogin.
| Configuring htop.
| Configuring openssh-sftp.
| Configuring xf86-input-evdev.
| Configuring task-xserver.
| Configuring cpufrequtils.
| Configuring systemd-compat-units.
| Configuring dnsmasq-dbus.
| Configuring connman.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-gnome-fonts:
|  *    eglibc (>=3D 2.12) *
|  * opkg_install_cmd: Cannot install package task-gnome-fonts.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-gnome:
|  *    eglibc (>=3D 2.12) *
|  * opkg_install_cmd: Cannot install package task-gnome.
| ERROR: Function 'do_rootfs' failed (see
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/=
work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/temp/log=
.do_rootfs.25130
for further information)
NOTE: package systemd-gnome-image-1.0-r0: task do_rootfs: Failed
ERROR: Task 8 (/home/joel/angstrom-oe/setup-scripts-core/sources/meta-angst=
rom/recipes-angstrom/images/systemd-gnome-image.bb,
do_rootfs) failed with exit code '1'
ERROR: '/home/joel/angstrom-oe/setup-scripts-core/sources/meta-angstrom/rec=
ipes-angstrom/images/systemd-gnome-image.bb'
failed


On Tue, Aug 2, 2011 at 4:57 PM, Joel A Fernandes <agnel.joel@gmail.com> wro=
te:
> I'd like to report a possible problem with oe-core that I'm not sure how =
to fix:
>
> On running a "bitbake systemd-gnome-image", the do_rootfs stage fails
> saying certain packages are missing.
>
> On digging further, I find that the opkg.conf that opkg-cl uses (in
> image.bbclass do_rootfs function) has the following contents:
>
> arch all 1
> arch any 6
> arch noarch 11
> arch arm 16
> arch beagleboard 21
> src oe file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_=
2010_x-eglibc/deploy/ipk
> src oe-all file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all
> src oe-beagleboard
> file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-=
eglibc/deploy/ipk/beagleboard
>
> But there is no entry for:
> file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-=
eglibc/deploy/ipk/armv7a
>
> As a result, many packages like xserver-xorg are not found by opkg and
> the do_rootfs stage fails.
>
> This could be a potential problem in package_generate_ipkg_conf in
> ./openembedded-core/meta/classes/package_ipk.bbclass (?)
>
> Here is the build log:
> [..]
> ++ echo any
> ++ sed -e s/arm/i686/
> + sdkarch=3Dany
> + extension=3D-nativesdk
> + '[' any =3D all -o any =3D any -o any =3D noarch ']'
> + extension=3D
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/any/Packages
> ']'
> + for arch in '$ipkgarchs'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/noarch/Packages
> ']'
> ++ echo noarch
> ++ sed -e s/arm/i686/
> + sdkarch=3Dnoarch
> + extension=3D-nativesdk
> + '[' noarch =3D all -o noarch =3D any -o noarch =3D noarch ']'
> + extension=3D
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/noarch/Packages
> ']'
> + for arch in '$ipkgarchs'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/arm/Packages
> ']'
> ++ echo arm
> ++ sed -e s/arm/i686/
> + sdkarch=3Di686
> + extension=3D-nativesdk
> + '[' i686 =3D all -o i686 =3D any -o i686 =3D noarch ']'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/i686-nativesdk/Packages
> ']'
> + for arch in '$ipkgarchs'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/beagleboard/Packages
> ']'
> + echo 'src oe-beagleboard
> file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-=
eglibc/deploy/ipk/beagleboard'
> ++ echo beagleboard
> ++ sed -e s/arm/i686/
> + sdkarch=3Dbeagleboard
> + extension=3D-nativesdk
> + '[' beagleboard =3D all -o beagleboard =3D any -o beagleboard =3D noarc=
h ']'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_201=
0_x-eglibc/deploy/ipk/beagleboard-nativesdk/Packages
> ']'
> + multilib_archs=3D
> + mkdir -p /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2=
010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/temp/
> + STATUS=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2=
010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/rootfs/var/lib/opkg/status
> + mkdir -p /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2=
010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/rootfs/var/lib/opkg
> + opkg-cl -f /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom=
_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-=
1.0-r0/opkg.conf
> -o /home/joel/angstrom-o
> e/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-an=
gstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite update
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs=
//v
> ar/lib/opkg/lists/oe.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs=
//v
> ar/lib/opkg/lists/oe-all.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/beagleboard/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs=
//v
> ar/lib/opkg/lists/oe-beagleboard.
> + export INSTALL_PACKAGES_ATTEMPTONLY_IPK=3D
> + INSTALL_PACKAGES_ATTEMPTONLY_IPK=3D
> + export INSTALL_PACKAGES_LINGUAS_IPK=3Dlocale-base-en-us
> + INSTALL_PACKAGES_LINGUAS_IPK=3Dlocale-base-en-us
> + export INSTALL_TASK_IPK=3Drootfs
> + INSTALL_TASK_IPK=3Drootfs
> + export INSTALL_ROOTFS_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/b=
uild/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/sys=
temd-gnome-image-1.0-r0/rootfs
> + INSTALL_ROOTFS_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/build/tm=
p-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gn=
ome-image-1.0-r0/rootfs
> + export INSTALL_CONF_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/bui=
ld/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/syste=
md-gnome-image-1.0-r0/opkg.conf
> + INSTALL_CONF_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp-=
angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnom=
e-image-1.0-r0/opkg.conf
> + export 'INSTALL_PACKAGES_NORMAL_IPK=3Dconnman-plugin-loopback
> openssh-sftp udev e2fsprogs-blkid htop rsyslog cpufrequtils systemd
> connman-plugin-wifi connman task-gnome-themes avahi-daemon
> e2fsprogs-e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> connman-systemd task-gnome avahi-utils task-xserver avahi-systemd
> shadow dropbear-systemd tinylogin angstrom-task-boot
> =A0task-gnome-xserver-base connman-plugin-ethernet'
> + INSTALL_PACKAGES_NORMAL_IPK=3D'connman-plugin-loopback openssh-sftp
> udev e2fsprogs-blkid htop rsyslog cpufrequtils systemd
> connman-plugin-wifi connman task-gnome-themes avahi-daemon e2fspro
> gs-e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> connman-systemd task-gnome avahi-utils task-xserver avahi-systemd
> shadow dropbear-systemd tinylogin angstrom-task-boot task-g
> nome-xserver-base connman-plugin-ethernet'
> + export INSTALL_PACKAGES_MULTILIB_IPK=3D
> + INSTALL_PACKAGES_MULTILIB_IPK=3D
> + package_install_internal_ipk
> + local target_rootfs=3D/home/joel/angstrom-oe/setup-scripts-core/build/t=
mp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-g=
nome-image-1.0-r0/rootfs
> + local conffile=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp-an=
gstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-=
image-1.0-r0/opkg.conf
> + local 'package_to_install=3Dconnman-plugin-loopback openssh-sftp udev
> e2fsprogs-blkid htop rsyslog cpufrequtils systemd connman-plugin-wifi
> connman task-gnome-themes avahi-daemon e2fsprogs-
> e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> connman-systemd task-gnome avahi-utils task-xserver avahi-systemd
> shadow dropbear-systemd tinylogin angstrom-task-boot task-gnom
> e-xserver-base connman-plugin-ethernet'
> + local package_attemptonly=3D
> + local package_lingusa=3D
> + local package_multilib=3D
> + local task=3Drootfs
> + mkdir -p /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2=
010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/rootfs/var/lib/opkg/
> + local 'ipkg_args=3D-f
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/opkg.c=
onf
> -o /home/joel/a
> ngstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagl=
eboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite'
> + opkg-cl -f /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom=
_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-=
1.0-r0/opkg.conf
> -o /home/joel/angstrom-o
> e/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-an=
gstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite update
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs=
//v
> ar/lib/opkg/lists/oe.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs=
//v
> ar/lib/opkg/lists/oe-all.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/beagleboard/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs=
//v
> ar/lib/opkg/lists/oe-beagleboard.
> + '[' xlinux-gnueabi =3D xlinux ']'
> + '[' xlinux-gnueabi =3D xlinux-gnueabi ']'
> + '[' '!' -z '' ']'
> + '[' '!' -z 'connman-plugin-loopback openssh-sftp udev
> e2fsprogs-blkid htop rsyslog cpufrequtils systemd connman-plugin-wifi
> connman task-gnome-themes avahi-daemon e2fsprogs-e2fsck task-gn
> ome-fonts task-gnome-apps systemd-compat-units connman-systemd
> task-gnome avahi-utils task-xserver avahi-systemd shadow
> dropbear-systemd tinylogin angstrom-task-boot task-gnome-xserver-base
> =A0connman-plugin-ethernet' ']'
> + opkg-cl -f /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom=
_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-=
1.0-r0/opkg.conf
> -o /home/joel/angstrom-o
> e/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-an=
gstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite install connman-plugin-loopback openssh-sft
> p udev e2fsprogs-blkid htop rsyslog cpufrequtils systemd
> connman-plugin-wifi connman task-gnome-themes avahi-daemon
> e2fsprogs-e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> co
> nnman-systemd task-gnome avahi-utils task-xserver avahi-systemd shadow
> dropbear-systemd tinylogin angstrom-task-boot task-gnome-xserver-base
> connman-plugin-ethernet
> Unknown package 'connman-plugin-loopback'.
> Unknown package 'openssh-sftp'.
> Unknown package 'udev'.
> Unknown package 'e2fsprogs-blkid'.
> Unknown package 'htop'.
> Unknown package 'rsyslog'.
> Unknown package 'cpufrequtils'.
> Unknown package 'systemd'.
> Unknown package 'connman-plugin-wifi'.
> Unknown package 'connman'.
> Installing task-gnome-themes (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/task-gnome-themes_1.0-r9_all.ipk.
> Unknown package 'avahi-daemon'.
> Unknown package 'e2fsprogs-e2fsck'.
> Installing task-gnome-fonts (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/task-gnome-fonts_1.0-r9_all.ipk.
> Installing task-gnome-apps (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/task-gnome-apps_1.0-r9_all.ipk.
> Installing systemd-compat-units (1.0-r10) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/systemd-compat-units_1.0-r10_all.ipk.
> Unknown package 'connman-systemd'.
> Installing task-gnome (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/task-gnome_1.0-r9_all.ipk.
> task-gnome: unsatisfied recommendation for ofono
> Unknown package 'avahi-utils'.
> Installing task-xserver (1.0-r0) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/beagleboard/task-xserver_1.0-r0_beagleboard.i=
pk.
> Unknown package 'avahi-systemd'.
> Installing shadow (4.1.4.3-r3) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/beagleboard/shadow_4.1.4.3-r3_beagleboard.ipk=
.
> Installing dropbear-systemd (v1-r0) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/dropbear-systemd_v1-r0_all.ipk.
> Unknown package 'tinylogin'.
> Installing angstrom-task-boot (1.0-r1) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/beagleboard/angstrom-task-boot_1.0-r1_beagleb=
oard.ipk.
> angstrom-feed-configs: unsatisfied recommendation for opkg
> Installing task-gnome-xserver-base (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angs=
trom_2010_x-eglibc/deploy/ipk/all/task-gnome-xserver-base_1.0-r9_all.ipk.
> mime-support: unsatisfied recommendation for file
> Unknown package 'connman-plugin-ethernet'.
> Configuring systemd-compat-units.
> Collected errors:
> =A0* opkg_install_cmd: Cannot install package connman-plugin-loopback.
> =A0* opkg_install_cmd: Cannot install package openssh-sftp.
> =A0* opkg_install_cmd: Cannot install package udev.
> =A0* opkg_install_cmd: Cannot install package e2fsprogs-blkid.
> =A0* opkg_install_cmd: Cannot install package htop.
> =A0* opkg_install_cmd: Cannot install package rsyslog.
> =A0* opkg_install_cmd: Cannot install package cpufrequtils.
> =A0* opkg_install_cmd: Cannot install package systemd.
> =A0* opkg_install_cmd: Cannot install package connman-plugin-wifi.
> =A0* opkg_install_cmd: Cannot install package connman.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-themes:
> =A0* =A0 =A0 =A0gnome-icon-theme * =A0 =A0 =A0gtk-engine-thinice *
> gtk-engine-redmond95 * =A0gtk-theme-crux * =A0 =A0 =A0 =A0gtk-engine-clea=
rlooks
> * =A0 =A0 =A0 =A0 gtk-engine-hcengine * =A0 gtk-theme-clearlooks *
> gnome-icon-theme * =A0 =A0 =A0gtk-theme-thinice * =A0 =A0 gnome-icon-them=
e *
> =A0gtk-engine-crux-engine * =A0 =A0 =A0 =A0gtk-theme-redmond *
> gtk-engine-glide * =A0 =A0 =A0gtk-theme-mist *
> =A0* opkg_install_cmd: Cannot install package task-gnome-themes.
> =A0* opkg_install_cmd: Cannot install package avahi-daemon.
> =A0* opkg_install_cmd: Cannot install package e2fsprogs-e2fsck.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-fonts:
> =A0* =A0 =A0 =A0mkfontdir * =A0 =A0 eglibc (>=3D 2.12) * =A0 =A0 =A0mkfon=
tscale *
> fontconfig * =A0 =A0fontconfig-utils *
> =A0* opkg_install_cmd: Cannot install package task-gnome-fonts.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-apps:
> =A0* =A0 =A0 =A0epiphany * =A0 =A0 =A0matchbox-terminal * =A0 =A0 x11vnc =
*
> =A0* opkg_install_cmd: Cannot install package task-gnome-apps.
> =A0* opkg_install_cmd: Cannot install package connman-systemd.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome:
> =A0* =A0 =A0 =A0gnome-keyring * =A0 =A0 =A0 =A0 gnome-bluetooth * =A0 =A0=
 =A0 nautilus *
> =A0gtk-engine-clearlooks * =A0 =A0 =A0 =A0 gtk-theme-clearlooks * =A0gdm =
*
> gnome-settings-daemon * =A0 =A0 =A0 =A0 gnome-panel * =A0 gnome-power-man=
ager *
> =A0gnome-control-center * =A0gnome-system-monitor * =A0upower *
> gnome-disk-utility * =A0 =A0connman-gnome * =A0 =A0 =A0 =A0 connman-plugi=
n-ntpd *
> =A0gdm-systemd * =A0 gpe-scap * =A0 =A0 =A0bash * =A0udisks *
> =A0* opkg_install_cmd: Cannot install package task-gnome.
> =A0* opkg_install_cmd: Cannot install package avahi-utils.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-xserver:
> =A0* =A0 =A0 =A0xserver-xorg * =A0xf86-input-mouse * =A0 =A0 =A0xf86-inpu=
t-keyboard *
> =A0xf86-input-evdev * =A0 =A0 =A0xf86-video-omapfb *
> =A0* opkg_install_cmd: Cannot install package task-xserver.
> =A0* opkg_install_cmd: Cannot install package avahi-systemd.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for shadow:
> =A0* =A0 =A0 =A0libpam-runtime * =A0 =A0 =A0 =A0pam-plugin-env *
> pam-plugin-shells * =A0 =A0 pam-plugin-faildelay * =A0pam-plugin-securett=
y *
> =A0pam-plugin-limits * =A0 =A0 pam-plugin-nologin * =A0 =A0pam-plugin-mot=
d *
> =A0eglibc (>=3D 2.12) * =A0 =A0 =A0pam-plugin-group * =A0 =A0 =A0pam-plug=
in-mail *
> =A0 pam-plugin-rootok * =A0 =A0 libpam (>=3D 1.1.4) * =A0 =A0 pam-plugin-=
lastlog
> *
> =A0* opkg_install_cmd: Cannot install package shadow.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for dropbear-systemd:
> =A0* =A0 =A0 =A0dropbear * =A0 =A0 =A0systemd *
> =A0* opkg_install_cmd: Cannot install package dropbear-systemd.
> =A0* opkg_install_cmd: Cannot install package tinylogin.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for angstrom-task-boot:
> =A0* =A0 =A0 =A0busybox * =A0 =A0 =A0 netbase * =A0 =A0 =A0 opkg * =A0bas=
e-passwd *
> =A0* opkg_install_cmd: Cannot install package angstrom-task-boot.
> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-xserver-base:
> =A0* =A0 =A0 =A0xvinfo * =A0 =A0 =A0 =A0dbus-x11 * =A0 =A0 =A0xdg-utils *=
 =A0 =A0 xhost *
> =A0xset * =A0xrandr * =A0 =A0 =A0 =A0xinetd * =A0 =A0 =A0 =A0xauth * =A0 =
=A0 =A0 =A0 xrdb * =A0xinit
> *
> =A0* opkg_install_cmd: Cannot install package task-gnome-xserver-base.
> =A0* opkg_install_cmd: Cannot install package connman-plugin-ethernet.
> ERROR: Function 'do_rootfs' failed (see
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/temp/l=
og.do_rootfs.32044
> for further information)
> (END)
>
>
> Thanks,
> Joel
>


