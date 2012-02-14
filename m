Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxNrL-0007UY-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 20:16:16 +0100
Received: by eaal10 with SMTP id l10so89049eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=31Bq9q/wu8tqMLiMp4slaI6v3+JDwjfGTOdMebYPSds=;
	b=mXHFf3/H578qdx/OXbagXzvyBI7fDJMtfrnF1sy5Cc5YN5tEniWXA0ST2jWBhySyjx
	9OZrKuHsNhq5f+zmCHD5hXl76fAIONoq7lVHQwxcx9LmdIgnod8BRnCbp0eWINN/A0ng
	+8L72AUrVmjw5kODZhprI3DHKqCkWGhDuPuvk=
Received: by 10.213.98.70 with SMTP id p6mr746406ebn.128.1329246485004;
	Tue, 14 Feb 2012 11:08:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n58sm1614179een.10.2012.02.14.11.08.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 11:08:02 -0800 (PST)
Date: Tue, 14 Feb 2012 20:08:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120214190800.GC23843@jama.jama.net>
References: <1328832372.10451.47.camel@ted>
	<CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
	<1328881254.13434.10.camel@ted>
	<20120211015834.GB2095@sakrah.homelinux.org>
	<1328977465.26671.0.camel@ted>
	<CA+chaQeSjRw_OTPauSx5YBbiLGdgfkMYGYi_0E3Me-QCPS+Q8Q@mail.gmail.com>
	<20120214185506.GA11340@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20120214185506.GA11340@sakrah.homelinux.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Tue, 14 Feb 2012 19:16:16 -0000
X-Groupsio-MsgNum: 17518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2012 at 10:55:06AM -0800, Khem Raj wrote:
> On (14/02/12 13:16), Martin Jansa wrote:
> > On Sat, Feb 11, 2012 at 5:24 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2012-02-10 at 17:58 -0800, Khem Raj wrote:
> > >> On (10/02/12 13:40), Richard Purdie wrote:
> > >> > On Thu, 2012-02-09 at 16:39 -0800, Khem Raj wrote:
> > >> > > On Thu, Feb 9, 2012 at 4:06 PM, Richard Purdie
> > >> > > <richard.purdie@linuxfoundation.org> wrote:
> > >> > > >
> > >> > > > +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-nat=
ive"
> > >> > >
> > >> > >
> > >> > > note that we will need to ship zlib-nativesdk as well if we do t=
his
> > >> > > so hopefully that case is covered by this.
> > >> >
> > >> > Yes, zlib has a BBCLASSEXTEND on zlib-nativesdk so this should be =
fine.
> > >>
> > >> OK and this is bundled with meta-toolchain too right ?
> > >
> > > By anything that depends on it by the shlibs code in the usual way, y=
es.
> >=20
> > But zlib is build time dependency, isn't it?
>=20
> yes it must be added to target gcc recipe
>=20
> >=20
> > Now it fails to build target gcc because it depends only on
> > zlib-native not target zlib and zlib.h is not found.
>=20
> whats the exact error? usually zlib is needed for gcj. are you building
> gcj ?

I don't have that log anymore, but I'm building default gcc
configuration from oe-core/meta-oe (iirc without gcj) and IIRC it was
=66rom lto (gcc/lto-compress.c:#include <zlib.h>).

Cheers,

>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk86sRAACgkQN1Ujt2V2gByHfgCeJcpQdiaPI9ITAZWrwCpC8Npg
ru8AnjQWckJZ+IsssgvujTLG/9ZORO4p
=50Xe
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
