Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 575C26FEFA;
	Wed, 10 Aug 2016 12:12:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so9152828wma.1;
	Wed, 10 Aug 2016 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n9uWs+UAS3HiNk4pSKa7uNsY1Qvdfxx2VofCCqiSqWQ=;
	b=r/lLigKcTKS1abSpYyf39nb3fcX69tP6L5JQFpNPdqyYUcRKTFKEe5/ETr3rggEV9T
	dqUHcN+MCUpGlYd4ln38egszniV5QxtgDLggEOg7kRI42maKe00hOQIC7e/sUf859G6F
	tIdn2QiP/sUbRUGHTTF50laBGlmV57kgxwX1i4Q/isjTGvwNyCn+rIweN6+Aw/02Ywa1
	uhdqb9xqAMTImXMUPu+FtFUG4n3AwKY6HaGENM27ANqqx6aKcG1RIOyVA33LYkYeCuxP
	LzLThUtN7lFxqpIOLUf9kDwkTC9ucIiAd4QQ+nwc6WxLucgXFwkStunMjxs8DxYe6fXy
	1pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n9uWs+UAS3HiNk4pSKa7uNsY1Qvdfxx2VofCCqiSqWQ=;
	b=Y8gQj46PenqL4osQjf3QcqatmKzK0QkpOaKyEKLLEK5wDiHBYpKN5c9SAqqArWjnU2
	moVzzeJEGXKrpMnynYPjBpF3bp+B2tmvrH0c+zdnIOPfD4fi/mHfr87EUmJk16VhTJcM
	ux2VSGuhCDMmLEhLvwrPRmr4O82pBFmDbeOpLOoNSeRRPNOl9oiwsE22DWhycxkutYsl
	1jUgdgI+JZOnQ8ZuLWzD/THAJikLnymjP90NEZOtPtypZxjiSyzy1/t1M1R0Qz2YKMd2
	JZTiNN4/V3VoPduRAVm+3rvCEOLrsLm4b8H9vkpGHLn1RgHddOGaeXS+VbpoW0o1tV0Z
	VOQQ==
X-Gm-Message-State: AEkoouuE621zkB4uKbbULBo/Cak8tR/j/DvOQp1g23qhRGIF6q1OyjYhBHSPLWMUtcbfig==
X-Received: by 10.28.107.88 with SMTP id g85mr3007729wmc.49.1470831170317;
	Wed, 10 Aug 2016 05:12:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	o142sm8102945wme.20.2016.08.10.05.12.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Aug 2016 05:12:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Aug 2016 14:12:54 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160810121254.flinpsr7bzwns6ue@jama>
References: <20160810094725.20395.91512@opal.openembedded.org>
	<20160810094727.589E850200@opal.openembedded.org>
	<20160810095921.fzwuugxh525z5e4u@jama>
	<1470825754.18638.3.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1470825754.18638.3.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/51: piglit: fix build failure with gold linker
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
X-List-Received-Date: Wed, 10 Aug 2016 12:12:50 -0000
X-Groupsio-MsgNum: 85614
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rt577pdx5k4rsli4"
Content-Disposition: inline

--rt577pdx5k4rsli4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 11:42:34AM +0100, Richard Purdie wrote:
> On Wed, 2016-08-10 at 11:59 +0200, Martin Jansa wrote:
> > On Wed, Aug 10, 2016 at 09:47:26AM +0000, git@git.openembedded.org wr
> > ote:
> > > rpurdie pushed a commit to branch master
> > > in repository openembedded-core.
> > >=20
> > > commit 79005ff905f8c82a8766af5a927b9a0f8929e24f
> > > Author: Maxin B. John <maxin.john@intel.com>
> > > AuthorDate: Mon Aug 1 18:34:49 2016 +0300
> > >=20
> > >     piglit: fix build failure with gold linker
> > >    =20
> > >     When we use gold linker while DISTRO set to "nodistro", piglit
> > > build
> > >     fails with the following error:
> > >    =20
> > >     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined
> > > reference to
> > >     'dlsym'
> > >     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined
> > > reference to
> > >     'dlerror'
> > >     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined
> > > reference to
> > >     'dlopen'
> > >     | collect2: error: ld returned 1 exit status
> > >    =20
> > >     Fix it by providing '-ldl' to LDFLAGS.
> > >    =20
> > >     [YOCTO #9851]
> > >    =20
> > >     Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/recipes-graphics/piglit/piglit_git.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> > > b/meta/recipes-graphics/piglit/piglit_git.bb
> > > index 811f7af..df90c4d 100644
> > > --- a/meta/recipes-graphics/piglit/piglit_git.bb
> > > +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> > > @@ -30,6 +30,8 @@ do_compile[dirs] =3D+ "${B}/temp/"
> > >  PACKAGECONFIG ??=3D ""
> > >  PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,
> > > -DPIGLIT_USE_GLUT=3D0,freeglut,"
> > > =20
> > > +LDFLAGS_append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is
> > > -gold', '-ldl', '', d)}"
> >=20
> > There was request to fix it properly in piglit code, why was this
> > version merged instead?
>=20
> Accidentally. It made it into mut and I'd assumed this was a v2. Sadly
> I don't keep all patch context in my head. I can revert it.

I don't blame you, it's hard to keep all patch context in head without tool=
s to
keep it for you (gerrit) :).

It can be properly resolved in follow-up change, so I think revert isn't
necessary for now.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rt577pdx5k4rsli4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlerGkUACgkQN1Ujt2V2gByfWQCgsbzk/hw3HT75B6pD6OoiiHMC
e88An3ViggPcRIuhnIXOIsj6/1qPOV24
=l0uP
-----END PGP SIGNATURE-----

--rt577pdx5k4rsli4--
