Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T2Lf2-0004B2-SJ; Fri, 17 Aug 2012 14:28:21 +0200
Received: by weyr6 with SMTP id r6so2506722wey.6
	for <multiple recipients>; Fri, 17 Aug 2012 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oMllMpFwN9FvN8IlHfvS2WbD5TNkYDbXPMK4YngG0WQ=;
	b=0Na1VLoYEi19+WxVja+2ECyngxYmD79OAOUwXiBnH1qWO9UHPnfeyVioB1w29Litx4
	BVMq/+jsQMWeNHr2qlApRIEAgBSv2aztgHOjj4aeOgZ5qeDb6s1lS2HksCw1gOzmI4LO
	oDXc/EUW0SpD2O34n6DAclIOGETrbbkaKtGAARvlQNXu8IakgQw+vsWxgnDFGstwKNoK
	STCcecuwOG6v8lVxF+Q4PKg+5Ae22T5LlNt8uW+bH5uXDwMNr40Xg6Mlsp7XYB9yos+Q
	KpE3sTLXOj1zjj8M+mIbEmBZkK69EWjlkLmA6fDjXduBzKoFoAk1EU0JOIQnkPFULTSb
	5nNQ==
Received: by 10.180.89.235 with SMTP id br11mr4682323wib.3.1345205782498;
	Fri, 17 Aug 2012 05:16:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm9442116wib.6.2012.08.17.05.16.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 05:16:21 -0700 (PDT)
Date: Fri, 17 Aug 2012 14:16:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120817121618.GH3625@jama.jama.net>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: One X Server To Rule Them All
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
X-List-Received-Date: Fri, 17 Aug 2012 12:28:21 -0000
X-Groupsio-MsgNum: 27707
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline

--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 01:12:45PM +0100, Burton, Ross wrote:
> Hi,
>=20
> It's bugged me for a while that oe-core is shipping both "big" X.org
> (in two variations) and "small" kdrive.  A quick review shows:
>=20
> - oe-core is using X.org for the qemu images on all platforms
> - meta-yocto is using big X.org for Atom, "lite" Xorg for beagleboard,
> and kdrive for mpc8315e/routerstationpro.
> - meta-ti is using xserver-xorg (and not the lite variation for
> beagle).  It also ships a binary kdrive-based Xsgx, but that doesn't
> require kdrive in oe-core.
>=20
> I looked at a few other BSPs but the ones I found appeared to leave X
> server choice to the user.  I also see that meta-oe is shipping
> another X.org server.

Is it? where? I've merged it to oe-core about year ago..

Cheers,

> Some consolidation is required, obviously.
>=20
> Xorg lite is just X.org with --disable-dri --disable-glx
> --disable-dga.  I need to investigate how much a difference that
> actually makes to the server binary and if it can be controlled by
> machine features or more granular packaging.
>=20
> Here's my plan:
> 1) Investigate differences between xorg/xorg-lite/kdrive, producing a
> feature matrix and binary size comparison.  Then assuming it's fine:
> 2) Remove xorg-lite, switch beagleboard in meta-yocto to X.org as per
> meta-ti's example
> 3) Remove kdrive, switch meta-yocto's remaining machines  to X.org
> 4) Review differences between oe-core and meta-oe's X.org, merge,
> unification at last, street party.
>=20
> I'm sure the combined members of oe-core and oe-devel have something
> to say about this.  Comments welcome!
>=20
> I'd obviously need to test X.org on the MPC8315e and RouterStation
> Pro, so if anyone has one of these set up then offering to test would
> be much appreciated.
>=20
> Cheers,
> Ross
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAuNhIACgkQN1Ujt2V2gBwGlwCdFI3EeXtjlWNsvjLo6k3DiIy6
F5sAnjVsf8oC0xtyoMjatlRJoe/4xcjg
=fbR4
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--
