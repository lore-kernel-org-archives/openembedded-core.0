Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6258765C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 12:27:53 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so22361294wid.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 04:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YneMhJDhUs0w45cu+zKAN3RY2BRQo3dBpk4WzRTLnrM=;
	b=I5ebElzEk85GzNaLaI0DLynsr8/1kvRpjHgSsc3JWdeGrmBk0oPGitgHimTZRbZxxi
	mnp4xBANRppcdgsIZrzAEh3/MbPh8vh+eDlzgIAN/1/+8D4W/HaBOWcveSe1q9N9w5Ms
	2mL0YFUEOPmBF42DNKChssQtPlH/vjqT3XKM3yUmLNvchEo89owERTHhEGZJiZsumqr4
	pbiVbfErMW03/8rOkjDxvvl+HSs1cfmxnhmaYsTRzjQt63dbSD7wAVyy4pMcp0WCAWwx
	gXBJIxL/7JOBrbuKVHrFTeUexRQ+kUbGuymtyac8lpG4xvfaGRhf6UBtiDZwWa18zjDS
	jPpw==
X-Received: by 10.180.108.143 with SMTP id hk15mr57569733wib.6.1421843274140; 
	Wed, 21 Jan 2015 04:27:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a1sm25332492wjx.28.2015.01.21.04.27.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jan 2015 04:27:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Jan 2015 13:27:56 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150121122756.GA2456@jama>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaOzuaeWJ-AQO1Bragu_w36f-tRmwUHLOtKNoxQ4N0VKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOzuaeWJ-AQO1Bragu_w36f-tRmwUHLOtKNoxQ4N0VKg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 21 Jan 2015 12:27:56 -0000
X-Groupsio-MsgNum: 61550
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 09:17:01PM +0000, Burton, Ross wrote:
> On 10 December 2014 at 14:18, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >  DEPENDS =3D "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
> >
> > +# depends on virtual/libx11
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
>=20
> Please drop piglit from this series, as that depending on x11 is a bug and
> I've a branch that is sorting that.
>=20
> But this does make me wonder why we can't make bitbake handle this for
> us...  just thinking out loud... would it be possible to have a "recursiv=
e"
> exception so that libx11 can say it needs the x11 DISTRO_FEATURE and
> anything that depends on libx11 is cleanly handled instead of erroring?

We have discussed this in July..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS/m0wACgkQN1Ujt2V2gBx/hwCfTTkg5GMsDXax2aQ8iEaRkhxC
IjgAn3L2rVQJ7sAI31namoSz/W8BMF09
=CJEL
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
