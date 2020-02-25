Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 083D3616F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:29:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so419624wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nn0QSFlBBTc/C+4v5Rx636BixcCNggFEB+gdRpLhlSE=;
	b=RksI4/l9q5XTD1KlotsapiYb9NN5DWYT3pfmzYWGrMGMv4EWaB+yWImGGCym9xq+4v
	S0cSg99LTfGi4Oxe9AatvZvnPalYTLrjj8DB2fMrCuIfvM+IMd3hE+IAQvNoth9KPZB+
	cuHJ3ycWP7+Jr5PlxmahwOp3s3I/4ceTyQ3COSY3yPiBK1jhPgh9sJE3FIbz5UEfzN4o
	XkaoLz2vnosxZgopW8nyrv4z01jL/iFSmmnYTUEfcBhN3TqTX5VSlOrL5x3q7Sp0Bm3P
	3oJck75MYxDHEjFeRd0uF66ZnfB1YujRhNTSWBMZKXPfLKSbuQL6zMKIyEl28sudfNF7
	21+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nn0QSFlBBTc/C+4v5Rx636BixcCNggFEB+gdRpLhlSE=;
	b=buvXlYX7xSq+a++CB7xO+0TQdttbu1XQETugZesftiswlkvS+qD45Uw2KDT/BvCm02
	bet0wdC0hNA9Y3UBgG6UdFXObSviUlwsmFQUhyQRTAkvg7zpZGJI1RjdTS3h70oYL7px
	WCv/kFwCDO3g/wh+FkRwXxhgPGG8Wrth5VDbTg3NwagUtWk1Rla1szvHf+E1rnsTrMEm
	LHenJmTAQNnLW7zU8TrU7agF5yeDTSi4ulRzQ1VByEat4uAJlg5UYuJWL25IXGN6A/0a
	+k74ul9NQWfgAq4Xj/ayGMs4Dj72Tygy71tH++T2xQEwPeM8ax8JOem1nzB7DQYK+Wkf
	E+CA==
X-Gm-Message-State: APjAAAUvBl+sg63EzBseckwYHSv4+zv9EgKOJm4KPtx7FO2UWbuA2ZF2
	I3wscxyxJ+FdWocQjFTZwVo=
X-Google-Smtp-Source: APXvYqw5t5a6nNmCpqUa/UY0YXixwlY0t9U7mYA1fTxMoOgnBacbQcmnL7gRNyMyxTIozAlrIWXXsg==
X-Received: by 2002:a1c:a594:: with SMTP id o142mr684769wme.146.1582658941066; 
	Tue, 25 Feb 2020 11:29:01 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id e8sm19471803wru.7.2020.02.25.11.29.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:29:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Feb 2020 20:28:59 +0100
To: Scott Branden <scott.branden@broadcom.com>
Message-ID: <20200225192859.j5j4shf72wxdvqgv@jama>
References: <20200225001115.18188-1-scott.branden@broadcom.com>
	<628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
	<f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
User-Agent: NeoMutt/20180716
Cc: Mircea Carausu <mircea.carausu@broadcom.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] common-license: add fdk-aac license file
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
X-List-Received-Date: Tue, 25 Feb 2020 19:29:02 -0000
X-Groupsio-MsgNum: 135604
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k24e7swngavm2c52"
Content-Disposition: inline

--k24e7swngavm2c52
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 11:13:46AM -0800, Scott Branden via Openembedded-co=
re wrote:
> Hi Richard,
>=20
> On 2020-02-25 2:46 a.m., Richard Purdie wrote:
> > On Mon, 2020-02-24 at 16:11 -0800, Scott Branden via Openembedded-core
> > wrote:
> > > From: Mircea Carausu <mircea.carausu@broadcom.com>
> > >=20
> > > Add Fraunhofer FDK AAC Codec Library license.
> > >=20
> > > Signed-offby: Mircea Carausu <mircea.carausu@broadcom.com>
> > > Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> > I'm not sure this belongs in Core? Is it a commonly used license? This
> > recipe isn't in OE-Core? Does the license have an SPDX identifier (I
> > couldn't see it on https://spdx.org/licenses/)?
> If we do not add this license the following WARNING is emitted:
>=20
> WARNING: fdk-aac-2.0.1-r0 do_populate_lic: fdk-aac: No generic license fi=
le
> exists for: Fraunhofer_FDK_AAC_Codec_Library_for_Android in any provider
>=20
> We have submitted the fdk-aac recipe to meta-openembedded/meta-multimedia
> here:
> https://patchwork.openembedded.org/patch/170495/
>=20
> Please suggest the appropriate place to submit this license.

licenses directory in meta-multimedia

> It is an open source license but does not have and SPDX indentifier and is
> only used for fdk-aac at this time.
>=20
> > Cheers,
> >=20
> > Richard
> >=20
> Thanks,
> =A0Scott
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--k24e7swngavm2c52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXlV1egAKCRA3VSO3ZXaA
HOwKAJ4iM4ahelkNeMm293V473lMma+AeACgl31BiS/U0IL9UQHAAQNsyQGlgFE=
=LkzD
-----END PGP SIGNATURE-----

--k24e7swngavm2c52--
