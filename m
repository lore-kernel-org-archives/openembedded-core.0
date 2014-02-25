Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 993846B938
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 00:28:43 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id e53so1950392eek.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xf0r4aHbGOwdWqD40Bvv6Um7TqtEBk/s4OC3jN9jbnk=;
	b=vdaLQ7SWq5lVaOYd9HxBJfhBFiaoQ9STSkHgX9BS7zbLyRVa+uJsO9WtD4y7dg5bkP
	aeZjiWPv9WapzLsg6SiAwhhja2mj0JHj/NUb8nqmyHq8ImoVNo5v76KPWvLMN2x4IVQ3
	Wi7BmOHjsqCE4iy4/ilrlFLWMaPWFO22JefsPGqYl/xd+36uxXdFb2IMhiELFRBbxRsu
	tPPmQCriFn0gHQz7f9FnBTse40mwaUZgYFOv3zshWK78khhti2jDEGihlzyIazIiilN9
	/TYzbzqwGyNdQQKJaJ1lI6e44+SxaUfiLDhZYvaoW3ZjcvKZDg6SreaqKtoEJ04ZxziW
	7j+w==
X-Received: by 10.14.202.136 with SMTP id d8mr27803856eeo.46.1393288124568;
	Mon, 24 Feb 2014 16:28:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o43sm69898206eef.12.2014.02.24.16.28.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 16:28:43 -0800 (PST)
Date: Tue, 25 Feb 2014 01:28:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20140225002842.GL26981@jama>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<1393092730.2640.25.camel@e130.pbcl.net>
	<A779E393-73D0-4FF8-A680-EA37F8CAFE3F@gmail.com>
	<8D402F63-A17D-458D-8C9B-CE3340EF0F9A@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <8D402F63-A17D-458D-8C9B-CE3340EF0F9A@dominion.thruhere.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Tue, 25 Feb 2014 00:28:49 -0000
X-Groupsio-MsgNum: 50544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhAUiXSLan16V5i8"
Content-Disposition: inline

--nhAUiXSLan16V5i8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2014 at 08:36:56AM +0100, Koen Kooi wrote:
>=20
> Op 22 feb. 2014, om 20:52 heeft Khem Raj <raj.khem@gmail.com> het volgend=
e geschreven:
>=20
> >=20
> > On Feb 22, 2014, at 10:12 AM, Phil Blundell <pb@pbcl.net> wrote:
> >=20
> >> On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote:
> >>> builds might work but they won=E2=80=99t run and yes so far IFUNC sup=
port is needed so it won=E2=80=99t work on non-x86
> >>> architectures. One common runtime problem I am seeing is logind not b=
eing able to talk to dbus
> >>> across all architectures. I have pushed my latest rework to pull bran=
ch
> >>=20
> >> What is the problem with ifunc on non-x86? =20
> >=20
> > they are not enabled across all architectures, well specifically, its n=
ot enabled on arm and seems also ppc is missing it.
> >=20
> >> As far as I know the
> >> compiler, assembler, linker and ld.so for all reasonable architectures
> >> support that nowadays (though prelink support is a bit patchy).  GCC
> >> didn't have ifuncs enabled for some architectures until quite recently
> >> but if that was the problem then you'd see compile-time failures.  So,
> >> if it compiles then I can't think of any reason why it oughtn't to run.
> >=20
> > systemd is using ifuncs to patch up the library migration it has done i=
n 209
> > so it only shows up when we enable compat lib support in systemd, and i=
f we patch the apps to forward port to systemd 209 then we don=E2=80=99t ne=
ed to enable compat lib support and
> > it could be left alone.
>=20
> Or we can cherry-pick http://cgit.freedesktop.org/systemd/systemd/commit/=
?id=3D03e37dd767e52908f30783d9b4c09fb6a4e865c7 :)

And 210 is out :)

FWIW: My world builds revealed only networkmanager failing to detect
libsystemd.

> > if we want to enable compat libs/ifunc then we can think of adding --en=
able-gnu-indirect-function
> > to gcc configure but then it may not work on all architectures that we =
are interested in.
> >=20
> >=20
> >> Is this a uclibc thing?
> >=20
> > no
> >=20
> >>=20
> >> p.
> >>=20
> >>=20
> >=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nhAUiXSLan16V5i8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlML47oACgkQN1Ujt2V2gByGJwCgudJcU1DwQ/CtVLU/etaY6ueY
XgYAn3njqy5I1Fw90ui7M6fo9MhT/jJ6
=LznH
-----END PGP SIGNATURE-----

--nhAUiXSLan16V5i8--
