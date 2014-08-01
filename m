Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id CA3B265CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 10:51:41 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so1117515wiw.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Aug 2014 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=74BHxVUyVE86hMXEEVyUITkpzdnfOWzLh1DMFxMoRqU=;
	b=H9T5wLopa/I0krtj5Ytnug1y68UVXRC2sXS2EODY1IktFgf1DRYDyBUhkOYWvsHIyA
	6WSEiwX9YOG2myzJwHh2c1z+nQluJcGb0OTIQO4HKwJXr/ogUW9DqY85d2O7R00LXwp/
	sThO1JZbEB/x69EBl0W72zFHkZhrd1rrm3v9y2eOjNl9ExKOr4b7IgbPViBICrMYQfHA
	vxHpKSp1oRWDSQZQsou3Hw5dRbSldJ7qwxayB9uzJTS7tXkcRMHYtJPEJJtZlbNY4NJN
	qULUnOoF0tcqDC4CnguI3TvcUG7VFut9lac3y7FByDKPTm7E1/sV6d0Rv+bfpaMS7Yev
	R3Tg==
X-Received: by 10.195.12.97 with SMTP id ep1mr6484660wjd.26.1406890300354;
	Fri, 01 Aug 2014 03:51:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm7488108wic.24.2014.08.01.03.51.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Aug 2014 03:51:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Aug 2014 12:52:03 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140801105203.GC16445@jama>
References: <20140729173251.GA9234@mail.itconsulting-heinold.de>
	<1635829.5tfOCJn7de@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1635829.5tfOCJn7de@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problem with debian renaming and upgrade-path on dora
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
X-List-Received-Date: Fri, 01 Aug 2014 10:51:50 -0000
X-Groupsio-MsgNum: 55838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zXfPu6M4uk8xi/G5"
Content-Disposition: inline

--zXfPu6M4uk8xi/G5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 10:32:38AM +0100, Paul Eggleton wrote:
> Hi Henning,
>=20
> On Tuesday 29 July 2014 19:32:51 Henning Heinold wrote:
> > I have a problem to get a sane upgrade path for a library package which
> > should be splitted in to serval packages on dora.
> >=20
> > The old package is called libfoo now the package gets split into libfoo
> > libfoo-bar libfoo-set and so on.
> >=20
> > Because of the debian renaming for libraries the PN-library package lib=
foo
> > is renamed to libfoo3.
> >=20
> > If we now want to upgrade from libfoo to libfoo3 oneway would be to use
> > RREPLACE, but the renaming wrapping is written at do_package into files,
> > before all the other stuff kicks in.
> >=20
> > So all RREPLACES are renamed to libfoo3 too, making it impossible to ge=
t a
> > REPLACE stanza for libfoo into an ipk.

Why do you want to do the upgrade one-way?

I think that one of debian renaming benefits is that the old libfoo
package stays installed on target until all programs aren't rebuilt
against libfoo3 and upgraded - then old libfoo could be automatically
uninstalled as orphaned package.

> Hmm. I guess one workaround for this would be to set the RREPLACES / RPRO=
VIDES=20
> / RCONFLICTS in a Python function that is called after the debian renamin=
g=20
> happens.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zXfPu6M4uk8xi/G5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPbcVMACgkQN1Ujt2V2gBwjqgCcDvLCyOIRf8Pf5t5mUiucXoED
4gAAoJaLcb1ZIndBytPrSqgErObo2yos
=E8fh
-----END PGP SIGNATURE-----

--zXfPu6M4uk8xi/G5--
