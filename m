Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6KEE-0001l0-9q
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 12:40:34 +0200
Received: by fxi1 with SMTP id 1so1504626fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 03:35:16 -0700 (PDT)
Received: by 10.223.36.68 with SMTP id s4mr831175fad.92.1316601315572;
	Wed, 21 Sep 2011 03:35:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b21sm3893338fab.8.2011.09.21.03.35.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:35:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b3d3c3a2df29ce43f732234d5da799e3d517e736.1316597628.git.sgw@linux.intel.com>
Date: Wed, 21 Sep 2011 12:35:12 +0200
Message-Id: <4CAD7688-F5DD-4BA6-BD85-2095CA6EF05F@dominion.thruhere.net>
References: <cover.1316597628.git.sgw@linux.intel.com>
	<b3d3c3a2df29ce43f732234d5da799e3d517e736.1316597628.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RC Fixes 07/19] distro tracking: Update Distro Aliases
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
X-List-Received-Date: Wed, 21 Sep 2011 10:40:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

To reiterate:

All the 'Poky' fields should be 'OE-core', OE-core should *not* have any =
poky references after the rebranding done post ELC 2011 a few months =
ago.

Op 21 sep. 2011, om 11:39 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../conf/distro/include/distro_tracking_fields.inc |   83 =
+++++++++++++++++++-
> 1 files changed, 81 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc =
b/meta/conf/distro/include/distro_tracking_fields.inc
> index b150af8..7ff233c 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -613,6 +613,7 @@ RECIPE_MAINTAINER_pn-libzypp =3D "Mark Hatle =
<mark.hatle@windriver.com>"
> RECIPE_LATEST_VERSION_pn-libzypp =3D "git"
> RECIPE_INTEL_SECTION_pn-libzypp =3D "base libs"
> RECIPE_COMMENTS_pn-libzypp =3D ""
> +DISTRO_PN_ALIAS_pn-libzypp =3D "OpenSuse=3Dlibzypp Meego=3Dlibzypp"
>=20
> RECIPE_STATUS_pn-dbus-wait =3D "green"
> RECIPE_DEPENDENCY_CHECK_pn-dbus-wait =3D "not done"
> @@ -743,6 +744,8 @@ RECIPE_COMMENTS_pn-opkg =3D ""
> RECIPE_LAST_UPDATE_pn-opkg =3D "Jul 21, 2010"
> RECIPE_MANUAL_CHECK_DATE_pn-opkg =3D "Jun 29, 2011"
> RECIPE_MAINTAINER_pn-opkg =3D "Dongxiao Xu <dongxiao.xu@intel.com"
> +DISTRO_PN_ALIAS_pn-opkg =3D "OSPDT =
upstream=3Dhttp://svn.openmoko.org/trunk/src/tar"
> +
>=20
> RECIPE_STATUS_pn-opkg_nogpg =3D "green"
> RECIPE_DEPENDENCY_CHECK_pn-opkg_nogpg =3D "not done"
> @@ -753,6 +756,8 @@ RECIPE_LATEST_RELEASE_DATE_pn-opkg_nogpg =3D =
"02/2010"
> RECIPE_COMMENTS_pn-opkg_nogpg =3D ""
> RECIPE_LAST_UPDATE_pn-opkg_nogpg =3D "Jul 21, 2010"
> RECIPE_MAINTAINER_pn-opkg_nogpg =3D "Dongxiao Xu =
<dongxiao.xu@intel.com"
> +DISTRO_PN_ALIAS_pn-opkg_nogpg =3D "OSPDT =
upstream=3Dhttp://svn.openmoko.org/trunk/s
> +
>=20
> RECIPE_STATUS_pn-dpkg =3D "green"
> RECIPE_LATEST_VERSION_pn-dpkg =3D "1.16.0.3"
> @@ -1051,6 +1056,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-shadow =
=3D "7 months"
> RECIPE_LATEST_RELEASE_DATE_pn-shadow =3D "Feb 15, 2011"
> RECIPE_LAST_UPDATE_pn-shadow =3D "Jun 4, 2011"
> RECIPE_MAINTAINER_pn-shadow =3D "Scott Garman =
<scott.a.garman@intel.com>"
> +DISTRO_PN_ALIAS_pn-shadow-sysroot =3D "Ubuntu=3Dshadow Fedora=3Dshadow"=

>=20
> RECIPE_STATUS_pn-coreutils =3D "green"
> RECIPE_LAST_UPDATE_pn-coreutils =3D "Jul 2, 2011"
> @@ -1151,6 +1157,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libgdbus =3D =
"09/2008"
> RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgdbus =3D "unknown"
> RECIPE_LAST_UPDATE_pn-libgdbus =3D "Jan 4, 2011"
> RECIPE_MAINTAINER_pn-libgdbus =3D "Scott Garman =
<scott.a.garman@intel.com>"
> +DISTRO_PN_ALIAS_pn-libgdbus =3D "Intel"
>=20
> RECIPE_STATUS_pn-apr =3D "green"
> RECIPE_LATEST_VERSION_pn-apr =3D "1.4.5"
> @@ -1712,6 +1719,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata =
=3D "1 month"
> RECIPE_LATEST_RELEASE_DATE_pn-tzdata =3D "05/2010"
> RECIPE_MANUAL_CHECK_DATE_pn-tzdata =3D "May 24, 2011"
> RECIPE_COMMENTS_pn-tzdata =3D ""
> +DISTRO_PN_ALIAS_pn-tzcode =3D "OSPDT"
> +
>=20
> RECIPE_STATUS_pn-tinylogin =3D "yellow"    # replaced, place holder =
for tracking
> RECIPE_LAST_UPDATE_pn-tinylogin =3D "Jul 21, 2006"
> @@ -1792,6 +1801,7 @@ RECIPE_MAINTAINER_pn-zypper =3D "Mark Hatle =
<mark.hatle@windriver.com>"
> RECIPE_LATEST_VERSION_pn-zypper =3D "git"
> RECIPE_INTEL_SECTION_pn-zypper =3D "base utils"
> RECIPE_COMMENTS_pn-zypper =3D ""
> +DISTRO_PN_ALIAS_pn-zypper =3D "OpenSuse=3Dzypper Meego=3Dzypper"
>=20
> RECIPE_STATUS_pn-sysstat =3D "green"
> RECIPE_LAST_UPDATE_pn-sysstat =3D "May 24, 2011"
> @@ -2467,10 +2477,12 @@ DISTRO_PN_ALIAS_pn-core-image-sdk =3D =
"OE-Core"
> RECIPE_STATUS_pn-task-core-console =3D "green"
> RECIPE_LATEST_VERSION_pn-task-core-console =3D "1.0"
> RECIPE_MAINTAINER_pn-task-core-console =3D "Dongxiao Xu =
<dongxiao.xu@intel.com>"
> +DISTRO_PN_ALIAS_pn-core-console =3D "OE-Core"
>=20
> RECIPE_STATUS_pn-task-core-x11 =3D "green"
> RECIPE_LATEST_VERSION_pn-task-core-x11 =3D "1.0"
> RECIPE_MAINTAINER_pn-task-core-x11 =3D "Dongxiao Xu =
<dongxiao.xu@intel.com>"
> +DISTRO_PN_ALIAS_pn-core-x11 =3D "OE-Core"
>=20
> RECIPE_STATUS_pn-task-core-basic =3D "green"
> RECIPE_LATEST_VERSION_pn-task-core-basic =3D "1.0"
> @@ -2795,7 +2807,7 @@ RECIPE_LAST_UPDATE_pn-latencytop =3D "Jul 22, =
2010"
> RECIPE_MAINTAINER_pn-latencytop =3D "Dexuan Cui =
<dexuan.cui@intel.com>"
>=20
> RECIPE_STATUS_pn-tcf-agent =3D "green"
> -DISTRO_PN_ALIAS_pn-tcf-agent =3D "WindRiver =
upstream=3Dhttp://www.eclipse.org/dsdp/tm/"
> +DISTRO_PN_ALIAS_pn-tcf-agent =3D "Windriver =
upstream=3Dhttp://www.eclipse.org/dsdp/tm/"
> RECIPE_DEPENDENCY_CHECK_pn-tcf-agent =3D "not done"
> RECIPE_LATEST_VERSION_pn-tcf-agent =3D "0.0+svnr1855"
> RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent =3D "Jul 21, 2011"
> @@ -2899,6 +2911,8 @@ RECIPE_LATEST_VERSION_pn-gcc=3D"4.6.1"
> RECIPE_LAST_UPDATE_pn-gcc =3D "May 1, 2011"
> RECIPE_MANUAL_CHECK_DATE_pn-gcc =3D "Jul 06, 2011"=20
> RECIPE_MAINTAINER_pn-gcc =3D "Nitin A Kamble =
<nitin.a.kamble@intel.com>"
> +DISTRO_PN_ALIAS_pn-gcc-runtime =3D "Ubuntu=3Dgcc Fedora=3Dgcc"
> +
>=20
> RECIPE_STATUS_pn-autoconf=3D"red"=20
> RECIPE_LATEST_VERSION_pn-autoconf=3D"2.68"
> @@ -3438,6 +3452,7 @@ =
RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "2 =
months"
> RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/05/04"
> RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "May 12, 2011"
> RECIPE_MAINTAINER_pn-qt4-tools-nativesdk =3D "Paul Eggleton =
<paul.eggleton@linux.intel.com>"
> +DISTRO_PN_ALIAS_pn-qt4-tools-nativesdk =3D "Mandriva=3Dlibqt4-devel =
Ubuntu=3Dlibqt4-dev"
>=20
> RECIPE_STATUS_pn-qt4-embedded =3D "green"
> RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.3"
> @@ -3445,6 +3460,7 @@ =
RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "2 months"
> RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/05/04"
> RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "May 12, 2011"
> RECIPE_MAINTAINER_pn-qt4-embedded =3D "Paul Eggleton =
<paul.eggleton@linux.intel.com>"
> +DISTRO_PN_ALIAS_pn-qt4-embedded =3D "OSPDT"
>=20
> RECIPE_STATUS_pn-qt4-x11-free =3D "green"
> RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.3"
> @@ -5342,6 +5358,15 @@ RECIPE_LATEST_VERSION_pn-clutter-box2d-1.6 =3D =
"0.10.0"
> RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d-1.6 =3D "Jun 28, 2011"
> RECIPE_LAST_UPDATE_pn-clutter-box2d-1.6 =3D "Mar 28, 2011"
> RECIPE_MAINTAINER_pn-clutter-box2d-1.6 =3D "Zhai Edwin =
<edwin.zhai@intel.com>"
> +DISTRO_PN_ALIAS_pn-clutter-box2d-1.6 =3D "OpenedHand"
> +
> +RECIPE_STATUS_pn-clutter-box2d =3D "red"
> +RECIPE_LATEST_VERSION_pn-clutter-box2d =3D "0.10.0"
> +RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d =3D "Jun 28, 2011"
> +RECIPE_LAST_UPDATE_pn-clutter-box2d =3D "Mar 28, 2011"
> +RECIPE_MAINTAINER_pn-clutter-box2d =3D "Zhai Edwin =
<edwin.zhai@intel.com>"
> +DISTRO_PN_ALIAS_pn-clutter-box2d =3D "OpenedHand"
> +
>=20
> RECIPE_STATUS_pn-clutter-gtk-1.4 =3D "red"
> DISTRO_PN_ALIAS_pn-clutter-gtk-1.4 =3D "Fedora=3Dclutter-gtk =
OpenSuSE=3Dclutter-gtk Ubuntu=3Dclutter-gtk-0.10 Mandriva=3Dclutter-gtk =
Debian=3Dclutter-gtk"
> @@ -5468,14 +5493,22 @@ DISTRO_PN_ALIAS_pn-core-image-base =3D =
"OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-basic =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-core =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-lsb =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-lsb-dev =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-lsb-qt3 =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-lsb-sdk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-minimal =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-minimal-dev =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-minimal-directdisk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-minimal-initramfs =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-minimal-live =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-minimal-mtdutils =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-rt =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-rt-sdk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-sato =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-sato-dev =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-sato-directdisk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-core-image-sato-live =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-core-image-sato-sdk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-apps-x11-pimlico =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-basic =3D "OE-Core"
> @@ -5485,10 +5518,14 @@ DISTRO_PN_ALIAS_pn-task-core-nfs =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-qt =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-sdk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-sdk-gmae =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-core-ssh-dropbear =3D "Poky"
> +DISTRO_PN_ALIAS_pn-task-core-ssh-openssh =3D "Poky"
> DISTRO_PN_ALIAS_pn-task-core-standalone-gmae-sdk-target =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-standalone-sdk-target =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-tools =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-x11-sato =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-qt4e =3D "Poky"
> +DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-natives =3D "Poky"
> DISTRO_PN_ALIAS_pn-initramfs-boot =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-initramfs-live-boot =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-initramfs-live-install =3D "OE-Core"
> @@ -5533,7 +5570,7 @@ DISTRO_PN_ALIAS_pn-xvideo-tests =3D "OpenedHand"
>=20
> RECIPE_STATUS_pn-kern-tools-native =3D "red"
> RECIPE_LATEST_VERSION_pn-kern-tools-native =3D "check"
> -DISTRO_PN_ALIAS_pn-kern-tools-native =3D "WindRiver"
> +DISTRO_PN_ALIAS_pn-kern-tools-native =3D "Windriver"
> RECIPE_LAST_UPDATE_pn-kern-tools-native =3D "Nov 11, 2010"
> RECIPE_MAINTAINER_pn-kern-tools-native =3D "Bruce Ashfield =
<bruce.ashfield@windriver.com>"
>=20
> @@ -5632,6 +5669,8 @@ RECIPE_NO_UPDATE_REASON_pn-lsb =3D "1.4 is fixed =
version of LSB Test"
>=20
> RECIPE_LATEST_VERSION_pn-lsbsetup =3D "0.9"
> RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup =3D "Jan 17, 2011"
> +DISTRO_PN_ALIAS_pn-lsbsetup =3D "Windriver"
> +
> RECIPE_LATEST_VERSION_pn-libxml-simple-perl =3D "2.18"
> RECIPE_LATEST_VERSION_pn-talloc =3D "2.0.5"
> RECIPE_STATUS_pn-gthumb =3D "red"
> @@ -5681,6 +5720,9 @@ =
RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-docbook-sgml-dtd =3D "unknown"
> RECIPE_COMMENTS_pn-docbook-sgml-dtd =3D ""
> RECIPE_LAST_UPDATE_pn-docbook-sgml-dtd =3D "Jan 28, 2011"
> RECIPE_MAINTAINER_pn-docbook-sgml-dtd =3D "Scott Garman =
<scott.a.garman@intel.com>"
> +DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-3.1 =3D "Fedora=3Ddocbook-dtds =
Mandriva=3Ddocbook-dtd31-sgml"
> +DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-4.1 =3D "Fedora=3Ddocbook-dtds =
Mandriva=3Ddocbook-dtd41-sgml"
> +DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-4.5 =3D "Fedora=3Ddocbook-dtds =
Mandriva=3Ddocbook-dtd42-sgml"
>=20
> RECIPE_STATUS_pn-docbook-dsssl-stylesheet =3D "green"
> RECIPE_DEPENDENCY_CHECK_pn-docbook-dsssl-stylesheet =3D "not done"
> @@ -5691,6 +5733,8 @@ =
RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-docbook-dsssl-stylesheet =3D =
"unknown"
> RECIPE_COMMENTS_pn-docbook-dsssl-stylesheet =3D ""
> RECIPE_LAST_UPDATE_pn-docbook-dsssl-stylesheet =3D "Jan 26, 2011"
> RECIPE_MAINTAINER_pn-docbook-dsssl-stylesheet =3D "Scott Garman =
<scott.a.garman@intel.com>"
> +DISTRO_PN_ALIAS_pn-docbook-dsssl-stylesheet =3D =
"Fedora=3Ddocbook-style-dsssl Ubuntu=3Ddocbook-dsssl"
> +DISTRO_PN_ALIAS_pn-docbook-dsssl-stylesheet-native =3D =
"Fedora=3Ddocbook-style-dsssl Ubuntu=3Ddocbook-dsssl"
>=20
> RECIPE_STATUS_pn-sgmlspl =3D "green"
> RECIPE_DEPENDENCY_CHECK_pn-sgmlspl =3D "not done"
> @@ -5701,6 +5745,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sgmlspl =
=3D "5 days"
> RECIPE_COMMENTS_pn-sgmlspl =3D ""
> RECIPE_LAST_UPDATE_pn-sgmlspl =3D "Jan 26, 2011"
> RECIPE_MAINTAINER_pn-sgmlspl =3D "Scott Garman =
<scott.a.garman@intel.com>"
> +DISTRO_PN_ALIAS_pn-sgmlspl =3D "Debian=3Dsgmlspl Ubuntu=3Dsgmlspl"
>=20
> RECIPE_STATUS_pn-opensp =3D "green"
> RECIPE_DEPENDENCY_CHECK_pn-opensp =3D "not done"
> @@ -5796,6 +5841,7 @@ =
RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cdrtools =3D "6 years 2 months"
> RECIPE_COMMENTS_pn-cdrtools =3D "This is the last GPL licensed version =
of cdrtools"
> RECIPE_LAST_UPDATE_pn-cdrtools =3D "Apr 25, 2011"
> RECIPE_MAINTAINER_pn-cdrtools =3D "Scott Garman =
<scott.a.garman@intel.com>"
> +DISTRO_PN_ALIAS_pn-cdrtools =3D "OpenSUSE=3Dcdrtools OSPDT"
>=20
> RECIPE_STATUS_pn-rxvt-unicode =3D "green"
> RECIPE_DEPENDENCY_CHECK_pn-rxvt-unicode =3D "not done"
> @@ -5830,6 +5876,7 @@ RECIPE_LAST_UPDATE_pn-pseudo =3D "Jun 06, 2011"
> RECIPE_MAINTAINER_pn-pseudo =3D "Mark Hatle =
<mark.hatle@windriver.com>"
> RECIPE_COMMENTS_pn-pseudo =3D "Yocto Project maintained"
> RECIPE_MANUAL_CHECK_DATE_pn-pseudo =3D "Jun 06, 2011"=20
> +DISTRO_PN_ALIAS_pn-pseudo =3D "Windriver"
>=20
> DISTRO_PN_ALIAS_pn-btrfs-tools =3D "Debian=3Dbtrfs-tools =
Fedora=3Dbtrfs-progs"
> DISTRO_PN_ALIAS_pn-rt-tests =3D "Debian=3Drt-tests Ubuntu=3Drt-tests"
> @@ -5846,3 +5893,35 @@ DISTRO_PN_ALIAS_pn-lame =3D "Debian=3Dlame =
Ubuntu=3Dlame"
> DISTRO_PN_ALIAS_pn-libiconv =3D "Fedora=3Dmingw-libiconv =
Opensuse=3Dcross-mingw-libiconv"
> DISTRO_PN_ALIAS_pn-qt4-native =3D "Fedora=3Dqt4 Debian=3Dqt4-dev-tools"
> DISTRO_PN_ALIAS_pn-update-alternatives-dpkg =3D =
"Opensuse=3Dupdate-alternatives Mandriva=3Dupdate-alternatives"
> +DISTRO_PN_ALIAS_pn-emgd-driver-bin =3D "Intel"
> +DISTRO_PN_ALIAS_pn-external-csl-toolchain =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-external-poky-toolchain =3D "Poky"
> +DISTRO_PN_ALIAS_pn-hello-mod =3D "Poky"
> +DISTRO_PN_ALIAS_pn-linux-dummy =3D "Intel"
> +DISTRO_PN_ALIAS_pn-meta-environment-i586 =3D "Poky"
> +DISTRO_PN_ALIAS_pn-meta-toolchain-gmae =3D "Poky"
> +DISTRO_PN_ALIAS_pn-meta-toolchain-qte =3D "Poky"
> +DISTRO_PN_ALIAS_pn-n450-audio =3D "Intel"
> +DISTRO_PN_ALIAS_pn-qt-demo-init =3D "Poky"
> +DISTRO_PN_ALIAS_pn-qt4e-demo-image =3D "Poky"
> +DISTRO_PN_ALIAS_pn-xorg-cf-files =3D "Poky"
> +
> +DISTRO_PN_ALIAS_pn-task-core-yocto =3D "Poky"
> +DISTRO_PN_ALIAS_pn-yocto-image-build =3D "Poky"
> +DISTRO_PN_ALIAS_pn-task-core-x11 =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-gcc-cross-initial =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-python-ZSI =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-swabber-native =3D "Poky"
> +DISTRO_PN_ALIAS_pn-opkg-nogpg =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-opkg-nogpg-native =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-opkg-nogpg-nativesdk =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-icecc-create-env =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-sysvinit-inittab =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-eglibc-locale =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-eglibc-locale-nativesdk =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-external-python-tarball =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-core-console =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-nativesdk =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-tar-replacement-native =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-cross-canadian-i586 =3D "OE-Core"
> --=20
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



