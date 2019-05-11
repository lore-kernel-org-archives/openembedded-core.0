Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 49A346C109
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 01:04:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w8so7152019wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8oqrryPVOPpNzhcyLe63oXk9K2OZ1nJTS22fd2Pyg2k=;
	b=UzWAyUj2Bn5zVc0d8TeCH0+aFnDGrPSxqQzGTUbNCEfdeZ8vjAzipL25MHBwq14bLo
	fMFpeQ0cs61mXRSqBsqWFp3myPO+pLh3MFatxjUtXKozyOkIn0srW/I0SPG2DrVu3U9M
	uJZNeJtTPCcHBxPzSNthaom+/x01GsVBszGxaA8xG3yaJvIvKFybxh0PwXIYwdCv3hQ6
	R63YSeBSL8Sst3493tWnee6Y67Y5tuijCYe/ZUsdjnkzzHojvbr/Nu1XjN8qTq3AFOy5
	FFm97HW96SwxK9egB5S+GumN6fMgS73OPDaMsOT1NvjI7uqj3CtpTX91cVXeA0lBzXFx
	8uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8oqrryPVOPpNzhcyLe63oXk9K2OZ1nJTS22fd2Pyg2k=;
	b=NvbiaG8PwcMAtWfTmo92fZ6Cgq2TaVE0q2OoTlaZUzoawRYlXQpafeaO6lm1l6B1wI
	5ut116isKyfxAe1kBOfqBD5iQfHfD/IAh2GUhEPW+Lvmhd0zMqzls8HBKC/0dHkNhJnu
	qvYMXqku8dHQCn1I2ix2yice42Nko6Q09Es4Hkr9v7NPkONkO+vXWDPTxoRMhb/BmUnQ
	3zvnO5PSxGxQuqdXOAHTTXqCPKj7CZ7GjZFpjfF6iGsq1DvuAA0veYS5omoPTxHDKjFp
	PDuVwmuCABlmyl5DifqeQ+ECIAHJ9VfhCt6ntMgT2xXhZqsb0t7OEuHctDRpGdN3V+Z4
	4IMA==
X-Gm-Message-State: APjAAAXPvqR6Y21+tpaUWcX7cokUi4Fyh+iSwmAXlfkvvMyuvm2T5VW3
	pfgiF+tHIpias+2l3np8P4o=
X-Google-Smtp-Source: APXvYqxrSmYpLoeSXo30HzGHFrVnETUt2+VXQV2KYuqVxnpN+/hD4k3gpKVTw5+lHwMyrzXGAq6kQQ==
X-Received: by 2002:a05:6000:1d0:: with SMTP id
	t16mr10052024wrx.239.1557536654999; 
	Fri, 10 May 2019 18:04:14 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id t6sm6580846wrn.3.2019.05.10.18.04.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 May 2019 18:04:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 11 May 2019 03:04:21 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190511010421.GA1523@jama>
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
	<CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
	<3b7d605c-ac73-6edf-7b39-598d451a4453@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3b7d605c-ac73-6edf-7b39-598d451a4453@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Sat, 11 May 2019 01:04:15 -0000
X-Groupsio-MsgNum: 124278
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 04:54:57PM -0700, Khem Raj wrote:
>=20
>=20
> On 5/10/19 4:00 PM, Andre McCurdy wrote:
> > On Fri, May 10, 2019 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On 5/10/19 3:13 PM, akuster808 wrote:
> >>> should we change the default to openssl ?
> >>
> >> I dont think so. Since newer versions of gnuTLS works okay.
> >=20
> > Isn't one of the goals for OE 2.8 to replace dependencies on [L]GPLv3
> > components with non-[L]GPLv3 alternatives so that meta-gplv2 can be
> > deprecated? This would seem to fit that goal exactly.
>=20
> Is that stated somewhere ? while I like the goal probably I missed the=20
> memo, my suggestion was just to give openssl backend some time to mature=
=20
> since its relatively new, and maybe give it some soak time
>=20
> >=20
> > It wasn't possible to build glib-networking with openssl until very
> > recently but now that it's supported upstream I think we should
> > switch.
> >=20
> >    https://github.com/GNOME/glib-networking/blob/master/NEWS

I don't have strong opinion either way.

I didn't want to change the default, because my only motivation was the
license issue with the newer gnutls, with the PACKAGECONFIG available
it's easy to change the TLS backend and that's all I need.

Will send v2 if there is some consensus from glib-networking users that
it should be changed and someone provides me the reasoning for the
commit message.

Cheers,

> >=20
> >>> - armin
> >>>
> >>> On 5/10/19 2:55 PM, Martin Jansa wrote:
> >>>> * gnutls from meta-gplv2 isn't new enough for this version of glib-n=
etworking:
> >>>>     meson.build:74:0: ERROR:  Invalid version of dependency, need 'g=
nutls' ['>=3D 3.4.6'] found '3.3.30'
> >>>>
> >>>> * disabling gnutls PACKAGECONFIG isn't an option either:
> >>>>     meson.build:131:2: ERROR:  Problem encountered: No TLS backends =
enabled. Please enable at least one TLS backend
> >>>>
> >>>> * add an option to replace gnutls with openssl
> >>>>
> >>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>> ---
> >>>>    meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.=
1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> >>>> index 09af229d69..e2b4cffb2b 100644
> >>>> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> >>>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> >>>> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] =3D "d71c6b2faa5ac29100=
314f08a1be020a2afd0291f025614c0a
> >>>>    PACKAGECONFIG ??=3D "gnutls"
> >>>>
> >>>>    PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3Ddisabled=
,gnutls"
> >>>> +PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisable=
d,openssl"
> >>>>    PACKAGECONFIG[libproxy] =3D "-Dlibproxy=3Denabled,-Dlibproxy=3Ddi=
sabled,libproxy"
> >>>>
> >>>>    EXTRA_OEMESON =3D "-Dgnome_proxy=3Ddisabled"
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXNYflQAKCRA3VSO3ZXaA
HPxzAJwL43kkSPGKslq6b+VKALSIsGYX9ACcCBtcEmxXq3raelCskg3cNH11EVE=
=s5JA
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
