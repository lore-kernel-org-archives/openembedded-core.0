Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 55E226BE2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:02:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t124so12336382wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 04:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2RBSiITndhjtIVkGNK0xcsksJsmFCwGcfukoDsu74t8=;
	b=s0zSSlDE9g5fg3oQs4d5Zvq6W8HOQJVYiHnA4qzmkpu66MtKD3wrOrrljICq90qQLl
	Zzr1ctBO7aOqQxgKnHGez67nXd9dquAgvQ/xo9y4Go2FhBks/A0vYpowR6hxvY96wkBK
	43c/QaHgWnSZ9J7Fnwgh42xS1r3TONqSbxrvfkcLjO2MrPZd70GwCTNI3VhD2+Oe1G2W
	8YhasxXfT3A0OOpn44Ir+qjIbTd+nGvyntL5ae+oPSCYFB0fDvH8cd/0k5cpSzYZzwjt
	J4K1wu1FGzq7iVMDQIVH1zqT76FJHOWDsyAxdWr1sXtrJmcHWYJnkJeS6pDJdvCo3x8A
	mOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2RBSiITndhjtIVkGNK0xcsksJsmFCwGcfukoDsu74t8=;
	b=dqmzyV5Q44b0MS7HXwN+28jz+IqUpZo16GBmWvJp06qBabXpVlBug+nEATu+w8orEG
	ihDPFPmU+0UNoVM/XA4J58j9IJbru4nB6RP4lLS8jEcorFVRkXYK/Eno5MPhhMZ3fgUT
	d8xB03dpm0PAW/y3rCcq6BwBe2rU6n44wKhaaOld0/CVWzverekc4UGykhGWQ1Ln4JFv
	uASuumw5caAuCpEjanrcV0vDIOeJBtdsKEhu519YLef5SlPQB3cOdWFYt+0/XHlq7g+q
	YU+B45QHRZXi9ahcpKkmc/Mk2P6CA8VdBze98yQfdU8Y10+//AJe11arsX4ohwIo/dyG
	LpLQ==
X-Gm-Message-State: APjAAAXqD71zmB2w7FXUKf0GxVZR8Z6sf2J8FbVx7bBq2fODbuo7g8rC
	ZgyBeKHnr14hSPlWW2S2fHg=
X-Google-Smtp-Source: APXvYqzpvsYD3B9PP/b9o1EpYwDA1/KmEwsLpfwngJLVPNcLPFTXC4Gpc2agUP4vkljSpFMze1eqQw==
X-Received: by 2002:a1c:4e19:: with SMTP id g25mr15544444wmh.9.1553598121023; 
	Tue, 26 Mar 2019 04:02:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	m17sm13913755wrx.3.2019.03.26.04.02.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 04:02:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Mar 2019 12:01:58 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190326110158.GB1929@jama>
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama>
	<CAJTo0LaFy7s7gjzxxB9yBn6613wCz=Jp=LtVbz8UsDxk1Ls58A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaFy7s7gjzxxB9yBn6613wCz=Jp=LtVbz8UsDxk1Ls58A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 11:02:01 -0000
X-Groupsio-MsgNum: 122613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline

--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 10:32:07AM +0000, Burton, Ross wrote:
> On Tue, 26 Mar 2019 at 10:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> > http fetcher won't (usually) fetch different version just by changing 1
> > variable inside the recipe and vice versa, renaming the recipe won't
> > fetch different SRCREV with git.
>=20
> Sure it will.  gcc_http.bb sets PV=3D8.3.0 in the recipe, and SRC_URI
> uses ${PV}.  The only catch is that http fetches have a secondary
> layer of transport checksums that git doesn't have.

I'm sorry, that's not what I meant.

git fetcher fetches whatever SRCREV is defined in the recipe, no matter
what PV says, I've seen enough recipe upgrades which just renamed the
recipe to have new version in filename updating SRCREV and even claimed
that the upgrade was properly tested, because nothing got broken :).

In webOS we got a bit further and PV+SRCREV are defined in one variable
WEBOS_VERSION and do_fetch qa check tests that the SRCREV points to
matching annotated version tag in the component.

> > If someone wants to update SRCREV in libcoms to be 10 commits behind
> > 0.1.10, is he expected to rename the recipe back to libcomps_git.bb and
> > re-add the PV variable (with new +git${SRCPV} suffix)?
>=20
> Yes.  The recipe ships a release.  If the recipe is changed from
> shipping a tested and maintainer approved release to a git snapshot,
> that definitely should not be trivial.

Next time someone needs to include few bugfixes from stable branch
included just after the release, should he update the SRCREV or add them
as .patch files?

> > I got used to "+git${SRCPV}" being dropped when the SRCREV matches
> > exactly the git tag, but renaming the recipe and removing the PV seems
> > too much, what is the benefit of doing that? It's not for clarity or
> > easier maintenance (at least for me), because PV next to SRCREV makes
> > much more sense to me (and helps people not to forget updating both at
> > the same time).
>=20
> For clarity and consistency: by convention recipes that ship releases
> put the PV in the filename.

FWIW: in webOS we don't use any version in filename, most recipes are
called just PN.bb and it works fine as well for us, less renames and
version consistently defined inside the recipes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJoGpQAKCRA3VSO3ZXaA
HJe5AJ9+zrJ7OCwkT1rbeJ+/bpRwYRDJdwCfZkKP1JHe5m09lzPRqY/XLAkrlK4=
=CLU8
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
