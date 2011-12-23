Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8OF-0005TL-Uj
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:54:40 +0100
Received: by wgbdt12 with SMTP id dt12so15102640wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:47:32 -0800 (PST)
Received: by 10.216.134.162 with SMTP id s34mr8522886wei.59.1324658852668;
	Fri, 23 Dec 2011 08:47:32 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id di5sm33103827wib.3.2011.12.23.08.47.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:47:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:47:31 +0100
In-Reply-To: <2b93d58b4e30b6327ddbe7b1d594399f64f2e926.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<2b93d58b4e30b6327ddbe7b1d594399f64f2e926.1324657801.git.shane.wang@intel.com>
Message-Id: <A0F06722-FDA7-4E36-B057-4F803F037EF4@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 12/14] ofono: upgrade to 1.0
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
X-List-Received-Date: Fri, 23 Dec 2011 16:54:40 -0000
X-Groupsio-MsgNum: 14763
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9DBE44D4-745D-46EA-92CE-0833B79BC271";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9DBE44D4-745D-46EA-92CE-0833B79BC271
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
> .../ofono/{ofono_0.50.bb =3D> ofono_1.0.bb}          |    6 +++---
> 2 files changed, 4 insertions(+), 4 deletions(-)
> rename meta/recipes-connectivity/ofono/{ofono_0.50.bb =3D> =
ofono_1.0.bb} (63%)
>=20
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc =
b/meta/recipes-connectivity/ofono/ofono.inc
> index 0cc58ae..bf6f6a5 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -3,7 +3,7 @@ SUMMARY  =3D "open source telephony"
> DESCRIPTION =3D "oFono is a stack for mobile telephony devices on =
Linux. oFono supports speaking to telephony devices through specific =
drivers, or with generic AT commands."
> LICENSE  =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \
> -                    =
file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D85d349dd8ec342c8f40d90=
e520f22779"
> +                    =
file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D3ce17d5978ef3445def265=
b98899c2ee"

what changed?=

--Apple-Mail=_9DBE44D4-745D-46EA-92CE-0833B79BC271
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70sKMACgkQMkyGM64RGpGQEgCgqAkNhZPYPoh/7KHHQfIniXV9
04QAn1H3Mnxf0CvUDrAcpCH4LmiIp27s
=4tuC
-----END PGP SIGNATURE-----

--Apple-Mail=_9DBE44D4-745D-46EA-92CE-0833B79BC271--
