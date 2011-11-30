Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVelR-0005ml-CW
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 08:39:33 +0100
Received: by eekc1 with SMTP id c1so130678eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 23:32:53 -0800 (PST)
Received: by 10.14.17.80 with SMTP id i56mr101380eei.173.1322638373049;
	Tue, 29 Nov 2011 23:32:53 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a60sm3302679eeb.4.2011.11.29.23.32.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 23:32:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 30 Nov 2011 08:32:50 +0100
In-Reply-To: <d2556a3bcd208b2d6a8c02332b26b6e808632d7c.1322619553.git.lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322619553.git.lei.mei@intel.com>
	<d2556a3bcd208b2d6a8c02332b26b6e808632d7c.1322619553.git.lei.mei@intel.com>
Message-Id: <F563ADF0-C759-47DC-AFCF-8973856C1266@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/3] dropbear: Upgrade from 0.53.1 to 2011.54
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
X-List-Received-Date: Wed, 30 Nov 2011 07:39:33 -0000
X-Groupsio-MsgNum: 13251
Content-Type: multipart/signed;
	boundary="Apple-Mail=_44A81C69-205D-4AFF-AEC7-6C56540F5886";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_44A81C69-205D-4AFF-AEC7-6C56540F5886
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 06:57 heeft Mei Lei het volgende geschreven:

> Signed-off-by: Mei Lei <lei.mei@intel.com>

So the commit summary says 'upgrade', but look here:

> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -16,7 +16,6 @@ SRC_URI =3D =
"http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
> 		 file://dropbear-0.53.1-static_build_fix.patch \
> 	         file://configure.patch \
> 	         file://fix-2kb-keys.patch \
> -	         file://allow-nopw.patch;apply=3Dno \

Why did you remove that?

> 	         file://init \
>                  ${@base_contains('DISTRO_FEATURES', 'pam', =
'${PAM_SRC_URI}', '', d)} "
>=20
> @@ -40,13 +39,6 @@ EXTRA_OECONF +=3D "\
>=20
> DISTRO_TYPE ?=3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", =
"debug", "",d)}"
>=20
> -do_debug_patch() {
> -	if [ "${DISTRO_TYPE}" =3D "debug" ]; then
> -		bbnote "WARNING: applying allow-nopw.patch which allows =
password-less logins!"
> -		patch -p1 < ${WORKDIR}/allow-nopw.patch
> -	fi
> -}
> -

And why did you remove that as well?

> addtask do_debug_patch after do_patch before do_configure

After removing the previous 2, why did you leave this one in?

Why are you breaking passwwdless logins without mentioning it in the =
commit summary!?!?!?=

--Apple-Mail=_44A81C69-205D-4AFF-AEC7-6C56540F5886
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7V3CIACgkQMkyGM64RGpHgUACgsBdwdc/I9xtHUSy9sNtntqgA
ZuAAoKv9xRsPq/TG5pR1PvKbJYEaB6fa
=HWWx
-----END PGP SIGNATURE-----

--Apple-Mail=_44A81C69-205D-4AFF-AEC7-6C56540F5886--
