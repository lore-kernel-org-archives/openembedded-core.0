Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5C975601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:46:21 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so277828wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4xK7eRDZF6aXErzLNA41dJYGrIaCjFo/MLpbeiv1cWs=;
	b=cBz9J9fF2eYRWlJYtqs4/ZirkMLftUOjjAOOP53Zbh2fwu5olcAAuJesO3BIYzDrpH
	K83J2kOBnqogzeVfA2Wth6DigKi7yt5A7dDvx7RC96IzKi/aVBVuG9+fwz9PqrnCV2/9
	ApPF0tzz8N1EnNEUPtNfLmR99GM3lLAj31lThUCItVorzKccqF5xB8SuDkyqsnEmJwR4
	2My8XPZyN75NB30fYzFq7HKZStAwPnY9EjuqIAurTTPE30Bzxz78g8SH2PMkCexWTlnQ
	atwJaIGrD1oqwLodJp+4lchLX5SMgySGN0yKBN6lXrfqzh0J6NqBm3Edbu2teazk6YMe
	YNnA==
X-Received: by 10.194.237.194 with SMTP id ve2mr7566039wjc.89.1408743982394;
	Fri, 22 Aug 2014 14:46:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ck5sm48300352wjb.24.2014.08.22.14.46.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Aug 2014 14:46:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Aug 2014 23:46:26 +0200
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140822214626.GF20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama> <20140822154954.04d4fc02@e6410-2>
MIME-Version: 1.0
In-Reply-To: <20140822154954.04d4fc02@e6410-2>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 21:46:31 -0000
X-Groupsio-MsgNum: 56863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Content-Disposition: inline

--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 03:49:54PM -0500, Peter Seebach wrote:
> On Fri, 22 Aug 2014 21:39:10 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Even enabling thumb seems wrong, because ARM_INSTRUCTION_SET is arm by
> > default, so this change is only renaming the feed, but still building
> > the same binaries (unless distro sets ARM_INSTRUCTION_SET).
>=20
> I think that's okay, because the point is to correctly indicate that
> the CPU can run thumb binaries if someone had a reason to make them.
>=20
> I mean, strictly speaking, I don't even *know of* an actual chip for which
> armv7a-neon is a correct descriptor. Because "armv7a-neon" is a chip which
> *cannot* run thumb binaries. Does anyone actually make a neon armv7a which
> can't run thumb binaries?
>=20
> And yeah, the RFC and ensuing discussion gets to some sort of underlying
> questions about what the purpose of DEFAULTTUNE is. I am inclined to think
> that the DEFAULTTUNE for a given tune-foo should be either the baseline of
> that chipset or a somewhat optimized tune for it.

For me it's sane default for shared binary feed and DISTRO config is the
right place to decide common denominator for your MACHINEs (if all
MACHINEs you support are cortexa9 then yes, it would be better
DEFAULTTUNE, if you enable "thumb" in default ARM_INSTRUCTION_SET, then
yes it makes sense to enable it in DEFAULTTUNE as well, but changing
default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
still building with -marm doesn't make much sense to me and is only
confusing.

Every distro can use something more "optimized" DEFAULTTUNEs for each
MACHINE they use, I do it for SHR:
https://github.com/shr-distribution/meta-smartphone/blob/shr/meta-shr-distr=
o/conf/distro/include/defaulttunes.inc

and for webOS-ports we used it for a while and then reverted back to
default, because the difference between cortexa8-neon, cortexa9-neon and
armv8a-neon wasn't worth building and maintaining separate binary feed
(see links in .inc file)
https://github.com/webOS-ports/meta-webos-ports/blob/master/conf/distro/inc=
lude/defaulttunes.inc

> I note that tune-core2 and tune-corei7 both set tunes (core2-32, corei7-6=
4)
> which include target-specific optimizations; this would be comparable to
> using cortexa9t-neon as the default tune for tune-cortexa9.inc.
>=20
> I don't think the current state of tunings reflects a completely consiste=
nt
> view of what DEFAULTTUNE means in a tuning file.
>=20
> -s
> --=20
> Listen, get this.  Nobody with a good compiler needs to be justified.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP3ujIACgkQN1Ujt2V2gBy5OwCeIO7aow42DkELuqVyM5vW1ucU
ObIAn1nj+NFTtx8khP3j1ilNe47yLJGp
=PNmM
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--
