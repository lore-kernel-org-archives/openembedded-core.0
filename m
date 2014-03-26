Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3BB60C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:51:02 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so1741052eek.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5JlyaOCYuEia6OTBjRi9L1lov8Yhdrl5AJFaL6kl69w=;
	b=PYsf6XKP/K4C9dI19/8X9+23herlyQoaOrud5k/7JDnTXZ+6LOfkEpF6qHvFQjZade
	wozcmvfC8IVpvIQgFHofFj37bqkWDKXGPhUqJpxj8vVapEpPTFTEPrei9IZQ3hdSaxmF
	5Q/oGx656j1/+rL+OcYLzrsMhoPaL0lWhGFO8B758J4W7DDciWS8kNQpg8piQtNP8WXH
	pDvft8xKpcWIfIZB6dIIeIxzYf2vem83qN1HbfEbd7+ssdP0/GuLZvAFlJRGi6Wl1hH4
	8PPCyenFKJny6M+ONGW1fHPJDQ/UgUD5NrNTrajVKFtogmqXrDCo6EkJRiuVvNK5Nbhq
	GG1Q==
X-Received: by 10.14.4.69 with SMTP id 45mr8958678eei.66.1395845463312;
	Wed, 26 Mar 2014 07:51:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w12sm47622942eez.36.2014.03.26.07.51.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 07:51:02 -0700 (PDT)
Date: Wed, 26 Mar 2014 15:51:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Message-ID: <20140326145102.GB3709@jama>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1395844085-9929-1-git-send-email-lauren.post@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 14:51:05 -0000
X-Groupsio-MsgNum: 51652
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 09:27:54AM -0500, Lauren Post wrote:
> This group of patches support the change of hardcoded bluez4 to
> virtual/bluez so that the upgrade to bluez5 is easier.
>=20
> This group of patches must be applied together.  Bluez4 is still
> default provider but it will be easier to override and provide bluez5
> support in future.
>=20
> Note there is one related patch for openobex in meta-oe.

virtual/* still doesn't work correctly in runtime variables, use
VIRTUAL-RUNTIME_bluez variable.

Last time I've asked for bluez4->bluez5 upgrade path fix on target I was
told that it's not supported and bluez5 isn't drop-in replacement for
bluez4 (yet), did that change already?

> Lauren Post (11):
>   bluez4:  Add virtual/bluez as provider
>   conman:  Change RDEPENDS on bluez4 to virtual/bluez
>   libpcap:  Change PACKAGECONFIG from bluez4 to virutal/bluez
>   neard:  Change RRECOMMENDS from bluez4 to virtual/bluez
>   ofono:  Change DEPENDS from bluez4 to virtual/bluez
>   pulseaudio:  Change PACKAGECONFIG from bluez4 to virtual/bluez
>   gst-plugin-bluetooth:  Change DEPENDS from bluez4 to virtual/bluez
>   gstreamer1.0-plugins-bad:  Change PACKAGECONFIG from bluez4 to
>     virtual/bluez
>   bluez-hcidump:  Change depends from bluez4 to virtual/bluez
>   default-providers:  Add virtual/bluez PROVIDER support to bluez4
>   package-group:  Change bluez4 to virtual/bluez
>=20
>  meta/conf/distro/include/default-providers.inc     |    2 +-
>  .../bluez/bluez-hcidump_2.5.bb                     |    2 +-
>  meta/recipes-connectivity/bluez/bluez4.inc         |    4 ++++
>  .../bluez/gst-plugin-bluetooth_4.101.bb            |    2 +-
>  meta/recipes-connectivity/connman/connman.inc      |    4 ++--
>  meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
>  meta/recipes-connectivity/neard/neard.inc          |    2 +-
>  meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
>  .../packagegroups/packagegroup-base.bb             |    2 +-
>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |    2 +-
>  .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |    2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 +++-
>  12 files changed, 18 insertions(+), 12 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMy6VYACgkQN1Ujt2V2gBwP1wCgloq6/fmrXRz0LvCmBFz7V60o
Y5UAoJXoLYeMKSlFSN3nf9IsxlTgdOkX
=lL3M
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
