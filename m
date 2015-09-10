Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1832C736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:38:29 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so27942755wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R0P5xMbRclg1SyFEIl1I7a0hROK15jJJFYYTcTxQt4Y=;
	b=JX7Q2VX7NvgKY6H4TXgsRwwR5msUYhoxaFXJ56SyOjDsKUsw4rJzXKh9BehUSLOBW1
	/BSGEw1F1FhprRdSpRGnaj3neZwDY8oaTch60LIqyGyMNuahoGfrx77uSHd0w5FT9IcE
	k7INuKCQUsLp07o67mbXeZ7dB+PFNDzn6FAlK1y3wzLTVXlR+N4YFukjcCEvEOxIyeG7
	XgJW9xQqo/nONU2O/Ef7KNiOD0OEZQAP7cnrmdSZq0PQ5hqZJcmwxj1Hjm2UPaRjwUbN
	Muj65CakgwK3UdET6tgrWTTWG+BqbIpdILVkAOynbi6RJq5i7fChYW1yFPWaxpPPxKB5
	/9ow==
X-Received: by 10.194.158.68 with SMTP id ws4mr58791985wjb.25.1441899509629;
	Thu, 10 Sep 2015 08:38:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bs8sm16254390wjc.47.2015.09.10.08.38.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 08:38:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Sep 2015 17:39:28 +0200
To: Alexander Kanevskiy <kad@kad.name>
Message-ID: <20150910153928.GB2387@jama>
References: <CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
	<CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
	<20150908210642.GG2381@jama>
	<CANFkWp=w7Lj_M4hPdBjNya+EHd_9oMJ9QM-ewGO2AAsxJs-9uA@mail.gmail.com>
	<20150910141812.GA2387@jama>
	<CANFkWp=0itcR3EOSnYS2Mjttg3kCxEHqCygAyigvkVE9kuNkaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANFkWp=0itcR3EOSnYS2Mjttg3kCxEHqCygAyigvkVE9kuNkaA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 10 Sep 2015 15:38:30 -0000
X-Groupsio-MsgNum: 70970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 06:23:07PM +0300, Alexander Kanevskiy wrote:
> On Thu, Sep 10, 2015 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Thu, Sep 10, 2015 at 05:03:25PM +0300, Alexander Kanevskiy wrote:
> > > On Wed, Sep 9, 2015 at 12:06 AM, Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > > Gerrit, despite its good ability to integrate into existing
> > infrastructures
> > > might be not the best solution for OE, and I must admit, gerrit is not
> > the
> > > best tool in the world for reviews, as there are limits in it like
> > missing
> >
> > I disagree, we can agree on that :).
> >
> >
> ok :)
>=20
>=20
> > > ability to review properly series of patches.
> >
> > It allows to review series of patches very well, newer versions also
> > show chains of reviews in better UI than older versions did.
> >
> > Worse problem is that such series need to be uploaded as series not as
> > individual patches, because gerrit cannot automagically discover such
> > dependencies between patches and cherry-pick them to single branch and
> > resolve conflicts if there are, but if you push whole series of patches
> > it will show it as chain and all works correctly.
> >
> >
> might be. I haven't checked latest versions 2.10+, but versions below were
> not up to the shape compared to e.g. pull-request workflow in GitHub.

GitHub's pull-request workflow model is even worse than e-mail reviews
on ML.

It doesn't even support doing inline comments, because as soon as the
"source" branch is rebased or just amended to address the review
comments from v1, it will loose reference to all these comments, because
the commits will look "new" (different git SHA).

That's completely useless for good review, I want to compare different
revisions of the same patch, to see what comments I had before and how
they were addressed in new version. Github doesn't support anything like
that, people are using different work-arounds like opening new
pull-request for each revision (which means you need to always push to
new branch) or listing the commit SHAs inside the global "comments"
section, so that very patient reviewer can open the older revisions and
do manual diff (by switching between 2 browser tabs back and forth
trying to spot the differences or whatever).

Atlassian Stash has exactly the same problem, ReviewBoard the same, they
all think that to address review comments you just add another commit on
top of your branch to fix the issues you introduced in submitted commits
- but that's useless for code quality, bisect-ability etc. We don't want
10 garbage changes with incorrect commit messages and 11th change on top
which fixes the issues, we're doing review so that each change is
meaningful, build-able, test-able and properly documented in commit
message - that's all I want to ensure by using code review tool and only
Gerrit allows to do it efficiently.

Gerrit shows all revisions of the same patch (as long as Change-Id is
the same) in the same UI, allows you to see diff between any 2
revisions including comments on them etc).

Only people who never got used to do detailed reviews in Gerrit can say
that Github's pull-request are "review-tool".

You can see similar discussion e.g. lately in systemd ML after they
moved to github "for better reviews".

> > > However, for people who don't like Gerrit, there is also always a
> > > possibility to use GitHub or something similar, like locally hosted
> > GitLab
> > > if OE don't want to be dependant on external service.
> >
> > I want to use it to share status of the meta-oe patches with contributo=
rs,
> > running my own GitLab locally won't help with this.
> >
> >
> GitHub's model is to fork repository, do any amount of modification in yo=
ur
> own copy and then open "pull-request" for review where you just specify
> source/destination repositories and branches with set of changes.
>=20
> Gitlab comment was practically to have similar to GitHub workflow, but
> instead of public's GitHub service to have instance on openembedded.org
> infrastructure, and thus requiring users to register accounts there.

But we want to depend on well-maintained external service like we depend
on github.com to mirror our repositories and we ask our users to use
github mirrors instead of git.openembedded.org.

Similarly we can depend on http://gerrithub.io/ to host our gerrit
instance to save some maintenance for people with access to
openembedded.org infrastructure.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXxpC8ACgkQN1Ujt2V2gBwhNACcDSzcyN285IMM7kYPfkI29u9d
bX8AoKEv1e6S7yOe+AZEtL5JgmE4Pg51
=1Xv4
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
