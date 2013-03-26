Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UKYSO-0002Jy-EW
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 19:19:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2013 11:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="284849880"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 26 Mar 2013 11:00:55 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.19]) with mapi id
	14.01.0355.002; Tue, 26 Mar 2013 18:00:52 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5 -
	upgrade real-life tests
Thread-Index: AQHOKkDaGsaqYW+oukOKxclq+xdVLZi4QFUAgAABbeA=
Date: Tue, 26 Mar 2013 18:00:52 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1621AB00@IRSMSX102.ger.corp.intel.com>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<1364216841-32600-3-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1621A8A5@IRSMSX102.ger.corp.intel.com>
	<20130326175036.GJ7539@jama>
In-Reply-To: <20130326175036.GJ7539@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5 - upgrade real-life tests
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
X-List-Received-Date: Tue, 26 Mar 2013 18:19:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

For Case 1, I have not tested how happy were connman, ofono, and others aft=
er the upgrade. :-) I guess they were not happy at all, at least at runtime=
.
Also, given your thoughts/observation, please advise on how we should proce=
ed on this one.
An option to postpone this upgrade until 1.5 is also possible.

Regards,
Cristian

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Tuesday, March 26, 2013 7:51 PM
To: Iorga, Cristian
Cc: Burton, Ross; Koen Kooi; openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5 - upgrad=
e real-life tests

On Tue, Mar 26, 2013 at 04:42:07PM +0000, Iorga, Cristian wrote:
> Hello all,
>=20
> Initial status:
>=20
> QEmu machine core-image-sato.
>=20
> Follow the /update/upgrade/install path as below:
>=20
> Fact: bluez5, at this point, is not an upgrade path for bluez4.
> Logical conclusion would be that bluez 5 and bluez4 should be provided on=
ly with RCONFLICTS (case 2), so that doing an:
> opkg upgrade
> would not work, otherwise, user will conclude that, at this stage, bluez5=
 is a replacement for bluez4, which, simply, is not true (Case 1).
>=20
> Forcing user to remove bluez4 and install manually bluez5 will suggest th=
at bluez5 is not compatible with bluez4, so not a replacement.
>=20
> In conclusion, in my opinion, we should go with RCONFLICTS only for bluez=
5.3 PU.
>=20
> See cases below.
>=20
> Please advise.
>=20
> Case 1:
> bluez4 and bluez5: reciprocal RREPLACES and RCONFLICTS

I'm bit surprised that it replaced bluez4 in this case, because last time I=
 tested this I also needed RPROVIDES (at least to keep ofono, packagegroup-=
base-bluetooth, connman happy).

> root@qemux86:~# opkg update
> Downloading http://192.168.7.1/upg-ipk/all/Packages.gz.
> Inflating http://192.168.7.1/upg-ipk/all/Packages.gz.
> Updated list of available packages in /var/lib/opkg/local_repo_all.
> Downloading http://192.168.7.1/upg-ipk/i586/Packages.gz.
> Inflating http://192.168.7.1/upg-ipk/i586/Packages.gz.
> Updated list of available packages in /var/lib/opkg/local_repo_i586.
> Downloading http://192.168.7.1/upg-ipk/qemux86/Packages.gz.
> Inflating http://192.168.7.1/upg-ipk/qemux86/Packages.gz.
> Updated list of available packages in /var/lib/opkg/local_repo_qemux86.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez4 - 4.101-r6.0
> libasound-module-bluez - 4.101-r6.0
> root@qemux86:~# opkg list-upgradable | grep bluez=20
> libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0
> bluez4 - 4.101-r6.0 - 5.3-r0.0
> root@qemux86:~# opkg install bluez5
> Multiple replacers for bluez5, using first one (bluez4).
> Package bluez4 is already installed on root.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez4 - 4.101-r6.0
> libasound-module-bluez - 4.101-r6.0
> root@qemux86:~# opkg upgrade
> Upgrading libasound-module-bluez on root from 4.101-r6.0 to 5.3-r0.0...
> Downloading http://192.168.7.1/upg-ipk/i586/libasound-module-bluez_5.3-r0=
.0_i586.ipk.
> Removing obsolete file /usr/share/alsa/bluetooth.conf.
> Removing obsolete file /usr/lib/alsa-lib/libasound_module_ctl_bluetooth.s=
o.
> Removing obsolete file /usr/lib/alsa-lib/libasound_module_pcm_bluetooth.s=
o.
> Upgrading bluez5 (5.3-r0.0) to root...
> Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
> Installing libical (0.48-r0.0) to root...
> Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
> Removing package bluez4 from root...
> Configuring libical.
> Configuring libasound-module-bluez.
> Configuring bluez5.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez5 - 5.3-r0.0
> libasound-module-bluez - 5.3-r0.0
> root@qemux86:~#
>=20
> Case 2:

Case 2 shows that if some distribution makes decision to replace bluez4 wit=
h bluez5 (e.g. doesn't have ofono, connman, packagegroup-base-bluetooth in =
their images, only their own app adapted to use bluez5), then they need to =
add RREPLACES to bluez4 by .bbappend.

That's why I was complaining about "upgrade path" when someone makes decisi=
on to change bluez version.

On the other hand, having whole R* combo in bluez5 can cause issues to peop=
le who don't want to upgrade yet (like in Case 1) - one answer to that is t=
hat they just shouldn't build it (no bluez5 in binary feed should prevent a=
ccidental opkg upgrade), but this works only until someone does e.g. "bitba=
ke world" :/.

> bluez4 and bluez5: reciprocal RCONFLICTS (only) root@qemux86:~# opkg=20
> list-upgradable libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0=20
> root@qemux86:~# opkg install bluez5 Installing bluez5 (5.3-r0.0) to=20
> root...
> Collected errors:
>  * check_conflicts_for: The following packages conflict with bluez5:
>  * check_conflicts_for: 	bluez4 *=20
>  * opkg_install_cmd: Cannot install package bluez5.
> root@qemux86:~# opkg upgrade bluez5
> Installing bluez5 (5.3-r0.0) to root...
> Collected errors:
>  * check_conflicts_for: The following packages conflict with bluez5:
>  * check_conflicts_for: 	bluez4 *=20
> root@qemux86:~# opkg list-installed | grep bluez
> bluez4 - 4.101-r6.0
> libasound-module-bluez - 4.101-r6.0
> root@qemux86:~# opkg remove bluez4
> No packages removed.
> Collected errors:
>  * print_dependents_warning: Package bluez4 is depended upon by packages:
>  * print_dependents_warning: 	ofono
>  * print_dependents_warning: 	packagegroup-base-bluetooth
>  * print_dependents_warning: 	connman
>  * print_dependents_warning: These might cease to work if package bluez4 =
is removed.
>=20
>  * print_dependents_warning: Force removal of this package with --force-d=
epends.
>  * print_dependents_warning: Force removal of this package and its=20
> dependents
>  * print_dependents_warning: with --force-removal-of-dependent-packages.
> root@qemux86:~# opkg remove --force-depends bluez4 Removing package=20
> bluez4 from root...
> root@qemux86:~# opkg list-installed | grep bluez=20
> libasound-module-bluez - 4.101-r6.0 root@qemux86:~# opkg install=20
> bluez5 Installing bluez5 (5.3-r0.0) to root...
> Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
> Installing libical (0.48-r0.0) to root...
> Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
> Configuring libical.
> Configuring bluez5.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez5 - 5.3-r0.0
> libasound-module-bluez - 4.101-r6.0
> root@qemux86:~#
>=20
>=20
>=20
> -----Original Message-----
> From: Iorga, Cristian
> Sent: Monday, March 25, 2013 3:07 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Iorga, Cristian
> Subject: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5
>=20
> - RCONFLICTS/RREPLACES bluez5
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/recipes-connectivity/bluez/bluez4_4.101.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb=20
> b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> index 3ea2f25..2e98043 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -1,6 +1,6 @@
>  require bluez4.inc
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  SRC_URI +=3D "file://bluetooth.conf \
>              file://sbc_mmx.patch \
> @@ -11,6 +11,9 @@ SRC_URI +=3D "file://bluetooth.conf \  SRC_URI[md5sum] =
=3D "fb42cb7038c380eb0e2fa208987c96ad"
>  SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4=
ad75fe52846f7487"
> =20
> +RCONFLICTS_${PN} =3D "bluez5"
> +RREPLACES_${PN} =3D "bluez5"
> +
>  do_install_append() {
>  	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>  	install -m 0644 ${S}/network/network.conf=20
> ${D}/${sysconfdir}/bluetooth/
> --
> 1.7.10.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


