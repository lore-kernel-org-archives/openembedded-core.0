Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 868E072C16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:34:23 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so1076175wev.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/0BbBKNn22Jvx8JLfI44gLPHN18Xsh956ZGT48h9Ii8=;
	b=oDXgSrqO+gXgN72D211fU4QObmTYue9vyMsNHeSEaY+EhxO61vzcwyRIDkNfh2tECz
	kqyM5wqz20v8Zh2S2Q5lDPvWqSZLc6ueyZR66Jxbq2ZikJnPA/nV5zs5lMwzEKRjxnDg
	xfotX1TnBo0OgblO+yqiNfL3cuOMYtp9E48Pl0TQYPV9++SpAU2fUc63TcUEB7F8/pLO
	3U9Hz8VrSmiOf55NgPQo/+cOlrjuzRliVH/eCOajJKxzyP3aVDuX0KG1853bQ97NZLRR
	6+x/ygXsGs7dVZfnnYlZaJUb5D1G7sZAHtkDzhLh8C3Esf1GLEoGanks9NBjmt5ySsDc
	VXkQ==
X-Received: by 10.180.90.233 with SMTP id bz9mr28697397wib.5.1421944463421;
	Thu, 22 Jan 2015 08:34:23 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hv5sm4629312wjb.16.2015.01.22.08.34.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:34:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jan 2015 17:34:28 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150122163428.GF2456@jama>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-4-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LamxpYW0uHzTRTjyJZgw7_meZbx5L=2mZ_LwdzRcv-vkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LamxpYW0uHzTRTjyJZgw7_meZbx5L=2mZ_LwdzRcv-vkg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] recipes-qt: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 22 Jan 2015 16:34:25 -0000
X-Groupsio-MsgNum: 61628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Content-Disposition: inline

--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 09:19:32PM +0000, Burton, Ross wrote:
> On 10 December 2014 at 14:18, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> > @@ -8,6 +8,9 @@ DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig l=
ibxft
> > libxext libxrender li
> >  PROVIDES +=3D "qt4-x11"
> >  QT4DEPENDS =3D ""
> >
> > +# depends on virtual/libx11
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
> > +
> >
>=20
> Isn't that redundant as qt4x11 already sets REQUIRED_DISTRO_FEATURES?
>=20
> Also, if setting REQURED_DISTRO_FEATURES in a class, using +=3D or _append
> seems like a sensible idea for future-proofing.

Done, good catch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTBJpQACgkQN1Ujt2V2gBwb9QCffYuoTZ6uLjEvTT7moLHqKOJa
JMkAn0CE6aZAHKWbAbSEYWtLIrlnCuXm
=8/Sj
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--
