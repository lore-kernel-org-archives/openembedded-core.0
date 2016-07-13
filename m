Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC966AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:46:50 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id r190so9257055wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mPIXc3yRVIuyXfAeMb9KBl9joqCjYhKimxmIEoy/4wM=;
	b=ChDW7jeQz+aVKHZffLJgABfyDJXMHXkuIAeEd0qOkHHBexqTMeAMSizXxnXXCVO412
	DBK1yaV2jha6vMK0kQEGZpL9iPstfdKHfKoRxD4XxS+Drc2EI+kk17neT/w+6e0Sw8Pl
	vUXHTZcRRpRDsx/awqPgixl3JNuULPWgngyq1QcT8apEK7nt+TO05iNwonaLsPHBqVrw
	L4w7Tg8PrflNRpvB/ibLGDakefnynn5eDRNdYQ4EpqAdVgDLjcPoh/0KmJ94povUbDTP
	MhuodijejIeAv0HB/IwVMkYoZSf2ytQ0eaguuH1ZCPNUEEk/sHovukmShQUAR86Gz1p/
	Zpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mPIXc3yRVIuyXfAeMb9KBl9joqCjYhKimxmIEoy/4wM=;
	b=E0x4HRq1QaFNp2VysM7Bh0wiwHHzoESvlgH9BqLGScsc2SQL8mxoeLOHx20FlToZVc
	jEOBMFlO/GOWWJ/xPscJk1mlKr151r5FOaqO5SrjwLfn4hvxgO+T92poSPTpUEcq3XJ3
	lhDpO5I2dhG+o8roeB4JiAWZNsfJWpoOnN+cKn+kpF5UvzdfJ1THwQqE2g+D8pJIdRR8
	LzOGK2JnNKKMee1qhcb20xtgCo9K8/tfGUBjwVhZ4xwkKjuZIqqyBetc5hzOU/j0Dile
	WDbApUfSpuuTvJOpwHm11enUQVxvjc51IsJQ0KVzBPL0F6cVMgDqirWMuzLOD2rmGLyJ
	n+eA==
X-Gm-Message-State: ALyK8tIZ69oMvKgQO/fYs+pOo9SSGKznXPTmllvR1BZ1F0OYaHU0BXBVE3sujGdL3qFaNQ==
X-Received: by 10.28.184.82 with SMTP id i79mr28355492wmf.26.1468414009768;
	Wed, 13 Jul 2016 05:46:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id eb8sm754976wjb.13.2016.07.13.05.46.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jul 2016 05:46:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Jul 2016 14:46:58 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160713124658.phdpvspfesue372e@jama>
References: <5784A2D0.9030902@mlbassoc.com>
	<CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
	<57855DCA.1080807@gmail.com>
	<CAJTo0LbJfZSNr5U9G8rBLXfqWfjf3R7uSatEwuQFSA9SfWh+xQ@mail.gmail.com>
	<5785627D.9080800@gmail.com>
	<1468362435.28829.118.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1468362435.28829.118.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: Future of GCC
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
X-List-Received-Date: Wed, 13 Jul 2016 12:46:53 -0000
X-Groupsio-MsgNum: 84453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fyrjxe6fjmmagjwj"
Content-Disposition: inline

--fyrjxe6fjmmagjwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2016 at 11:27:15PM +0100, Richard Purdie wrote:
> On Tue, 2016-07-12 at 14:34 -0700, akuster808 wrote:
> >=20
> > On 07/12/2016 02:24 PM, Burton, Ross wrote:
> > > On 12 July 2016 at 22:14, akuster808 <akuster808@gmail.com> wrote:
> > >=20
> > > > > Personally I was thinking that gcc 5.x and 6.x should stay in
> > > > > oe-core for
> > > > > this cycle, and then drop 5.x after the release.
> > > >=20
> > > >=20
> > > > Wouldn't that be dropped iff GCC 7.0 is release? or are you
> > > > saying we
> > > > should only have one GCC version?
> > > >=20
> > >=20
> > > Well, depends on the adoption and migration problems.  I don't
> > > think we
> > > should carry three versions,
> >=20
> > I agree. 3 is too many.
> >=20
> >  and ideally one, but two is acceptable to ease
> > > migration.
> >=20
> > One makes Stable maintenance less costly in time.
>=20
> I'm personally a fan of one if we can do it. We've taken a bit of an
> "easier" path recently but it might be time to change that. Right now
> I'm not aware of any of our core usecases which need 5.x, all work with
> 6.x. I am aware of some BSPs on older kernels which would however have
> issues.

There are many PNBLACKLIST in other layers in recipes which don't even
build with gcc-6 and other which possibly have more issues in runtime.

But I agree that it's easier to officially support just one default gcc
and I'm in favour of removing 5.x from oe-core.

We also used to have gcc 4.3 in meta-openembedded/toolchain-layer which
was removed in:

commit 5a5ec1c0607466d0369170c7a3e25ca92d51ca1c
Author: mike.looijmans@topic.nl <mike.looijmans@topic.nl>
Date:   Thu Oct 8 07:39:20 2015 +0200

    Remove toolchain-layer

If there is enough interest to share the 5.x recipes somewhere, then
people actually using/testing it should do that and I would accept
meta-openembedded patch reviving toolchain-layer with 5.x in it.

--fyrjxe6fjmmagjwj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleGOD4ACgkQN1Ujt2V2gBywcwCcDwiQ/fvU7zvRdErudrMeWLPV
5egAn2PLoAMpNnMIDk5yg9HnI0XGAxH1
=/Xh3
-----END PGP SIGNATURE-----

--fyrjxe6fjmmagjwj--
