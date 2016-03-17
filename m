Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8B89F605BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:25:37 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so3738432wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=m5DFy4dn80H+cMm4d+yRqH7twnedvq3gP9WpB17rmHs=;
	b=y39dtaQwcOYOJXKDzvdHhFDy0NMr3yGGcYMAdp+CtCaumu8t0KPB9k4nf695xyS/jg
	bTC3mKSprkz7vaFo6qVelzrmnCfmRv5TiSNZy9j46N8aWXpNVpJxm9Rmqi0D9tJZ2S0W
	6E8ak8H5DMOgjJ8D9zJ1xi8y5xwH3X34RSsnI2jvYQ1wraNE/JA45kxDAQGeIZh0DDWZ
	ecbw90D5RZuMb42ms3Z6waIgUE6zVfStlzUNwZIZCCSHTI1Gft4FcimouT77cGyJ3vsO
	iEpbVTc3eiTttrBJnCXtalMjEB8xogwHuy8kP/KncYeZLrRj9LGX/np35RICTtBNHbpe
	9fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=m5DFy4dn80H+cMm4d+yRqH7twnedvq3gP9WpB17rmHs=;
	b=Ul3nBXjiHhF1I6psRTfaN2c2jIPVPCOvFKX2epcEJPCA1P3G/jhiS26+K0+v05Z5Nc
	EV+c8k7tY14B5ukvUWZBEYa/0wMw59QViUmJ4MdXDdxEy78+yHG/+x6059yB/zQwxHxN
	0Y/fB/coyStQgcYb4n4FnOllfaYXej6kqdO6iypVGRBmPTLIrbL6r101em8R+zop6+eg
	LPo5UlCOxsP8pk/nWpSHAJhDZ7vgowbRgIIqsVmBdCUq6VJFupYYyTVSAZGX4Z2DMfk8
	Gr27GNWjxnkKDYd1ZOjY/Yip+v72XysCa1oEKX5CaqRZJgtQ1B4TbEcmZwE+IFff+5/y
	obig==
X-Gm-Message-State: AD7BkJK9wMWpeRzwLDIStGJDBV27CDJ9WQck01rxqZLT93rIG+x7cEcpX5pOGOYQo/OJbg==
X-Received: by 10.28.57.69 with SMTP id g66mr35409617wma.51.1458235537631;
	Thu, 17 Mar 2016 10:25:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg1sm8615058wjc.27.2016.03.17.10.25.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 10:25:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 18:29:20 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160317172920.GF2553@jama>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-9-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1458235169-9267-9-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] gobject-introspection.bbclass: mark as machine specific due to COMBINED_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2016 17:25:40 -0000
X-Groupsio-MsgNum: 79753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 10:19:29AM -0700, Andre McCurdy wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/gobject-introspection.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/go=
bject-introspection.bbclass
> index eb0e7ad..8a09e34 100644
> --- a/meta/classes/gobject-introspection.bbclass
> +++ b/meta/classes/gobject-introspection.bbclass
> @@ -35,3 +35,6 @@ FILES_${PN}_append =3D " ${libdir}/girepository-*/*.typ=
elib"
>  # .gir files go to dev package, as they're needed for developing (but no=
t for
>  # running) things that depends on introspection.
>  FILES_${PN}-dev_append =3D " ${datadir}/gir-*/*.gir"
> +
> +# Due to use of COMBINED_FEATURES
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

This was already proposed in:
http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118743=
=2Ehtml
thread, but unfortunately rejected :/.

Also this isn't enough, you would need to change all recipes depending
on one recipes with this inherit to be MACHINE_ARCH as well.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbq6W8ACgkQN1Ujt2V2gByPUQCgnZGehCKKbti6zIHxLzTrvlo9
DTsAoIgTVFs8waSj+xGl9T+QF0B82/0d
=R1Bl
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
