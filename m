Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id DF0236D558;
	Wed, 20 Nov 2013 18:35:03 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id d51so4253151eek.3
	for <multiple recipients>; Wed, 20 Nov 2013 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=isPjAugeTMTGfxZgtSQnaBTxlLohjJrPHp7J6kGeTw8=;
	b=VaSmxD/VplM4ofF2//SNJu5rmjIWVhg1OUKIkB06CELWToQqSzsohC0b9hbjJuFIei
	wTsZQdFpFAuIPz4klfigduSOiE/FKgjBoseSPOSKBO0aZA2Pk+5tw5jEbYHJMlrHUOm4
	jqCVrvSlb6N54f9FNJ9SZMUgH97LO0FM/GveiYEa1NJtPnFI9po/6qtgwK9irRYhya47
	f+5SiWF0ug77EfefAuWLDkdwd0kSx/O+SBMVcjdyJEoZQyKciBN9tX+nHZygJKp8j5Lu
	/IFIo37rrbLJyBNXPmvOuj9qrzaebgElcZ9Qnf5LkHaHeFW+lAqjt5Hn4cvUcTcLbKiA
	DHww==
X-Received: by 10.14.224.132 with SMTP id x4mr2696660eep.5.1384972504662;
	Wed, 20 Nov 2013 10:35:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	u46sm62640682eep.17.2013.11.20.10.35.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 10:35:03 -0800 (PST)
Date: Wed, 20 Nov 2013 19:35:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131120183507.GU3708@jama>
References: <20131120122126.GM3708@jama>
	<CAJTo0LbddOTBfon=xp4WByGCzB9aiNxH+jD2KiGxJcjBfdUAfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbddOTBfon=xp4WByGCzB9aiNxH+jD2KiGxJcjBfdUAfg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks Wed Nov 20
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
X-List-Received-Date: Wed, 20 Nov 2013 18:35:05 -0000
X-Groupsio-MsgNum: 47356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4fNq9Po2wJlmxAaR"
Content-Disposition: inline

--4fNq9Po2wJlmxAaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 03:52:20PM +0000, Burton, Ross wrote:
> On 20 November 2013 12:21, Martin Jansa <martin.jansa@gmail.com> wrote:
> >     * openembedded-core/meta/recipes-graphics/wayland/weston_1.3.0.bb, =
do_patch
>=20
> This is a patch in your branch that isn't in oe-core.

I'm sorry about that, I've just dropped last -+ 30 patches I have for
deterministic dependencies from jansa/test branches which are used in
world builds.

I'll readd them when I find time to run test-dependencies.sh script
again.

> >     * openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-om=
apfb_git.bb, do_fetch
>=20
> For anyone who isn't aware the upstream repository was deleted and the
> best available clone (git.debian.org) has just had catastrophic disk
> failure.

I was more surprised that do_fetch failed (here as well as in few other
components) because I have quite old downloads directory already
populated from previous builds - I haven't yet checked log.do_fetch for
other failed components to see why it wasn't reused.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4fNq9Po2wJlmxAaR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKNANsACgkQN1Ujt2V2gBz++QCfTIxUowviI7O387L7Xxfkmwk8
61YAniWuo95xr2KiqlJ4iT6e1GGiF1cJ
=foDK
-----END PGP SIGNATURE-----

--4fNq9Po2wJlmxAaR--
