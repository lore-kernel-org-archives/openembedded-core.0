Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id EF81960896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:54:09 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so794317eek.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YdaY3PrvIc0qbQsbZhQFq88dkVS79coaiSDbvteUJqw=;
	b=uuYDS6J94/1OviKnHuVuBEJIZFbR822+wvY5nfK6HZ7v8E5AyCJys1R/POxjcq0xF6
	BQQmyjGoQ5PhS+ga2hnlYthgWFkFitXiiZP0Jhvj0itEExsnCqPzWOwoX3VSVLICQU+V
	0XoW9rvRffEppDKR3PUU8RMpAtLeo0KLnSQ12+5zDD6hWJ2HGzt8ZxgdFVne1ummVQKP
	zW02pY7LHs5QaHoiqrZBJpPDc3uz8NihIPNDkdhpnBdhtrbY+fPyI+ud6Fvujh7FJqjP
	VuAnqMcuuSBB7ESYDAVViPv9smNh+B5Q4poVlkQ7ZLcXhdMTvy29cUqe+boWzoxkoD9j
	7e2g==
X-Received: by 10.15.77.199 with SMTP id p47mr2596615eey.50.1377165249597;
	Thu, 22 Aug 2013 02:54:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm16331642eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 02:54:09 -0700 (PDT)
Date: Thu, 22 Aug 2013 11:55:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20130822095515.GJ522@jama>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios>
	<969F26A8BAB325438E7EB80D3C3134FB16C17CB1@IRSMSX105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C17CB1@IRSMSX105.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 09:54:10 -0000
X-Groupsio-MsgNum: 43714
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3CAnR4CLEnEWqRMR"
Content-Disposition: inline

--3CAnR4CLEnEWqRMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 09:14:07AM +0000, Iorga, Cristian wrote:
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Paul Eggleton
> Sent: Thursday, August 22, 2013 12:08 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [CONSOLIDATED PULL 00/62] Python3, Packge Exlude a=
nd more (Initial ACK Please)!

Iorga, please get better e-mail client, there is no way to see what was
written by you and what was there from Paul's reply.

> > Cristian Iorga (4):
> >   packagegroup-self-hosted: pcmanfm integration
> >   builder: register directories with pcmanfm
> >   build-appliance-image: changing the icon theme to sato
> >   default-providers: Set the preferred provider for bluez
>=20
> I thought we were going to fix the libasound-module-bluez multiple provid=
er issue by renaming the package?
>  - Actually, that involves more changes (change in packagegroup-base.bb) =
and I think that this change will be eliminated once we will make the chang=
e to BlueZ5 in the next release (or I hope so :-) ).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3CAnR4CLEnEWqRMR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIV4AMACgkQN1Ujt2V2gBzlHQCcCIVlGie8chEUCLtep/h5ws9d
NggAnR6iPc06PkuItZQPcL+P9gIsTXej
=Z7mY
-----END PGP SIGNATURE-----

--3CAnR4CLEnEWqRMR--
