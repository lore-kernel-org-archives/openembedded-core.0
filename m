Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 297D860111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:49:42 +0000 (UTC)
Received: by wmec201 with SMTP id c201so288202827wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3QyeISnT80AtGMx8gjYKLX6sumX++OSOdd8iARmsSoc=;
	b=R+h+t1emL40EcxydHSfa7FOYH6L74snT13B4bS5Q9SsqbxlLb8H0FLRhOVwo6LY/ez
	ntGB8eBqpsQ5EU8f8/6fHbbFeRcVmRoBdOc/O0Q7QMzhKtCfCHtGuP5wpveVVdeYftbX
	TJ4/SEBA3DbgivRBuuAU0N0/aDC7fnWc1yWqtdztCSzer6RFt/By5T/yrMnevs06xG1X
	7qSi/M3bYAOispWFPBrGGOPe2nho6LPIMLBfoadGvppvD+qUnFsJUZgMMlWLOvT53GlP
	svAFpIclMl+X4Mrmbf5MKZXcL+2GQjRmB8mCpLKwg013M5wW+sjqDAi+tIy0CC5pLSnm
	qbMA==
X-Received: by 10.28.91.72 with SMTP id p69mr10842679wmb.49.1447865382964;
	Wed, 18 Nov 2015 08:49:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e83sm2087459wmc.23.2015.11.18.08.49.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 08:49:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Nov 2015 17:49:56 +0100
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20151118164956.GD2213@jama>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<018bb1afb653b342e39f2d9c7a14645913c554ae.1447757562.git.Martin.Jansa@gmail.com>
	<1447864564.1472.52.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1447864564.1472.52.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 09/16] cortexa{7,15,17}: add VFPv4 tunes
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
X-List-Received-Date: Wed, 18 Nov 2015 16:49:43 -0000
X-Groupsio-MsgNum: 73641
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline

--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 04:36:04PM +0000, Phil Blundell wrote:
> On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> > * it was added only to hf cortexa7 in:
> >   commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
> >   Author: Kristof Robot <krirobo@gmail.com>
> >   Date:   Sun Jan 26 10:03:56 2014 +0100
> >=20
> >       Add Cortex A7 support for NEONv2 & FPv4
> >=20
> > * add it to softfp cortexa7 and both versions for cortexa15 and
> >   cortexa17 tunes
>=20
> I can't say I'm wildly thrilled about the combinatorial explosion of
> tunes that differ only in a few letters.  Can't we just enable NEON and
> VFPv4 under the existing cortex-a15 tune?  Those ISAs are both part of
> the Cortex-A15 cpu, right?

I don't have strong opinion about this, I just want it to behave
consistently.

> Also...
>=20
> > * we should also update Cortex-A7 and Cortex-A15, to use=20
> > -march=3Darmv7ve,
> >   but the problem is that oe-core has gcc-4.[89] and gcc-5.2 and gcc
> > -4.8
> >   doesn't support it yet, maybe we should do this change after gcc
> > -4.8
> >   is removed, for details see:
> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907
>=20
> ... this part of the commit message is superseded by the following
> patch, right?

Correct, I'll remove it and resend when there is some decision about
above.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZMrDMACgkQN1Ujt2V2gBwtlQCdEgX4rnRxmlel3x3KkejJAh0g
NtUAmQHuQ3DGGR8ZTbGZ5JfOEd9U8Nz0
=mxdx
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
