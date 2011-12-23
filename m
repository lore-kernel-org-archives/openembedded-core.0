Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8I2-00054x-TM
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:48:14 +0100
Received: by mail-we0-f175.google.com with SMTP id m13so4443031wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:41:09 -0800 (PST)
Received: by 10.216.133.74 with SMTP id p52mr14012735wei.39.1324658469399;
	Fri, 23 Dec 2011 08:41:09 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p2sm14249045wbh.22.2011.12.23.08.41.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:41:08 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:41:07 +0100
In-Reply-To: <6a425c8c138a3eddc3c2b01eb350e3277f9eb888.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<6a425c8c138a3eddc3c2b01eb350e3277f9eb888.1324657801.git.shane.wang@intel.com>
Message-Id: <E52DB641-01B4-4DB4-AFEC-395E8A780D16@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 03/14] gst-plugins-bad: upgrade to 0.10.22
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
X-List-Received-Date: Fri, 23 Dec 2011 16:48:15 -0000
X-Groupsio-MsgNum: 14756
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D3134536-326A-4970-8F3B-4DEA67356D9F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D3134536-326A-4970-8F3B-4DEA67356D9F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> ...s-bad_0.10.21.bb =3D> gst-plugins-bad_0.10.22.bb} |    7 +++----
> 1 files changed, 3 insertions(+), 4 deletions(-)
> rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.21.bb =
=3D> gst-plugins-bad_0.10.22.bb} (76%)
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
> similarity index 76%
> rename from =
meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
> rename to meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
> index a7023e3..ec067b8 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
> @@ -4,12 +4,11 @@ LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>                     =
file://gst/tta/filters.h;beginline=3D12;endline=3D29;md5=3D629b0c7a665d155=
a6677778f4460ec06 \
>                     =
file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
> -                    =
file://gst/qtmux/gstqtmuxmap.h;beginline=3D1;endline=3D19;md5=3D2da8f56a44=
697c1527c5a4bcf8d5d69b \

Why is that removed?=

--Apple-Mail=_D3134536-326A-4970-8F3B-4DEA67356D9F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70ryMACgkQMkyGM64RGpG/6gCgt9Zskr5hHCHpM/SiKly/rT7n
vkYAnjMEMpTtmqGwxoqBCGLNVVc5TfNJ
=kPvf
-----END PGP SIGNATURE-----

--Apple-Mail=_D3134536-326A-4970-8F3B-4DEA67356D9F--
