Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id BCCF173232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 14:17:14 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so25011298wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dHQliJ7v/lJ5cwNo0n7aDO5l8TfpGoOGsaWvajbq4Ec=;
	b=JuXIov8l8udm0byeFY5/QUzB+GhVqVqDWTdGtAYuf5B6LnOiQKYYC4xAKnr3YQnASz
	/OPri6tu6sOuXJOcygOYNOQe+t6A2HV6ay/zvM1MRcsRVGPaSo5S5a7hspZ1Q3v8Bw7Y
	Pd71Z7feWj1Go1EZYvhLSdu/zqigTuJa5WZ53Qolk5q0cCLenWe6su5yG7HXLZJpH6Gu
	LFkZFCibK1l5LtsQLcpmi3IPHfuaDvlexMIxNfaV5SA/m9/0l1qW2NNBfNaqzGkR2OwI
	Szt9QTNYn4+pJ5ImArGjFrqADXeomGA9TBBqnJpfnAlAcHahRtBVfTAOwPrzEdCoWJzT
	tOtA==
X-Received: by 10.180.182.7 with SMTP id ea7mr7030233wic.58.1441894633743;
	Thu, 10 Sep 2015 07:17:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	12sm15956930wjw.15.2015.09.10.07.17.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 07:17:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Sep 2015 16:18:12 +0200
To: Alexander Kanevskiy <kad@kad.name>,
	openembedded-core@lists.openembedded.org
Message-ID: <20150910141812.GA2387@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
	<CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
	<20150908210642.GG2381@jama>
	<CANFkWp=w7Lj_M4hPdBjNya+EHd_9oMJ9QM-ewGO2AAsxJs-9uA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANFkWp=w7Lj_M4hPdBjNya+EHd_9oMJ9QM-ewGO2AAsxJs-9uA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: Patch merge process
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
X-List-Received-Date: Thu, 10 Sep 2015 14:17:15 -0000
X-Groupsio-MsgNum: 70961
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 05:03:25PM +0300, Alexander Kanevskiy wrote:
> On Wed, Sep 9, 2015 at 12:06 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Tue, Sep 08, 2015 at 11:39:17AM -0700, Khem Raj wrote:
> > > On Tue, Sep 8, 2015 at 11:18 AM, Trevor Woerner <twoerner@gmail.com>
> > wrote:
> > > > If Richard doesn't want to use gerrit for OE-core, that doesn't exc=
lude
> > > > others from using it for the layers they manage, does it?
> > >
> > > yes, however, we should prefer this to run on oe domain, its better
> > > for project and then if most of layers use it its fine too, it could
> > > end up
> > > with same situation as patchwork where oe-core and bitbake do not use
> > > it actively. other layers do. its not ideal situation but its ok as
> > > long as
> > > its makes people productive, we could be open for options its matter
> > > of volunteers then maintaining the infra for these services.
> >
> > I agree, there are not technical reasons for not using it for other
> > layers, but once we ask contributors to create account on gerrit and
> > submit all patches through gerrit for *some* layers, then these people
> > will ask why oe-core and bitbake submissions are different.
> >
> > I should also say that I really like gerrit work-flow and review, but if
> > people continue to send patches to e-mail and someone else will need to
> > add Change-Ids to them and consolidate them into review-chains, than
> > it's not as great as it could be if all related people "buy-it" and use
> > it exclusively.
> >
>=20
> Gerrit, despite its good ability to integrate into existing infrastructur=
es
> might be not the best solution for OE, and I must admit, gerrit is not the
> best tool in the world for reviews, as there are limits in it like missing

I disagree, we can agree on that :).

> ability to review properly series of patches.

It allows to review series of patches very well, newer versions also
show chains of reviews in better UI than older versions did.

Worse problem is that such series need to be uploaded as series not as
individual patches, because gerrit cannot automagically discover such
dependencies between patches and cherry-pick them to single branch and
resolve conflicts if there are, but if you push whole series of patches
it will show it as chain and all works correctly.

> However, for people who don't like Gerrit, there is also always a
> possibility to use GitHub or something similar, like locally hosted GitLab
> if OE don't want to be dependant on external service.

I want to use it to share status of the meta-oe patches with contributors,
running my own GitLab locally won't help with this.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXxkR8ACgkQN1Ujt2V2gBws7wCfZ92MWHWFvqOmuB2uIIotpIyx
zwQAnA0bsh5g+Nzv8NhoEQkQb3IhOXVB
=x1FT
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
