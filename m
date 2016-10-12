Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7749B70101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 17:30:26 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id o68so89852907qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eawrTpsDyfvXZhTdyG4m67o3ViPjEFTOwzSFvSVEg1U=;
	b=qdaB7rRsDapc7cBhVH2f2iP3jGAGEbqGxHV433rwK13gyciXQP+7GfprQRXYyn98Bq
	bDSn/mn+qhwXOgFvv813Im+xkjfNJnFb/uQjNCSha5RG5mrNC6KVn0QyVxYjfxQIytzV
	Hv/jNOBwrDXXvfk8hRWDQNS/9u2pn6frX1Nb6FEfCCqHXbvNdq32u5TGKdiHdoYgFERa
	bXjtVLet/eyzzDaqxamvXrCzPgadOuKiIGNJwmMJk7qiOEC789nl4Jojb69cE+lVsZZB
	/2B5bwDDso4wk58lrDFH2DwkJO6/xhjk+A++1jk0bsa7Zan+LuvydT3MeYts3b1isZEt
	byGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eawrTpsDyfvXZhTdyG4m67o3ViPjEFTOwzSFvSVEg1U=;
	b=W8nrZIVaTou55zh7uiGnyQFOtKPSpoHDE/WNOhn02fiuCgaf36Gb9NrLEvTjzy9ugb
	2wD8Op4q+2HMNIVnwoIDRkxTHFxlNqqCzAdtPMQF+ZGg0vBBzUQPIFM/K8/lPOWmsQMs
	hpiIwfd6eLYeQcSMi1pnMN9aBDv1RUYbKqeqAyCx4QxKSWPgzX3TmrBAW351/0bGwVVr
	YzfLvv/PhTbqI3HhiAhh1j46xEQgsx/FyZ6WCYtgU6q4knhDqV44UuHEktRCvNrt/D7p
	O9lB/2aUEqLTs4h+8TiJV/VVDOxB27B+M1Y+1ZjfoJxnKLfBHHQoQ5CXmTLBQ2N2fwgJ
	5mbA==
X-Gm-Message-State: AA6/9Rlrzr5tewtsIK9UTXG/pLM2pHV7NB/kRkMgKMTQ8ScsIhGKCMNmRWM4WWoStpubEg==
X-Received: by 10.194.246.169 with SMTP id xx9mr3179814wjc.76.1476293427378;
	Wed, 12 Oct 2016 10:30:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id f2sm14605919wjr.2.2016.10.12.10.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Oct 2016 10:30:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 Oct 2016 19:30:25 +0200
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20161012173025.GF2923@jama>
References: <1476291665.16008.59.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1476291665.16008.59.camel@pbcl.net>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts in DL_DIR
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
X-List-Received-Date: Wed, 12 Oct 2016 17:30:27 -0000
X-Groupsio-MsgNum: 88127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline

--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 06:01:05PM +0100, Phil Blundell wrote:
> I just ran into an annoying problem with two recipes whose upstreams
> both use the same poor naming scheme for their downloadable tarballs
> which causes the sources to collide in DL_DIR. =A0One of them is eudev,
> which has:
>=20
> SRC_URI =3D "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz

Github archives are regenerated from time to time and then the checksums
are changed, so 3rd option is to use git fetcher with SRCREV matching the
has of v${PV} tag.

> This shows up as a source checksum error when the second package finds
> what it thinks are its sources in DL_DIR, but of course they are not
> the files that it wanted.
>=20
> I couldn't immediately find any easy way to work around this
> difficulty. =A0Setting "localpath=3Deudev_v{$PV}.tar.gz" in eudev's SRC_U=
RI
> looks superficially like it ought to do the right thing, but although
> this changes the location that the fetcher will search for the
> downloaded file it doesn't actually cause wget to put the file there so
> this doesn't work either.
>=20
> I suppose I could define DL_DIR in terms of ${PN}, which would
> presumably fix this problem at the cost of causing all my previous
> downloads to be repeated. =A0Or I could stop using eudev, or wait for one
> of the two packages to release a new version. :-) =A0Any better
> suggestions?
>=20
> thanks
>=20
> p.
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf+czEACgkQN1Ujt2V2gBwDfwCfbXtNltHIvwd2zCruBGhY8yiN
WY0An06YT2FqhydDmlGPox8jmw9oiKQG
=Y9Rf
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--
