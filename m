Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 302EC609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 11:48:01 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so3085558wib.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xYALhswRKJhLIKLcpbWcZf6jle+zVD+xZd80dW2VXO0=;
	b=K5i6Y9jmFsy/EH0wSJ7+sCIkve9yATsZiuyEvU+bN7svyvgKZPKGUUM/SvM9veFBNg
	9N+ue7yHEfYB4ywnysUxKoS3ViXeBxw3+3JQZ+S+en+d4ZOx0bWVlabhL6t3BI2+VsZV
	sbVrqjSjkZqmMFAIPgRdnNRIQ7Wv9TvgNofODggxgT7/1A83BC6MVYzYN1AYxYBdihgL
	vqo8H9JXLQq5RcD9dtCK9Ic9SrzDhJNIc0bGnZwNyHqLN3RtfFKk0Cam7w4eNe/nx/XY
	weZMZyKCBjfjbsIL2TgmL0bZNFAJPm8G3PJ5R9jNwXA+2bnGibwiKwhTRouryXmbf9Va
	Kw/A==
X-Received: by 10.195.17.164 with SMTP id gf4mr14981727wjd.45.1407325682688;
	Wed, 06 Aug 2014 04:48:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lq15sm5431729wic.1.2014.08.06.04.48.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 04:48:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 13:48:31 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140806114831.GG14848@jama>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
	<20140724152218.GM2492@jama> <1406553510.13346.17.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1406553510.13346.17.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 06 Aug 2014 11:48:07 -0000
X-Groupsio-MsgNum: 56044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0z5c7mBtSy1wdr4F"
Content-Disposition: inline

--0z5c7mBtSy1wdr4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2014 at 02:18:30PM +0100, Richard Purdie wrote:
> On Thu, 2014-07-24 at 17:22 +0200, Martin Jansa wrote:
> > On Thu, Jul 24, 2014 at 02:52:45PM +0100, Burton, Ross wrote:
> > > On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > > +REQUIRED_DISTRO_FEATURES =3D "x11"
> > >=20
> > > Now I'm wondering why this is the solution.
> > >=20
> > > If you attempt to build e.g. gnome-desktop explicitly without the x11
> > > distro feature you understandably get an error message, because
> > > gnome-desktop depends on libx11 which sanity checks the distro
> > > features.  This seems correct.
> > >=20
> > > Presumably you're problem is that you're running world builds and
> > > they're producing errors on gnome-desktop because they can't satisfy a
> > > dependency on libx11.  It seems that bubbling up the
> > > REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - why
> > > can't SkipPackage be handled specially, so if you do bitbake -k world
> > > and libx11 emits SkipPackage, anything that has unsatisfiable
> > > dependencies because of this is also skipped?
> >=20
> > We discussed this many months ago and IIRC the conclusion was that user
> > should explicitly say that he wants to skip the recipes which depend on
> > something skipped (so that he is aware of what he is missing).
> >=20
> > At that time there wasn't REQUIRED_DISTRO_FEATURES support, so I've
> > created huge list of PNBLACKLISTs to blacklist everything not available
> > in our setup - so I can do world builds without ERRORs at the beginning.
> >=20
> > REQUIRED_DISTRO_FEATURES seems to me like reasonable compromise, that's
> > why I've sent this patchset to replace small part of my huge blacklist.
> >=20
> > This is the list:
> > https://github.com/openwebos/meta-webos/blob/master/conf/distro/include=
/webos-recipe-blacklist-world.inc
> >=20
> > If someone has time to improve SkipPackage and we really want to skip
> > all depending packages, I would be glad to test such patch (because it
> > allows to easily drop all those blacklists for "depends-on-broken"
> > components)
>=20
> The question here is whether we want a system which calculates what it
> thinks is right or that we declare it.
>=20
> The risk is that if SkipPackage (now known as SkipRecipe) were to
> automatically "spread", you could in theory break the toolchain, have
> nothing buildable and "bitbake world" would return success.
>=20
> Effectively the -k option to bitbake already does the SkipPackage
> "spread" idea since bitbake just removes dependencies until it works. If
> does that in a fairly verbose way but it does so deliberately so you can
> see what is going on.
>=20
> The alternative is to declare what a given recipe supports and then we
> can know whether it should be skipped or not under a given circumstance.
>=20
> Personally, I'm leaning towards a more declarative approach where we
> specify what should and shouldn't be expected to work. I'm open to
> discussion on it though...

I agree with more declarative approach.

I don't mind maintaining PNBLACKLIST e.g. for components depending on
something we decided to blacklist ourselves in distro config.

But for components like this, where we really know that they won't work
without X11 in DISTRO_FEATURES, I think bitbake should skip them
automatically (thanks to REQUIRED_DISTRO_FEATURES). It already
automatically skips all recipes in xorg-lib directory, why it shouldn't
skip other recipes living somewhere else?

> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0z5c7mBtSy1wdr4F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiFg8ACgkQN1Ujt2V2gBwNqACgsmAezHtNHdoRQCorsR3wcryB
fn8Anj52bDZ43wx9bHw5Xm0iZqlFsyP4
=3ztq
-----END PGP SIGNATURE-----

--0z5c7mBtSy1wdr4F--
