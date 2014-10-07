Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 43BD565E0C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 17:29:02 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi2so8681038wib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9MfwBIUO2EDjmcDyBynSzAdL2IqKPf0hfF8q3iUkDnQ=;
	b=o5l7Xz06l3JBORKwv+gCsLrt3wSv25UdX50y2xoyVa+Gdj8FHhBcfx+INo6UYMzOxJ
	RA4l2XGkIUXrbK0jxrdw1FJxRogL4o6aGG+Kk3corULj0MxoL4a7j5bcCju1s+g8WrVP
	X1+PDU7yRLVGVCw9lBOM5V64gIGcqrPP25nlg9NMhWQsO4hOmDZz8MFF2fjCEZ/DpX4k
	XIIimzT9E/0MC7n8qUEimH5r2Yu6tM46sIFdP9ddujOb2ANdJQZLBb5JTz4SNTMY2DSS
	D58jeRVuO+V3RN52gmtLNXS7kcMyWNdW2EH7INCT+aDg9818q0ldpmpybtlihxh8Ao6B
	1zQQ==
X-Received: by 10.180.21.163 with SMTP id w3mr1393558wie.11.1412702943191;
	Tue, 07 Oct 2014 10:29:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ma8sm21505894wjb.46.2014.10.07.10.29.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 10:29:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Oct 2014 19:30:05 +0200
To: Lauren Post <Lauren.Post@freescale.com>
Message-ID: <20141007173005.GF12322@jama>
References: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple issues building from dizzy or master
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
X-List-Received-Date: Tue, 07 Oct 2014 17:29:07 -0000
X-Groupsio-MsgNum: 58406
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline

--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 03:24:35PM +0000, Lauren Post wrote:
> We've been trying for a few weeks to move all our builds to master (yeste=
rday dizzy for poky which is the same) and been having random strange probl=
ems on multiple jenkins machines we do our daily builds on.  I talked to Ot=
avio about it but wonder if we are missing something.    I'd appreciate any=
 ideas.   We can build our kernel and uboot fine but when we try to build a=
 more complex image with qt5 we have not succeeded any build since yesterda=
y.
>=20
> As of today we are now getting errors in db compilation
> On both locally and on Jenkins we keep getting a db compile error as of t=
oday.
> ./db_cxx.h:59:22: fatal error: iostream.h: No such file or directory
>  #include <iostream.h>
>                       ^

Check this thread:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg55=
742.html

you need to detect why your db build doesn't define HAVE_CXX_STDHEADERS

> ---------------------------------------------------------------------
> For last week we've been battling random gcc_runtime configure errors onl=
y on Jenkins machines. =20
>=20
> This is the configure error.
> checking dynamic linker characteristics... configure: error: Link tests a=
re not allowed after GCC_NO_EXECUTABLES.
>=20
> -------------------------------------------------------------------------=
------------------------------
> As of yesterday morning, we are also having many unpack errors on many fi=
les that are disappearing from our downloads before unpack.  The fetch is w=
orking but then when it unpacks the package has disappeared from downloads.=
  I've seen this on multiple components (libx11, xproto, inputproto, util-l=
inux).  Seems to happen more often with rm_work set but I've seen it withou=
t it set.
>=20
> I'd appreciate any ideas.  The only one I can reproduce locally is the db=
 error above but the others seem to only happen on Jenkins machines.  We ha=
ve 4 different Jenkins machines all of which can't build on the master bran=
ch but have built fine for months on daisy and dora branches. =20
>=20
> By the way you can't set your gcc to 4.8.2 - liburcu breaks if you try to=
 use the older compiler.  So not sure if any of the gcc runtime issues are =
related to the new gcc version.   Not sure if we should keep gcc 4.8.2 in d=
izzy if it can't be used.
>=20
> Thanks for any ideas.  I've tried everything I can think of.
>=20
> Lauren Post
> i.MX Freescale=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ0Ix0ACgkQN1Ujt2V2gByxwQCgpln73/Ssy6SSayE+FgHFF5PT
5egAnijTlfbJeg9YrUZf0bRpzW4ne2/q
=lBet
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
