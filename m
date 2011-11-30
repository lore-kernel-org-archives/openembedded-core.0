Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVegg-0005F1-Ic
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 08:34:38 +0100
Received: by eaad13 with SMTP id d13so274099eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 23:27:54 -0800 (PST)
Received: by 10.213.3.73 with SMTP id 9mr163789ebm.133.1322638072115;
	Tue, 29 Nov 2011 23:27:52 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s44sm3193267eef.11.2011.11.29.23.27.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 23:27:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 30 Nov 2011 08:27:47 +0100
In-Reply-To: <98e7c1af195aa7fe0ac8c53314b95c6e42e626c6.1322608290.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322608290.git.josh@linux.intel.com>
	<98e7c1af195aa7fe0ac8c53314b95c6e42e626c6.1322608290.git.josh@linux.intel.com>
Message-Id: <EC6977EC-6DCC-46CE-84A0-0A5FD67ADAAA@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/4] gthumb: update to 2.12.4
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
X-List-Received-Date: Wed, 30 Nov 2011 07:34:38 -0000
X-Groupsio-MsgNum: 13249
Content-Type: multipart/signed;
	boundary="Apple-Mail=_33EA191D-C65E-441D-BD50-1A00A86CCF4C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_33EA191D-C65E-441D-BD50-1A00A86CCF4C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 00:14 heeft Joshua Lock het volgende geschreven:

> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
> .../gthumb/{gthumb_2.12.3.bb =3D> gthumb_2.12.4.bb}  |    6 +++---
> 1 files changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-gnome/gthumb/{gthumb_2.12.3.bb =3D> =
gthumb_2.12.4.bb} (76%)
>=20
> diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb =
b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> similarity index 76%
> rename from meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
> rename to meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> index 7fb8a94..ccac8eb 100644
> --- a/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
> +++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> @@ -3,7 +3,7 @@ SECTION =3D "x11/gnome"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
> DEPENDS =3D "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf =
libpng gstreamer jpeg tiff gst-plugins-base"
> -PR =3D "r1"
> +PR =3D "r0"

I think it's safe to drop PR =3D "r0" especially considering that we =
want to get rid of PR.

regards,

Koen=

--Apple-Mail=_33EA191D-C65E-441D-BD50-1A00A86CCF4C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7V2vUACgkQMkyGM64RGpEjnQCggks4IkDkj/V4A9mYKS41qqE0
b54AoIs0Q1PyUaxmq1moVtEd7soJHCmU
=PKnX
-----END PGP SIGNATURE-----

--Apple-Mail=_33EA191D-C65E-441D-BD50-1A00A86CCF4C--
