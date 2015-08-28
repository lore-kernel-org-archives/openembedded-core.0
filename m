Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 86CA760043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 05:50:41 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so51069261pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=9H54g3UFTbi5XwusyKyr5c61DRlXLiyRcQD1bcJUwHQ=;
	b=CTfBcYU8yEfPN0hazNwn3oblInP3eXq7G5AolOPMoPOfiyKoAbNMh+VeHGNuqw2+Qq
	Tter8UH9yVPpYh+A4NfezIw4u5OgYmtUHile5MnzSujZPh6zfGPcxDHV4VZ44cH702Vf
	n0Xh5LKPirz7+0s3lh2CfvuprL3+5YBDBzypM2nhRs/AP60fPAD23yj9XeEylIXWXzZ+
	q0x0felUIz5K78WcEDOJN1w7Br6969kEnBrWhVWNvpsECrnaa4VZKirMYHrH/M/0Y79Y
	ayZ5+XS65NSjfnflNbQRE9Sl7z5h9rzPAJlTuqU896BH54viN/p60/w6voW9HZvMiFW3
	mJaQ==
X-Received: by 10.68.98.194 with SMTP id ek2mr12298867pbb.152.1440741042305;
	Thu, 27 Aug 2015 22:50:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id b6sm4341870pdo.63.2015.08.27.22.50.41
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 22:50:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <9873f94b4a88ca4ecf7ed28737c5f7c6f9d6d199.1440700983.git.chris_larson@mentor.com>
Date: Thu, 27 Aug 2015 22:50:40 -0700
Message-Id: <3747805E-B6F6-4B4F-B803-4E39098D0F5A@gmail.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
	<cover.1440700983.git.chris_larson@mentor.com>
	<9873f94b4a88ca4ecf7ed28737c5f7c6f9d6d199.1440700983.git.chris_larson@mentor.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] packagegroup-base: pull in iw as well as wireless-tools
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
X-List-Received-Date: Fri, 28 Aug 2015 05:50:43 -0000
X-Groupsio-MsgNum: 70201
Content-Type: multipart/signed;
	boundary="Apple-Mail=_51137D1E-889A-4B59-8E20-82FB4CB07378";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_51137D1E-889A-4B59-8E20-82FB4CB07378
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 27, 2015, at 11:48 AM, Christopher Larson <kergoth@gmail.com> =
wrote:
>=20
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> As was discussed in the commit which adds iw:
>=20
> iw uses cfg80211/nl80211, which is the way of the future. =
wireless-tools uses
> WEXT, which uses ioctl, which is in deep maintenance mode. See
> =
http://wireless.kernel.org/en/developers/Documentation/Wireless-Extensions=
.
> Also https://wireless.wiki.kernel.org/en/users/Documentation/iw =
indicates "The
> old tool iwconfing, which uses Wireless Extensions interface, is =
deprecated
> and it's strongly recommended to switch to iw and nl80211."
>=20
> wireless-tools is kept as well for now for compatibility reasons, =
until we
> have verified that all the network configuration mechanisms are using =
iw.
>=20
> This adds VIRTUAL-RUNTIME_wireless-tools as a distro convenience.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> meta/conf/distro/include/default-providers.inc       | 1 +
> meta/recipes-core/packagegroups/packagegroup-base.bb | 6 +++++-
> 2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc =
b/meta/conf/distro/include/default-providers.inc
> index 8d92c2e..9f84d5c 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -22,6 +22,7 @@ VIRTUAL-RUNTIME_update-alternatives ?=3D =
"update-alternatives-opkg"
> VIRTUAL-RUNTIME_apm ?=3D "apm"
> VIRTUAL-RUNTIME_alsa-state ?=3D "alsa-state"
> VIRTUAL-RUNTIME_getopt ?=3D "util-linux-getopt"
> +VIRTUAL-RUNTIME_wireless-tools ?=3D "iw wireless-tools"
>=20
> #
> # Default recipe providers
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb =
b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 262d65f..c5530aa 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -48,6 +48,10 @@ PACKAGES =3D ' \
> # Override by distro if needed
> VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
>=20
> +# Override by distro if needed. iw is the future, but wireless-tools =
is kept
> +# for now as well for compatibility.
> +VIRTUAL-RUNTIME_wireless-tools ?=3D "iw wireless-tools=E2=80=9D

wouldn=E2=80=99t the define from default-providers.inc be enough ?

> +
> #
> # packagegroup-base contain stuff needed for base system (machine =
related)
> #
> @@ -292,7 +296,7 @@ RRECOMMENDS_packagegroup-base-ipsec =3D "\
> #
> SUMMARY_packagegroup-base-wifi =3D "WiFi support"
> RDEPENDS_packagegroup-base-wifi =3D "\
> -    wireless-tools \
> +    ${VIRTUAL-RUNTIME_wireless-tools} \
>     ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', =
'hostap-utils', '',d)} \
>     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', =
'',d)} \
>     wpa-supplicant"
> --
> 2.2.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_51137D1E-889A-4B59-8E20-82FB4CB07378
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf9rAACgkQuwUzVZGdMxRe2ACdE2AvVuT4ngDgFqdhOkfhC58d
VLEAnj/VbuktAxVbIUCXXrmzwMn7fbtj
=qpgZ
-----END PGP SIGNATURE-----

--Apple-Mail=_51137D1E-889A-4B59-8E20-82FB4CB07378--
