Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8F90F6FEA8;
	Mon, 16 Jun 2014 17:20:23 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so4472063wiw.11
	for <multiple recipients>; Mon, 16 Jun 2014 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PZukLe0VIhlDp3tZpnkA8WYFBZ52P6yfQSPVGulRtq8=;
	b=cX5/6Cfa6xNjlNFi8NPUXfWmLWhK4/j89HaJhQEK4GjiokXmOXk4/Px0mdqxxMARnn
	iVPpCzOK53QZhC9i9J9usq4nkSWMbOS5NUPJjc+UG7cX6Kf+9QyanBt+r9hoMaqvEG9Y
	L8LycupGijSZIU3EI/RrN7G8bsaI3G/rBe/8wsxzEVtfLvvVW0idexEkPRlChJnen1Gx
	fZZXuUruacRaPBWrjQSwSWq6dSWPUo2vIGL6tNkIa/I1vXoNSADIODCP6lPpzbMg/F6E
	fmwgHpOayzFTs+Jfc0WpYtCcL7eYcQ9hAaxw6Agk97BOXubaJLU/BPO4kwKmWGEcuhAy
	0isg==
X-Received: by 10.180.184.198 with SMTP id ew6mr29697206wic.13.1402939224529; 
	Mon, 16 Jun 2014 10:20:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w9sm35202767eev.4.2014.06.16.10.20.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 10:20:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Jun 2014 19:20:43 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20140616172043.GS2428@jama>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
	<539E8F97.3070508@dresearch-fe.de>
	<6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
	<539EBCA8.3000709@dresearch-fe.de> <20140616105942.GO2428@jama>
	<539F1D15.8090304@gmail.com>
MIME-Version: 1.0
In-Reply-To: <539F1D15.8090304@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Mon, 16 Jun 2014 17:20:33 -0000
X-Groupsio-MsgNum: 54173
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lzfPtAjrR1KYNfg0"
Content-Disposition: inline

--lzfPtAjrR1KYNfg0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2014 at 09:36:37AM -0700, akuster808 wrote:
> Martin,
>=20
> You can add me as a meta-oe daisy maintainer, if there is still a need.

Thanks Armin, please send update to README files which will list you and
your e-mail (to be added in CC: for daisy patches).

> - Armin
>=20
> On 06/16/2014 03:59 AM, Martin Jansa wrote:
> > On Mon, Jun 16, 2014 at 11:45:12AM +0200, Steffen Sledz wrote:
> >> On 16.06.2014 10:48, Paul Eggleton wrote:
> >>> On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
> >>>> What is the right ML address for patches in this area?
> >>>>
> >>>> The meta-multimedia/README in git://git.openembedded.org/meta-openem=
bedded
> >>>> (daisy branch) says:
> >>>>
> >>>>    "Send pull requests to openembedded-devel@lists.openembedded.org"
> >>>>
> >>>> But i believe this should be openembedded-core@lists.openembedded.or=
g.
> >>>
> >>> No, for all layers in the meta-openembedded repository it should be
> >>> openembedded-devel as listed.
> >>
> >> OK, thx for this info.
> >>
> >> So i hope the patch will make it into the daisy branch in the next tim=
e, because our build is broken meanwhile (OK, we have a workaround, but thi=
s is unendearing).
> >
> > We still don't have meta-oe daisy maintainer :/ (and update to READMEs
> > in daisy branch)..
> >
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lzfPtAjrR1KYNfg0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOfJ2sACgkQN1Ujt2V2gBxWxACgq4i/ZLAsUVYCSiSAS1xumcYf
aZAAoIqMNB4mavwAbsolf9IsrWJ/zxpp
=Emg+
-----END PGP SIGNATURE-----

--lzfPtAjrR1KYNfg0--
