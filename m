Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKYHh-0001t8-KQ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 19:07:52 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so3803087dak.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7EGvNr/MRy6+tZm5KuQi3svPxWyRMgvZFqYPtIDh8JA=;
	b=lw6AV6SZYBq9jB1RxbnBlfJMigVRBInFhaNR/PPQxB27WzjBmVzijDTvl2LDMwsase
	CwGq3odIaT4/tlF+3EkskSpjCg9x0oB6zMpkUAVllZyRmysGgP3VXu4EBPczlpExV41L
	R+Ge30LyctHQhG7ciBCO8ol1XnQmC0fG5bnxRTyjnKn+Q6OASms06ZXUU/JZ2chLaD3I
	zEQAVieEkhJSIUI8Tf3jEiYKz7gr9BaObN4JNEkz8w2G5iIFxW1OD3vF9F891yzAMtRc
	HmtH6WsYhonCk0mG/+gLF1paY/8vKmk2GRVI3r4XulMZFVrAs/Ybr1PFsCcF1tudeJlO
	djDQ==
X-Received: by 10.66.20.36 with SMTP id k4mr25037127pae.176.1364320243474;
	Tue, 26 Mar 2013 10:50:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bs1sm7453944pbc.8.2013.03.26.10.50.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 10:50:42 -0700 (PDT)
Date: Tue, 26 Mar 2013 18:50:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20130326175036.GJ7539@jama>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<1364216841-32600-3-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1621A8A5@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1621A8A5@IRSMSX102.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 26 Mar 2013 18:07:54 -0000
X-Groupsio-MsgNum: 37125
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Content-Disposition: inline

--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

I'm bit surprised that it replaced bluez4 in this case, because last
time I tested this I also needed RPROVIDES (at least to keep ofono,
packagegroup-base-bluetooth, connman happy).

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
> root@qemux86:~# opkg list-upgradable | grep bluez
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
=2E0_i586.ipk.
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
> root@qemux86:~#=20
>=20
> Case 2:

Case 2 shows that if some distribution makes decision to replace bluez4
with bluez5 (e.g. doesn't have ofono, connman,
packagegroup-base-bluetooth in their images, only their own app adapted
to use bluez5), then they need to add RREPLACES to bluez4 by .bbappend.

That's why I was complaining about "upgrade path" when someone makes
decision to change bluez version.

On the other hand, having whole R* combo in bluez5 can cause issues to
people who don't want to upgrade yet (like in Case 1) - one answer to
that is that they just shouldn't build it (no bluez5 in binary feed
should prevent accidental opkg upgrade), but this works only until
someone does e.g. "bitbake world" :/.

> bluez4 and bluez5: reciprocal RCONFLICTS (only)
> root@qemux86:~# opkg list-upgradable
> libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0
> root@qemux86:~# opkg install bluez5
> Installing bluez5 (5.3-r0.0) to root...
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
>  * print_dependents_warning: Force removal of this package and its depend=
ents
>  * print_dependents_warning: with --force-removal-of-dependent-packages.
> root@qemux86:~# opkg remove --force-depends bluez4
> Removing package bluez4 from root...
> root@qemux86:~# opkg list-installed | grep bluez
> libasound-module-bluez - 4.101-r6.0
> root@qemux86:~# opkg install bluez5
> Installing bluez5 (5.3-r0.0) to root...
> Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
> Installing libical (0.48-r0.0) to root...
> Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
> Configuring libical.
> Configuring bluez5.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez5 - 5.3-r0.0
> libasound-module-bluez - 4.101-r6.0
> root@qemux86:~#=20
>=20
>=20
>=20
> -----Original Message-----
> From: Iorga, Cristian=20
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
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recip=
es-connectivity/bluez/bluez4_4.101.bb
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
>  	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
> --
> 1.7.10.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFR3+wACgkQN1Ujt2V2gBy+CgCfQ5crZKj+gwA2pqHFEJdr93tH
LcQAoLO5CkAcHCGlc9sY/8NSiSH6pGWm
=jsHv
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--
