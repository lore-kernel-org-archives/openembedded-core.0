Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A696465CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:13:50 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so2292828wiv.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wEYyX56FwwHvneZRUufDAkC49Pem33ilSZo0DI7fyLg=;
	b=mJPzmbf3TnfugR0c8IRvShQdgLWwbbmm2S1caft/EnzSTWC3GcE010SxkgQeHczmri
	1sYbdH5eTCoKr41FVukFFd+DGOqk32DHxfmpBEm4yByO4GpK83sBJJmtNlpsocRjY1ch
	kPlpoBiycgsMN8GFEv9jqMvJlHBTgsQIlvdiNuzyQaok8HQwZhr5S66ra8MN/AKNTBn4
	sCzYYluEEPC5hC3wsRnHyEU68aB92B1szrufWqVTGAGWTmiwN1KNmtLogNUu8Vo3WlvG
	el2kgo3r5fp/3A5V3843zNDMvb+svDvfNqms3GSE6iwgJPbE66hqfzJ+3ayO3PYhXZJ9
	Gp+A==
X-Received: by 10.194.58.205 with SMTP id t13mr54357972wjq.55.1415726029990;
	Tue, 11 Nov 2014 09:13:49 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ll2sm15319036wjb.11.2014.11.11.09.13.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 09:13:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Nov 2014 18:13:44 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20141111171344.GA2453@jama>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
	<20140724152218.GM2492@jama> <1406553510.13346.17.camel@ted>
	<20140806114831.GG14848@jama> <20141030132053.GF15148@jama>
	<1414675717.7649.56.camel@ted>
	<57233C63-3053-410A-9D7D-011B9D3B3331@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <57233C63-3053-410A-9D7D-011B9D3B3331@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 11 Nov 2014 17:13:56 -0000
X-Groupsio-MsgNum: 59543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2014 at 03:18:50PM +0100, Koen Kooi wrote:
>=20
> Op 30 okt. 2014, om 14:28 heeft Richard Purdie <richard.purdie@linuxfound=
ation.org> het volgende geschreven:
>=20
> > On Thu, 2014-10-30 at 14:20 +0100, Martin Jansa wrote:
> >> On Wed, Aug 06, 2014 at 01:48:31PM +0200, Martin Jansa wrote:
> >>> On Mon, Jul 28, 2014 at 02:18:30PM +0100, Richard Purdie wrote:
> >>>> On Thu, 2014-07-24 at 17:22 +0200, Martin Jansa wrote:
> >>>>> On Thu, Jul 24, 2014 at 02:52:45PM +0100, Burton, Ross wrote:
> >>>>>> On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>>>>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
> >>>>>>=20
> >>>>>> Now I'm wondering why this is the solution.
> >>>>>>=20
> >>>>>> If you attempt to build e.g. gnome-desktop explicitly without the =
x11
> >>>>>> distro feature you understandably get an error message, because
> >>>>>> gnome-desktop depends on libx11 which sanity checks the distro
> >>>>>> features.  This seems correct.
> >>>>>>=20
> >>>>>> Presumably you're problem is that you're running world builds and
> >>>>>> they're producing errors on gnome-desktop because they can't satis=
fy a
> >>>>>> dependency on libx11.  It seems that bubbling up the
> >>>>>> REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - =
why
> >>>>>> can't SkipPackage be handled specially, so if you do bitbake -k wo=
rld
> >>>>>> and libx11 emits SkipPackage, anything that has unsatisfiable
> >>>>>> dependencies because of this is also skipped?
> >>>>>=20
> >>>>> We discussed this many months ago and IIRC the conclusion was that =
user
> >>>>> should explicitly say that he wants to skip the recipes which depen=
d on
> >>>>> something skipped (so that he is aware of what he is missing).
> >>>>>=20
> >>>>> At that time there wasn't REQUIRED_DISTRO_FEATURES support, so I've
> >>>>> created huge list of PNBLACKLISTs to blacklist everything not avail=
able
> >>>>> in our setup - so I can do world builds without ERRORs at the begin=
ning.
> >>>>>=20
> >>>>> REQUIRED_DISTRO_FEATURES seems to me like reasonable compromise, th=
at's
> >>>>> why I've sent this patchset to replace small part of my huge blackl=
ist.
> >>>>>=20
> >>>>> This is the list:
> >>>>> https://github.com/openwebos/meta-webos/blob/master/conf/distro/inc=
lude/webos-recipe-blacklist-world.inc
> >>>>>=20
> >>>>> If someone has time to improve SkipPackage and we really want to sk=
ip
> >>>>> all depending packages, I would be glad to test such patch (because=
 it
> >>>>> allows to easily drop all those blacklists for "depends-on-broken"
> >>>>> components)
> >>>>=20
> >>>> The question here is whether we want a system which calculates what =
it
> >>>> thinks is right or that we declare it.
> >>>>=20
> >>>> The risk is that if SkipPackage (now known as SkipRecipe) were to
> >>>> automatically "spread", you could in theory break the toolchain, have
> >>>> nothing buildable and "bitbake world" would return success.
> >>>>=20
> >>>> Effectively the -k option to bitbake already does the SkipPackage
> >>>> "spread" idea since bitbake just removes dependencies until it works=
=2E If
> >>>> does that in a fairly verbose way but it does so deliberately so you=
 can
> >>>> see what is going on.
> >>>>=20
> >>>> The alternative is to declare what a given recipe supports and then =
we
> >>>> can know whether it should be skipped or not under a given circumsta=
nce.
> >>>>=20
> >>>> Personally, I'm leaning towards a more declarative approach where we
> >>>> specify what should and shouldn't be expected to work. I'm open to
> >>>> discussion on it though...
> >>>=20
> >>> I agree with more declarative approach.
> >>>=20
> >>> I don't mind maintaining PNBLACKLIST e.g. for components depending on
> >>> something we decided to blacklist ourselves in distro config.
> >>>=20
> >>> But for components like this, where we really know that they won't wo=
rk
> >>> without X11 in DISTRO_FEATURES, I think bitbake should skip them
> >>> automatically (thanks to REQUIRED_DISTRO_FEATURES). It already
> >>> automatically skips all recipes in xorg-lib directory, why it shouldn=
't
> >>> skip other recipes living somewhere else?
> >>=20
> >> Can we make some decision now?
> >=20
> > Well, I think there was an implied outcome of this:
> >=20
> > a) We don't want to automatically do things, we want something
> > declarative
> >=20
> > b) We therefore need to go and add REQUIRED_DISTRO_FEATURES =3D "x11" to
> > some further places.
> >=20
> > As such, I'll take patches.
> >=20
> > Was that what other people understood?
>=20
> That's how I read it and FWIW, I agree.

ping for Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRiQ8gACgkQN1Ujt2V2gBwiuQCgigEceN8ExmgioK/mGaEIdWTn
utgAoKQYrujxyBSYtQ1vSbwiBJn4VQ3u
=8JvP
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
